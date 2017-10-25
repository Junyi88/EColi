/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef MSKALLENCAHN_H
#define MSKALLENCAHN_H

#include "ACBulk.h"

// Forward Declarations
class MskAllenCahn;

template <>
InputParameters validParams<MskAllenCahn>();

/**
 * MskAllenCahn uses the Free Energy function and derivatives
 * provided by a DerivativeParsedMaterial to computer the
 * residual for the bulk part of the Allen-Cahn equation.
 */
class MskAllenCahn : public ACBulk<Real>
{
public:
  MskAllenCahn(const InputParameters & parameters);

  virtual void initialSetup();

protected:
  virtual Real computeDFDOP(PFFunctionType type);
  virtual Real computeQpOffDiagJacobian(unsigned int jvar);

  const unsigned int _nvar;
  const MaterialProperty<Real> & _dFdEta;
  const MaterialProperty<Real> & _d2FdEta2;

  std::vector<const MaterialProperty<Real> *> _d2FdEtadarg;

private:
  const MaterialProperty<Real> & _Mask;
};

#endif // ALLENCAHN_H
