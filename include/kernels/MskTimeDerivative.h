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

#ifndef MSKTIMEDERIVATIVE_H
#define MSKTIMEDERIVATIVE_H

#include "TimeKernel.h"

// Forward Declaration
class MskTimeDerivative;

template <>
InputParameters validParams<MskTimeDerivative>();

class MskTimeDerivative : public TimeKernel
{
public:
  MskTimeDerivative(const InputParameters & parameters);

  virtual void computeJacobian() override;

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;

  bool _lumping;

private:
  const MaterialProperty<Real> & _Mask;
};

#endif // TIMEDERIVATIVE_H
