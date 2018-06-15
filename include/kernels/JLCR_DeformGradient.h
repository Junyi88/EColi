#ifndef JLCR_DeformGradient_H
#define JLCR_DeformGradient_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

// Forward Declaration
class JLCR_DeformGradient;

template <>
InputParameters validParams<JLCR_DeformGradient>();

//----------------------------------------------------------------
class JLCR_DeformGradient : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JLCR_StressDivergence(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;
  virtual unsigned int WhichJacobianVariable(unsigned var);

  const unsigned int _nvar;

  const VariableValue & _Foth1;
  const VariableValue & _Foth2;
  const VariableValue & _disp;
  const VariableGradient & _grad_disp;
  unsigned int _componentI;
  unsigned int _componentJ;

  unsigned int _Foth1_var_number;
  unsigned int _Foth2_var_number;
  unsigned int _disp_var_number;

  unsigned int _component_oth1;
  unsigned int _component_oth2;

  Real _inter1;
  const bool _IJSame;
  unsigned int _itype;
};

#endif // COUPLEDTIMEDERIVATIVE_H
