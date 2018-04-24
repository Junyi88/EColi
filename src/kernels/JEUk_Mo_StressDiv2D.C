#include "JEUk_Mo_StressDiv2D.h"

template<>
InputParameters validParams<JEUk_Mo_StressDiv2D>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Momentum for Stresses");
  params.addCoupledVar("Stresses", "Normal Stress, Shear Stress");
  params.addRequiredParam<unsigned>("Component", "The component of the velocity");
  return params;
}

//** Constructor *********************************************************

JEUk_Mo_StressDiv2D::JEUk_Mo_StressDiv2D(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _nvar(_coupled_moose_vars.size()),
    _NormalStress(coupledValue("Stresses",0)),
    _ShearStress(coupledValue("Stresses",1)),
    _component(getParam<unsigned>("Component")),
    _NormalStress_var_number(coupled("velocities",0)),
    _ShearStress_var_number(coupled("velocities",1))
    {
      if (_component==1)
        _other_component=2;
      else
        _other_component=1;
    }

//** computeQpResidual() *********************************************************
Real
JEUk_Mo_StressDiv2D::computeQpResidual()
{
  return (_grad_test[_i][_qp](_component)*_NormalStress[_qp])+
     (_grad_test[_i][_qp](_other_component)*_ShearStress[_qp]);
}

//** computeQpJacobian() *********************************************************
Real
JEUk_Mo_StressDiv2D::computeQpJacobian()
{
  return 0.0;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JEUk_Mo_StressDiv2D::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (WhichJacobianVariable(jvar)==1){
    return _grad_test[_i][_qp](_component)*_phi[_j][_qp];

  } else if (WhichJacobianVariable(jvar)==2){

    return _grad_test[_i][_qp](_other_component)*_phi[_j][_qp];

  } else
    return 0.0;
}

// ** WhichJacobianVariable
unsigned int
JEUk_Mo_StressDiv2D::WhichJacobianVariable(unsigned var)
{
  if (var == _NormalStress_var_number)
    return 1;
  else if (var == _ShearStress_var_number)
    return 2;
  else
    return 0;
}
