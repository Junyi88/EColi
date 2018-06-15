#include "JLCR_StressDivergence.h"

template<>
InputParameters validParams<JLCR_StressDivergence>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Stress Divergence");
  params.addCoupledVar("Stresses", "Stress_i1, Stress_i2, Stress_i3");
  return params;
}

//** Constructor *********************************************************

JLCR_StressDivergence::JLCR_StressDivergence(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _nvar(_coupled_moose_vars.size()),
    _Stress1(coupledValue("Stresses",0)),
    _Stress2(coupledValue("Stresses",1)),
    _Stress3(coupledValue("Stresses",2)),
    _Stress1_var_number(coupled("Stresses",0)),
    _Stress2_var_number(coupled("Stresses",1)),
    _Stress3_var_number(coupled("Stresses",2))
    {}

//** computeQpResidual() *********************************************************
Real
JLCR_StressDivergence::computeQpResidual()
{
  return (_grad_test[_i][_qp](0)*_Stress1[_qp])+
     (_grad_test[_i][_qp](1)*_Stress2[_qp])+
     (_grad_test[_i][_qp](2)*_Stress3[_qp]);
}

//** computeQpJacobian() *********************************************************
Real
JLCR_StressDivergence::computeQpJacobian()
{
  return 0.0;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JLCR_StressDivergence::computeQpOffDiagJacobian(unsigned int jvar)
{
  return _grad_test[_i][_qp](WhichJacobianVariable(jvar))*_phi[_j][_qp];
}

// ** WhichJacobianVariable
unsigned int
JLCR_StressDivergence::WhichJacobianVariable(unsigned var)
{
  if (var == _Stress1_var_number)
    return 0;
  else if (var == _Stress2_var_number)
    return 1;
  else if (var == _Stress3_var_number)
    return 2;
  else
    return 1000;
}
