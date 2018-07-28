#include "ZTest_Velocity.h"

template<>
InputParameters validParams<ZTest_Velocity>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Velocities");
  params.addCoupledVar("Displacement", "Displacements");
  params.addRequiredParam<unsigned int>("component",
                                        "An integer corresponding to the direction "
                                        "the variable this kernel acts in. (0 for x, "
                                        "1 for y, 2 for z)");
  params.addParam<Real>("Gamma", 0.5, "Gamma");
  params.addParam<Real>("Beta", 0.25, "Beta");
  return params;
}

//** Constructor *********************************************************

ZTest_Velocity::ZTest_Velocity(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _ComponentI(getParam<unsigned int>("component")),
    _Gamma(getParam<Real>("Gamma")),
    _Beta(getParam<Real>("Beta")),
    _Gamma_Beta(_Gamma/_Beta),
    _Con1(1.0-_Gamma_Beta),
    _Con2((1.0-_Gamma)+0.5*_Gamma_Beta*(1.0-2.0*_Beta)),
    _Acc(3),
    _dp(coupledValue("Displacement")),
    _dp_old(coupledValueOld("Displacement")),
    _var_d(coupled("Displacement")),
    _Accumulator(0.0),
    _u_old(valueOld())
    {

      _Acc[0]=&getMaterialPropertyOld<Real>("Acc_x");
      _Acc[1]=&getMaterialPropertyOld<Real>("Acc_y");
      _Acc[2]=&getMaterialPropertyOld<Real>("Acc_z");
    }

//** computeQpResidual() *********************************************************
Real
ZTest_Velocity::computeQpResidual()
{
  //_u_dot=(_u[_qp]-_u_old[_qp])/dt
  _Accumulator=_Con1*(_u_old[_qp]-_u[_qp])*_dt;
  _Accumulator+=(_dt*_dt)*_Con2*(*_Acc[_ComponentI])[_qp];

  // _Accumulator=-_Con1*_u_dot[_qp];
  // _Accumulator+=_Con2*(*_Acc[_ComponentI])[_qp];
  // _Accumulator*=(_dt*_dt);
  _Accumulator+=_Gamma_Beta*(_dp[_qp]-_dp_old[_qp]);
  _Accumulator*=_test[_i][_qp];

  return _Accumulator;
}

//** computeQpJacobian() *********************************************************
Real
ZTest_Velocity::computeQpJacobian()
{

  return -_dt*_phi[_j][_qp]*_test[_i][_qp];
}

//** computeQpOffDiagJacobian() *********************************************************
Real
ZTest_Velocity::computeQpOffDiagJacobian(unsigned int jvar)
{

  if (jvar==_var_d){
   return _phi[_j][_qp]*_test[_i][_qp]*_Gamma_Beta;
  }


  return 0.0;
}
