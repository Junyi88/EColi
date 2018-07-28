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


  std::vector<const VariableValue *> _Displacements;
  std::vector<const VariableValue *> _Displacements_old;
  std::vector<const VariableValue *> _Velocities;

  MaterialProperty<Real> & _Acc_x;
  MaterialProperty<Real> & _Acc_y;
  MaterialProperty<Real> & _Acc_z;

  const MaterialProperty<Real> & _Acc_x_old;
  const MaterialProperty<Real> & _Acc_y_old;
  const MaterialProperty<Real> & _Acc_z_old;

  const Real _Beta;
  const Real _Con1;
  Real _Con2;
};

#endif
