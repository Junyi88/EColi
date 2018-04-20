#ifndef JEUk_Mo_NV_HS2D_H
#define JEUk_Mo_NV_HS2D_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class JEUk_Mo_NV_HS2D;

template<>
InputParameters validParams<JEUk_Mo_NV_HS2D>();

class JEUk_Mo_NV_HS2D : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JEUk_Mo_NV_HS2D(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  const VariableValue & _v1;
  const VariableGradient & _grad_v1;

  unsigned _component;
  unsigned _other_component;

  Real _Lambda;
};

#endif