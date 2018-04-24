#ifndef JEUk_Mo_StressDiv2D_H
#define JEUk_Mo_StressDiv2D_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class JEUk_Mo_StressDiv2D;

template<>
InputParameters validParams<JEUk_Mo_StressDiv2D>();

class JEUk_Mo_StressDiv2D : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JEUk_Mo_StressDiv2D(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);
  virtual unsigned int WhichJacobianVariable(unsigned var);

  const unsigned int _nvar;
  const VariableValue & _NormalStress;
  const VariableValue & _ShearStress;

  unsigned _component;
  unsigned _other_component;

  unsigned int _NormalStress_var_number;
  unsigned int _ShearStress_var_number;
};

#endif
