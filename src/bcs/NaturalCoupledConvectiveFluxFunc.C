/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#include "NaturalCoupledConvectiveFluxFunc.h"

#include "Function.h"

template <>
InputParameters
validParams<NaturalCoupledConvectiveFluxFunc>()
{
  InputParameters params = validParams<IntegratedBC>();
  params.addRequiredCoupledVar("T_infinity", "Field holding far-field temperature");
  params.addRequiredParam<MaterialPropertyName>("h",  "Heat Transfer Coefficient");
  params.addRequiredParam<FunctionName>("function", "The function.");

  return params;
}

//IntegratedBC(parameters),
NaturalCoupledConvectiveFluxFunc::NaturalCoupledConvectiveFluxFunc(const InputParameters & parameters)
  : DerivativeMaterialInterface<JvarMapIntegratedBCInterface<IntegratedBC>>(parameters),
    _T_infinity(coupledValue("T_infinity")),
    _H(getMaterialProperty<Real>("h")),
    _dHdT(getMaterialPropertyDerivative<Real>("h", _var.name())),
    _func(getFunction("function"))
{
}

Real
NaturalCoupledConvectiveFluxFunc::computeQpResidual()
{
  return _test[_i][_qp] * _H[_qp] * (_u[_qp] - _T_infinity[_qp]) * _func.value(_t, _q_point[_qp]);
}

Real
NaturalCoupledConvectiveFluxFunc::computeQpJacobian()
{
  return _test[_i][_qp] * (_dHdT[_qp]* (_u[_qp] - _T_infinity[_qp]) + _H[_qp]) * _phi[_j][_qp] * _func.value(_t, _q_point[_qp]);
}
