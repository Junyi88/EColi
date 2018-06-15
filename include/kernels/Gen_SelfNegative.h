#ifndef Gen_SelfNegative_H
#define Gen_SelfNegative_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class Gen_SelfNegative;

template<>
InputParameters validParams<Gen_SelfNegative>();

class Gen_SelfNegative : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  Gen_SelfNegative(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
//  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

};

#endif
