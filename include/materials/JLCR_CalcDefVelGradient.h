#ifndef JLCR_CalcDefVelGradient_H
#define JLCR_CalcDefVelGradient_H

#include "Material.h"
#include "RankTwoTensor.h"
#include "RankFourTensor.h"
#include "RotationTensor.h"
#include "DerivativeMaterialInterface.h"

class JLCR_CalcDefVelGradient : public DerivativeMaterialInterface<Material>
{
public:
  JLCR_CalcDefVelGradient(const InputParameters & parameters);
  virtual ~JLCR_CalcDefVelGradient() {}

  virtual void computeQpProperties();
protected:
  virtual void initQpStatefulProperties() override;

  /// Coupled displacement variables
  unsigned int _ndisp;

  MaterialProperty<RankTwoTensor> & _DefGrad;
  const MaterialProperty<RankTwoTensor> & _DefGrad_old;
  MaterialProperty<RankTwoTensor> & _RotMat;
  MaterialProperty<RankTwoTensor> & _StretchMat;

  std::vector<const VariableValue *> _vel;
  std::vector<const VariableGradient *> _grad_vel;
  MaterialProperty<RankTwoTensor> & _VelGrad;
  MaterialProperty<RankTwoTensor> & _SpinVel;
  MaterialProperty<RankTwoTensor> & _DefVel;


};

#endif
