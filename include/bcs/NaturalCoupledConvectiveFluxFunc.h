/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef NATURALCOUPLEDCONVECTIVEFLUXFUNC_H
#define NATURALCOUPLEDCONVECTIVEFLUXFUNC_H

#include "IntegratedBC.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"
#include "Function.h"

//class NaturalCoupledConvectiveFluxFunc : public IntegratedBC
class NaturalCoupledConvectiveFluxFunc : public DerivativeMaterialInterface<JvarMapIntegratedBCInterface<IntegratedBC>>
{
public:
  NaturalCoupledConvectiveFluxFunc(const InputParameters & parameters);
  virtual ~NaturalCoupledConvectiveFluxFunc() {}

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();

  const VariableValue & _T_infinity;
  const MaterialProperty<Real> & _H;
  const MaterialProperty<Real> & _dHdT;
  Function & _func;
};

template <>
InputParameters validParams<NaturalCoupledConvectiveFluxFunc>();

#endif // COUPLEDCONVECTIVEFLUX_H
