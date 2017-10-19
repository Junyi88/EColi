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

#ifndef FUNCTIONNEUMANNJUNYIBC_H
#define FUNCTIONNEUMANNJUNYIBC_H

#include "IntegratedBC.h"

// Forward Declarations
class FunctionNeumannJunyiBC;
class Function;

template <>
InputParameters validParams<FunctionNeumannBC>();

/**
 * Boundary condition of a Neumann style whose value is computed by a user-defined function
 */
class FunctionNeumannJunyiBC : public IntegratedBC
{
public:
  FunctionNeumannJunyiBC(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;

  /// The function being used for setting the value
  Function & _func;
  const RealVectorValue & _value;
  const MaterialProperty<Real> & _mask;
};

#endif // FUNCTIONNEUMANNBC_H
