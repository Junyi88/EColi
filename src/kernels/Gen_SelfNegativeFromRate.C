#include "Gen_SelfNegativeFromRate.h"

template<>
InputParameters validParams<Gen_SelfNegativeFromRate>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Self");
  params.addCoupledVar("v", "velocity");
  return params;
}

//** Constructor *********************************************************

Gen_SelfNegativeFromRate::Gen_SelfNegativeFromRate(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _v(coupledValue("v"))
    {
    }

//** computeQpResidual() *********************************************************
Real
Gen_SelfNegativeFromRate::computeQpResidual()
{
  return -_v[_qp]*_test[_i][_qp];
}

//** computeQpJacobian() *********************************************************
// Real
// Gen_SelfNegativeFromRate::computeQpJacobian()
// {
//     return 0.0;
// }
//** computeQpJacobian() *********************************************************
Real
Gen_SelfNegativeFromRate::computeQpOffDiagJacobian(unsigned int jvar)
{
    return -_phi[_j][_qp]*_test[_i][_qp];
}
