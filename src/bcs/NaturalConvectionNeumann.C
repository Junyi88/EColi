/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#include "NaturalConvectionNeumann.h"

#include "Function.h"

template <>
InputParameters
validParams<NaturalConvectionNeumann>()
{
  InputParameters params = validParams<IntegratedBC>();
  params.addRequiredCoupledVar("T_infinity", "Field holding far-field temperature");
  params.addRequiredParam<Real>("Ph", "Heat transfer coefficient");
  params.addRequiredParam<Real>("m", "Heat transfer coefficient");

  return params;
}

NaturalConvectionNeumann::NaturalConvectionNeumann(const InputParameters & parameters)
  : IntegratedBC(parameters),
    _T_infinity(coupledValue("T_infinity")),
    _Ph(getParam<Real>("Ph")),
    _m(getParam<Real>("m"))
{
}

Real
NaturalConvectionNeumann::computeQpResidual()
{
  return _test[_i][_qp] * _Ph * pow( (_u[_qp] / _T_infinity[_qp]) , (-_m));
}

Real
NaturalConvectionNeumann::computeQpJacobian()
{
  return _test[_i][_qp] * -_m * _Ph * pow( (1.0/ _T_infinity[_qp]) , (-_m)) * pow( _u[_qp] , (-_m-1.0)) * _phi[_j][_qp] ;
}
