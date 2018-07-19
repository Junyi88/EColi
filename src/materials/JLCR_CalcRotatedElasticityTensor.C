#include "JLCR_CalcRotatedElasticityTensor.h"
#include "MooseMesh.h"
#include "Assembly.h"
// libmesh includes
#include "libmesh/quadrature.h"

template<>
InputParameters validParams<JLCR_CalcRotatedElasticityTensor>()
{
  InputParameters params = validParams<Material>();
  params.addRequiredCoupledVar("velocities", "The displacements appropriate for the simulation geometry and coordinate system");
  return params;
}

JLCR_CalcRotatedElasticityTensor::JLCR_CalcRotatedElasticityTensor(const InputParameters & parameters) :
    DerivativeMaterialInterface<Material>(parameters),
    _RotMat(getMaterialProperty<RankTwoTensor>("Rotation_Matrix")),
    _elasticity_tensor(getMaterialProperty<RankFourTensor>("elasticity_tensor")),
    _R_Cijkl_RT(declareProperty<RankFourTensor>("Rotated_elasticity_tensor"))
{
  // fetch coupled variables and gradients (as stateful properties if necessary)
  _R_Cijkl_RT[_qp].zero();


}

void
JLCR_CalcRotatedElasticityTensor::initQpStatefulProperties()
{
  _R_Cijkl_RT[_qp]=_elasticity_tensor[_qp];
}

void
JLCR_CalcRotatedElasticityTensor::computeQpProperties()
{
    _R_Cijkl_RT[_qp].zero();
    for (int i=0;i<3;i++)
      for (int j=0;i<3;i++)
        for (int k=0;i<3;i++)
          for (int l=0;i<3;i++)
            for (int m=0;i<3;i++)
              for (int p=0;i<3;i++){
                _R_Cijkl_RT[_qp](i,j,k,l)=_R_Cijkl_RT[_qp](i,j,k,l)+
                    _RotMat[_qp](i,m)*_RotMat[_qp](l,p)*
                    _elasticity_tensor[_qp](m,j,k,p);
              }


}
