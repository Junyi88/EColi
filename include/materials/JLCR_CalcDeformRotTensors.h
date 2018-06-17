#ifndef JLCR_CalcDeformRotTensors_H
#define JLCR_CalcDeformRotTensors_H

#include "Material.h"
#include "RankTwoTensor.h"
#include "RankFourTensor.h"
#include "RotationTensor.h"
#include "DerivativeMaterialInterface.h"

class JLCR_CalcDeformRotTensors : public DerivativeMaterialInterface<Material>
{
public:
  JLCR_CalcDeformRotTensors(const InputParameters & parameters);
  virtual ~JLCR_CalcDeformRotTensors() {}

  virtual void computeProperties();
protected:
  virtual void initQpStatefulProperties();

  /// Coupled displacement variables
  unsigned int _ndisp;
  std::vector<const VariableValue *> _disp;
  std::vector<const VariableGradient *> _grad_disp;
  MaterialProperty<RankTwoTensor> & _DefGrad;
  MaterialProperty<RankTwoTensor> & _RotMat;
  MaterialProperty<RankTwoTensor> & _StretchMat;

};

#endif
