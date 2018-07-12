#ifndef Gen_SelfNegativeFromRate_H
#define Gen_SelfNegativeFromRate_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class Gen_SelfNegativeFromRate;

template<>
InputParameters validParams<Gen_SelfNegativeFromRate>();

class Gen_SelfNegativeFromRate : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  Gen_SelfNegativeFromRate(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  // virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  const VariableValue & _v;
};

#endif
