#include "JLU1_StressDivergenceU.h"

template<>
InputParameters validParams<JLU1_StressDivergenceU>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Kernel For Stress Divergence");
  params.addCoupledVar("Other_Displacements", "Other Displacements");
  params.addRequiredParam<unsigned>("Component_I", "The component I");
  return params;
}

//** Constructor *********************************************************

JLU1_StressDivergenceU::JLU1_StressDivergenceU(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _Component_I(getParam<unsigned>("Component_I")),
    _Other_Components(2),
    _Stress(getMaterialPropertyByName<RankTwoTensor>("Stress")),
    _elasticity_tensor(getMaterialPropertyByName<RankFourTensor>("elasticity_tensor")),
    _n_vars(2)
    {
      if (_Component_I==0){
        _Other_Components[0]=1;
        _Other_Components[1]=2;
      } else if (_Component_I==1){
        _Other_Components[0]=0;
        _Other_Components[1]=2;
      } else if (_Component_I==2){
        _Other_Components[0]=0;
        _Other_Components[1]=1;
      }

      for (unsigned int i = 0; i < 2; ++i)
      {
         _n_vars[i]=coupled("Other_Displacements",i);
      }

    }

//** computeQpResidual() *********************************************************
Real
JLU1_StressDivergenceU::computeQpResidual()
{
  _Accumulator=0.0;
  for (unsigned int j = 0; j < 3; ++j)
  {
     _Accumulator+=(_Stress[_qp])(_Component_I,j)* (_grad_test[_i][_qp])(j);
  }

  return _Accumulator;
}

//** computeQpJacobian() *********************************************************
Real
JLU1_StressDivergenceU::computeQpJacobian()
{

  _Accumulator=0.0;
  for (unsigned int j = 0; j < 3; ++j)
    for (unsigned int k = 0; k < 3; ++k){
      _PlaceHolder0 = (_elasticity_tensor[_qp](_Component_I,j,_Component_I,k) *
        (_grad_phi[_j][_qp])(k));
      _PlaceHolder0 += (_elasticity_tensor[_qp](_Component_I,j,k,_Component_I) *
        (_grad_phi[_j][_qp])(k));

      _Accumulator+=_PlaceHolder0 * (_grad_test[_i][_qp])(j);
    }

  return 0.5*_Accumulator;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
JLU1_StressDivergenceU::computeQpOffDiagJacobian(unsigned int jvar)
{
  _N = WhichJacobianVariable(jvar);
  _Accumulator=0.0;
  for (unsigned int j = 0; j < 3; ++j)
    for (unsigned int k = 0; k < 3; ++k){
      _PlaceHolder0 = (_elasticity_tensor[_qp](_Component_I,j,_N ,k) *
        (_grad_phi[_j][_qp])(k));
      _PlaceHolder0 += (_elasticity_tensor[_qp](_Component_I,j,k,_N) *
        (_grad_phi[_j][_qp])(k));

      _Accumulator+=_PlaceHolder0 * (_grad_test[_i][_qp])(j);
    }

  return 0.5*_Accumulator;
}

//** WhichJacobianVariable *********************************************************
unsigned int
JLU1_StressDivergenceU::WhichJacobianVariable(unsigned int var)
{
  for (unsigned int i = 0; i < 2; ++i)
  {
    if (var == (_n_vars[i]))
      return _Other_Components[i];
  }
    return 1000;
}
