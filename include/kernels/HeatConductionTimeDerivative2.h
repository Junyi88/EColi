/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef HEATCONDUCTIONTIMEDERIVATIVE2_H
#define HEATCONDUCTIONTIMEDERIVATIVE2_H

// MOOSE includes
#include "TimeDerivative.h"
#include "Material.h"

// Forward Declarations
class HeatConductionTimeDerivative2;

template <>
InputParameters validParams<HeatConductionTimeDerivative2>();

/**
 * A class for defining the time derivative of the heat equation.
 *
 * By default this Kernel computes:
 *   \f$ \rho * c_p * \frac{\partial T}{\partial t}, \f$
 * where \f$ \rho \f$ and \f$ c_p \f$ are material properties with the names "density" and
 * "specific_heat", respectively.
 */
class HeatConductionTimeDerivative2 : public TimeDerivative
{
public:
  /// Contructor for Heat Equation time derivative term.
  HeatConductionTimeDerivative2(const InputParameters & parameters);

protected:
  /// Compute the residual of the Heat Equation time derivative.
  virtual Real computeQpResidual();

  /// Compute the jacobian of the Heat Equation time derivative.
  virtual Real computeQpJacobian();

  const MaterialProperty<Real> & _specific_heat;
  const MaterialProperty<Real> & _density;
  const MaterialProperty<Real> & _Mask;
};

#endif // HEATCONDUCTIONTIMEDERIVATIVE_H
