#ifndef JLCR_CalcStressRateWithRot_H
#define JLCR_CalcStressRateWithRot_H

#include "Material.h"
#include "RankTwoTensor.h"
#include "RankFourTensor.h"
#include "RotationTensor.h"
#include "DerivativeMaterialInterface.h"

class JLCR_CalcStressRateWithRot : public DerivativeMaterialInterface<Material>
{
public:
  JLCR_CalcStressRateWithRot(const InputParameters & parameters);
  virtual ~JLCR_CalcStressRateWithRot() {}

  virtual void computeQpProperties();
protected:
  virtual void initQpStatefulProperties();

  /// Coupled displacement variables


  const MaterialProperty<RankFourTensor> & _elasticity_tensor;
  const MaterialProperty<RankTwoTensor> & _VelGrad;

  MaterialProperty<RankTwoTensor> & _StressRate;
};

#endif
