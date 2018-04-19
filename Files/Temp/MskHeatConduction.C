/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/

#include "HeatConduction.h"
#include "MooseMesh.h"

template <>
InputParameters
validParams<MskHeatConductionKernel>()
{
  InputParameters params = validParams<Diffusion>();
  params.addClassDescription(
      "Computes residual/Jacobian contribution for $(k \\nabla T, \\nabla \\psi)$ term.");
  params.addParam<MaterialPropertyName>(
      "diffusion_coefficient",
      "thermal_conductivity",
      "Property name of the diffusivity (Default: thermal_conductivity)");
  params.addParam<MaterialPropertyName>(
      "diffusion_coefficient_dT",
      "thermal_conductivity_dT",
      "Property name of the derivative of the diffusivity with respect "
      "to the variable (Default: thermal_conductivity_dT)");
  params.set<bool>("use_displaced_mesh") = true;

  params.addRequiredParam<MaterialPropertyName>("Mask",  "Mask Variable");
  return params;
}

MskHeatConductionKernel::MskHeatConductionKernel(const InputParameters & parameters)
  : Diffusion(parameters),
    _diffusion_coefficient(getMaterialProperty<Real>("diffusion_coefficient")),
    _diffusion_coefficient_dT(hasMaterialProperty<Real>("diffusion_coefficient_dT")
                                  ? &getMaterialProperty<Real>("diffusion_coefficient_dT")
                                  : NULL) , _Mask(getMaterialProperty<Real>("Mask"))
{
}

Real
MskHeatConductionKernel::computeQpResidual()
{
  if (_Mask[_qp]<0.5)
    return 0.0;

  return _diffusion_coefficient[_qp] * Diffusion::computeQpResidual();
}

Real
MskHeatConductionKernel::computeQpJacobian()
{
  if (_Mask[_qp]<0.5)
    return 0.0;
    
  Real jac = _diffusion_coefficient[_qp] * Diffusion::computeQpJacobian();
  if (_diffusion_coefficient_dT)
    jac += (*_diffusion_coefficient_dT)[_qp] * _phi[_j][_qp] * Diffusion::computeQpResidual();
  return jac;
}
