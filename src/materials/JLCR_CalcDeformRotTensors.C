#include "JLCR_CalcDeformRotTensors.h"
#include "MooseMesh.h"
#include "Assembly.h"
// libmesh includes
#include "libmesh/quadrature.h"

template<>
InputParameters validParams<JLCR_CalcDeformRotTensors>()
{
  InputParameters params = validParams<Material>();
  params.addRequiredCoupledVar("displacements", "The displacements appropriate for the simulation geometry and coordinate system");
  return params;
}

JLCR_CalcDeformRotTensors::JLCR_CalcDeformRotTensors(const InputParameters & parameters) :
    DerivativeMaterialInterface<Material>(parameters),
    _ndisp(coupledComponents("displacements")),
    _disp(3),
    _grad_disp(3),
    _DefGrad(declareProperty<RankTwoTensor>("Deformation_Gradient")),
    _RotMat(declareProperty<RankTwoTensor>("Rotation_Matrix")),
    _StretchMat(declareProperty<RankTwoTensor>("Stretch_Matrix"))
{
  // fetch coupled variables and gradients (as stateful properties if necessary)
  for (unsigned int i = 0; i < _ndisp; ++i)
  {
    _disp[i] = &coupledValue("displacements", i);
    _grad_disp[i] = &coupledGradient("displacements", i);
  }

  // set unused dimensions to zero
  for (unsigned i = _ndisp; i < 3; ++i)
  {
    _disp[i] = &_zero;
    _grad_disp[i] = &_grad_zero;
  }


}

void
JLCR_CalcDeformRotTensors::initQpStatefulProperties()
{
  _DefGrad[_qp].zero();
  _RotMat[_qp].zero();
  _StretchMat[_qp].zero();

  _DefGrad[_qp].addIa(1.0);
  _RotMat[_qp].addIa(1.0);
  _StretchMat[_qp].addIa(1.0);
}

void
JLCR_CalcDeformRotTensors::computeQpProperties()
{
    RankTwoTensor A((*_grad_disp[0])[_qp], (*_grad_disp[1])[_qp], (*_grad_disp[2])[_qp]);
    _DefGrad[_qp] = A;
    _DefGrad[_qp].addIa(1.0);//Gauss point deformation gradient
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
