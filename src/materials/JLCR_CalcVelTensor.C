#include "JLCR_CalcVelTensor.h"
#include "MooseMesh.h"
#include "Assembly.h"
// libmesh includes
#include "libmesh/quadrature.h"

template<>
InputParameters validParams<JLCR_CalcVelTensor>()
{
  InputParameters params = validParams<Material>();
  params.addRequiredCoupledVar("displacements", "The displacements appropriate for the simulation geometry and coordinate system");
  return params;
}

JLCR_CalcVelTensor::JLCR_CalcVelTensor(const InputParameters & parameters) :
    DerivativeMaterialInterface<Material>(parameters),
    _ndisp(coupledComponents("displacements")),
    _vel(3),
    _grad_vel(3),
    _VelGrad(declareProperty<RankTwoTensor>("Velocity_Gradient")),
    _SpinMat(declareProperty<RankTwoTensor>("Spin_Matrix")),
    _DefMat(declareProperty<RankTwoTensor>("Deform_Matrix"))
{
  // fetch coupled variables and gradients (as stateful properties if necessary)
  for (unsigned int i = 0; i < _ndisp; ++i)
  {
    _vel[i] = &coupledValue("displacements", i);
    _grad_vel[i] = &coupledGradient("displacements", i);

  }

  // set unused dimensions to zero
  for (unsigned int i = _ndisp; i < 3; ++i)
  {
    _vel[i] = &_zero;
    _grad_vel[i] = &_grad_zero;
  }


}

void
JLCR_CalcVelTensor::initQpStatefulProperties()
{
  _VelGrad[_qp].zero();
  _SpinMat[_qp].zero();
  _DefMat[_qp].zero();

  _VelGrad[_qp].addIa(1.0);
  _SpinMat[_qp].addIa(1.0);
  _DefMat[_qp].addIa(1.0);
}

void
JLCR_CalcVelTensor::computeProperties()
{
    RankTwoTensor A((*_grad_disp[0])[_qp], (*_grad_disp[1])[_qp], (*_grad_disp[2])[_qp]);
    _VelGrad[_qp] = A;
    _VelGrad[_qp].addIa(1.0);//Gauss point deformation gradient


    _SpinMat[_qp] = 0.5*(_VelGrad[_qp]+_VelGrad[_qp].transpose());
    _DefMat[_qp]  = 0.5*(_VelGrad[_qp]-_VelGrad[_qp].transpose());


}
