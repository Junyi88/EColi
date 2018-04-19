#include "JEUk_Mass_ConvecFull2D.h"

template<>
InputParameters validParams<JEUk_Mass_ConvecFull2D>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Convection of Mass in Mass Continuity for 2D");
  params.addCoupledVar("velocities", "Vector of velocities - x, y");
  return params;
}

//** Constructor *********************************************************

JEUk_Mass_ConvecFull2D::JEUk_Mass_ConvecFull2D(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _nvar(_coupled_moose_vars.size()),
    _v1(coupledValue("velocities",0)),
    _v2(coupledValue("velocities",1)),
    _v1_var_number(coupled("velocities",0)),
    _v2_var_number(coupled("velocities",1))
    {
    }

//** computeQpResidual() *********************************************************
Real
JEUk_Mass_ConvecFull2D::computeQpResidual()
{
  RealVectorValue vs(_v1[_qp], _v2[_qp], 0.0);
  _grad_v1=coupledGradient("velocities",0)[_qp];
  _grad_v2=coupledGradient("velocities",1)[_qp];
  return _test[_i][_qp]*(_grad_u[_qp](0)*_v1[_qp]+_grad_u[_qp](1)*_v2[_qp]+
            _u[_qp]*(_grad_v1(0)+_grad_v2(1)));
}

//** computeQpJacobian() *********************************************************
Real
JEUk_Mass_ConvecFull2D::computeQpJacobian()
{
    RealVectorValue vs(_v1[_qp], _v2[_qp], 0.0);
    _grad_v1=coupledGradient("velocities",0)[_qp];
    _grad_v2=coupledGradient("velocities",1)[_qp];

    return _test[_i][_qp]*(_grad_phi[_j][_qp](0)*_v1[_qp]+_grad_phi[_j][_qp](1)*_v2[_qp]+
              _phi[_j][_qp]*(_grad_v1(0)+_grad_v2(1)));
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JEUk_Mass_ConvecFull2D::computeQpOffDiagJacobian(unsigned int jvar)
{
  RealVectorValue phis(0.0, 0.0, 0.0);
  _grad_v1=coupledGradient("velocities",0)[_qp];
  _grad_v2=coupledGradient("velocities",1)[_qp];

  if (WhichJacobianVariable(jvar)==1){
    phis(0)=_phi[_j][_qp];
    return _test[_i][_qp]*(_grad_u[_qp](0)*phis(0)+_u[_qp]*_grad_phi[_j][_qp](0));

  } else if (WhichJacobianVariable(jvar)==2){
    phis(1)=_phi[_j][_qp];
    return _test[_i][_qp]*(_grad_u[_qp](1)*phis(1)+_u[_qp]*_grad_phi[_j][_qp](1));

  } else
    return 0.0;
}

// ** WhichJacobianVariable
unsigned int
JEUk_Mass_ConvecFull2D::WhichJacobianVariable(unsigned var)
{
  if (var == _v1_var_number)
    return 1;
  else if (var == _v2_var_number)
    return 2;
  else
    return 0;
}
