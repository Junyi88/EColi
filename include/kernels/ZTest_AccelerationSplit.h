#ifndef ZTest_AccelerationSplit_H
#define ZTest_AccelerationSplit_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

// Forward Declaration
class ZTest_AccelerationSplit;

template <>
InputParameters validParams<ZTest_AccelerationSplit>();

//----------------------------------------------------------------
class ZTest_AccelerationSplit : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  ZTest_AccelerationSplit(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;


  Real _Beta;
  const VariableValue & _dp;
  const VariableValue & _dp_old;
  const VariableValue & _v_old;
  const VariableValue & _u_old;
  unsigned int _var_d;
  Real _Accumulator;
};

#endif // COUPLEDTIMEDERIVATIVE_H
