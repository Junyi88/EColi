#ifndef PUSZTAIACBULKB_H
#define PUSZTAIACBULKB_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

#include <iostream>
#include <fstream>
//----------------------------------
class PusztaiACBulkB;

template<>
InputParameters validParams<PusztaiACBulkB>();

class PusztaiACBulkB : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  PusztaiACBulkB(const InputParameters & parameters);
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
  const Real _A;
  const Real _Z;
  const bool _variable_L;
  const bool _variable_H;
  std::vector<bool> _isQs;
  std::vector<int> _MapQs;

   // Other functions
   Real SqrtGrad2();
   Real InSqrtGrad2(const Real &x);
   Real PhiTest2Square(const Real &x);
};

#endif
