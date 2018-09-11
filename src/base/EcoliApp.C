#include "EcoliApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "ModulesApp.h"
#include "MooseSyntax.h"

// ---------------------
#include "JLU1_VelocityU.h"
#include "JLU1_VelocityGradients.h"
#include "JLU1_StressFromRates.h"
#include "JLU1_StressDivergenceU.h"
#include "JLU1_DeformationGradientStrains.h"

//================================
template<>
InputParameters validParams<EcoliApp>()
{
  InputParameters params = validParams<MooseApp>();
  return params;
}

EcoliApp::EcoliApp(InputParameters parameters) :
    MooseApp(parameters)
{
  Moose::registerObjects(_factory);
  ModulesApp::registerObjects(_factory);
  EcoliApp::registerObjects(_factory);

  Moose::associateSyntax(_syntax, _action_factory);
  ModulesApp::associateSyntax(_syntax, _action_factory);
  EcoliApp::associateSyntax(_syntax, _action_factory);
}

EcoliApp::~EcoliApp()
{
}

// External entry point for dynamic application loading
extern "C" void EcoliApp__registerApps() { EcoliApp::registerApps(); }
void
EcoliApp::registerApps()
{
  registerApp(EcoliApp);
}

// External entry point for dynamic object registration
extern "C" void EcoliApp__registerObjects(Factory & factory) { EcoliApp::registerObjects(factory); }
void
EcoliApp::registerObjects(Factory & factory)
{
  registerKernel(JLU1_VelocityU);
  registerKernel(JLU1_StressDivergenceU);
  registerMaterial(JLU1_VelocityGradients);
  registerMaterial(JLU1_StressFromRates);
  registerMaterial(JLU1_DeformationGradientStrains);
}

// External entry point for dynamic syntax association
extern "C" void EcoliApp__associateSyntax(Syntax & syntax, ActionFactory & action_factory) { EcoliApp::associateSyntax(syntax, action_factory); }
void
EcoliApp::associateSyntax(Syntax & /*syntax*/, ActionFactory & /*action_factory*/)
{
}
