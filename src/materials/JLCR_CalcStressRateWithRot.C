#include "JLCR_CalcStressRateWithRot.h"
#include "MooseMesh.h"
#include "Assembly.h"
// libmesh includes
#include "libmesh/quadrature.h"

template<>
InputParameters validParams<JLCR_CalcStressRateWithRot>()
{
  InputParameters params = validParams<Material>();
  return params;
}

JLCR_CalcStressRateWithRot::JLCR_CalcStressRateWithRot(const InputParameters & parameters) :
    DerivativeMaterialInterface<Material>(parameters),
    _elasticity_tensor(getMaterialPropertyByName<RankFourTensor>("Rotated_elasticity_tensor")), //elasticity_tensor
    _VelGrad(getMaterialPropertyByName<RankTwoTensor>("DeformV_Gradient")), //DeformV_Gradient,Velocity_Gradient
    _StressRate(declareProperty<RankTwoTensor>("Stress_Rate"))
{
 //moron
}

void
JLCR_CalcStressRateWithRot::initQpStatefulProperties()
{
  _StressRate[_qp].zero();

}

void
JLCR_CalcStressRateWithRot::computeQpProperties()
{
    _StressRate[_qp]=_elasticity_tensor[_qp]*_VelGrad[_qp];

}
