#ifndef JLU1_StressFromRates_H
#define JLU1_StressFromRates_H

#include "Material.h"
#include "RankTwoTensor.h"
#include "RankFourTensor.h"
#include "RotationTensor.h"
#include "DerivativeMaterialInterface.h"

class JLU1_StressFromRates : public DerivativeMaterialInterface<Material>
{
public:
  JLU1_StressFromRates(const InputParameters & parameters);
  virtual ~JLU1_StressFromRates() {}

  virtual void computeQpProperties();
protected:
  virtual void initQpStatefulProperties();

  // --------------------------------------------------------
  const MaterialProperty<RankFourTensor> & _elasticity_tensor;
  const MaterialProperty<RankTwoTensor> & _D_grad_vel;

  MaterialProperty<RankTwoTensor> & _StressRate;
  MaterialProperty<RankTwoTensor> & _Stress;
  const MaterialProperty<RankTwoTensor> & _Stress_old;
};

#endif
