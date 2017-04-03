/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/

#include "ACMultiInterfaceAnisoFix.h"
#include "NonlinearSystem.h"

#include <cmath>
#include <iostream>
#include <istream>
#include <fstream>
#include <ostream>

template<>
InputParameters validParams<ACMultiInterfaceAnisoFix>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Gradient energy Allen-Cahn Kernel with cross terms");
  params.addRequiredCoupledVar("etas", "All eta_i order parameters of the multiphase problem");
  params.addRequiredParam<std::vector<MaterialPropertyName> >("kappa_names", "The kappa used with the kernel");
  params.addParam<MaterialPropertyName>("mob_name", "L", "The mobility used with the kernel");
  params.addParam<unsigned int>("num_dim", 2, "Number of dimension");
  return params;
}

ACMultiInterfaceAnisoFix::ACMultiInterfaceAnisoFix(const InputParameters & parameters) :
    Kernel(parameters),
    _num_etas(coupledComponents("etas")),
    _eta(_num_etas),
    _grad_eta(_num_etas),
    _eta_vars(_fe_problem.getNonlinearSystemBase().nVariables(), -1),
    _kappa_names(getParam<std::vector<MaterialPropertyName> >("kappa_names")),
    _kappa(_num_etas*2),
    _L(getMaterialProperty<Real>("mob_name")),
    _num_dim(getParam<unsigned int>("num_dim"))
{
  // if (_num_etas != _kappa_names.size())
  //   mooseError("Supply the same nummber of etas and kappa_names.");

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

    // get gradient prefactors
  //  _kappa[i] = &getMaterialPropertyByName<Real>(_kappa_names[i]);
  }

  for (unsigned int i = 0; i < _num_etas*_num_dim; ++i)
  {

    _kappa[i] = &getMaterialPropertyByName<Real>(_kappa_names[i]);
  }

  if (a < 0)
    mooseError("Kernel variable must be listed in etas for ACMultiInterfaceAnisoFix kernel " << name());
  else
    _a = a;
}

Real
ACMultiInterfaceAnisoFix::computeQpResidual()
{
  const VariableValue & _eta_a = _u;
  const VariableGradient & _grad_eta_a = _grad_u;

  VariableGradient _kappa_detaA=_grad_u;
  VariableGradient _kappa_detaB=_grad_u;
  int nK = 0;



  std::ofstream myfile;  //Junyi Debug
  myfile.open ("CheckValues.txt",std::ios::app); //Junyi Debug
  myfile << "W===========================.\n"; //Junyi Debug
  myfile << "_kappa="<<(*_kappa[0])[0]<<std::endl; //Junyi Debug
  myfile << "_grad_u="<<_grad_u[0]<<std::endl; //Junyi Debug
  myfile << "_grad_ux="<<(_grad_u[0](0))<<std::endl; //Junyi Debug
  myfile << "_grad_ux="<<(_grad_u[0](1))<<std::endl; //Junyi Debug
  myfile << "_grad_ux="<<(_grad_u[0](2))<<std::endl; //Junyi Debug
  myfile << "_num_etas="<<_num_etas<<std::endl; //Junyi Debug
  myfile << "_kappa_detaA1="<<_kappa_detaA[0]<<std::endl; //Junyi Debug
  myfile << "_kappa_detaB1="<<_kappa_detaB[0]<<std::endl; //Junyi Debug

  Real sum = 0.0;
  for (unsigned int b = 0; b < _num_etas; ++b)
  {
   //
   myfile << "b="<<b<<std::endl; //Junyi Debug
   _kappa_detaA=multiplyFixedkappa(b,_kappa_detaA);
   myfile << "moron"<<std::endl; //Junyi Debug
   _kappa_detaB=multiplyFixedkappa(b,(*_grad_eta[b]));
   myfile << "_kappa_detaA2="<<_kappa_detaA[0]<<std::endl; //Junyi Debug
   myfile << "_kappa_detaB2="<<_kappa_detaB[0]<<std::endl; //Junyi Debug
    // skip the diagonal term (does not contribute)
    if (b == _a) continue;
    myfile << "b,a="<<b<<','<<_a<<std::endl; //Junyi Debug
    sum += (*_kappa[b])[_qp] * (
               // order 1 terms
               2.0 * _test[_i][_qp] * (_eta_a[_qp] * (*_grad_eta[b])[_qp] - (*_eta[b])[_qp] * _grad_eta_a[_qp]) * (*_grad_eta[b])[_qp]
               // volume terms
             + ( - (   _eta_a[_qp] * (*_eta[b])[_qp] * _grad_test[_i][_qp]
                     + _test[_i][_qp] * (*_eta[b])[_qp] * _grad_eta_a[_qp]
                     + _test[_i][_qp] * _eta_a[_qp] * (*_grad_eta[b])[_qp]
                   ) * (*_grad_eta[b])[_qp])
             - ( - (   (*_eta[b])[_qp] * (*_eta[b])[_qp] * _grad_test[_i][_qp]
                     + 2.0 * _test[_i][_qp] * (*_eta[b])[_qp] * (*_grad_eta[b])[_qp]
                   ) * _grad_eta_a[_qp])
           );
  }

  myfile.close(); //Junyi Debug
  return _L[_qp] * sum;
}

