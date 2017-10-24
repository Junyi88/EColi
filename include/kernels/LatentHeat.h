#ifndef LATENTHEAT_H
#define LATENTHEAT_H

//LatentHeat
#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class LatentHeat;

template<>
InputParameters validParams<LatentHeat>();

class LatentHeat : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  LatentHeat(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  //const unsigned int _nvar;

  const MaterialProperty<Real> & _Conductivity;
  // const MaterialProperty<Real> & _CL;

  // For Jacobian Diag
  const MaterialProperty<Real> & _dConductivitydTemp;

  // Other Auxiliary Variables
  unsigned int _Temp_var;
  const VariableValue & _Temp;
  const VariableGradient & _grad_Temp;

  const Real _Tmelt;
  const Real _K;
  const Real _DT;
  const Real _dummy;

};

#endif
