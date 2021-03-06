/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef SWITCHINGFUNCTIONMATERIALLAGRANGE_H
#define SWITCHINGFUNCTIONMATERIALLAGRANGE_H

#include "OrderParameterFunctionMaterial.h"

// Forward Declarations
class SwitchingFunctionMaterialLagrange;

template <>
InputParameters validParams<SwitchingFunctionMaterialLagrange>();

/**
 * Material class to provide the switching function \f$ h(\eta) \f$ for
 * the KKS system.
 *
 * \see KKSPhaseChemicalPotential
 * \see KKSCHBulk
 */
class SwitchingFunctionMaterialLagrange : public OrderParameterFunctionMaterial
{
public:
  SwitchingFunctionMaterialLagrange(const InputParameters & parameters);

protected:
  virtual void computeQpProperties();
  Real _P;
  
  Real _Z1;
  Real _A1;
  Real _B1;

  Real _Z2;
  Real _A2;
  Real _B2;
};

#endif // SWITCHINGFUNCTIONMATERIALLAGRANGE_H
