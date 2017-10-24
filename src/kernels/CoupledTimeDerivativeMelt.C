/****************************************************************/
/*               DO NOT MODIFY THIS HEADER                      */
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*           (c) 2010 Battelle Energy Alliance, LLC             */
/*                   ALL RIGHTS RESERVED                        */
/*                                                              */
/*          Prepared by Battelle Energy Alliance, LLC           */
/*            Under Contract No. DE-AC07-05ID14517              */
/*            With the U. S. Department of Energy               */
/*                                                              */
/*            See COPYRIGHT for full restrictions               */
/****************************************************************/

#include "CoupledTimeDerivativeMelt.h"

template <>
InputParameters
validParams<CoupledTimeDerivativeMelt>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Time derivative Kernel that acts on a coupled variable");
  params.addRequiredCoupledVar("v", "Coupled variable");
  params.addRequiredParam<Real>("T_melt",  "Melting Temperature");
  params.addRequiredParam<Real>("K",  "Value1");
  return params;
}

CoupledTimeDerivativeMelt::CoupledTimeDerivativeMelt(const InputParameters & parameters)
  : Kernel(parameters), _v(coupledValue("v")), _v_dot(coupledDot("v")), _dv_dot(coupledDotDu("v")), _v_var(coupled("v")),
  _Tmelt(getParam<Real>("T_melt")), _K(getParam<Real>("K"))
{
}

Real
CoupledTimeDerivativeMelt::computeQpResidual()
{
  if (((_v[_qp]>=_Tmelt)&&(_u[_qp]<1.0))||((_v[_qp]<=_Tmelt)&&(_u[_qp]>0.0))) {
    return _K*_test[_i][_qp] * _v_dot[_qp];
  }

  return 0.0;
}

Real
CoupledTimeDerivativeMelt::computeQpJacobian()
{
  return 0.0;
}

Real
CoupledTimeDerivativeMelt::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (((_v[_qp]>=_Tmelt)&&(_u[_qp]<1.0))||((_v[_qp]<=_Tmelt)&&(_u[_qp]>0.0))) {
  if (jvar == _v_var)
    return _K*_test[_i][_qp] * _phi[_j][_qp] * _dv_dot[_qp];
  }

  return 0.0;
}
