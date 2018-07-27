#include "ZTest_NewmarkBetaAcceleration.h"
#include "MooseMesh.h"
#include "Assembly.h"
// libmesh includes
#include "libmesh/quadrature.h"

template<>
InputParameters validParams<ZTest_NewmarkBetaAcceleration>()
{
  InputParameters params = validParams<Material>();
  params.addClassDescription("Calculate Acceleration Using Newmark Beta");
  params.addCoupledVar("displacements", "Displacements");
  params.addCoupledVar("velocities", "Velocity");
  params.addParam<Real>("Gamma", 0.5, "Gamma");
  params.addParam<Real>("Beta", 0.25, "Beta");

  return params;
}

ZTest_NewmarkBetaAcceleration::ZTest_NewmarkBetaAcceleration(const InputParameters & parameters) :
    DerivativeMaterialInterface<Material>(parameters),
    _elasticity_tensor(getMaterialPropertyByName<RankFourTensor>("Rotated_elasticity_tensor")), //elasticity_tensor
    _VelGrad(getMaterialPropertyByName<RankTwoTensor>("DeformV_Gradient")), //DeformV_Gradient,Velocity_Gradient
    _StressRate(declareProperty<RankTwoTensor>("Stress_Rate"))
{
 //moron
}

void
ZTest_NewmarkBetaAcceleration::initQpStatefulProperties()
{
  _StressRate[_qp].zero();

}

void
ZTest_NewmarkBetaAcceleration::computeQpProperties()
{
    _StressRate[_qp]=_elasticity_tensor[_qp]*_VelGrad[_qp];

}
