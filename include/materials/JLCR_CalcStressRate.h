#ifndef JLCR_CalcStressRate_H
#define JLCR_CalcStressRate_H

#include "Material.h"
#include "RankTwoTensor.h"
#include "RankFourTensor.h"
#include "RotationTensor.h"
#include "DerivativeMaterialInterface.h"

class JLCR_CalcStressRate : public DerivativeMaterialInterface<Material>
{
public:
  JLCR_CalcStressRate(const InputParameters & parameters);
  virtual ~JLCR_CalcStressRate() {}

  virtual void computeQpProperties();
protected:
  virtual void initQpStatefulProperties();

  /// Coupled displacement variables


  const MaterialProperty<RankFourTensor> & _elasticity_tensor;
  const MaterialProperty<RankTwoTensor> & _VelGrad;

  MaterialProperty<RankTwoTensor> & _StressRate;
};

#endif
