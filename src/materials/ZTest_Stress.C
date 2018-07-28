#include "ZTest_Stress.h"
#include "MooseMesh.h"
#include "Assembly.h"
// libmesh includes
#include "libmesh/quadrature.h"

template<>
InputParameters validParams<ZTest_Stress>()
{
  InputParameters params = validParams<Material>();
  params.addClassDescription("Calculate Stress");
  return params;
}

ZTest_Stress::ZTest_Stress(const InputParameters & parameters) :
    DerivativeMaterialInterface<Material>(parameters),
    _Stress(declareProperty<RankTwoTensor>("Stress")),
    _Stress_old(getMaterialPropertyOld<RankTwoTensor>("Stress")),
    _StressRate(getMaterialProperty<RankTwoTensor>("Stress_Rate"))
{

}

void
ZTest_Stress::initQpStatefulProperties()
{
  _Stress[_qp].zero();

}

void
ZTest_Stress::computeQpProperties()
{

  _Stress[_qp]=_Stress_old[_qp]+_dt*_StressRate[_qp];
}
