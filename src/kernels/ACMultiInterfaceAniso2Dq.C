/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/

#include "ACMultiInterfaceAniso2Dq.h"
#include "MooseVariable.h"
#include "NonlinearSystem.h"

// #include <cmath>
// #include <iostream>
// #include <istream>
// #include <fstream>
// #include <ostream>


template<>
InputParameters validParams<ACMultiInterfaceAniso2Dq>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Gradient energy Allen-Cahn Kernel with cross terms");
  params.addRequiredCoupledVar("etas", "All eta_i order parameters of the multiphase problem");
  params.addRequiredParam<std::vector<MaterialPropertyName> >("kappa_names", "The kappa used with the kernel");
  params.addParam<MaterialPropertyName>("mob_name", "L", "The mobility used with the kernel");
  params.addParam<unsigned int>("num_dim", 2, "Number of dimension");
  params.addRequiredCoupledVar("Q1", "Q1");
  params.addRequiredCoupledVar("Q2", "Q2");
  return params;
}

ACMultiInterfaceAniso2Dq::ACMultiInterfaceAniso2Dq(const InputParameters & parameters) :
    Kernel(parameters),
    _num_dim(getParam<unsigned int>("num_dim")),
    _num_etas(coupledComponents("etas")),
    _eta(_num_etas),
    _grad_eta(_num_etas),
    _eta_vars(_fe_problem.getNonlinearSystemBase().nVariables(), -1),
    _kappa_names(getParam<std::vector<MaterialPropertyName> >("kappa_names")),
    _kappa(_num_etas*_num_dim),
    _L(getMaterialProperty<Real>("mob_name")),
    _q1(&coupledValue("Q1")),
    _q2(&coupledValue("Q2"))
{
  if ((_num_etas*_num_dim) != _kappa_names.size())
    mooseError("Supply the correct nummber of etas, num dims and kappa_names.");

  unsigned int nvariables = _fe_problem.getNonlinearSystemBase().nVariables();

  int a = -1;
  for (unsigned int i = 0; i < _num_etas; ++i)
  {
    // get all order parameters and their gradients
    _eta[i] = &coupledValue("etas", i);
    _grad_eta[i] = &coupledGradient("etas", i);

    // populate lookup table form jvar to _eta index
    unsigned int var = coupled("etas", i);
    if (var < nvariables)
      _eta_vars[var] = i;

    // get the index of the variable the kernel is operating on
    if (coupled("etas", i) == _var.number())
      a = i;
  }

  // get gradient prefactors
  for (unsigned int i = 0; i < _num_etas*_num_dim; ++i)
    _kappa[i] = &getMaterialPropertyByName<Real>(_kappa_names[i]);

  if (a < 0)

    mooseError("Kernel variable must be listed in etas for ACMultiInterfaceAniso2Dq kernel " ,name());

  else
    _a = a;
}

Real
ACMultiInterfaceAniso2Dq::computeQpResidual()
{
  const VariableValue & _eta_a = _u;
  const VariableGradient & _grad_eta_a = _grad_u;

  RealGradient _kappa_detaA;
  RealGradient _kappa_detaB;

  Real sum = 0.0;
  for (unsigned int b = 0; b < _num_etas; ++b)
  {
    // skip the diagonal term (does not contribute)
    if (b == _a) continue;

    _kappa_detaA=kappaXgradeta(b,_grad_eta_a[_qp]);
    _kappa_detaB=kappaXgradeta(b,(*_grad_eta[b])[_qp]);
    sum += (
               // order 1 terms
               2.0 * _test[_i][_qp] * (_eta_a[_qp] * (*_grad_eta[b])[_qp] - (*_eta[b])[_qp] * _grad_eta_a[_qp]) * _kappa_detaB
               // volume terms
             + ( - (   _eta_a[_qp] * (*_eta[b])[_qp] * _grad_test[_i][_qp]
                     + _test[_i][_qp] * (*_eta[b])[_qp] * _grad_eta_a[_qp]
                     + _test[_i][_qp] * _eta_a[_qp] * (*_grad_eta[b])[_qp]
                   ) * _kappa_detaB)
             - ( - (   (*_eta[b])[_qp] * (*_eta[b])[_qp] * _grad_test[_i][_qp]
                     + 2.0 * _test[_i][_qp] * (*_eta[b])[_qp] * (*_grad_eta[b])[_qp]
                   ) * _kappa_detaA)
           );
  }

  return _L[_qp] * sum;
}

