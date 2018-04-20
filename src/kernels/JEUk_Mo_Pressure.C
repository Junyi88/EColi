#include "JEUk_Mo_Pressure.h"

template<>
InputParameters validParams<JEUk_Mo_Pressure>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Momentum for Pressure");
  params.addRequiredParam<Real>("Pressure", "Pressure");
  return params;
}

//** Constructor *********************************************************

JEUk_Mo_Pressure::JEUk_Mo_Pressure(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _Pressure(getParam<Real>("Pressure"))
    {
    }

//** computeQpResidual() *********************************************************
Real
JEUk_Mo_Pressure::computeQpResidual()
{
  return -_Pressure*_test[_qp];
}

//** computeQpJacobian() *********************************************************
Real
JEUk_Mo_Pressure::computeQpJacobian()
{
    return 0.0;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JEUk_Mo_Pressure::computeQpOffDiagJacobian(unsigned int jvar)
{
    return 0.0;
}
