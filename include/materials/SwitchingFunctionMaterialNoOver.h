/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef SWITCHINGFUNCTIONMATERIALNOOVER_H
#define SWITCHINGFUNCTIONMATERIALNOOVER_H

#include "OrderParameterFunctionMaterial.h"

// Forward Declarations
class SwitchingFunctionMaterialNoOver;

template <>
InputParameters validParams<SwitchingFunctionMaterialNoOver>();

/**
 * Material class to provide the switching function \f$ h(\eta) \f$ for
 * the KKS system.
 *
 * \see KKSPhaseChemicalPotential
 * \see KKSCHBulk
 */
class SwitchingFunctionMaterialNoOver : public OrderParameterFunctionMaterial
{
public:
  SwitchingFunctionMaterialNoOver(const InputParameters & parameters);

protected:
  virtual void computeQpProperties();

  /// Polynomial order of the switching function \f$ h(\eta) \f$
  MooseEnum _h_order;
};

#endif // SWITCHINGFUNCTIONMATERIALNOOVER_H
