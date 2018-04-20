#include "JEUk_Mo_TimeDerivative.h"

template<>
InputParameters validParams<JEUk_Mo_TimeDerivative>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Momentum - Time Derivative ");
  params.addCoupledVar("rho", "Density");
  return params;
}

//** Constructor *********************************************************

JEUk_Mo_TimeDerivative::JEUk_Mo_TimeDerivative(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _rho(coupledValue("rho"))
    {
    }

//** computeQpResidual() *********************************************************
Real
JEUk_Mo_TimeDerivative::computeQpResidual()
{
  return _rho[_qp]*_test[_i][_qp]*_u_dot[_qp];
}

//** computeQpJacobian() *********************************************************
Real
JEUk_Mo_TimeDerivative::computeQpJacobian()
{
    return _rho[_qp]*_test[_i][_qp] * _phi[_j][_qp] * _du_dot_du[_qp];
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JEUk_Mo_TimeDerivative::computeQpOffDiagJacobian(unsigned int jvar)
{
    return _phi[_j][_qp]*_test[_i][_qp]*_u_dot[_qp];
}
