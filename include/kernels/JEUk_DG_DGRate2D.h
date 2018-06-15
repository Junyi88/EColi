#ifndef JEUk_DG_DGRate2D_H
#define JEUk_DG_DGRate2D_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class JEUk_DG_DGRate2D;

template<>
InputParameters validParams<JEUk_DG_DGRate2D>();

class JEUk_DG_DGRate2D : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JEUk_DG_DGRate2D(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);
  virtual unsigned int WhichJacobianVariable(unsigned var);

  const unsigned int _nvar;
  const VariableGradient & _grad_v;
  const VariableValue & _Foth;

  unsigned int _v_var_number;
  unsigned int _Foth_var_number;

  unsigned _component_jself;
  unsigned _component_jother;
};

#endif
