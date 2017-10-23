#include "LatentConductionEta.h"

template<>
InputParameters validParams<LatentConductionEta>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Phase Component of Conduction For Heat transfer with latent heat");

  params.addRequiredParam<MaterialPropertyName>("Conductivity",  "Conductivity of the material");
//  params.addRequiredParam<MaterialPropertyName>("Cl",  "Latent heat of the material");
  // params.addRequiredParam<MaterialPropertyName>("T_melt",  "Melting Temperature");
  params.addRequiredParam<Real>("T_melt",  "Melting Temperature");
  params.addRequiredCoupledVar("Temp", "Coupled Temperature");

  return params;
}

//** Constructor *********************************************************
LatentConductionEta::LatentConductionEta(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _Conductivity(getMaterialProperty<Real>("Conductivity")),
    _dConductivitydTemp(getMaterialPropertyDerivative<Real>("Conductivity","Temp")),
    _Temp_var(coupled("Temp")),
    _Temp(coupledValue("Temp")),
    _grad_Temp(coupledGradient("Temp")),
    _Tmelt(getParam<Real>("T_melt"))
    {}

  //** computeQpResidual() *********************************************************
Real
LatentConductionEta::computeQpResidual()
{
  if (((_Temp[_qp]>=_Tmelt)&&(_u[_qp]<1.0))||((_Temp[_qp]<=_Tmelt)&&(_u[_qp]>0.0))) {
    return (_Conductivity[_qp]*_grad_Temp[_qp])*_grad_test[_i][_qp];
  }


  return 0.0;

}

//** computeQpJacobian() *********************************************************
Real
LatentConductionEta::computeQpJacobian()
{
  // if (((_Temp[_qp]>=_Tmelt)&&(_u[_qp]<1.0))||((_Temp[_qp]<=_Tmelt)&&(_u[_qp]>0.0))) {
  //   return (_dConductivitydTemp[_qp]*_phi[_j][_qp]*_grad_u[_qp]+
  //     _Conductivity[_qp]*_grad_phi[_j][_qp])*_grad_test[_i][_qp];
  // }


  return 0.0;
}

//** computeQpOffDiagJacobian() *********************************************************
// Real
LatentConductionEta::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (jvar == _Temp_var){
    if (((_Temp[_qp]>=_Tmelt)&&(_u[_qp]<1.0))||((_Temp[_qp]<=_Tmelt)&&(_u[_qp]>0.0))) {
      return (_dConductivitydTemp[_qp]*_phi[_j][_qp]*_grad_Temp[_qp]+
        _Conductivity[_qp]*_grad_phi[_j][_qp]*Temp[_qp])*_grad_test[_i][_qp];
    }
  }

  return 0.0;

}
