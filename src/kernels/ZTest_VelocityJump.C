#include "ZTest_VelocityJump.h"

template<>
InputParameters validParams<ZTest_VelocityJump>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Velocities");
  params.addCoupledVar("Displacement", "Acceleration");
  return params;
}

//** Constructor *********************************************************

ZTest_VelocityJump::ZTest_VelocityJump(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _dp(coupledValue("Displacement")),
    _dp_old(coupledValueOld("Displacement")),
    _u_old(valueOld()),
    _Accumulator(0.0)
    {
    }

//** computeQpResidual() *********************************************************
Real
ZTest_VelocityJump::computeQpResidual()
{

  _Accumulator=-_dt*_u[_qp];
  _Accumulator+=_dp[_qp]-_dp_old[_qp];
  _Accumulator*=_test[_i][_qp];

  return _Accumulator;
}

//** computeQpJacobian() *********************************************************
Real
ZTest_VelocityJump::computeQpJacobian()
{

  return -_phi[_j][_qp]*_test[_i][_qp]*_dt;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
ZTest_VelocityJump::computeQpOffDiagJacobian(unsigned int jvar)
{


  return _phi[_j][_qp]*_test[_i][_qp];

}
