#include "JEUk_DG_DGRate2D.h"

template<>
InputParameters validParams<JEUk_DG_DGRate2D>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For DeformationGradient");
  params.addCoupledVar("Velocity", "The Velocities");
  params.addCoupledVar("F_Other", "The Other Stress Gradient");
  params.addRequiredParam<unsigned>("Component_i", "The component of the velocity");
  params.addRequiredParam<unsigned>("Component_jself", "The component of the j of the gradient");
  params.addRequiredParam<unsigned>("Component_jother",  "The component of the j of the other gradient");
  return params;
}

//** Constructor *********************************************************
JEUk_DG_DGRate2D::JEUk_DG_DGRate2D(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _nvar(_coupled_moose_vars.size()),
    _grad_v(coupledGradient("Velocity")),
    _Foth(coupledValue("F_Other")),
    _v_var_number(coupled("Velocity")),
    _Foth_var_number(coupled("F_Other")),
    _component_jself(getParam<unsigned>("Component_jself")),
    _component_jother(getParam<unsigned>("Component_jother"))
    {
    }

//** computeQpResidual() *********************************************************
Real
JEUk_DG_DGRate2D::computeQpResidual()
{
  return -_test[_i][_qp]*(_grad_v[_qp](_component_jself)*_u[_qp]+
            _grad_v[_qp](_component_jother)*_Foth[_qp]);
}

//** computeQpJacobian() *********************************************************
Real
JEUk_DG_DGRate2D::computeQpJacobian()
{
  return -_test[_i][_qp]*(_grad_v[_qp](_component_jself)*_phi[_j][_qp]);
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JEUk_DG_DGRate2D::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (WhichJacobianVariable(jvar)==1){
    return -_test[_i][_qp]*(_grad_phi[_j][_qp](_component_jself)*_u[_qp]+
              _grad_phi[_j][_qp](_component_jother)*_Foth[_qp]);

  } else if (WhichJacobianVariable(jvar)==2){

    return -_test[_i][_qp]*(_grad_v[_qp](_component_jother)*_phi[_j][_qp]);

  } else
    return 0.0;
}



// ** WhichJacobianVariable
unsigned int
JEUk_DG_DGRate2D::WhichJacobianVariable(unsigned var)
{
  if (var == _v_var_number)
    return 1;
  else if (var == _Foth_var_number)
    return 2;
  else
    return 0;
}
