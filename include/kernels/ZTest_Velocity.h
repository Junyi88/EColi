#ifndef ZTest_Velocity_H
#define ZTest_Velocity_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

// Forward Declaration
class ZTest_Velocity;

template <>
InputParameters validParams<ZTest_Velocity>();

//----------------------------------------------------------------
class ZTest_Velocity : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  ZTest_Velocity(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const unsigned int _ComponentI;

  Real _Gamma;
  Real _Beta;
  Real _Gamma_Beta;
  Real _Con1;
  Real _Con2;

  std::vector<const MaterialProperty<Real> *> _Acc;
  const VariableValue & _dp;
  const VariableValue & _dp_old;
  unsigned int _var_d;

  Real _Accumulator;
  const VariableValue & _u_old;
};

#endif // COUPLEDTIMEDERIVATIVE_H
