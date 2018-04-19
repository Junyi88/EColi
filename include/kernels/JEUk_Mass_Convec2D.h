#ifndef JEUK_MASS_CONVEC2D_H
#define JEUK_MASS_CONVEC2D_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class JEUk_MassConvec2D;

template<>
InputParameters validParams<JEUk_MassConvec2D>();

class JEUk_MassConvec2D : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JEUk_MassConvec2D(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  const unsigned int _nvar;
  const VariableValue & _v1;
  const VariableValue & _v2;
  unsigned int _v1_var_number;
  unsigned int _v2_var_number;
};

#endif
