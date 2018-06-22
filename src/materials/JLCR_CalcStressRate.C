#include "JLCR_CalcStressRate.h"
#include "MooseMesh.h"
#include "Assembly.h"
// libmesh includes
#include "libmesh/quadrature.h"

template<>
InputParameters validParams<JLCR_CalcStressRate>()
{
  InputParameters params = validParams<Material>();
  return params;
}

JLCR_CalcStressRate::JLCR_CalcStressRate(const InputParameters & parameters) :
    DerivativeMaterialInterface<Material>(parameters),
    _elasticity_tensor(getMaterialPropertyByName<RankFourTensor>("elasticity_tensor")),
    _VelGrad(getMaterialPropertyByName<RankTwoTensor>("Velocity_Gradient")),
    _StressRate(declareProperty<RankTwoTensor>("Stress_Rate"))
{

}

void
JLCR_CalcStressRate::initQpStatefulProperties()
{
  _StressRate[_qp].zero();

}

void
JLCR_CalcStressRate::computeProperties()
{
    _StressRate[_qp]=_elasticity_tensor[_qp]*_VelGrad[_qp];

}
