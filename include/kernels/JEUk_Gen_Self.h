#ifndef JEUk_Gen_Self_H
#define JEUk_Gen_Self_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class JEUk_Gen_Self;

template<>
InputParameters validParams<JEUk_Gen_Self>();

class JEUk_Gen_Self : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JEUk_Gen_Self(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
//  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

};

#endif
