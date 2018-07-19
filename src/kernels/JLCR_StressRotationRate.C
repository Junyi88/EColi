#include "JLCR_StressRotationRate.h"

template<>
InputParameters validParams<JLCR_StressRotationRate>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Stress Divergence");
  params.addRequiredCoupledVar("Velocity", "Velocitites");
  params.addRequiredCoupledVar("Stresses", "Other Stresses");
  params.addRequiredParam<unsigned>("Component_I", "The component I");
  params.addRequiredParam<unsigned>("Component_J", "The component J");
  return params;
}

//** Constructor *********************************************************

JLCR_StressRotationRate::JLCR_StressRotationRate(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _componentI(getParam<unsigned>("Component_I")-1),
    _componentJ(getParam<unsigned>("Component_J")-1),
    _Stress(8),
    _v_num(3), _Stress_num(8), _Stress_num_i(8), _Stress_num_j(8),
    _SpinVel(getMaterialPropertyByName<RankTwoTensor>("SpinV_Gradient")),
    _Dummy(0.0),_num_v(0)
    {
      for (unsigned int i = 0; i < 3; ++i)
      {
         _v_num[i]=coupled("Velocity",i);
      }


      _num_v=0;
      for (unsigned int i = 0; i < 3; ++i)
        for (unsigned int j = 0; j < 3; ++j)
      {
        if ((i!=_componentI)&&(j!=_componentJ)){
         _Stress[_num_v]= &coupledValue("Stresses", i);
         _Stress_num[_num_v]=coupled("Stresses",i);
         _Stress_num_i[_num_v]=i;
         _Stress_num_j[_num_v]=j;
         _num_v++;
       }
      }

    }

//** computeQpResidual() *********************************************************
Real
JLCR_StressRotationRate::computeQpResidual()
{
  _Dummy=0.0;
  for (unsigned int i = 0; i < 3; ++i)
    _
  return -_Dummy;
}

//** computeQpJacobian() *********************************************************
Real
JLCR_StressRotationRate::computeQpJacobian()
{
  return 0.0;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JLCR_StressRotationRate::computeQpOffDiagJacobian(unsigned int jvar)
{
  _StressJac=0.0;
  _num_v=WhichJacobianVariable(jvar);

  for (unsigned int n=0;n < 3; n++){
    if (_num_v==n){
      _StressJac+=_elasticity_tensor[_qp](_componentI,_componentJ,n,n)*2.0*
        _grad_phi[_j][_qp](n);
    }  else{
      _StressJac+=(_elasticity_tensor[_qp](_componentI,_componentJ,n,_num_v)+
        _elasticity_tensor[_qp](_componentI,_componentJ,_num_v,n))*_grad_phi[_j][_qp](n);
    }
	/*
    if (_num_v==n){
      _StressJac+=_elasticity_tensor(_componentI,_componentJ,n,n)*2.0*
        _phi[_j][_qp](n);
    }  else{
      _StressJac+=(_elasticity_tensor(_componentI,_componentJ,n,_num_v)+
        _elasticity_tensor(_componentI,_componentJ,_num_v,n))*_phi[_j][_qp](n);
    }
	*/
  }

  _StressJac*=-_test[_i][_qp]*0.5;

  return _StressJac;
}

// ** WhichJacobianVariable
unsigned int
JLCR_StressRotationRate::WhichJacobianVariable(unsigned int var)
{

  for (unsigned int i = 0; i < 3; ++i)
  {
    if (var == (_v_num[i]))
      return i;
  }
  for (unsigned int i = 0; i < 8; ++i)
  {
    if (var == (_Stress_num[i]))
      return i+3;
  }
    return 1000;
}
