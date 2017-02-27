#include "PusztaiCHBulk.h"

template<>
InputParameters validParams<PusztaiCHBulk>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Pusztai Kernel for Etas");
  params.addRequiredParam<MaterialPropertyName>("L_name",  "The mobility used with the kernel");
  params.addRequiredParam<MaterialPropertyName>("H_name",  "The energy function of the non-grain boundary phases");
  params.addRequiredParam<MaterialPropertyName>("P_name", "Interpolation function for phases");
  params.addParam<Real>("DelQMax", 20.0, "Maximum Value");
  params.addParam<Real>("DelQPin", 0.1 ,"Pinning");
  params.addCoupledVar("Args", "Vector of Etas and Temperature this object depends on");
  params.addCoupledVar("Qs", "Vector of Qs this object depends on");
  params.addParam<bool>("variable_L", false, "The mobility is a function of any MOOSE variable (if this is set to false L must be constant over the entire domain!)");
  params.addParam<bool>("variable_H", false, "The h is a function of any MOOSE variable (if this is set to false h must be constant over the entire domain!)");

  return params;
}

//** Constructor *********************************************************
PusztaiCHBulk::PusztaiCHBulk(const InputParameters & parameters) :
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
    _y0(getParam<Real>("Correction_y0")),
    _Z(getParam<Real>("Correction_Z")),
    _A3(2.0*_y0/(pow(_Z,3.0))-3.0/(pow(_Z,4.0))),
    _A2(4.0*_y0/(pow(_Z,3.0))-3.0/(pow(_Z,2.0))),
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
PusztaiCHBulk::computeQpResidual()
{
  // std::ofstream myfile;  //QZ_Debug
  // myfile.open ("DebgQs.txt",std::ios_base::app); //QZ_Debug
  // myfile<<"----------------"<<std::endl; //QZ_Debug
  // myfile<<"_grad_u[_qp]:"<<_grad_u[_qp]<<std::endl; //QZ_Debug
  // myfile<<"NablaLTest():"<<NablaLTest()<<std::endl; //QZ_Debug
  // myfile<<"InSqrtGrad2():"<<InSqrtGrad2()<<std::endl; //QZ_Debug
  // myfile<<"(_grad_u[_qp]*NablaLTest()):"<<(_grad_u[_qp]*NablaLTest())<<std::endl; //QZ_Debug
  // myfile<<"-xxx----"<<std::endl; //QZ_Debug
  return 2.0*_H[_qp]*_P[_qp]*InSqrtGrad2()*(_grad_u[_qp]*NablaLTest());
}

//** computeQpJacobian() *********************************************************
Real
PusztaiCHBulk::computeQpJacobian()
{
  return ((InSqrtGrad2()*_grad_phi[_j][_qp])+
         (_grad_u[_qp]*dInSqrtGrad2_dEta()))*H2PNablaLTest();
}

//** computeQpOffDiagJacobian() *********************************************************
Real
PusztaiCHBulk::computeQpOffDiagJacobian(unsigned int jvar)
{
  // return 0.0;
  const unsigned int cvar = mapJvarToCvar(jvar);

  RealGradient sum=_H[_qp]*(*_dPdarg[cvar])[_qp]*_phi[_j][_qp]*_grad_u[_qp]*InSqrtGrad2();
  sum+=_H[_qp]*_P[_qp]*_grad_u[_qp]*dInSqrtGrad2_dArg(cvar);

  if(_variable_H)
    sum+=_P[_qp]*(*_dHdarg[cvar])[_qp]*_phi[_j][_qp]*_grad_u[_qp]*InSqrtGrad2();

  Real sum2=sum*Nabla2LTest();

  if(_variable_L)
    sum2+=2.0*_H[_qp]*InSqrtGrad2()*_grad_u[_qp]*DiffNablaLTest(cvar);

  return sum2;
}

//** NablaLTest() *********************************************************
RealGradient
PusztaiCHBulk::NablaLTest()
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
PusztaiCHBulk::DiffNablaLTest(const unsigned int &cvar)
{
  RealGradient dsum=_grad_phi[_j][_qp]*(*_dLdarg[cvar])[_qp];
  for (unsigned int i = 0; i < _nvar; ++i)
    dsum+=_phi[_j][_qp]*(*_gradarg[cvar])[_qp]*(*_d2Ldarg2[i][cvar])[_qp];
  return dsum;
}

//** SqrtGrad2() *********************************************************
Real
PusztaiCHBulk::SqrtGrad2()
{
  Real sum=_grad_u[_qp]*_grad_u[_qp];

  for (unsigned int i = 0; i < _nQs; ++i)
    sum+=coupledGradient("Qs", i)[_qp]*coupledGradient("Qs", i)[_qp];

  return sqrt(sum);
}

//** InSqrtGrad2() *********************************************************
Real
PusztaiCHBulk::InSqrtGrad2()
{
  if(SqrtGrad2()<_Z)
  {
    return _A3*pow(SqrtGrad2(),3.0)+_A2*pow(SqrtGrad2(),2.0)+_y0;
  }

  return 1.0/SqrtGrad2();
}

//** dInSqrtGrad2_dEta() *********************************************************
Real
PusztaiCHBulk::dInSqrtGrad2_dEta()
{
  if (SqrtGrad2()>_Z)
  {
    return -(_grad_u[_qp]*_grad_phi[_j][_qp])/pow(SqrtGrad2(),3.0);
  }

  return (3.0*_A3*SqrtGrad2()+2.0*_A2)*(_grad_u[_qp]*_grad_phi[_j][_qp]);
}

//** dInSqrtGrad2_dArg() *********************************************************
Real
PusztaiCHBulk::dInSqrtGrad2_dArg(const unsigned int &cvar)
{
  if (SqrtGrad2()>_Z)
  {
    return -((*_gradarg[cvar])[_qp]*_grad_phi[_j][_qp])/pow(SqrtGrad2(),3.0);
  }

  return (3.0*_A3*SqrtGrad2()+2.0*_A2)*((*_gradarg[cvar])[_qp]*_grad_phi[_j][_qp]);
}

//** H2NablaLTest() *********************************************************
RealGradient
PusztaiCHBulk::H2PNablaLTest()
{
  return 2.0*_H[_qp]*_P[_qp]*NablaLTest();
}

//** H2NablaLTest() *********************************************************
RealGradient
PusztaiCHBulk::Nabla2LTest()
{
  return 2.0*NablaLTest();
}
