#ifndef ZTest_VelocitySplit_H
#define ZTest_VelocitySplit_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

// Forward Declaration
class ZTest_VelocitySplit;

template <>
InputParameters validParams<ZTest_VelocitySplit>();

//----------------------------------------------------------------
class ZTest_VelocitySplit : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  ZTest_VelocitySplit(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;


  const Real &_Gamma;

  const VariableValue & _ac;
  const VariableValue & _ac_old;

  Real _Accumulator;
  const VariableValue & _u_old;
};

#endif // COUPLEDTIMEDERIVATIVE_H
