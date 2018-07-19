#ifndef Gen_Gen_Dummy_H
#define Gen_Gen_Dummy_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class Gen_Dummy;

template<>
InputParameters validParams<Gen_Dummy>();

class Gen_Dummy : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  Gen_Dummy(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  // virtual Real computeQpJacobian();
//  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

};

#endif
