#ifndef PUSZTAICHBULK_H
#define PUSZTAICHBULK_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"


#include <iostream>
#include <fstream>

//----------------------------------
class PusztaiCHBulk;

template<>
InputParameters validParams<PusztaiCHBulk>();

class PusztaiCHBulk : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  PusztaiCHBulk(const InputParameters & parameters);
  // virtual void initialSetup();

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  const unsigned int _nvar;
  unsigned int _nQs;


  const MaterialProperty<Real> & _L;
  const MaterialProperty<Real> & _H;
  const MaterialProperty<Real> & _P;

  // For Jacobian Off-Diag
  std::vector<const MaterialProperty<Real> *> _dLdarg;
  std::vector<const MaterialProperty<Real> *> _dHdarg;
  std::vector<const MaterialProperty<Real> *> _dPdarg;
  std::vector<const MaterialProperty<Real> *> _d2LdEtadarg;
  std::vector<std::vector<const MaterialProperty<Real> *> > _d2Ldarg2;
  std::vector<const VariableGradient *> _gradarg;


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
  RealGradient NablaLTest();
  RealGradient DiffNablaLTest(const unsigned int &cvar);

  Real SqrtGrad2();
  Real InSqrtGrad2();
  Real dInSqrtGrad2_dEta();
  Real dInSqrtGrad2_dArg(const unsigned int &cvar);

  RealGradient H2PNablaLTest();
  RealGradient Nabla2LTest();
};

#endif
