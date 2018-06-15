#ifndef JEUK_MASS_CONVECFULL2D_H
#define JEUK_MASS_CONVECFULL2D_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class JEUk_Mass_ConvecFull2D;

template<>
InputParameters validParams<JEUk_Mass_ConvecFull2D>();

class JEUk_Mass_ConvecFull2D : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JEUk_Mass_ConvecFull2D(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);
  virtual unsigned int WhichJacobianVariable(unsigned var);

  const unsigned int _nvar;
  const VariableValue & _v1;
  const VariableValue & _v2;
  unsigned int _v1_var_number;
  unsigned int _v2_var_number;

  RealGradient _grad_v1;
  RealGradient _grad_v2;
};

#endif
