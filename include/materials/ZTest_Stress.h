#ifndef ZTest_Stress_H
#define ZTest_Stress_H

#include "Material.h"
#include "RankTwoTensor.h"
#include "RankFourTensor.h"
#include "RotationTensor.h"
#include "DerivativeMaterialInterface.h"

class ZTest_Stress : public DerivativeMaterialInterface<Material>
{
public:
  ZTest_Stress(const InputParameters & parameters);
  virtual ~ZTest_Stress() {}

  virtual void computeQpProperties();
protected:
  virtual void initQpStatefulProperties();

  /// Coupled displacement variables
  MaterialProperty<RankTwoTensor> & _Stress;
  const MaterialProperty<RankTwoTensor> & _Stress_old;
  const MaterialProperty<RankTwoTensor> & _StressRate;

};

#endif
