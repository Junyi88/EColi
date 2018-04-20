#ifndef JEUk_Mo_Convec2D_H
#define JEUk_Mo_Convec2D_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class JEUk_Mo_Convec2D;

template<>
InputParameters validParams<JEUk_Mo_Convec2D>();

class JEUk_Mo_Convec2D : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JEUk_Mo_Convec2D(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);
  virtual unsigned int WhichJacobianVariable(unsigned var);

  const unsigned int _nvar;
  const VariableValue & _v1;
  const VariableValue & _rho;

  const VariableGradient & _grad_v1;

  unsigned int _v1_var_number;
  unsigned int _rho_var_number;
  unsigned _component;
  unsigned _other_component;
};

#endif