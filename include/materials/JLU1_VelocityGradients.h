#ifndef JLU1_VelocityGradients_H
#define JLU1_VelocityGradients_H

#include "Material.h"
#include "RankTwoTensor.h"
#include "RankFourTensor.h"
#include "RotationTensor.h"
#include "DerivativeMaterialInterface.h"

class JLU1_VelocityGradients : public DerivativeMaterialInterface<Material>
{
public:
  JLU1_VelocityGradients(const InputParameters & parameters);
  virtual ~JLU1_VelocityGradients() {}

  virtual void computeQpProperties();

protected:
  virtual void initQpStatefulProperties() override;

  /// Coupled displacement variables
  unsigned int _ndisp;

  std::vector<const VariableValue *> _vel;
  std::vector<const VariableGradient *> _grad_vel;

  MaterialProperty<RankTwoTensor> & _L_grad_vel;
  MaterialProperty<RankTwoTensor> & _D_grad_vel;
  MaterialProperty<RankTwoTensor> & _W_grad_vel;

};

#endif
