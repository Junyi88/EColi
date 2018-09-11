#ifndef JLU1_VelocityU_H
#define JLU1_VelocityU_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

// Forward Declaration
class JLU1_VelocityU;

template <>
InputParameters validParams<JLU1_VelocityU>();

//----------------------------------------------------------------
class JLU1_VelocityU : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JLU1_VelocityU(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  const VariableValue & _dp; // Displacements
  const VariableValue & _dp_old; // Displacements Previous Step
  const VariableValue & _u_old; // Velocity Previous Step
  Real _Accumulator;
};

#endif
