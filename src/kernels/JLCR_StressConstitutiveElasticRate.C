#include "JLCR_StressConstitutiveElasticRate.h"

template<>
InputParameters validParams<JLCR_StressConstitutiveElasticRate>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Stress Divergence");
  params.addRequiredCoupledVar("Velocity", "The displacements appropriate for the simulation geometry and coordinate system");
  params.addRequiredParam<unsigned>("Component_I", "The component I");
  params.addRequiredParam<unsigned>("Component_J", "The component J");
  return params;
}

//** Constructor *********************************************************

JLCR_StressConstitutiveElasticRate::JLCR_StressConstitutiveElasticRate(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _nvar(coupledComponents("Velocity")),
    _componentI(getParam<unsigned>("Component_I")-1),
    _componentJ(getParam<unsigned>("Component_J")-1),
    _v(3),
    _grad_v(3),
    _v_num(3),
    _elasticity_tensor(getMaterialPropertyByName<RankFourTensor>("elasticity_tensor")),
    _StressRate(getMaterialPropertyByName<RankTwoTensor>("Stress_Rate")),
    _StressJac(0.0),_num_v(0)
    {
      for (unsigned int i = 0; i < _nvar; ++i)
      {
        _v[i] = &coupledValue("Velocity", i);
        _grad_v[i] = &coupledGradient("Velocity", i);
        // _v_num[i]=&coupled("Velocity",i);
		_v_num[i]=coupled("Velocity",i);
      }

      // set unused dimensions to zero
      for (unsigned int i = _nvar; i < 3; ++i)
      {
        _v[i] = &_zero;
        _grad_v[i] = &_grad_zero;
        _v_num[i]=0;
      }

    }

//** computeQpResidual() *********************************************************
Real
JLCR_StressConstitutiveElasticRate::computeQpResidual()
{

  return -_StressRate[_qp](_componentI,_componentJ)*_test[_i][_qp];
}

//** computeQpJacobian() *********************************************************
Real
JLCR_StressConstitutiveElasticRate::computeQpJacobian()
{
  return 0.0;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JLCR_StressConstitutiveElasticRate::computeQpOffDiagJacobian(unsigned int jvar)
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
JLCR_StressConstitutiveElasticRate::WhichJacobianVariable(unsigned int var)
{

  for (unsigned int i = _nvar; i < 3; ++i)
  {
    if (var == (_v_num[i]))
      return i;
  }
    return 1000;
}
