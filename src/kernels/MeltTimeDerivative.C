/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#include "MeltTimeDerivative.h"

template <>
InputParameters
validParams<MeltTimeDerivative>()
{
  InputParameters params = validParams<TimeDerivative>();
  params.addClassDescription(
      "Time derivative term $\\rho c_p \\frac{\\partial T}{\\partial t}$ of "
      "the heat equation with the specific heat $c_p$ and the density $\\rho$ as arguments.");

  // Density may be changing with deformation, so we must integrate
  // over current volume by setting the use_displaced_mesh flag.
  params.set<bool>("use_displaced_mesh") = true;

  params.addParam<MaterialPropertyName>(
      "specific_heat", "specific_heat", "Property name of the specific heat material property");
  params.addParam<MaterialPropertyName>(
      "density", "density", "Property name of the density material property");
  params.addCoupledVar("args", "Vector of additional arguments of the specific heat and density");

  params.addRequiredParam<Real>("T_melt",  "Melting Temperature");
  params.addRequiredCoupledVar("Eta", "Coupled Eta that defines the liquid phase eta=1 is liquid");

  return params;
}

MeltTimeDerivative::MeltTimeDerivative(
    const InputParameters & parameters)
  : DerivativeMaterialInterface<JvarMapKernelInterface<TimeDerivative>>(parameters),
    _specific_heat(getMaterialProperty<Real>("specific_heat")),
    _d_specific_heat_dT(getMaterialPropertyDerivative<Real>("specific_heat", _var.name())),
    _density(getMaterialProperty<Real>("density")),
    _d_density_dT(getMaterialPropertyDerivative<Real>("density", _var.name())),
    _Eta_var(coupled("Eta")),
    _Eta(coupledValue("Eta")),
    _Tmelt(getParam<Real>("T_melt")),
    _Eta_dot(coupledDot("Eta")),
    _dEta_dot(coupledDotDu("Eta"))
{
  // Get number of coupled variables
  unsigned int nvar = _coupled_moose_vars.size();

  // reserve space for derivatives
  _d_specific_heat_dargs.resize(nvar);
  _d_density_dargs.resize(nvar);

  // Iterate over all coupled variables
  for (unsigned int i = 0; i < nvar; ++i)
  {
    const std::string iname = _coupled_moose_vars[i]->name();
    _d_specific_heat_dargs[i] = &getMaterialPropertyDerivative<Real>("specific_heat", iname);
    _d_density_dargs[i] = &getMaterialPropertyDerivative<Real>("density", iname);
  }
}

Real
MeltTimeDerivative::computeQpResidual()
{

  return _specific_heat[_qp] * _density[_qp] *_test[_i][_qp] * _Eta_dot[_qp];

  return 0.0;

}

Real
MeltTimeDerivative::computeQpJacobian()
{
  const Real dT = _test[_i][_qp] * _dEta_dot[_qp];

  // on-diagonal Jacobian with all terms that may depend on the kernel variable
  // return _specific_heat[_qp] * _density[_qp] * TimeDerivative::computeQpJacobian() +
  //        _d_specific_heat_dT[_qp] * _phi[_j][_qp] * _density[_qp] * dT +
  //        _specific_heat[_qp] * _d_density_dT[_qp] * _phi[_j][_qp] * dT;

   return _d_specific_heat_dT[_qp] * _phi[_j][_qp] * _density[_qp] * dT +
          _specific_heat[_qp] * _d_density_dT[_qp] * _phi[_j][_qp] * dT;

  // return 0.0;
}

Real
MeltTimeDerivative::computeQpOffDiagJacobian(unsigned int jvar)
{
  // if (((_u[_qp]>=_Tmelt)&&(_Eta[_qp]<1.0))||((_u[_qp]<=_Tmelt)&&(_Eta[_qp]>0.0))) {
  // // get the coupled variable jvar is referring to
  // const unsigned int cvar = mapJvarToCvar(jvar);
  //
  // // off-diagonal contribution with terms that depend on coupled variables
  // const Real dT = TimeDerivative::computeQpResidual();
  // return (*_d_specific_heat_dargs[cvar])[_qp] * _phi[_j][_qp] * _density[_qp] * dT +
  //        _specific_heat[_qp] * (*_d_density_dargs[cvar])[_qp] * _phi[_j][_qp] * dT;
  // }

  if (jvar == _Eta_var)
    return _specific_heat[_qp] * _density[_qp]*_test[_i][_qp] * _phi[_j][_qp] * _dEta_dot[_qp];

  const unsigned int cvar = mapJvarToCvar(jvar);
  const Real dT = _test[_i][_qp] * _dEta_dot[_qp];
  return (*_d_specific_heat_dargs[cvar])[_qp] * _phi[_j][_qp] * _density[_qp] * dT +
         _specific_heat[_qp] * (*_d_density_dargs[cvar])[_qp] * _phi[_j][_qp] * dT;
  // return 0.0;
}
