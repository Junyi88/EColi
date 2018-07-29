#ifndef ZTest_StressDivJump_H
#define ZTest_StressDivJump_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"
#include "RankFourTensor.h"
#include "RankTwoTensor.h"

// Forward Declaration
class ZTest_StressDivJump;

template <>
InputParameters validParams<ZTest_StressDivJump>();

//----------------------------------------------------------------
class ZTest_StressDivJump : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  ZTest_StressDivJump(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;
  virtual unsigned int WhichJacobianVariable(unsigned var);

  unsigned int _ComponentI;
  std::vector<unsigned int> _OtherDisp;
  std::vector<unsigned int> _IVals;


  const MaterialProperty<RankTwoTensor> & _StressRate;
  const MaterialProperty<RankTwoTensor> & _StressOld;
  const MaterialProperty<RankFourTensor> & _Cijkl;
  Real _Accumulator;
  unsigned int _num_var;

};

#endif // COUPLEDTIMEDERIVATIVE_H
