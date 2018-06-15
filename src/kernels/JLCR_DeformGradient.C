#include "JLCR_DeformGradient.h"

template<>
InputParameters validParams<JLCR_DeformGradient>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Deformation Gradient");
  params.addCoupledVar("F_others", 'F_smaller,F_larger');
  params.addCoupledVar("Displacement", 'Displacement_i');
  params.addRequiredParam<unsigned>("Component_I", "The component I");
  params.addRequiredParam<unsigned>("Component_J", "The component J");
  return params;
}

//** Constructor *********************************************************

JLCR_DeformGradient::JLCR_DeformGradient(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _nvar(_coupled_moose_vars.size()),
    _Foth1(coupledValue("F_other",0)),
    _Foth2(coupledValue("F_other",1)),
    _disp(coupledValue("Displacement",0)),
    _grad_disp(coupledGradient("Displacement",0)),
    _componentI(getParam<unsigned>("Component")-1),
    _componentJ(getParam<unsigned>("Component")-1),
    _Foth1_var_number(coupled("F_other",0)),
    _Foth2_var_number(coupled("F_other",1)),
    _disp_var_number(coupled("Displacement",1)),
    _componentI_oth1(0), _componentI_oth2(1),
    _inter1(0.0), _IJSame(_componentI==_componentJ),
    _itype(1000)
    {
      if (_componentI==0) {
        _component_oth1=1;
        _component_oth2=2;
      } else if (_componentI==1) {
        _component_oth1=0;
        _component_oth2=2;
      } else if (_componentI==2) {
        _component_oth1=0;
        _component_oth2=1;
      }

    }

//** computeQpResidual() *********************************************************
Real
JLCR_DeformGradient::computeQpResidual()
{
  if (_IJSame)
    _inter1=-1.0;
  else
    _inter1=0.0;

  _inter1+=_u[qp]*(1.0-_grad_u[_qp](_componentI));
  _inter1-=_grad_disp[_qp](_component_oth1)*_Foth1[_qp];
  _inter1-=_grad_disp[_qp](_component_oth2)*_Foth2[_qp];
  _inter1*=_test[_i][_qp];

  return _inter1;
}

//** computeQpJacobian() *********************************************************
Real
JLCR_DeformGradient::computeQpJacobian()
{
  _inter1=(1.0-_grad_disp[_qp](_componentI));
  _inter1*=_phi[_j][_qp]*_test[_i][_qp];

  return _inter1;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JLCR_DeformGradient::computeQpOffDiagJacobian(unsigned int jvar)
{
  _itype=WhichJacobianVariable(unsigned jvar);
  if (_itype==8){
    _inter1=-_phi[_j][_qp](_componentI)*_u[_qp];
    _inter1-=_phi[_j][_qp](_component_oth1)*_Foth1[_qp];
    _inter1-=_phi[_j][_qp](_component_oth2)*_Foth2[_qp];
    _inter1*=_test[_i][_qp];
  } else{
     _inter1=-_grad_disp[_qp](_itype)*_test[_i][_qp]*_phi[_j][_qp];
  }

  return _inter1;
}

// ** WhichJacobianVariable
unsigned int
JLCR_DeformGradient::WhichJacobianVariable(unsigned var)
{
  if (var == _Foth1_var_number)
    return _component_oth1;
  else if (var == _Foth2_var_number)
    return _component_oth2;
  else if (var == _disp_var_number)
    return 8;
  else
    return 1000;
}
