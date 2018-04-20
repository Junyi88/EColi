#include "JEUk_Mo_Convec2D.h"

template<>
InputParameters validParams<JEUk_Mo_Convec2D>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Convection of Momentum for 2D");
  params.addCoupledVar("OtherVel", "The Other Component of velocity");
  params.addCoupledVar("rho", "Density");
  params.addRequiredParam<unsigned>("Component", "The component of the velocity");
  return params;
}

//** Constructor *********************************************************

JEUk_Mo_Convec2D::JEUk_Mo_Convec2D(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _nvar(_coupled_moose_vars.size()),
    _v1(coupledValue("OtherVel")),
    _rho(coupledValue("rho")),
    _grad_v1(coupledGradient("OtherVel")),
    _v1_var_number(coupled("OtherVel")),
    _rho_var_number(coupled("rho")),
    _component(getParam<unsigned>("Component"))
    {
      if (_component==1)
        _other_component=2;
      else
        _other_component=1;
    }

//** computeQpResidual() *********************************************************
Real
JEUk_Mo_Convec2D::computeQpResidual()
{
  RealVectorValue vs(0.0, 0.0, 0.0);

  if (_component==1){
    vs(1) = _u[_qp];
    vs(2) = _v1[_qp];
  }  else {
    vs(2) = _u[_qp];
    vs(1) = _v1[_qp];
  }

  return _rho[_qp]*(vs * _grad_u[_qp])*test[_i][_qp];
}

//** computeQpJacobian() *********************************************************
Real
JEUk_Mo_Convec2D::computeQpJacobian()
{
  RealVectorValue vs(0.0, 0.0, 0.0);

  if (_component==1){
    vs(1) = _u[_qp];
    vs(2) = _v1[_qp];
  }  else {
    vs(2) = _u[_qp];
    vs(1) = _v1[_qp];
  }

    return _rho[_qp]*((vs * _grad_phi[_j][_qp])+
               (_phi[_j][_qp] * _grad_u[_qp](_component)))*test[_i][_qp];
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JEUk_Mo_Convec2D::computeQpOffDiagJacobian(unsigned int jvar)
{
  RealVectorValue vs(0.0, 0.0, 0.0);

  if (_component==1){
    vs(1) = _u[_qp];
    vs(2) = _v1[_qp];
  }  else {
    vs(2) = _u[_qp];
    vs(1) = _v1[_qp];
  }

  if (WhichJacobianVariable(jvar)==1){
    return _rho[_qp]*test[_i][_qp]*_phi[_j][_qp]*_grad_u[_qp](_other_component)


  } else if (WhichJacobianVariable(jvar)==2){

    return _phi[_j][_qp]*(vs * _grad_u[_qp])*test[_i][_qp];

  } else
    return 0.0;
}

// ** WhichJacobianVariable
JEUk_Mo_Convec2D::WhichJacobianVariable(unsigned var)
{
  if (var == _v1_var_number)
    return 1;
  else if (var == _rho_var_number)
    return 2;
  else
    return 0;
}
