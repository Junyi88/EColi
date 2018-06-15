#include "Gen_SelfNegative.h"

template<>
InputParameters validParams<JEUk_Gen_Self>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Self");
  return params;
}

//** Constructor *********************************************************

Gen_SelfNegative::Gen_SelfNegative(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters)
    {
    }

//** computeQpResidual() *********************************************************
Real
Gen_SelfNegative::computeQpResidual()
{
  return -_u[_qp]*_test[_i][_qp];
}

//** computeQpJacobian() *********************************************************
Real
Gen_SelfNegative::computeQpJacobian()
{
    return -_phi[_j][_qp]*_test[_i][_qp];
}
