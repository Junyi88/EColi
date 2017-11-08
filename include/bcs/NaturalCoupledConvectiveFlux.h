/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef NATURALCOUPLEDCONVECTIVEFLUX_H
#define NATURALCOUPLEDCONVECTIVEFLUX_H

#include "IntegratedBC.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

// class NaturalCoupledConvectiveFlux : public IntegratedBC
class NaturalCoupledConvectiveFlux : public DerivativeMaterialInterface<JvarMapIntegratedBCInterface<IntegratedBC>>
{
public:
  NaturalCoupledConvectiveFlux(const InputParameters & parameters);
  virtual ~NaturalCoupledConvectiveFlux() {}

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();

  const VariableValue & _T_infinity;
  const MaterialProperty<Real> & _H;
  const MaterialProperty<Real> & _dHdT;

};

template <>
InputParameters validParams<NaturalCoupledConvectiveFlux>();

#endif // COUPLEDCONVECTIVEFLUX_H
