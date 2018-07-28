#include "ZTest_VelocitySplit.h"

template<>
InputParameters validParams<ZTest_VelocitySplit>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Velocities");
  params.addCoupledVar("Acceleration", "Acceleration");
  params.addParam<Real>("Gamma", 0.5, "Beta");
  return params;
}

//** Constructor *********************************************************

ZTest_VelocitySplit::ZTest_VelocitySplit(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _Gamma(getParam<Real>("Gamma")),
    _ac(coupledValue("Acceleration")),
    _ac_old(coupledValueOld("Acceleration")),
    _Accumulator(0.0),
    _u_old(valueOld())
    {
    }

//** computeQpResidual() *********************************************************
Real
ZTest_VelocitySplit::computeQpResidual()
{

  _Accumulator=_Gamma*_ac[_qp]+(1.0-_Gamma)*_ac_old[_qp];
  _Accumulator*=_dt;
  _Accumulator+=(_u_old[_qp]-_u[_qp]);
  _Accumulator*=_test[_i][_qp];

  return _Accumulator;
}

//** computeQpJacobian() *********************************************************
Real
ZTest_VelocitySplit::computeQpJacobian()
{

  return -_phi[_j][_qp]*_test[_i][_qp];
}

//** computeQpOffDiagJacobian() *********************************************************
Real
ZTest_VelocitySplit::computeQpOffDiagJacobian(unsigned int jvar)
{


  return _phi[_j][_qp]*_test[_i][_qp]*_Gamma*_dt;

}
