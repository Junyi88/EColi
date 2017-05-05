#include "PusztaiQsBulkB.h"

template<>
InputParameters validParams<PusztaiQsBulkB>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Pusztai Kernel for Etas");
  params.addRequiredParam<MaterialPropertyName>("L_name",  "The mobility used with the kernel");
  params.addRequiredParam<MaterialPropertyName>("H_name",  "The energy function of the non-grain boundary phases");
  params.addRequiredParam<MaterialPropertyName>("P_name", "Interpolation function for phases");
  params.addParam<Real>("Correction_A", 1.0, "Maximum Value");
  params.addParam<Real>("Correction_Z", 0.001 ,"Pinning");
  params.addCoupledVar("Args", "Vector of Etas and Temperature this object depends on");
  params.addCoupledVar("Qs", "Vector of Qs this object depends on");
  params.addParam<bool>("variable_L", false, "The mobility is a function of any MOOSE variable (if this is set to false L must be constant over the entire domain!)");
  params.addParam<bool>("variable_H", false, "The h is a function of any MOOSE variable (if this is set to false h must be constant over the entire domain!)");

  return params;
}

//** Constructor *********************************************************
PusztaiQsBulkB::PusztaiQsBulkB(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _nvar(_coupled_moose_vars.size()),
    _nQs(0),
    _L(getMaterialProperty<Real>("L_name")),
    _H(getMaterialProperty<Real>("H_name")),
    _P(getMaterialProperty<Real>("P_name")),
    _dLdarg(_nvar),
    _dHdarg(_nvar),
    _dPdarg(_nvar),
    _d2LdEtadarg(_nvar),
    _d2Ldarg2(_nvar),
    _gradarg(_nvar),
    _A(getParam<Real>("Correction_A")),
    _Z(getParam<Real>("Correction_Z")),
    _C1(2.0*_A*_A*_A/3.0),
    _C2(8.0*_A*_A*_A*_A*_A/15.0),
    _C3(34.0*_A*_A*_A*_A*_A*_A*_A/105.0),
    _variable_L(getParam<bool>("variable_L")),
    _variable_H(getParam<bool>("variable_H")),
    _isQs(getCoupledMooseVars().size(),false),
    _MapQs(_nvar,_nvar)
    {
      // Initialise _nQs Value
      std::vector<std::string> QName(_nvar);
      for (auto& x: getCoupledVars())
        if (x.first=="Qs")
        {
          _nQs=x.second.size();
          for (unsigned int i = 0; i < _nQs; ++i)
            QName[i]=x.second[i]->name();
          break;
        }

      // Initialise _isQs and _ Values
      for (unsigned int i = 0; i < _nvar; ++i)
        {
          MooseVariable * ivar = _coupled_moose_vars[i];
          const VariableName iname = ivar->name();

          if (iname == _var.name())
            mooseError("The kernel variable should not be specified in the coupled `Etas` or `Qs` parameter.");

          // Initialise _isQs and _ Values
          for (unsigned int j = 0; j < _nQs; ++j)
            if(iname == QName[j])
              {
                _isQs[i]=true;
                _MapQs[i]=j;
              }

          // Fill in Jacobian Off-Diag pointers

          _dLdarg[i] = &getMaterialPropertyDerivative<Real>("L_name", iname);
          _dHdarg[i] = &getMaterialPropertyDerivative<Real>("H_name", iname);
          _dPdarg[i] = &getMaterialPropertyDerivative<Real>("P_name", iname);
          _d2LdEtadarg[i] = &getMaterialPropertyDerivative<Real>("L_name", iname, _var.name());
          _gradarg[i] = &(ivar->gradSln());

          _d2Ldarg2[i].resize(_nvar);
          for (unsigned int j = 0; j < _nvar; ++j)
            _d2Ldarg2[i][j] = &getMaterialPropertyDerivative<Real>("L_name", iname, _coupled_moose_vars[j]->name());
    }
  }

  //** computeQpResidual() *********************************************************
Real
PusztaiQsBulkB::computeQpResidual()
{
  // std::ofstream myfile;  //QZ_Debug
  // myfile.open ("DebgQs.txt",std::ios_base::app); //QZ_Debug
  // myfile<<"----------------"<<std::endl; //QZ_Debug
  // myfile<<"_grad_u[_qp]:"<<_grad_u[_qp]<<std::endl; //QZ_Debug
  // myfile<<"NablaLTest():"<<NablaLTest()<<std::endl; //QZ_Debug
  // myfile<<"InSqrtGrad2():"<<InSqrtGrad2()<<std::endl; //QZ_Debug
  // myfile<<"(_grad_u[_qp]*NablaLTest()):"<<(_grad_u[_qp]*NablaLTest())<<std::endl; //QZ_Debug
  // myfile<<"-xxx----"<<std::endl; //QZ_Debug
  Real x=SqrtGrad2();
  return 2.0*_H[_qp]*_P[_qp]*InSqrtGrad2(x)*(_grad_u[_qp]*NablaLTest());
}

//** computeQpJacobian() *********************************************************
Real
PusztaiQsBulkB::computeQpJacobian()
{ Real x=SqrtGrad2();
  return ((InSqrtGrad2(x)*_grad_phi[_j][_qp])+
         (_grad_u[_qp]*dInSqrtGrad2_dEta(x)))*H2PNablaLTest();
}

//** computeQpOffDiagJacobian() *********************************************************
Real
PusztaiQsBulkB::computeQpOffDiagJacobian(unsigned int jvar)
{ Real x=SqrtGrad2();
  // return 0.0;
  const unsigned int cvar = mapJvarToCvar(jvar);

  RealGradient sum=_H[_qp]*(*_dPdarg[cvar])[_qp]*_phi[_j][_qp]*_grad_u[_qp]*InSqrtGrad2(x);
  sum+=_H[_qp]*_P[_qp]*_grad_u[_qp]*dInSqrtGrad2_dArg(cvar,x);

  if(_variable_H)
    sum+=_P[_qp]*(*_dHdarg[cvar])[_qp]*_phi[_j][_qp]*_grad_u[_qp]*InSqrtGrad2(x);

  Real sum2=sum*Nabla2LTest();

  if(_variable_L)
    sum2+=2.0*_H[_qp]*InSqrtGrad2(x)*_grad_u[_qp]*DiffNablaLTest(cvar);

  return sum2;
}

//** NablaLTest() *********************************************************
RealGradient
PusztaiQsBulkB::NablaLTest()
{
  RealGradient sum=_L[_qp]*_grad_test[_i][_qp];

  if(_variable_L)
    {
      for (unsigned int i = 0; i < _nvar; i++)
        sum+=(*_gradarg[i])[_qp] * (*_dLdarg[i])[_qp] *  _test[_i][_qp];
    }

  return sum;
}

//** DiffNablaLTest() *********************************************************
RealGradient
PusztaiQsBulkB::DiffNablaLTest(const unsigned int &cvar)
{
  RealGradient dsum=_grad_phi[_j][_qp]*(*_dLdarg[cvar])[_qp];
  for (unsigned int i = 0; i < _nvar; ++i)
    dsum+=_phi[_j][_qp]*(*_gradarg[cvar])[_qp]*(*_d2Ldarg2[i][cvar])[_qp];
  return dsum;
}

//** SqrtGrad2() *********************************************************
Real
PusztaiQsBulkB::SqrtGrad2()
{
  Real sum=_grad_u[_qp]*_grad_u[_qp];

  for (unsigned int i = 0; i < _nQs; ++i)
    sum+=coupledGradient("Qs", i)[_qp]*coupledGradient("Qs", i)[_qp];

  return sqrt(sum);
}

//** InSqrtGrad2() *********************************************************
Real
PusztaiQsBulkB::InSqrtGrad2(const Real &x)
{ if (x>_Z)
   return tanh(_A*x)/x;

  return _A*cosh(_A*x);
}

//** dInSqrtGrad2_dEta() *********************************************************
Real
PusztaiQsBulkB::dInSqrtGrad2_dEta(const Real &x)
{
  if (x>_Z)
  {
    return (_grad_u[_qp]*_grad_phi[_j][_qp])*(
      _A*sech(_A*x)*sech(_A*x)/x-tanh(_A*x)/(x*x));
  }

  return (-_C1+_C2*x*x-_C3*pow(x,5.0))*(
            _grad_u[_qp]*_grad_phi[_j][_qp]);
}

//** dInSqrtGrad2_dArg() *********************************************************
Real
PusztaiQsBulkB::dInSqrtGrad2_dArg(const unsigned int &cvar, const Real &x)
{
  if (x>_Z)
  {
    return ((*_gradarg[cvar])[_qp]*_grad_phi[_j][_qp])*(
      _A*sech(_A*x)*sech(_A*x)/x-tanh(_A*x)/(x*x));
  }

  return (-_C1+_C2*x*x-_C3*pow(x,5.0))*
           ((*_gradarg[cvar])[_qp]*_grad_phi[_j][_qp]);
}

//** H2NablaLTest() *********************************************************
RealGradient
PusztaiQsBulkB::H2PNablaLTest()
{
  return 2.0*_H[_qp]*_P[_qp]*NablaLTest();
}

//** H2NablaLTest() *********************************************************
RealGradient
PusztaiQsBulkB::Nabla2LTest()
{
  return 2.0*NablaLTest();
}
