#include "JLU1_StressFromRates.h"
#include "MooseMesh.h"
#include "Assembly.h"
// libmesh includes
#include "libmesh/quadrature.h"

template<>
InputParameters validParams<JLU1_StressFromRates>()
{
  InputParameters params = validParams<Material>();
  return params;
}

JLU1_StressFromRates::JLU1_StressFromRates(const InputParameters & parameters) :
    DerivativeMaterialInterface<Material>(parameters),
    _elasticity_tensor(getMaterialPropertyByName<RankFourTensor>("elasticity_tensor")),
    _D_grad_vel(getMaterialPropertyByName<RankTwoTensor>("DVelocity_Gradient")),
    _StressRate(declareProperty<RankTwoTensor>("Stress_Rate")),
    _Stress(declareProperty<RankTwoTensor>("Stress")),
    _Stress_old(getMaterialPropertyOld<RankTwoTensor>("Stress"))
{}

// --------------------------------------------
void
JLU1_StressFromRates::initQpStatefulProperties()
{
  _StressRate[_qp].zero();
  _Stress[_qp].zero();
}

void
JLU1_StressFromRates::computeQpProperties()
{
    _StressRate[_qp]=_elasticity_tensor[_qp]*_D_grad_vel[_qp];
    _Stress[_qp]=_Stress_old[_qp]+_dt*_StressRate[_qp];
}
