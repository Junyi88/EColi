#include "Gen_SelfRate.h"

template<>
InputParameters validParams<Gen_SelfRate>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Self");
  params.addCoupledVar("v", "velocity");
  return params;
}

//** Constructor *********************************************************

Gen_SelfRate::Gen_SelfRate(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _v(coupledValue("v"))
    {
    }

//** computeQpResidual() *********************************************************
Real
Gen_SelfRate::computeQpResidual()
{
  return (_u_dot[_qp]-_v[_qp])*_test[_i][_qp];
}

//** computeQpJacobian() *********************************************************
Real
Gen_SelfRate::computeQpJacobian()
{
    return _test[_i][_qp] * _phi[_j][_qp] * _du_dot_du[_qp];
}
//** computeQpJacobian() *********************************************************
Real
Gen_SelfRate::computeQpOffDiagJacobian(unsigned int jvar)
{
    return -_phi[_j][_qp]*_test[_i][_qp];
}
