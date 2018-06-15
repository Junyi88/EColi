#ifndef JEUk_Mo_TimeDerivative_H
#define JEUk_Mo_TimeDerivative_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class JEUk_Mo_TimeDerivative;

template<>
InputParameters validParams<JEUk_Mo_TimeDerivative>();

class JEUk_Mo_TimeDerivative : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JEUk_Mo_TimeDerivative(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  const VariableValue & _rho;
};

#endif
