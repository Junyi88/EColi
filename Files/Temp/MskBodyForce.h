/****************************************************************/
/*               DO NOT MODIFY THIS HEADER                      */
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*           (c) 2010 Battelle Energy Alliance, LLC             */
/*                   ALL RIGHTS RESERVED                        */
/*                                                              */
/*          Prepared by Battelle Energy Alliance, LLC           */
/*            Under Contract No. DE-AC07-05ID14517              */
/*            With the U. S. Department of Energy               */
/*                                                              */
/*            See COPYRIGHT for full restrictions               */
/****************************************************************/

#ifndef MSKBODYFORCE_H
#define MSKBODYFORCE_H

#include "Kernel.h"

// Forward Declarations
class MskBodyForce;
class Function;

template <>
InputParameters validParams<MskBodyForce>();

/**
 * This kernel implements a generic functional
 * body force term:
 * $ - c \cdof f \cdot \phi_i $
 *
 * The coefficient and function both have defaults
 * equal to 1.0.
 */
class MskBodyForce : public Kernel
{
public:
  MskBodyForce(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;

  const Real & _value;
  Function & _function;
  const PostprocessorValue * const _postprocessor;

private:
  const MaterialProperty<Real> & _Mask;
};

#endif
