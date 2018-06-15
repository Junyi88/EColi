#ifndef JEUk_Stress_NV_Dev2D_H
#define JEUk_Stress_NV_Dev2D_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class JEUk_Stress_NV_Dev2D;

template<>
InputParameters validParams<JEUk_Stress_NV_Dev2D>();

class JEUk_Stress_NV_Dev2D : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JEUk_Stress_NV_Dev2D(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);
  virtual unsigned int WhichJacobianVariable(unsigned var);

  const unsigned int _nvar;
  const VariableGradient & _grad_v1;
  const VariableGradient & _grad_v2;

  Real _Mu;
  unsigned int _v1_var_number;
  unsigned int _v2_var_number;

  unsigned _component1;
  unsigned _component2;
};

#endif
