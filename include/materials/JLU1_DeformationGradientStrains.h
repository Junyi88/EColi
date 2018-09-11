#ifndef JLU1_DeformationGradientStrains_H
#define JLU1_DeformationGradientStrains_H

#include "Material.h"
#include "RankTwoTensor.h"
#include "RankFourTensor.h"
#include "RotationTensor.h"
#include "DerivativeMaterialInterface.h"

class JLU1_DeformationGradientStrains : public DerivativeMaterialInterface<Material>
{
public:
  JLU1_DeformationGradientStrains(const InputParameters & parameters);
  virtual ~JLU1_DeformationGradientStrains() {}

  virtual void computeQpProperties();

protected:
  virtual void initQpStatefulProperties() override;

  /// Coupled displacement variables
  const MaterialProperty<RankTwoTensor> & _L_grad_vel;

  MaterialProperty<RankTwoTensor> & _F;
  MaterialProperty<RankTwoTensor> & _Fdot;
  MaterialProperty<RankTwoTensor> & _Strain;
  const MaterialProperty<RankTwoTensor> & _F_old;
};

#endif