Real
ACMultiInterfaceAniso2Dq::computeQpJacobian()
{
  RealGradient _kappa_detaB;
  RealGradient _kappa_dphi;

  Real sum = 0.0;
  for (unsigned int b = 0; b < _num_etas; ++b)
  {
    // skip the diagonal term (does not contribute)
    if (b == _a) continue;

    _kappa_detaB=kappaXgradeta(b,(*_grad_eta[b])[_qp]);
    _kappa_dphi=kappaXgradeta(b,_grad_phi[_j][_qp]);

    sum += (
         2.0 * _test[_i][_qp] * ( (_phi[_j][_qp] * (*_grad_eta[b])[_qp] - (*_eta[b])[_qp] * _grad_phi[_j][_qp]) * _kappa_detaB)
      + ( - (   _phi[_j][_qp] * (*_eta[b])[_qp] * _grad_test[_i][_qp]
              + _test[_i][_qp] * (*_eta[b])[_qp] * _grad_phi[_j][_qp]
              + _test[_i][_qp] * _phi[_j][_qp] * (*_grad_eta[b])[_qp]
            ) * _kappa_detaB
        )
      - ( - (   (*_eta[b])[_qp] * (*_eta[b])[_qp] * _grad_test[_i][_qp]
              + 2.0 * _test[_i][_qp] * (*_eta[b])[_qp] * (*_grad_eta[b])[_qp]
            ) * _kappa_dphi
        )
    );
  }

  return _L[_qp] * sum;
}

Real
ACMultiInterfaceAniso2Dq::computeQpOffDiagJacobian(unsigned int jvar)
{
  const VariableValue & _eta_a = _u;
  const VariableGradient & _grad_eta_a = _grad_u;

  RealGradient _kappa_detaA;
  RealGradient _kappa_detaB;
  RealGradient _kappa_dphi;

  const int b = _eta_vars[jvar];
  if (b < 0) return 0.0;

  _kappa_detaA=kappaXgradeta(b,_grad_eta_a[_qp]);
  _kappa_detaB=kappaXgradeta(b,(*_grad_eta[b])[_qp]);
  _kappa_dphi=kappaXgradeta(b,_grad_phi[_j][_qp]);

  return _L[_qp] * (
             2.0 * _test[_i][_qp] * (
                 (_eta_a[_qp] * _grad_phi[_j][_qp] - _phi[_j][_qp] * _grad_eta_a[_qp]) * _kappa_detaB
               + (_eta_a[_qp] * (*_grad_eta[b])[_qp] - (*_eta[b])[_qp] * _grad_eta_a[_qp]) * _kappa_dphi
             )
           + ( - (   _eta_a[_qp] * _phi[_j][_qp] * _grad_test[_i][_qp]
                   + _test[_i][_qp] * _phi[_j][_qp] * _grad_eta_a[_qp]
                   + _test[_i][_qp] * _eta_a[_qp] * _grad_phi[_j][_qp]
                 ) * _kappa_detaB
               - (   _eta_a[_qp] * (*_eta[b])[_qp] * _grad_test[_i][_qp]
                   + _test[_i][_qp] * (*_eta[b])[_qp] * _grad_eta_a[_qp]
                   + _test[_i][_qp] * _eta_a[_qp] * (*_grad_eta[b])[_qp]
                 ) * _kappa_dphi
             )
           - ( - (   2.0 * (*_eta[b])[_qp] * _phi[_j][_qp] * _grad_test[_i][_qp]
                   + 2.0 * _test[_i][_qp] * (_phi[_j][_qp] * (*_grad_eta[b])[_qp] + (*_eta[b])[_qp] * _grad_phi[_j][_qp])
                 ) * _kappa_detaA)
         );
}


RealGradient
ACMultiInterfaceAniso2Dq::kappaXgradeta(const int b,const RealGradient gradeta)
{
  RealGradient kappagradeta;
    kappagradeta(3)=0.0;

  VariableValue c1=(*_q1)[_qp]^2 - (*_q2)[_qp]^2;
  VariableValue s1=2 * (*_q1)[_qp] * (*_q2)[_qp];

  kappagradeta(0)=((c1*(*_kappa[b])[_qp])-
                    s1*(*_kappa[b+_num_etas])[_qp]) *  gradeta(0);

  kappagradeta(1)=((s1*(*_kappa[b])[_qp])+
                    c1*(*_kappa[b+_num_etas])[_qp]) *  gradeta(1);

  return kappagradeta;
}
