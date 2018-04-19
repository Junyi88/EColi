#ifndef LATENTCONDUCTIONTEMP_H
#define LATENTCONDUCTIONTEMP_H

//LatentConductionTemp
#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class LatentConductionTemp;

template<>
InputParameters validParams<LatentConductionTemp>();

class LatentConductionTemp : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  LatentConductionTemp(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  //virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  //const unsigned int _nvar;

  const MaterialProperty<Real> & _Conductivity;
  // const MaterialProperty<Real> & _CL;

  // For Jacobian Diag
  const MaterialProperty<Real> & _dConductivitydTemp;

  // Other Auxiliary Variables
  unsigned int _Eta_var;
  const VariableValue & _Eta;

  const Real _Tmelt;

};

#endif
