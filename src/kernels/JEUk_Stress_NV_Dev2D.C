#include "JEUk_Stress_NV_Dev2D.h"

template<>
InputParameters validParams<JEUk_Stress_NV_Dev2D>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Stress with NV Hydrostatic");
  params.addCoupledVar("Velocities", "The Velocities");
  params.addRequiredParam<Real>("Mu", "Mu");
  params.addParam<unsigned>("Component1", 1, "The component of the velocity");
  params.addParam<unsigned>("Component2", 2, "The component of the velocity");
  return params;
}

//** Constructor *********************************************************

JEUk_Stress_NV_Dev2D::JEUk_Stress_NV_Dev2D(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _nvar(_coupled_moose_vars.size()),
    _grad_v1(coupledGradient("Velocities",0)),
    _grad_v2(coupledGradient("Velocities",1)),
    _Mu(getParam<Real>("Mu")),
    _v1_var_number(coupled("velocities",0)),
    _v2_var_number(coupled("velocities",1)),
    _component1(getParam<unsigned>("Component1")),
    _component2(getParam<unsigned>("Component2"))
    {
    }

//** computeQpResidual() *********************************************************
Real
JEUk_Stress_NV_Dev2D::computeQpResidual()
{
  return -_Mu*_test[_i][_qp]*(_grad_v1[_qp](_component2-1)+_grad_v2[_qp](_component1-1));
}

//** computeQpJacobian() *********************************************************
Real
JEUk_Stress_NV_Dev2D::computeQpJacobian()
{
  return 0.0;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JEUk_Stress_NV_Dev2D::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (WhichJacobianVariable(jvar)==1){
    return -_Mu*_test[_i][_qp]*(_grad_phi[_j][_qp](_component2-1));

  } else if (WhichJacobianVariable(jvar)==2){

    return -_Mu*_test[_i][_qp]*(_grad_phi[_j][_qp](_component1-1));

  } else
    return 0.0;
}

// ** WhichJacobianVariable
unsigned int
JEUk_Stress_NV_Dev2D::WhichJacobianVariable(unsigned var)
{
  if (var == _v1_var_number)
    return 1;
  else if (var == _v2_var_number)
    return 2;
  else
    return 0;
}
