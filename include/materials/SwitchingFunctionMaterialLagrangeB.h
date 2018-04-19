/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef SWITCHINGFUNCTIONMATERIALLAGRANGEB_H
#define SWITCHINGFUNCTIONMATERIALLAGRANGEB_H

#include "OrderParameterFunctionMaterial.h"

// Forward Declarations
class SwitchingFunctionMaterialLagrangeB;

template <>
InputParameters validParams<SwitchingFunctionMaterialLagrangeB>();

/**
 * Material class to provide the switching function \f$ h(\eta) \f$ for
 * the KKS system.
 *
 * \see KKSPhaseChemicalPotential
 * \see KKSCHBulk
 */
class SwitchingFunctionMaterialLagrangeB : public OrderParameterFunctionMaterial
{
public:
  SwitchingFunctionMaterialLagrangeB(const InputParameters & parameters);

protected:
  virtual void computeQpProperties();
};

#endif // SWITCHINGFUNCTIONMATERIALLAGRANGEB_H
