#include "EcoliApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "ModulesApp.h"
#include "MooseSyntax.h"

#include "PusztaiACBulk.h" //Add
#include "PusztaiQsBulk.h" //Add
#include "JunyiAngle2Value.h" //Add
#include "JunyiSmoothCircleBaseIC.h" //Add
#include "JunyiMultiSmoothCircleIC.h" //Add
#include "ACMultiInterfaceAnisoFix.h"

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
  registerKernel(PusztaiACBulk); //Add
  registerKernel(PusztaiQsBulk); //Add
  registerKernel(ACMultiInterfaceAnisoFix); //Add
  registerAuxKernel(JunyiAngle2Value); //Add
  // registerInitialCondition(JunyiSmoothCircleBaseIC); //Add
  registerInitialCondition(JunyiMultiSmoothCircleIC); //Add
}

// External entry point for dynamic syntax association
extern "C" void EcoliApp__associateSyntax(Syntax & syntax, ActionFactory & action_factory) { EcoliApp::associateSyntax(syntax, action_factory); }
void
EcoliApp::associateSyntax(Syntax & /*syntax*/, ActionFactory & /*action_factory*/)
{
}
