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
  MaterialProperty<RankTwoTensor> & _RotMat;
  MaterialProperty<RankTwoTensor> & _elasticity_tensor;
  MaterialProperty<RankTwoTensor> & _R_Cijkl_RT;


};

#endif
