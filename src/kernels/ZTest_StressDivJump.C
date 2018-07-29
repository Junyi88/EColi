#include "ZTest_StressDivJump.h"

template<>
InputParameters validParams<ZTest_StressDivJump>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernal For Stress Divergence");
  params.addCoupledVar("Other_Disp", "Other Displacements");
  params.addRequiredParam<unsigned int>("component",
                                        "An integer corresponding to the direction "
                                        "the variable this kernel acts in. (0 for x, "
                                        "1 for y, 2 for z)");
  return params;
}

//** Constructor *********************************************************

ZTest_StressDivJump::ZTest_StressDivJump(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _ComponentI(getParam<unsigned int>("component")),
    _OtherDisp(2),
    _IVals(2),
    _StressRate(getMaterialProperty<RankTwoTensor>("Stress_Rate")),
    _StressOld(getMaterialPropertyOld<RankTwoTensor>("Stress")),
    _Cijkl(getMaterialProperty<RankFourTensor>("elasticity_tensor")),
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
ZTest_StressDivJump::computeQpResidual()
{

  _Accumulator=0.0;

  for (unsigned int j=0;j<3;++j){
    _Accumulator+=_grad_test[_i][_qp](j)*(_StressOld[_qp](_ComponentI,j)
      +_StressRate[_qp](_ComponentI,j)*_dt);
  }


  return _Accumulator;
}

//** computeQpJacobian() *********************************************************
Real
ZTest_StressDivJump::computeQpJacobian()
{
  _Accumulator=0.0;

  for (unsigned int j=0; j<3; ++j){
    for (unsigned int k=0; k<3; ++k){
      _Accumulator+=_grad_test[_i][_qp](j)*(
        _Cijkl[_qp](_ComponentI,j,_ComponentI,k)*_grad_phi[_j][_qp](k)+
        _Cijkl[_qp](_ComponentI,j,k,_ComponentI)*_grad_phi[_j][_qp](k)
      );
    }
  }
  return _Accumulator;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
ZTest_StressDivJump::computeQpOffDiagJacobian(unsigned int jvar)
{
  _num_var=WhichJacobianVariable(jvar);
  if (_num_var<3){
    _Accumulator=0.0;

    for (unsigned int j=0; j<3; ++j){
      for (unsigned int k=0; k<3; ++k){
        _Accumulator+=_grad_test[_i][_qp](j)*(
          _Cijkl[_qp](_ComponentI,j,_num_var,k)*_grad_phi[_j][_qp](k)+
          _Cijkl[_qp](_ComponentI,j,k,_num_var)*_grad_phi[_j][_qp](k)
        );
      }
    }
   return _Accumulator;
  }


  return 0.0;
}

// ** WhichJacobianVariable
unsigned int
ZTest_StressDivJump::WhichJacobianVariable(unsigned var)
{
    for (unsigned int i=0; i<2; ++i){
      if (var == _OtherDisp[i]){
        return _IVals[i];
      }
    }

    return 1000;
}
