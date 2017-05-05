#include "PusztaiACBulkB.h"

template<>
InputParameters validParams<PusztaiACBulkB>()
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

PusztaiACBulkB::PusztaiACBulkB(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _nvar(_coupled_moose_vars.size()),
    _nQs(0),
    _L(getMaterialProperty<Real>("L_name")),
    _H(getMaterialProperty<Real>("H_name")),
    _dPdEta(getMaterialPropertyDerivative<Real>("P_name", _var.name())),
    _d2PdEta2(getMaterialPropertyDerivative<Real>("P_name", _var.name(), _var.name())),
    _dLdEta(getMaterialPropertyDerivative<Real>("L_name", _var.name())),
    _dHdEta(getMaterialPropertyDerivative<Real>("H_name", _var.name())),
    _d2PdEtadarg(_nvar),
    _dLdarg(_nvar),
    _dHdarg(_nvar),
    _A(getParam<Real>("Correction_A")),
    _Z(getParam<Real>("Correction_Z")),
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
          _d2PdEtadarg[i] = &getMaterialPropertyDerivative<Real>("P_name", iname, _var.name());
          _dLdarg[i] = &getMaterialPropertyDerivative<Real>("L_name", iname);
          _dHdarg[i] = &getMaterialPropertyDerivative<Real>("H_name", iname);
        }
    }


//** computeQpResidual() *********************************************************
Real
PusztaiACBulkB::computeQpResidual()
{
  return _L[_qp]*_test[_i][_qp]*2.0*_H[_qp]*_dPdEta[_qp]*SqrtGrad2();
}

//** computeQpJacobian() *********************************************************
Real
PusztaiACBulkB::computeQpJacobian()
{ Real x=SqrtGrad2();
  Real dsum=_d2PdEta2[_qp]*_L[_qp]*_H[_qp];

  if (_variable_L)
    dsum+=_dPdEta[_qp]*_dLdEta[_qp]*_H[_qp];

  if (_variable_H)
    dsum+=_dPdEta[_qp]*_L[_qp]*_dHdEta[_qp];

    return dsum*PhiTest2Square(x);
}

//** computeQpOffDiagJacobian() *********************************************************
Real
PusztaiACBulkB::computeQpOffDiagJacobian(unsigned int jvar)
{
  Real x=SqrtGrad2();
  const unsigned int cvar = mapJvarToCvar(jvar);


//----------------------------
  if (_isQs[cvar])
    { return _dPdEta[_qp]*_L[_qp]*_H[_qp]*2.0*_test[_i][_qp]*
      (_grad_phi[_j][_qp]*coupledGradient("Qs",_MapQs[cvar])[_qp])*InSqrtGrad2(x);
    }
//----------------------------

  Real dsum=(*_d2PdEtadarg[cvar])[_qp]*_L[_qp]*_H[_qp];

  if (_variable_L)
    dsum+=_dPdEta[_qp]*(*_dLdarg[cvar])[_qp]*_H[_qp];

  if (_variable_H)
    dsum+=_dPdEta[_qp]*_L[_qp]*(*_dHdarg[cvar])[_qp];

    dsum*= PhiTest2Square(x);

  return dsum;

}

//** SqrtGrad2() *********************************************************
Real
PusztaiACBulkB::SqrtGrad2()
{
  // Real sum=_grad_u[_qp]*_grad_u[_qp];
  Real sum=0.0;
  for (unsigned int i = 0; i < _nQs; ++i)
    sum+=coupledGradient("Qs", i)[_qp]*coupledGradient("Qs", i)[_qp];

  return sqrt(sum);
}

//** InSqrtGrad2() *********************************************************
//** InSqrtGrad2() *********************************************************
Real
PusztaiACBulkB::InSqrtGrad2(const Real &x)
{ if (x>_Z)
   return tanh(_A*x)/x;

  return _A*cosh(_A*x);
}

//** PhiTest2Square() *********************************************************
Real
PusztaiACBulkB::PhiTest2Square(const Real &x)
{
  return _phi[_j][_qp]*_test[_i][_qp]*2.0*x;
}
