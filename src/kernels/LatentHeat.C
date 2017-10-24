#include "LatentHeat.h"

template<>
InputParameters validParams<LatentHeat>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Phase Component of Conduction For Heat transfer with latent heat");

  params.addRequiredParam<MaterialPropertyName>("Conductivity",  "Conductivity of the material");
//  params.addRequiredParam<MaterialPropertyName>("Cl",  "Latent heat of the material");
  // params.addRequiredParam<MaterialPropertyName>("T_melt",  "Melting Temperature");
  params.addRequiredParam<Real>("T_melt",  "Melting Temperature");
  params.addRequiredCoupledVar("Temp", "Coupled Temperature");
  params.addRequiredParam<Real>("K",  "K");
  return params;
}

//** Constructor *********************************************************
LatentHeat::LatentHeat(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _Conductivity(getMaterialProperty<Real>("Conductivity")),
    _dConductivitydTemp(getMaterialPropertyDerivative<Real>("Conductivity","Temp")),
    _Temp_var(coupled("Temp")),
    _Temp(coupledValue("Temp")),
    _grad_Temp(coupledGradient("Temp")),
    _Tmelt(getParam<Real>("T_melt")),
    _K(getParam<Real>("K")),
    _DT(0.0), _dummy(0.0)
    {}

  //** computeQpResidual() *********************************************************
Real
LatentHeat::computeQpResidual()
{

  _DT=_Tmelt-_Temp[_qp];


  if (_DT<0.0){
    if (_u[_qp]<=1.0) {
      _dummy=(_u[qp]-1.0);
      return _K*_dummy*_dummy*_DT*_test[_i][_qp];
    } else {return 0.0;}

  } else if (_DT>0.0){
    if (_u[_qp]>=0.0) {
      return _K*_u[qp]*_u[_qp]*_DT*_test[_i][_qp];
    } else {return 0.0;}
  }

  return 0.0;

}

//** computeQpJacobian() *********************************************************
Real
LatentHeat::computeQpJacobian()
{
  // if (((_Temp[_qp]>=_Tmelt)&&(_u[_qp]<1.0))||((_Temp[_qp]<=_Tmelt)&&(_u[_qp]>0.0))) {
  //   return (_dConductivitydTemp[_qp]*_phi[_j][_qp]*_grad_u[_qp]+
  //     _Conductivity[_qp]*_grad_phi[_j][_qp])*_grad_test[_i][_qp];
  // }

  _DT=_Tmelt-_Temp[_qp];

  if (_DT<0.0){
    if (_u[_qp]<=1.0) {

      return 2.0*_K*(_u[_qp]*_phi[_j][_qp]-_phi[_j][_qp])*_DT*_test[_i][_qp];
    } else {return 0.0;}

  } else if (_DT>0.0){
    if (_u[_qp]>=0.0) {
      return 2.0*_K*(_u[_qp]*_phi[_j][_qp])*_DT*_test[_i][_qp];
    } else {return 0.0;}
  }

  return 0.0;
}

//** computeQpOffDiagJacobian() *********************************************************
Real
LatentHeat::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _Temp_var){
    if (_DT<0.0){
      if (_u[_qp]<=1.0) {
        _dummy=(_u[qp]-1.0);
        return _K*_dummy*_dummy*(-_phi[_j][_qp])*_test[_i][_qp];
      } else {return 0.0;}

    } else if (_DT>0.0){
      if (_u[_qp]>=0.0) {
        return _K*_u[qp]*_u[qp]*(-_phi[_j][_qp])*_test[_i][_qp];
      } else {return 0.0;}
    }
  }

  return 0.0;

}
