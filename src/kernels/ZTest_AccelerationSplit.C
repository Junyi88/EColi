#include "ZTest_AccelerationSplit.h"

template<>
InputParameters validParams<ZTest_AccelerationSplit>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Velocities");
  params.addCoupledVar("Displacement", "Displacements");
  params.addCoupledVar("Velocity", "Displacements");
  params.addParam<Real>("Beta", 0.25, "Beta");
  return params;
}

//** Constructor *********************************************************

ZTest_AccelerationSplit::ZTest_AccelerationSplit(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _Beta(getParam<Real>("Beta")),
    _dp(coupledValue("Displacement")),
    _dp_old(coupledValueOld("Displacement")),
    _v_old(coupledValueOld("Velocity")),
    _u_old(valueOld()),
    _var_d(coupled("Displacement")),
    _Accumulator(0.0)
    {

    }

//** computeQpResidual() *********************************************************
Real
ZTest_AccelerationSplit::computeQpResidual()
{

  _Accumulator=-_Beta*_dt*_dt*_u[_qp];
  _Accumulator-=_dp_old[_qp];
  _Accumulator+=_dp[_qp];
  _Accumulator-=_v_old[_qp]*_dt;
  _Accumulator-=_u_old[_qp]*_dt*_dt*0.5*(1.0-2.0*_Beta);
  _Accumulator*=_test[_i][_qp];

  return _Accumulator;
}

//** computeQpJacobian() *********************************************************
Real
ZTest_AccelerationSplit::computeQpJacobian()
{

  return -_Beta*_dt*_dt*_phi[_j][_qp]*_test[_i][_qp];
}

//** computeQpOffDiagJacobian() *********************************************************
Real
ZTest_AccelerationSplit::computeQpOffDiagJacobian(unsigned int jvar)
{
  //return _phi[_j][_qp]*_test[_i][_qp];
  if (jvar==_var_d){
   return _phi[_j][_qp]*_test[_i][_qp];
  }

  return 0.0;

}
