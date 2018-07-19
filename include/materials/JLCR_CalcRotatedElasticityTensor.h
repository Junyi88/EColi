#ifndef JLCR_CalcRotatedElasticityTensor_H
#define JLCR_CalcRotatedElasticityTensor_H

#include "Material.h"
#include "RankTwoTensor.h"
#include "RankFourTensor.h"
#include "RotationTensor.h"
#include "DerivativeMaterialInterface.h"

class JLCR_CalcRotatedElasticityTensor : public DerivativeMaterialInterface<Material>
{
public:
  JLCR_CalcRotatedElasticityTensor(const InputParameters & parameters);
  virtual ~JLCR_CalcRotatedElasticityTensor() {}

  virtual void computeQpProperties();
protected:
  virtual void initQpStatefulProperties();

  /// Coupled displacement variables
  const MaterialProperty<RankTwoTensor> & _RotMat;
  const MaterialProperty<RankFourTensor> & _elasticity_tensor;
  MaterialProperty<RankFourTensor> & _R_Cijkl_RT;


};

#endif
