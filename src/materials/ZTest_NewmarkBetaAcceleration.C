#include "ZTest_NewmarkBetaAcceleration.h"
#include "MooseMesh.h"
#include "Assembly.h"
// libmesh includes
#include "libmesh/quadrature.h"

template<>
InputParameters validParams<ZTest_NewmarkBetaAcceleration>()
{
  InputParameters params = validParams<Material>();
  params.addClassDescription("Calculate Acceleration Using Newmark Beta");
  params.addCoupledVar("displacements", "Displacement");
  params.addCoupledVar("velocities", "Displacement");
  params.addParam<Real>("Beta", 0.25, "Beta");

  return params;
}

ZTest_NewmarkBetaAcceleration::ZTest_NewmarkBetaAcceleration(const InputParameters & parameters) :
    DerivativeMaterialInterface<Material>(parameters),
    _Displacements(3),
    _Displacements_old(3),
    _Velocities(3),
    _Acc_x(declareProperty<Real>("Acc_x")),
    _Acc_y(declareProperty<Real>("Acc_y")),
    _Acc_z(declareProperty<Real>("Acc_z")),
    _Acc_x_old(getMaterialPropertyOld<Real>("Acc_x")),
    _Acc_y_old(getMaterialPropertyOld<Real>("Acc_y")),
    _Acc_z_old(getMaterialPropertyOld<Real>("Acc_z")),
    _Beta(getParam<Real>("Beta")),
    _Con1((1.0-2.0*getParam<Real>("Beta"))/(2.0*getParam<Real>("Beta"))),
    _Con2(0.0)
{
  for (unsigned int i=0; i<3; ++i){
    _Displacements[i]= &coupledValue("displacements", i);
    _Displacements_old[i]= &coupledValueOld("displacements", i);
    _Velocities[i]= &coupledValueOld("velocities", i);
  }
}

void
ZTest_NewmarkBetaAcceleration::initQpStatefulProperties()
{
  _Acc_x[_qp]=0.0;
  _Acc_y[_qp]=0.0;
  _Acc_z[_qp]=0.0;

}

void
ZTest_NewmarkBetaAcceleration::computeQpProperties()
{

  if (_dt>0.0){
    _Con2=1.0/(_Beta*_dt*_dt);

    _Acc_x[_qp]=((*_Displacements[0])[_qp]);
    _Acc_x[_qp]-=((*_Displacements_old[0])[_qp]);
    _Acc_x[_qp]-=_dt*((*_Velocities[0])[_qp]);
    _Acc_x[_qp]*=_Con2;
    _Acc_x[_qp]-=_Con1*(_Acc_x_old[_qp]);

    _Acc_y[_qp]=((*_Displacements[1])[_qp]);
    _Acc_y[_qp]-=((*_Displacements_old[1])[_qp]);
    _Acc_y[_qp]-=_dt*((*_Velocities[1])[_qp]);
    _Acc_y[_qp]*=_Con2;
    _Acc_y[_qp]-=_Con1*(_Acc_y_old[_qp]);

    _Acc_z[_qp]=((*_Displacements[2])[_qp]);
    _Acc_z[_qp]-=((*_Displacements_old[2])[_qp]);
    _Acc_z[_qp]-=_dt*((*_Velocities[2])[_qp]);
    _Acc_z[_qp]*=_Con2;
    _Acc_z[_qp]-=_Con1*(_Acc_z_old[_qp]);

  } else {
  _Acc_x[_qp]=0.0;
  _Acc_y[_qp]=0.0;
  _Acc_z[_qp]=0.0;
  }
}
