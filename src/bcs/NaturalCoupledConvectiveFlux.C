/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#include "NaturalCoupledConvectiveFlux.h"

#include "Function.h"

template <>
InputParameters
validParams<NaturalCoupledConvectiveFlux>()
{
  InputParameters params = validParams<IntegratedBC>();
  params.addRequiredCoupledVar("T_infinity", "Field holding far-field temperature");
  params.addRequiredParam<MaterialPropertyName>("h",  "Heat Transfer Coefficient");


  return params;
}

NaturalCoupledConvectiveFlux::NaturalCoupledConvectiveFlux(const InputParameters & parameters)
  : IntegratedBC(parameters),
    _T_infinity(coupledValue("T_infinity")),
    _H(getMaterialProperty<Real>("h")),
    _dHdT(getMaterialPropertyDerivative<Real>("h", _var.name()))
{
}

Real
NaturalCoupledConvectiveFlux::computeQpResidual()
{
  return _test[_i][_qp] * _H[_qp] * (_u[_qp] - _T_infinity[_qp]);
}

Real
NaturalCoupledConvectiveFlux::computeQpJacobian()
{
  return _test[_i][_qp] * (_dHdT[_qp]* (_u[_qp] - _T_infinity[_qp]) + _H[_qp]) * _phi[_j][_qp];
}
