#ifndef ZTest_VelocityJump_H
#define ZTest_VelocityJump_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

// Forward Declaration
class ZTest_VelocityJump;

template <>
InputParameters validParams<ZTest_VelocityJump>();

//----------------------------------------------------------------
class ZTest_VelocityJump : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  ZTest_VelocityJump(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _dp;
  const VariableValue & _dp_old;
  const VariableValue & _u_old;
  Real _Accumulator;
};

#endif // COUPLEDTIMEDERIVATIVE_H
