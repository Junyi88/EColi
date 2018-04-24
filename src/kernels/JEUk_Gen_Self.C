#include "JEUk_Gen_Self.h"

template<>
InputParameters validParams<JEUk_Gen_Self>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Self");
  return params;
}

//** Constructor *********************************************************

JEUk_Gen_Self::JEUk_Gen_Self(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters)
    {
    }

//** computeQpResidual() *********************************************************
Real
JEUk_Gen_Self::computeQpResidual()
{
  return _u[_qp]*_test[_i][_qp];
}

//** computeQpJacobian() *********************************************************
Real
JEUk_Gen_Self::computeQpJacobian()
{
    return _phi[_j][_qp]*_test[_i][_qp];
}
