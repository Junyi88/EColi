#include "JLU1_VelocityU.h"

template<>
InputParameters validParams<JLU1_VelocityU>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernel For Velocities from Displacements");
  params.addCoupledVar("Displacement", "Displacement");
  return params;
}

//** Constructor *********************************************************

JLU1_VelocityU::JLU1_VelocityU(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _dp(coupledValue("Displacement")),
    _dp_old(coupledValueOld("Displacement")),
    _u_old(valueOld()),
    _Accumulator(0.0)
    {
    }

//** computeQpResidual() *********************************************************
Real
JLU1_VelocityU::computeQpResidual()
{
  _Accumulator=-_dt*_u[_qp];
  _Accumulator+=_dp[_qp]-_dp_old[_qp];
  _Accumulator*=_test[_i][_qp];

  return _Accumulator;
}

//** computeQpJacobian() *********************************************************
Real
JLU1_VelocityU::computeQpJacobian()
{
  return -_phi[_j][_qp]*_test[_i][_qp]*_dt;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JLU1_VelocityU::computeQpOffDiagJacobian(unsigned int jvar)
{
  return _phi[_j][_qp]*_test[_i][_qp];
}
