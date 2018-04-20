#include "JEUk_Mo_BodyF.h"

template<>
InputParameters validParams<JEUk_Mo_BodyF>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Momentum for Body Force");
  params.addCoupledVar("rho", "Density");
  params.addRequiredParam<Real>("BodyForce", "Body Force");
  return params;
}

//** Constructor *********************************************************

JEUk_Mo_BodyF::JEUk_Mo_BodyF(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _rho(coupledValue("rho")),
    _BodyF(getParam<Real>("BodyForce"))
    {
    }

//** computeQpResidual() *********************************************************
Real
JEUk_Mo_BodyF::computeQpResidual()
{
  return -_rho[_qp]*_BodyF*_test[_i][_qp];
}

//** computeQpJacobian() *********************************************************
Real
JEUk_Mo_BodyF::computeQpJacobian()
{
    return 0.0;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JEUk_Mo_BodyF::computeQpOffDiagJacobian(unsigned int jvar)
{
    return -_phi[_j][_qp]*_BodyF*_test[_i][_qp];
}