Real
ACMultiInterfaceAnisoFix::computeQpJacobian()
{
  Real sum = 0.0;
  for (unsigned int b = 0; b < _num_etas; ++b)
  {
    // skip the diagonal term (does not contribute)
    if (b == _a) continue;

    sum += (*_kappa[b])[_qp] * (
         2.0 * _test[_i][_qp] * ( (_phi[_j][_qp] * (*_grad_eta[b])[_qp] - (*_eta[b])[_qp] * _grad_phi[_j][_qp]) * (*_grad_eta[b])[_qp] )
      + ( - (   _phi[_j][_qp] * (*_eta[b])[_qp] * _grad_test[_i][_qp]
              + _test[_i][_qp] * (*_eta[b])[_qp] * _grad_phi[_j][_qp]
              + _test[_i][_qp] * _phi[_j][_qp] * (*_grad_eta[b])[_qp]
            ) * (*_grad_eta[b])[_qp]
        )
      - ( - (   (*_eta[b])[_qp] * (*_eta[b])[_qp] * _grad_test[_i][_qp]
              + 2.0 * _test[_i][_qp] * (*_eta[b])[_qp] * (*_grad_eta[b])[_qp]
            ) * _grad_phi[_j][_qp]
        )
    );
  }

  return _L[_qp] * sum;
}

Real
ACMultiInterfaceAnisoFix::computeQpOffDiagJacobian(unsigned int jvar)
{
  const VariableValue & _eta_a = _u;
  const VariableGradient & _grad_eta_a = _grad_u;

  const int b = _eta_vars[jvar];
  if (b < 0) return 0.0;

  return _L[_qp] * (*_kappa[b])[_qp] * (
             2.0 * _test[_i][_qp] * (
                 (_eta_a[_qp] * _grad_phi[_j][_qp] - _phi[_j][_qp] * _grad_eta_a[_qp]) * (*_grad_eta[b])[_qp]
               + (_eta_a[_qp] * (*_grad_eta[b])[_qp] - (*_eta[b])[_qp] * _grad_eta_a[_qp]) * _grad_phi[_j][_qp]
             )
           + ( - (   _eta_a[_qp] * _phi[_j][_qp] * _grad_test[_i][_qp]
                   + _test[_i][_qp] * _phi[_j][_qp] * _grad_eta_a[_qp]
                   + _test[_i][_qp] * _eta_a[_qp] * _grad_phi[_j][_qp]
                 ) * (*_grad_eta[b])[_qp]
               - (   _eta_a[_qp] * (*_eta[b])[_qp] * _grad_test[_i][_qp]
                   + _test[_i][_qp] * (*_eta[b])[_qp] * _grad_eta_a[_qp]
                   + _test[_i][_qp] * _eta_a[_qp] * (*_grad_eta[b])[_qp]
                 ) * _grad_phi[_j][_qp]
             )
           - ( - (   2.0 * (*_eta[b])[_qp] * _phi[_j][_qp] * _grad_test[_i][_qp]
                   + 2.0 * _test[_i][_qp] * (_phi[_j][_qp] * (*_grad_eta[b])[_qp] + (*_eta[b])[_qp] * _grad_phi[_j][_qp])
                 ) * _grad_eta_a[_qp])
         );
}


VariableGradient
ACMultiInterfaceAnisoFix::multiplyFixedkappa(const int b,const VariableGradient gradeta)
{
  VariableGradient kappadeta=gradeta;
  Real xxx;
  Real xxx2;
    //  kappadeta(2)=0.0;

    std::ofstream myfile;  //Junyi Debug
    myfile.open ("CheckValues.txt",std::ios::app); //Junyi Debug
   myfile << "x1"<<std::endl; //Junyi Debug
  for (unsigned int i = 0; i < _num_dim; ++i)
    {
      myfile << "_qp=="<<_qp<<std::endl; //Junyi Debug
      xxx=(gradeta[_qp](i));
      xxx2=(*_kappa[b+i * _num_etas])[_qp];
      kappadeta[_qp](i)=xxx2 * xxx;

    }

  myfile << "x2"<<std::endl; //Junyi Debug
  myfile.close();
  return kappadeta;
}
