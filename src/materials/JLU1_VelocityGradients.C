#include "JLU1_VelocityGradients.h"
#include "MooseMesh.h"
#include "Assembly.h"
// libmesh includes
#include "libmesh/quadrature.h"

template<>
InputParameters validParams<JLU1_VelocityGradients>()
{
  InputParameters params = validParams<Material>();
  params.addRequiredCoupledVar("velocities", "Velocities");
  return params;
}

// --------------------------------------------------------
JLU1_VelocityGradients::JLU1_VelocityGradients(const InputParameters & parameters) :
    DerivativeMaterialInterface<Material>(parameters),
    _ndisp(coupledComponents("velocities")),
    _vel(3),
    _grad_vel(3),
    _D_grad_vel(declareProperty<RankTwoTensor>("DVelocity_Gradient")),
    _W_grad_vel(declareProperty<RankTwoTensor>("WVelocity_Gradient"))
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

// --------------------------------------------------------
void
JLU1_VelocityGradients::initQpStatefulProperties()
{
  _D_grad_vel[_qp].zero();
  _W_grad_vel[_qp].zero();
}

// --------------------------------------------------------
void
JLU1_VelocityGradients::computeQpProperties()
{
    // Calculate Velocity Gradients
    _D_grad_vel[_qp]  = 0.5*(_VelGrad[_qp]+_VelGrad[_qp].transpose());
    _W_grad_vel[_qp]  = 0.5*(_VelGrad[_qp]-_VelGrad[_qp].transpose());
}
