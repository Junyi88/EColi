#include "JunyiAngle2Value.h"

template<>
InputParameters validParams<JunyiAngle2Value>()
{
  InputParameters params = validParams<AuxKernel>();
  // params.addRequiredParam<MaterialPropertyName>("Switch", "The Material that act as a switch");
  // params.addRequiredParam<MaterialPropertyName>("SwitchValues", "The Material that act as a switch");
  // params.addRequiredParam<MaterialPropertyName>("RndValues", "Random Values when Switch = 0");
  params.addCoupledVar("Switch", "The Material that act as a switch");
  params.addCoupledVar("SwitchValues", "The Material that act as a switch");
  params.addCoupledVar("RndValues", "Random Values when Switch = 0");
  params.addParam<int>("Component", 1, "Component");

  return params;
}

// JunyiAngle2Value::JunyiAngle2Value(const InputParameters & parameters) :
//     AuxKernel(parameters),
//     _S(getMaterialProperty<Real>("Switch")),
//     _SV(getMaterialProperty<Real>("SwitchValues")),
//     _RV(getMaterialProperty<Real>("RndValues")),
//     _ncom(getParam<int>("Component"))
//     {}

JunyiAngle2Value::JunyiAngle2Value(const InputParameters & parameters) :
    AuxKernel(parameters),
    _S(1),
    _SV(1),
    _RV(1),
    _ncom(getParam<int>("Component"))
    {
      _S[0]=&coupledValue("Switch",0);
      _SV[0]=&coupledValue("SwitchValues",0);
      _RV[0]=&coupledValue("RndValues",0);
    }

Real
JunyiAngle2Value::computeValue()
{ Real x=(*_RV[0])[_qp];

  if ((*_S[0])[_qp]>=0.9)
    x=(*_SV[0])[_qp];

  if (_ncom==1)
    return cos(x);

  return sin(x);

}
