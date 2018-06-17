#ifndef JLCR_CalcVelTensor_H
#define JLCR_CalcVelTensor_H

#include "Material.h"
#include "RankTwoTensor.h"
#include "RankFourTensor.h"
#include "RotationTensor.h"
#include "DerivativeMaterialInterface.h"

class JLCR_CalcVelTensor : public DerivativeMaterialInterface<Material>
{
public:
  JLCR_CalcVelTensor(const InputParameters & parameters);
  virtual ~JLCR_CalcVelTensor() {}

  virtual void computeProperties();
protected:
  virtual void initQpStatefulProperties();

  /// Coupled displacement variables
  unsigned int _ndisp;
  std::vector<const VariableValue *> _vel;
  std::vector<const VariableGradient *> _grad_vel;
  MaterialProperty<RankTwoTensor> & _VelGrad;
  MaterialProperty<RankTwoTensor> & _SpinMat;
  MaterialProperty<RankTwoTensor> & _DefMat;

};

#endif
