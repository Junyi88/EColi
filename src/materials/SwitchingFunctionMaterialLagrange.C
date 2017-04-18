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
  MooseEnum h_order("SIMPLE=0 HIGH", "SIMPLE");
  params.set<std::string>("function_name") = std::string("h");
  return params;
}

SwitchingFunctionMaterialLagrange::SwitchingFunctionMaterialLagrange(const InputParameters & parameters)
  : OrderParameterFunctionMaterial(parameters)
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


  if (n<0.0)
  {
    _prop_f[_qp] = 0.0;
    _prop_df[_qp] = 0.0;
    _prop_d2f[_qp] = 0.0;
  }
  if (n>1.0)
  {
    _prop_f[_qp] = 1.0;
    _prop_df[_qp] = 0.0;
    _prop_d2f[_qp] = 0.0;
  }


}
