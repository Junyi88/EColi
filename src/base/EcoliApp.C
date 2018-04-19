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

#include "ACMultiInterfaceAnisoFix.h" //Add
#include "ACMultiInterfaceAniso2Dq.h" //Add
#include "SwitchingFunctionMaterialNoOver.h" //Add
#include "SwitchingFunctionMaterialLagrange.h" //Add
#include "SwitchingFunctionMaterialLagrangeB.h" //Add
#include "HeatConduction2.h"

#include "PusztaiACBulkB.h" //Add
#include "PusztaiQsBulkB.h" //Add

#include "LqPhaseStressUpdate.h"

#include "FunctionNeumannJunyiBC.h"

#include "LatentConductionTemp.h"
#include "LatentConductionEta.h"

#include "LatentHeat.h"
#include "MeltTimeDerivative.h"

#include "CoupledTimeDerivativeMelt.h"
#include "SpecificHeatConductionTimeDerivativeMelt.h"
#include "HeatConductionTimeDerivative2.h"

//
#include "MskAllenCahn.h"
#include "MskBodyForce.h"
#include "MskHeatConduction.h"
#include "MskLatentHeat.h"
#include "MskMeltTimeDerivative.h"
#include "MskSpecificHeatConductionTimeDerivative.h"
#include "MskStressDivergence.h"
#include "MskStressDivergenceTensors.h"
#include "MskTimeDerivative.h"

#include "MaskedCoupledConvectiveFlux.h"
#include "NaturalConvectionNeumann.h"
#include "NaturalCoupledConvectiveFlux.h"
#include "NaturalCoupledConvectiveFluxFunc.h"

<<<<<<< HEAD
=======
// ------ JEUk_MassConvec2D
#include "JEUk_MassConvec2D.h"
>>>>>>> 1c281b326a1f96f83d5ac8a9f8cb3633e95d3327

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
  registerKernel(PusztaiACBulkB); //Add
  registerKernel(PusztaiQsBulkB); //Add
  registerKernel(ACMultiInterfaceAnisoFix); //Add
  registerKernel(ACMultiInterfaceAniso2Dq); //Add
  registerKernel(HeatConduction2Kernel); //Add

  registerKernel(LatentConductionTemp);
  registerKernel(LatentConductionEta);

  registerKernel(CoupledTimeDerivativeMelt);
  registerKernel(SpecificHeatConductionTimeDerivativeMelt);
  registerKernel(LatentHeat);
  registerKernel(MeltTimeDerivative);
  registerKernel(HeatConductionTimeDerivative2);

  //
  registerKernel(MskAllenCahn);
  registerKernel(MskBodyForce);
  registerKernel(MskHeatConduction);
  registerKernel(MskLatentHeat);
  registerKernel(MskMeltTimeDerivative);
  registerKernel(MskSpecificHeatConductionTimeDerivative);
  registerKernel(MskStressDivergence);
  registerKernel(MskStressDivergenceTensors);
  registerKernel(MskTimeDerivative);

  registerAuxKernel(JunyiAngle2Value); //Add
  // registerInitialCondition(JunyiSmoothCircleBaseIC); //Add
  registerInitialCondition(JunyiMultiSmoothCircleIC); //Add
  registerMaterial(SwitchingFunctionMaterialNoOver); //Add
  registerMaterial(SwitchingFunctionMaterialLagrange); //Add
  registerMaterial(SwitchingFunctionMaterialLagrangeB); //Add
  registerMaterial(LqPhaseStressUpdate); //Add
  registerBoundaryCondition(FunctionNeumannJunyiBC);
  registerBoundaryCondition(MaskedCoupledConvectiveFlux);
  registerBoundaryCondition(NaturalConvectionNeumann);
  registerBoundaryCondition(NaturalCoupledConvectiveFlux);
  registerBoundaryCondition(NaturalCoupledConvectiveFluxFunc);
<<<<<<< HEAD
=======

  //----------------
  registerAuxKernel(JEUk_Mass_Convec2D);
>>>>>>> 1c281b326a1f96f83d5ac8a9f8cb3633e95d3327
}

// External entry point for dynamic syntax association
extern "C" void EcoliApp__associateSyntax(Syntax & syntax, ActionFactory & action_factory) { EcoliApp::associateSyntax(syntax, action_factory); }
void
EcoliApp::associateSyntax(Syntax & /*syntax*/, ActionFactory & /*action_factory*/)
{
}
