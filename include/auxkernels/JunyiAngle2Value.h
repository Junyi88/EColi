/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef JUNYIANGLE2VALUE_H
#define JUNYIANGLE2VALUE_H

#include "AuxKernel.h"
#include "DerivativeMaterialInterface.h"

class JunyiAngle2Value;

template<>
InputParameters validParams<JunyiAngle2Value>();

//==========================
class JunyiAngle2Value : public AuxKernel
{
public:
  JunyiAngle2Value(const InputParameters & parameters);

protected:
  virtual Real computeValue();

  // const MaterialProperty<Real> & _S;
  // const MaterialProperty<Real> & _SV;
  // const MaterialProperty<Real> & _RV;
  // const MaterialProperty<Real> & _S;
  // const MaterialProperty<Real> & _SV;
  // const MaterialProperty<Real> & _RV;
  // std::vector<const VariableValue *> _S;
  std::vector<const VariableValue *> _S;
  std::vector<const VariableValue *> _SV;
  std::vector<const VariableValue *> _RV;
  unsigned int _ncom;
};



#endif //OUTPUTEULERANGLES_H
