/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef HeatConduction2KERNEL_H
#define HEATCONDUCTION2KERNEL_H

#include "Diffusion.h"
#include "Material.h"

// Forward Declarations
class HeatConduction2Kernel;

template <>
InputParameters validParams<HeatConduction2Kernel>();

/**
 * Note: This class is named HeatConductionKernel instead of HeatConduction
 * to avoid a clash with the HeatConduction namespace.  It is registered
 * as HeatConduction, which means it can be used by that name in the input
 * file.
 */
class HeatConduction2Kernel : public Diffusion
{
public:
  HeatConduction2Kernel(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual();

  virtual Real computeQpJacobian();

private:
  const MaterialProperty<Real> & _diffusion_coefficient;
  const MaterialProperty<Real> * const _diffusion_coefficient_dT;
};

#endif // HEATCONDUCTION2KERNEL_H
