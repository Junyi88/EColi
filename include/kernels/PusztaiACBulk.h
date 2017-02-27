#ifndef PUSZTAIACBULK_H
#define PUSZTAIACBULK_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class PusztaiACBulk;

template<>
InputParameters validParams<PusztaiACBulk>();

class PusztaiACBulk : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  PusztaiACBulk(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  const unsigned int _nvar;
  unsigned int _nQs;

  const MaterialProperty<Real> & _L;
  const MaterialProperty<Real> & _H;

  // For residual
  const MaterialProperty<Real> & _dPdEta;

  // For Jacobian Diag
  const MaterialProperty<Real> & _d2PdEta2;
  const MaterialProperty<Real> & _dLdEta;
  const MaterialProperty<Real> & _dHdEta;

  // For Jacobian Off-Diag
  std::vector<const MaterialProperty<Real> *> _d2PdEtadarg;
  std::vector<const MaterialProperty<Real> *> _dLdarg;
  std::vector<const MaterialProperty<Real> *> _dHdarg;
  // std::vector<const VariableGradient *> _gradarg;

  // Other Auxiliary Variables
  const Real _y0;
  const Real _Z;
  const Real _A3;
  const Real _A2;
  const bool _variable_L;
  const bool _variable_H;
  std::vector<bool> _isQs;
  std::vector<int> _MapQs;

   // Other functions
   Real SqrtGrad2();
   Real InSqrtGrad2();
   Real PhiTest2Square();
};

#endif
