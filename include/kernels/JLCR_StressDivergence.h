#ifndef JLCR_StressDivergence_H
#define JLCR_StressDivergence_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

// Forward Declaration
class JLCR_StressDivergence;

template <>
InputParameters validParams<JLCR_StressDivergence>();

//----------------------------------------------------------------
class JLCR_StressDivergence : public Kernel
{
public:
  JLCR_StressDivergence(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;
  virtual unsigned int WhichJacobianVariable(unsigned var);

  const unsigned int _nvar;

  const VariableValue & _Stress1;
  const VariableValue & _Stress2;
  const VariableValue & _Stress3;

  unsigned int _Stress1_var_number;
  unsigned int _Stress2_var_number;
  unsigned int _Stress3_var_number;

};

#endif // COUPLEDTIMEDERIVATIVE_H
