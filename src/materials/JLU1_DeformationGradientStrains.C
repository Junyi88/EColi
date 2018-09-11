#include "JLU1_DeformationGradientStrains.h"
#include "MooseMesh.h"
#include "Assembly.h"
// libmesh includes
#include "libmesh/quadrature.h"

template<>
InputParameters validParams<JLU1_DeformationGradientStrains>()
{
  InputParameters params = validParams<Material>();
  params.addRequiredCoupledVar("velocities", "Velocities");
  return params;
}

// --------------------------------------------------------
JLU1_DeformationGradientStrains::JLU1_DeformationGradientStrains(const InputParameters & parameters) :
    DerivativeMaterialInterface<Material>(parameters),
    _L_grad_vel(getMaterialPropertyByName<RankTwoTensor>("Velocity_Gradient")),
    _F(declareProperty<RankTwoTensor>("Deformation_Gradient")),
    _Fdot(declareProperty<RankTwoTensor>("Deformation_Gradient_Rate")),
    _Strain(declareProperty<RankTwoTensor>("strain")),
    _F_old(getMaterialPropertyOld<RankTwoTensor>("Deformation_Gradient"))
{}

// --------------------------------------------------------
void
JLU1_DeformationGradientStrains::initQpStatefulProperties()
{
  _F[_qp].zero();
  _Fdot[_qp].zero();
  _Strain[_qp].zero();

  _F[_qp].addIa(1.0);
}

// --------------------------------------------------------
void
JLU1_DeformationGradientStrains::computeQpProperties()
{
    _Fdot[_qp].zero();
    for (unsigned i=0; i < 3; ++i)
      for (unsigned j=0; j < 3; ++j)
        for (unsigned k=0; k < 3; ++k)
          _Fdot[_qp](i,j) += _L_grad_vel[_qp](i,k) * _F_old[_qp](k,j);

    _F[_qp]=_Fdot[_qp]*_dt;
    _F[_qp]+=_F_old[_qp];

    _Strain[_qp].zero();
    for (unsigned i=0; i < 3; ++i)
      for (unsigned j=0; j < 3; ++j)
        for (unsigned k=0; k < 3; ++k)
          _Strain[_qp](i,j) += _F[_qp](k,i) * _F[_qp](k,j);

    for (unsigned i=0; i < 3; ++i)
        _Strain[_qp](i,i) -= 1.0;

    _Strain[_qp]*=0.5;    
}
