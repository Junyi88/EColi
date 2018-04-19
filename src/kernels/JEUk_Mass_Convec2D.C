#include "JEUk_Mass_Convec2D.h"

template<>
InputParameters validParams<JEUk_Mass_Convec2D>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Convection of Mass in Mass Continuity for 2D");
  params.addCoupledVar("velocities", "Vector of velocities - x, y");
  return params;
}

//** Constructor *********************************************************

JEUk_Mass_Convec2D::JEUk_Mass_Convec2D(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _nvar(_coupled_moose_vars.size()),
    _v1(coupledValue("velocities",0)),
    _v2(coupledValue("velocities",1)),
    _v1_var_number(coupled("velocities"),0),
    _v2_var_number(coupled("velocities"),1)
    {
    }

//** computeQpResidual() *********************************************************
Real
JEUk_Mass_Convec2D::computeQpResidual()
{
  RealVectorValue vs(_v1[_qp],_v2[_qp],_zero);
  return -_u[_qp] * (vs * _grad_test[_i][_qp]);
}

//** computeQpJacobian() *********************************************************
Real
JEUk_Mass_Convec2D::computeQpJacobian()
{
    RealVectorValue vs(_v1[_qp],_v2[_qp],_zero);

    return -_phi[_j][_qp] * (vs * _grad_test[_i][_qp]);
}

//** computeQpOffDiagJacobian() *********************************************************
Real
PusztaiACBulk::computeQpOffDiagJacobian(unsigned int jvar)
{ RealVectorValue phis(_zero,_zero,_zero);
  if (WhichJacobianVariable(jvar)==1){
    phis(1)=_phi[_j][_qp];
    return -_u[_qp] * (vs * _grad_test[_i][_qp]);

  } else if (WhichJacobianVariable(jvar)==2){
    phis(2)=_phi[_j][_qp];
    return -_u[_qp] * (vs * _grad_test[_i][_qp]);

  } else
    return 0.0;
}

// ** WhichJacobianVariable
unsigned int
JEUk_Mass_Convec2D::WhichJacobianVariable(unsigned var)
{
  if (var == _v1_var_number)
    return 1;
  else if (var == _v2_var_number)
    return 2;
  else
    return 0;
}
