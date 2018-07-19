#ifndef JLCR_StressRotationRate_H
#define JLCR_StressRotationRate_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"
#include "JUtils_GetVarType.h"
#include "RankFourTensor.h"
#include "RankTwoTensor.h"

// Forward Declaration
class JLCR_StressRotationRate;

template <>
InputParameters validParams<JLCR_StressRotationRate>();

//----------------------------------------------------------------
class JLCR_StressRotationRate : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JLCR_StressRotationRate(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;
  virtual unsigned int WhichJacobianVariable(unsigned var);
  Real GetStress(unsigned int i, unsigned int j);


  unsigned int _componentI;
  unsigned int _componentJ;

  std::vector<const VariableValue *> _Stress;

  std::vector<unsigned int> _v_num;
  std::vector<unsigned int> _Stress_num;
  std::vector<unsigned int> _Stress_num_i;
  std::vector<unsigned int> _Stress_num_j;
  std::vector<unsigned int> _Stress_map;

  const MaterialProperty<RankTwoTensor> & _SpinVel;

  Real _Dummy;
  unsigned int _num_v, _n;
};

#endif // COUPLEDTIMEDERIVATIVE_H
