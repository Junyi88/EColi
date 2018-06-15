#include "JEUk_Stress_NV_HS2D.h"

template<>
InputParameters validParams<JEUk_Stress_NV_HS2D>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Stress with NV Hydrostatic");
  params.addCoupledVar("Velocities", "The Velocities");
  params.addRequiredParam<Real>("Lambda", "Lambda");
  params.addParam<Real>("Mu", 0.0, "Mu");
  return params;
}

//** Constructor *********************************************************

JEUk_Stress_NV_HS2D::JEUk_Stress_NV_HS2D(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _nvar(_coupled_moose_vars.size()),
    _grad_v1(coupledGradient("Velocities",0)),
    _grad_v2(coupledGradient("Velocities",1)),
    _Lambda(getParam<Real>("Lambda")),
    _Mu(getParam<Real>("Mu")),
    _v1_var_number(coupled("Velocities",0)),
    _v2_var_number(coupled("Velocities",1))
    { _Lambda+=2.0*_Mu;
    }

//** computeQpResidual() *********************************************************
Real
JEUk_Stress_NV_HS2D::computeQpResidual()
{
  return -_Lambda*_test[_i][_qp]*(_grad_v1[_qp](0)+_grad_v2[_qp](1));
}

//** computeQpJacobian() *********************************************************
Real
JEUk_Stress_NV_HS2D::computeQpJacobian()
{
  return 0.0;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JEUk_Stress_NV_HS2D::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (WhichJacobianVariable(jvar)==1){
    return -_Lambda*_test[_i][_qp]*(_grad_phi[_j][_qp](0));

  } else if (WhichJacobianVariable(jvar)==2){

    return -_Lambda*_test[_i][_qp]*(_grad_phi[_j][_qp](1));

  } else
    return 0.0;
}

// ** WhichJacobianVariable
unsigned int
JEUk_Stress_NV_HS2D::WhichJacobianVariable(unsigned var)
{
  if (var == _v1_var_number)
    return 1;
  else if (var == _v2_var_number)
    return 2;
  else
    return 0;
}
