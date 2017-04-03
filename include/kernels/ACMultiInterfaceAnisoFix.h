/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef ACMULTIINTERFACEANISOFIX_H
#define ACMULTIINTERFACEANISOFIX_H

#include "Kernel.h"
#include <cmath>
#include <iostream>
#include <istream>
#include <fstream>
#include <ostream>

//Forward Declarations
class ACMultiInterfaceAnisoFix;

template<>
InputParameters validParams<ACMultiInterfaceAnisoFix>();

/**
 * Compute the gradient interface terms for a multiphase system. This includes
 * cross terms of the form \f$ \left( \eta_a\nabla\eta_b - \eta_b\nabla\eta_a \right)^2\f$.
 * Note that in a two phase system with \f$ \eta = \eta_b = 1-\eta_a \f$ the regular ACInterface
 * kernel can be used as the gradient interface term simplifies to the usual
 * \f$ ()\nabla\eta)^2 \f$ form.
 *
 * http://mooseframework.org/wiki/PhysicsModules/PhaseField/DevelopingModels/MultiPhaseModels/ACMultiInterfaceAnisoFix/
 */
class ACMultiInterfaceAnisoFix : public Kernel
{
public:
  ACMultiInterfaceAnisoFix(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int);

  /// Order parameters
  unsigned int _num_dim;
  unsigned int _num_etas;
  std::vector<const VariableValue *> _eta;
  std::vector<const VariableGradient *> _grad_eta;

  /// Lookup table from couple variable number into the etas vector
  std::vector<int> _eta_vars;

  /// Index of the eta this kernel is operating on
  unsigned int _a;

  /// Interface gradient prefactor
  std::vector<MaterialPropertyName> _kappa_names;
  std::vector<const MaterialProperty<Real> *> _kappa;

  /// Mobility
  const MaterialProperty<Real> & _L;


  // Multiplication
  RealGradient kappaXgradeta(const int b,const RealGradient gradeta);
};

#endif //ACMULTIINTERFACE_H