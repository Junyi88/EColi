#ifndef Gen_SelfRate_H
#define Gen_SelfRate_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class Gen_SelfRate;

template<>
InputParameters validParams<Gen_SelfRate>();

class Gen_SelfRate : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  Gen_SelfRate(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  const VariableValue & _v;
};

#endif
