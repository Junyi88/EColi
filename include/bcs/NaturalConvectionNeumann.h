/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef NATURALCONVECTIONNEUMANN_H
#define NATURALCONVECTIONNEUMANN_H

#include "IntegratedBC.h"

class NaturalConvectionNeumann : public IntegratedBC
{
public:
  NaturalConvectionNeumann(const InputParameters & parameters);
  virtual ~NaturalConvectionNeumann() {}

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();

  const VariableValue & _T_infinity;

  const Real _Ph;
  const Real _m;
};

template <>
InputParameters validParams<NaturalConvectionNeumann>();

#endif // COUPLEDCONVECTIVEFLUX_H
