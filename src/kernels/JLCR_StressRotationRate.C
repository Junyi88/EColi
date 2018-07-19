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
    _Stress_map(9),
    _SpinVel(getMaterialPropertyByName<RankTwoTensor>("SpinV_Gradient")),
    _Dummy(0.0),_num_v(0), _n(0)
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

         _n=(i-1)*3+j;
         _Stress_map[_n]=_num_v;
         _num_v++;
       } else {
         _n=(i-1)*3+j;
         _Stress_num_j[_n]=0;
       }
      }

    }

//** computeQpResidual() *********************************************************
Real
JLCR_StressRotationRate::computeQpResidual()
{
  _Dummy=0.0;
  for (unsigned int i = 0; i < 3; ++i){
    _Dummy+=GetStress(_componentI, i)*_SpinVel[_qp](i, _componentJ);
    _Dummy-=GetStress(i, _componentJ)*_SpinVel[_qp](_componentI, i);
  }

  return _Dummy*_test[_i][_qp];
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

  _num_v=WhichJacobianVariable(jvar);
  if (_num_v>2){
    _n=_num_v-3;
    _Dummy=_SpinVel[_qp](_componentJ,_Stress_num_j[_n])-
          _SpinVel[_qp](_Stress_num_i[_n],_componentI);
    _Dummy*=_phi[_j][_qp];
    return _Dummy*_test[_i][_qp];

  } else {
    _n=_num_v;
    _Dummy=GetStress(_componentI, _n)*_grad_phi[_j][_qp](_componentJ);
    _Dummy-=GetStress(_n, _componentJ)*_grad_phi[_j][_qp](_componentI);

    if (_componentJ==_n){
      for (unsigned int m=0; m<3; ++m){
          _Dummy-=GetStress(_componentI,m)*_grad_phi[_j][_qp](m);
      }
    }
    if (_componentI==_n){
      for (unsigned int m=0; m<3; ++m){
          _Dummy+=GetStress(m,_componentJ)*_grad_phi[_j][_qp](m);
      }
    }

    return _Dummy*0.5*_test[_i][_qp];
  }

  return 0.0;
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

// ** WhichJacobianVariable
Real
JLCR_StressRotationRate::GetStress(unsigned int i, unsigned int j){
  _n=_Stress_map[(i-1)*3+j];
  if (_n!=0){
    return (*_Stress[_n])[_qp];
  }
  return _u[_qp];
}
