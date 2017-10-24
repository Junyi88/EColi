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

#ifndef COUPLEDTIMEDERIVATIVEMELT_H
#define COUPLEDTIMEDERIVATIVEMELT_H

#include "Kernel.h"

// Forward Declaration
class CoupledTimeDerivativeMelt;

template <>
InputParameters validParams<CoupledTimeDerivativeMelt>();

/**
 * This calculates the time derivative for a coupled variable
 **/
class CoupledTimeDerivativeMelt : public Kernel
{
public:
  CoupledTimeDerivativeMelt(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _v;
  const VariableValue & _v_dot;
  const VariableValue & _dv_dot;
  const unsigned int _v_var;

  const Real _Tmelt;
  const Real _K;
};

#endif // COUPLEDTIMEDERIVATIVE_H
