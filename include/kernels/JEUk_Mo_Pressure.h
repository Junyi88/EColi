#ifndef JEUk_Mo_Pressure_H
#define JEUk_Mo_Pressure_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class JEUk_Mo_Pressure;

template<>
InputParameters validParams<JEUk_Mo_Pressure>();

class JEUk_Mo_Pressure : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JEUk_Mo_Pressure(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  Real _Pressure;
};

#endif
