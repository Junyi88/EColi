/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef MASKEDCOUPLEDCONVECTIVEFLUX_H
#define MASKEDCOUPLEDCONVECTIVEFLUX_H

#include "IntegratedBC.h"

class MaskedCoupledConvectiveFlux : public IntegratedBC
{
public:
  MaskedCoupledConvectiveFlux(const InputParameters & parameters);
  virtual ~MaskedCoupledConvectiveFlux() {}

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();

  const VariableValue & _T_infinity;
  const Real _coefficient;

  const MaterialProperty<Real> & _mask;
};

template <>
InputParameters validParams<MaskedCoupledConvectiveFlux>();

#endif // COUPLEDCONVECTIVEFLUX_H
