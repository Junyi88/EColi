/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#include "MaskedCoupledConvectiveFlux.h"

#include "Function.h"

template <>
InputParameters
validParams<MaskedCoupledConvectiveFlux>()
{
  InputParameters params = validParams<IntegratedBC>();
  params.addRequiredCoupledVar("T_infinity", "Field holding far-field temperature");
  params.addRequiredParam<Real>("coefficient", "Heat transfer coefficient");
  params.addRequiredParam<MaterialPropertyName>("Mask_name",  "The material to mask the system");

  return params;
}

MaskedCoupledConvectiveFlux::MaskedCoupledConvectiveFlux(const InputParameters & parameters)
  : IntegratedBC(parameters),
    _T_infinity(coupledValue("T_infinity")),
    _coefficient(getParam<Real>("coefficient")),
    _mask(getMaterialProperty<Real>("Mask_name"))
{
}

Real
MaskedCoupledConvectiveFlux::computeQpResidual()
{
  return _test[_i][_qp] * _coefficient * (_u[_qp] - _T_infinity[_qp]) * _mask[_qp];
}

Real
MaskedCoupledConvectiveFlux::computeQpJacobian()
{
  return _test[_i][_qp] * _coefficient * _phi[_j][_qp] * _mask[_qp] ;
}
