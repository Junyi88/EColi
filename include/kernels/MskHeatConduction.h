/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef MSKHEATCONDUCTIONKERNEL_H
#define MSKHEATCONDUCTIONKERNEL_H

#include "Diffusion.h"
#include "Material.h"

// Forward Declarations
class MskHeatConduction;

template <>
InputParameters validParams<MskHeatConduction>();

/**
 * Note: This class is named MskHeatConduction instead of HeatConduction
 * to avoid a clash with the HeatConduction namespace.  It is registered
 * as HeatConduction, which means it can be used by that name in the input
 * file.
 */
class MskHeatConduction : public Diffusion
{
public:
  MskHeatConduction(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual();

  virtual Real computeQpJacobian();

private:
  const MaterialProperty<Real> & _diffusion_coefficient;
  const MaterialProperty<Real> * const _diffusion_coefficient_dT;

  const MaterialProperty<Real> & _Mask;
};

#endif // HEATCONDUCTIONKERNEL_H
