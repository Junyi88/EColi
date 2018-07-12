#include "JLCR_CalcDefVelGradient.h"
#include "MooseMesh.h"
#include "Assembly.h"
// libmesh includes
#include "libmesh/quadrature.h"

template<>
InputParameters validParams<JLCR_CalcDefVelGradient>()
{
  InputParameters params = validParams<Material>();
  params.addRequiredCoupledVar("displacements", "Displacements");
  params.addRequiredCoupledVar("velocities", "Velocities");
  return params;
}

JLCR_CalcDefVelGradient::JLCR_CalcDefVelGradient(const InputParameters & parameters) :
    DerivativeMaterialInterface<Material>(parameters),
    _ndisp(coupledComponents("displacements")),
    _DefGrad(declareProperty<RankTwoTensor>("Deformation_Gradient")),
    _DefGrad_old(getMaterialPropertyOld<RankTwoTensor>("Deformation_Gradient")),
    _RotMat(declareProperty<RankTwoTensor>("Rotation_Matrix")),
    _StretchMat(declareProperty<RankTwoTensor>("Stretch_Matrix")),
    _vel(3),
    _grad_vel(3),
    _VelGrad(declareProperty<RankTwoTensor>("Velocity_Gradient")),
    _SpinVel(declareProperty<RankTwoTensor>("SpinV_Gradient")),
    _DefVel(declareProperty<RankTwoTensor>("DeformV_Gradient"))
{
  // fetch coupled variables and gradients (as stateful properties if necessary)
  for (unsigned int i = 0; i < _ndisp; ++i)
  {
    _vel[i] = &coupledValue("velocities", i);
    _grad_vel[i] = &coupledGradient("velocities", i);

  }

  // set unused dimensions to zero
  for (unsigned int i = _ndisp; i < 3; ++i)
  {
    _vel[i] = &_zero;
    _grad_vel[i] = &_grad_zero;
  }


}

void
JLCR_CalcDefVelGradient::initQpStatefulProperties()
{
  _VelGrad[_qp].zero();
  _SpinVel[_qp].zero();
  _DefVel[_qp].zero();

  _DefGrad[_qp].zero();
  _DefGrad[_qp].addIa(1.0);

  _RotMat[_qp].zero();
  _RotMat[_qp].addIa(1.0);

  _StretchMat[_qp].zero();
  _StretchMat[_qp].addIa(1.0);
  // _DefGrad_old[_qp].zero();
  // _DefGrad_old[_qp].addIa(1.0);
}

void
JLCR_CalcDefVelGradient::computeQpProperties()
{
    // Calculate Velocity Gradient
    RankTwoTensor A((*_grad_vel[0])[_qp], (*_grad_vel[1])[_qp], (*_grad_vel[2])[_qp]);
    _VelGrad[_qp] = A;

    _SpinVel[_qp] = 0.5*(_VelGrad[_qp]+_VelGrad[_qp].transpose());
    _DefVel[_qp]  = 0.5*(_VelGrad[_qp]-_VelGrad[_qp].transpose());

    // Calculate Change In F
    _DefGrad[_qp]=((_VelGrad[_qp]*_DefGrad_old[_qp])*_dt)+_DefGrad_old[_qp];

    // Calculate Rotation and Stretch_Matrix
    std::vector<Real> e_value(3);
    RankTwoTensor e_vector, N1, N2, N3;
    RankTwoTensor Chat = _DefGrad[_qp].transpose() * _DefGrad[_qp];
    Chat.symmetricEigenvaluesEigenvectors(e_value, e_vector);

    const Real lambda1 = std::sqrt(e_value[0]);
    const Real lambda2 = std::sqrt(e_value[1]);
    const Real lambda3 = std::sqrt(e_value[2]);

    N1.vectorOuterProduct(e_vector.column(0), e_vector.column(0));
    N2.vectorOuterProduct(e_vector.column(1), e_vector.column(1));
    N3.vectorOuterProduct(e_vector.column(2), e_vector.column(2));

    _StretchMat[_qp] = N1 * lambda1 + N2 * lambda2 + N3 * lambda3;
    RankTwoTensor invUhat(_StretchMat[_qp].inverse());

    _RotMat[_qp]  = _DefGrad[_qp] * invUhat;
}
