/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#include "SwitchingFunctionMaterialLagrange.h"

template <>
InputParameters
validParams<SwitchingFunctionMaterialLagrange>()
{
  InputParameters params = validParams<OrderParameterFunctionMaterial>();
  params.addClassDescription("Helper material to provide h(eta) and its derivative in one of two "
                             "polynomial forms.\nSIMPLE: 3*eta^2-2*eta^3\nHIGH: "
                             "eta^3*(6*eta^2-15*eta+10)");
  params.set<std::string>("function_name") = std::string("h");
  params.addParam<Real>("Correction_P", 0.00, "Max ReflectPoint");
  params.addParam<Real>("Correction_Z", 0.01, "ReflectPoint");
  return params;
}

SwitchingFunctionMaterialLagrange::SwitchingFunctionMaterialLagrange(const InputParameters & parameters)
  : OrderParameterFunctionMaterial(parameters),
    _P(getParam<Real>("Correction_P")),
    _Z1(getParam<Real>("Correction_Z")),
    _A1((1.0)/(_Z1+_P)),
    _B1((_Z1+_P)/exp(_A1*_Z1)),
    _Z2(1.0-_Z1),
    _A2(1.0/(1.0-_Z2+_P)),
    _B2((1.0-_Z2+_P)/exp(-_A2*_Z2))
{
}

void
SwitchingFunctionMaterialLagrange::computeQpProperties()
{
  Real n = _eta[_qp];
  //n = n > 1 ? 1 : (n < 0 ? 0 : n);


      _prop_f[_qp] = n;
      _prop_df[_qp] = 1.0;
      _prop_d2f[_qp] = 0.0;


  if (n<_Z1)
  {
    _prop_f[_qp] = _B1*exp(_A1*n)-_P;
    _prop_df[_qp] = _A1*_B1*exp(_A1*n);
    _prop_d2f[_qp] =_A1*_prop_df[_qp];
  }
  if (n>_Z2)
  {
    _prop_f[_qp] = 1.0-_B2*exp(-_A2*n)+_P;
    _prop_df[_qp] = _A2*_B2*exp(-_A2*n);
    _prop_d2f[_qp] = -_A2*_prop_df[_qp];
  }


}
