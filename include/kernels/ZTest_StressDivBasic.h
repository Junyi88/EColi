#ifndef ZTest_StressDivBasic_H
#define ZTest_StressDivBasic_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"

// Forward Declaration
class ZTest_StressDivBasic;

template <>
InputParameters validParams<ZTest_StressDivBasic>();

//----------------------------------------------------------------
class ZTest_StressDivBasic : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  ZTest_StressDivBasic(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;
  virtual unsigned int WhichJacobianVariable(unsigned var);

  const unsigned int _ComponentI;
  std::vector<unsigned int> _OtherDisp;
  std::vector<unsigned int> _IVals;

  Real _Gamma_Beta;
  const MaterialProperty<RankTwoTensor> & _StressRate;
  const MaterialProperty<RankTwoTensor> & _StressOld;
  const MaterialProperty<RankFourTensor> & _Cijlk;
  Real _Accumulator;
  unsigned int _num_var;

};

#endif // COUPLEDTIMEDERIVATIVE_H
