#include "Gen_Dummy.h"

template<>
InputParameters validParams<Gen_Dummy>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Self");
  return params;
}

//** Constructor *********************************************************

Gen_Dummy::Gen_Dummy(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters)
    {
    }

//** computeQpResidual() *********************************************************
Real
Gen_Dummy::computeQpResidual()
{
  return 0.0;
}

//** computeQpJacobian() *********************************************************
// Real
// Gen_Dummy::computeQpJacobian()
// {
//     return 0.0;
// }
