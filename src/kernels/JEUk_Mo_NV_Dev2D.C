#include "JEUk_Mo_NV_Dev2D.h"

template<>
InputParameters validParams<JEUk_Mo_NV_Dev2D>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Momentum with NV Hydrostatic");
  params.addCoupledVar("OtherVel", "The Other Component of velocity");
  params.addRequiredParam<unsigned>("Component", "The component of the velocity");
  params.addRequiredParam<Real>("Mu", "Mu");
  return params;
}

//** Constructor *********************************************************

JEUk_Mo_NV_Dev2D::JEUk_Mo_NV_Dev2D(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _v1(coupledValue("OtherVel")),
    _grad_v1(coupledGradient("OtherVel")),
    _component(getParam<unsigned>("Component")),
    _Mu(getParam<Real>("Lambda"))
    {
      if (_component==1)
        _other_component=2;
      else
        _other_component=1;
    }

//** computeQpResidual() *********************************************************
Real
JEUk_Mo_NV_Dev2D::computeQpResidual()
{
  return -_Mu*_test[_qp]*(_grad_u[_qp](_other_component)+_grad_v1[_qp](_component));
}

//** computeQpJacobian() *********************************************************
Real
JEUk_Mo_NV_Dev2D::computeQpJacobian()
{
  return -_Mu*_test[_qp]*(_grad_phi[_j][_qp](_other_component));
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JEUk_Mo_NV_Dev2D::computeQpOffDiagJacobian(unsigned int jvar)
{
  return -_Mu*_test[_qp]*(_grad_phi[_j][_qp](_component));
}
