#include "JLCR_CalcRotatedElasticityTensor.h"
#include "MooseMesh.h"
#include "Assembly.h"
// libmesh includes
#include "libmesh/quadrature.h"

template<>
InputParameters validParams<JLCR_CalcRotatedElasticityTensor>()
{
  InputParameters params = validParams<Material>();
//  params.addRequiredCoupledVar("velocities", "The displacements appropriate for the simulation geometry and coordinate system");
  return params;
}

JLCR_CalcRotatedElasticityTensor::JLCR_CalcRotatedElasticityTensor(const InputParameters & parameters) :
    DerivativeMaterialInterface<Material>(parameters),
    _RotMat(getMaterialProperty<RankTwoTensor>("Rotation_Matrix")),
    _elasticity_tensor(getMaterialProperty<RankFourTensor>("elasticity_tensor")),
    _R_Cijkl_RT(declareProperty<RankFourTensor>("Rotated_elasticity_tensor"))
{
  // fetch coupled variables and gradients (as stateful properties if necessary)
  //_R_Cijkl_RT[_qp].zero();


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


    for (unsigned int i=0; i<3; i++){
    for (unsigned int j=0; j<3; j++){
    for (unsigned int k=0; k<3; k++){
    for (unsigned int l=0; l<3; l++){
     for (unsigned int p=0; p<3; p++){
     for (unsigned int m=0; m<3; m++){
       _R_Cijkl_RT[_qp](i,j,k,l)+=_elasticity_tensor[_qp](i,j,k,l)*
             _RotMat[_qp](l,p)*_RotMat[_qp](i,m);

     }}}}}}


    //_R_Cijkl_RT[_qp]=_elasticity_tensor[_qp]*_RotMat[_qp];
    /*
    for (int i=0;i<3;i++)
      for (int j=0;j<3;j++)
        for (int k=0;k<3;k++)
          for (int l=0;l<3;l++)
            for (int m=0;m<3;m++)
              for (int p=0;p<3;p++){
                _R_Cijkl_RT[_qp](i,j,k,l)=_R_Cijkl_RT[_qp](i,j,k,l)+
                    _RotMat[_qp](i,m)*_RotMat[_qp](l,p)*
                    _elasticity_tensor[_qp](m,j,k,p);
              }

     */
}
