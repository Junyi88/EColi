#include "ZTest_StressDivBasic.h"

template<>
InputParameters validParams<ZTest_StressDivBasic>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Stress Divergence");
  params.addCoupledVar("Other_Disp", "Other Displacements");
  params.addRequiredParam<unsigned int>("component",
                                        "An integer corresponding to the direction "
                                        "the variable this kernel acts in. (0 for x, "
                                        "1 for y, 2 for z)");
  params.addParam<Real>("Gamma", 0.5, "Gamma");
  params.addParam<Real>("Beta", 0.25, "Beta");
  return params;
}

//** Constructor *********************************************************

ZTest_StressDivBasic::ZTest_StressDivBasic(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _ComponentI(getParam<unsigned int>("component"),
    _OtherDisp(2),
    _IVals(2),
    _Gamma_Beta(getParam<Real>("Gamma")/getParam<Real>("Beta")),
    _StressRate(getMaterialProperty<RankTwoTensor>("Stress_Rate")),
    _StressOld(getMaterialPropertyOld<RankTwoTensor>("Stress")),
    _Cijlk(getMaterialProperty<RankFourTensor>("elasticity_tensor")),
    _Accumulator(0.0),
    _num_var(0)
    {
      _num_var=0;
      for (unsigned int i=0;i<3;++i){
        if (_ComponentI!=i){
          _IVals[_num_var]=i;
          _OtherDisp[_num_var]=coupled("Other_Disp",_num_var);
          _num_var++;
        }

      }

    }

//** computeQpResidual() *********************************************************
Real
ZTest_StressDivBasic::computeQpResidual()
{

  _Accumulator=0.0;

  for (unsigned int j=0;j<3;++j){
    _Accumulator+=_grad_test[_i][_qp](j)*(_StressOld[_qp](i,j)
      +_StressRate(i,j));
  }


  return _Accumulator*_dt*_dt;
}

//** computeQpJacobian() *********************************************************
Real
ZTest_StressDivBasic::computeQpJacobian()
{
  _Accumulator=0.0;

  for (unsigned int j=0; j<3; ++j){
    for (unsigned int k=0; k<3; ++k){
      _Accumulator+=_grad_test[_i][_qp](j)*(
        _Cijkl(_componentI,j,_componentI,k)*_grad_phi[_j][_qp](k)+
        _Cijkl(_componentI,j,k,_componentI)*_grad_phi[_j][_qp](k)
      );
    }
    return _Accumulator*0.5*_dt*_dt*_Gamma_Beta;
  }
  return 0.0;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
ZTest_StressDivBasic::computeQpOffDiagJacobian(unsigned int jvar)
{
  _num_var=WhichJacobianVariable(jvar);
  if (_num_var<3){
    _Accumulator=0.0;

    for (unsigned int j=0; j<3; ++j){
      for (unsigned int k=0; k<3; ++k){
        _Accumulator+=_grad_test[_i][_qp](j)*(
          _Cijkl(_componentI,j,_num_var,k)*_grad_phi[_j][_qp](k)+
          _Cijkl(_componentI,j,k,_num_var)*_grad_phi[_j][_qp](k)
        );
      }
    }
   return _Accumulator*0.5*_dt*_dt*_Gamma_Beta;
  }


  return 0.0;
}

// ** WhichJacobianVariable
unsigned int
ZTest_StressDivBasic::WhichJacobianVariable(unsigned var)
{
  if (var == _Stress1_var_number)
    return 0;
  else if (var == _Stress2_var_number)
    return 1;
  else if (var == _Stress3_var_number)
    return 2;
  else

    for (unsigned int i=0; i<2; ++i){
      if (var == _OtherDisp[i]){
        return _IVals[i];
      }
    }

    return 1000;
}
