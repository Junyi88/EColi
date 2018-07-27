#ifndef ZTest_NewmarkBetaAcceleration_H
#define ZTest_NewmarkBetaAcceleration_H

#include "Material.h"
#include "RankTwoTensor.h"
#include "RankFourTensor.h"
#include "RotationTensor.h"
#include "DerivativeMaterialInterface.h"

class ZTest_NewmarkBetaAcceleration : public DerivativeMaterialInterface<Material>
{
public:
  ZTest_NewmarkBetaAcceleration(const InputParameters & parameters);
  virtual ~ZTest_NewmarkBetaAcceleration() {}

  virtual void computeQpProperties();
protected:
  virtual void initQpStatefulProperties();

  /// Coupled displacement variables


  const MaterialProperty<RankFourTensor> & _elasticity_tensor;
  const MaterialProperty<RankTwoTensor> & _VelGrad;

  MaterialProperty<RankTwoTensor> & _StressRate;
};

#endif
