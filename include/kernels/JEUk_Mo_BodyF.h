#ifndef JEUk_Mo_BodyF_H
#define JEUk_Mo_BodyF_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class JEUk_Mo_BodyF;

template<>
InputParameters validParams<JEUk_Mo_BodyF>();

class JEUk_Mo_BodyF : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JEUk_Mo_BodyF(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  const VariableValue & _rho;
  Real _BodyF;
};

#endif
