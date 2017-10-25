/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#include "MskMskAllenCahn.h"

template <>
InputParameters
validParams<MskMskAllenCahn>()
{
  InputParameters params = ACBulk<Real>::validParams();
  params.addClassDescription("Allen-Cahn Kernel that uses a DerivativeMaterial Free Energy");
  params.addRequiredParam<MaterialPropertyName>(
      "f_name", "Base name of the free energy function F defined in a DerivativeParsedMaterial");
      params.addRequiredParam<MaterialPropertyName>("Mask",  "Mask Variable");
  return params;
}

MskMskAllenCahn::MskMskAllenCahn(const InputParameters & parameters)
  : ACBulk<Real>(parameters),
    _nvar(_coupled_moose_vars.size()),
    _dFdEta(getMaterialPropertyDerivative<Real>("f_name", _var.name())),
    _d2FdEta2(getMaterialPropertyDerivative<Real>("f_name", _var.name(), _var.name())),
    _d2FdEtadarg(_nvar), _Mask(getMaterialProperty<Real>("Mask"))
{
  // Iterate over all coupled variables
  for (unsigned int i = 0; i < _nvar; ++i)
    _d2FdEtadarg[i] =
        &getMaterialPropertyDerivative<Real>("f_name", _var.name(), _coupled_moose_vars[i]->name());
}

void
MskMskAllenCahn::initialSetup()
{
  ACBulk<Real>::initialSetup();
  validateNonlinearCoupling<Real>("f_name");
  validateDerivativeMaterialPropertyBase<Real>("f_name");
}

Real
MskMskAllenCahn::computeDFDOP(PFFunctionType type)
{
  if (_Mask[_qp]<0.5)
    return 0.0;
    
  switch (type)
  {
    case Residual:
      return _dFdEta[_qp];

    case Jacobian:
      return _d2FdEta2[_qp] * _phi[_j][_qp];
  }

  mooseError("Internal error");
}

Real
MskMskAllenCahn::computeQpOffDiagJacobian(unsigned int jvar)
{
  if (_Mask[_qp]<0.5)
    return 0.0;

  // get the coupled variable jvar is referring to
  const unsigned int cvar = mapJvarToCvar(jvar);

  return ACBulk<Real>::computeQpOffDiagJacobian(jvar) +
         _L[_qp] * (*_d2FdEtadarg[cvar])[_qp] * _phi[_j][_qp] * _test[_i][_qp];
}
