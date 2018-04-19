#include "LatentConductionTemp.h"

template<>
InputParameters validParams<LatentConductionTemp>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Temp Component of Conduction For Heat transfer with latent heat");

  params.addRequiredParam<MaterialPropertyName>("Conductivity",  "Conductivity of the material");
  // params.addRequiredParam<MaterialPropertyName>("T_melt",  "Melting Temperature");
  params.addRequiredParam<Real>("T_melt",  "Melting Temperature");
  params.addRequiredCoupledVar("Eta", "Coupled Eta that defines the liquid phase eta=1 is liquid");

  return params;
}

//** Constructor *********************************************************
LatentConductionTemp::LatentConductionTemp(const InputParameters & parameters) :
    DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >(parameters),
    _Conductivity(getMaterialProperty<Real>("Conductivity")),
    _dConductivitydTemp(getMaterialPropertyDerivative<Real>("Conductivity", _var.name())),
    _Eta_var(coupled("Eta")),
    _Eta(coupledValue("Eta")),
    _Tmelt(getParam<Real>("T_melt"))
    {}

  //** computeQpResidual() *********************************************************
Real
LatentConductionTemp::computeQpResidual()
{
  if (((_u[_qp]>=_Tmelt)&&(_Eta[_qp]<1.0))||((_u[_qp]<=_Tmelt)&&(_Eta[_qp]>0.0))) {
    return 0.0;
  }

  return (_Conductivity[_qp]*_grad_u[_qp])*_grad_test[_i][_qp];

}

//** computeQpJacobian() *********************************************************
Real
LatentConductionTemp::computeQpJacobian()
{
  if (((_u[_qp]>=_Tmelt)&&(_Eta[_qp]<1.0))||((_u[_qp]<=_Tmelt)&&(_Eta[_qp]>0.0))) {
    return 0.0;
  }

  return (_dConductivitydTemp[_qp]*_phi[_j][_qp]*_grad_u[_qp]+
    _Conductivity[_qp]*_grad_phi[_j][_qp])*_grad_test[_i][_qp];
}

//** computeQpOffDiagJacobian() *********************************************************
// Real
// LatentConductionTemp::computeQpOffDiagJacobian(unsigned int jvar)
// {}
