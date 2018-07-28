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

// ------ JEUk_MassConvec2D
#include "JEUk_Mass_Convec2D.h"
#include "JEUk_Mass_ConvecFull2D.h"

#include "JEUk_Mo_BodyF.h"
#include "JEUk_Mo_Convec2D.h"
#include "JEUk_Mo_NV_Dev2D.h"
#include "JEUk_Mo_NV_HS2D.h"
#include "JEUk_Mo_Pressure.h"
#include "JEUk_Mo_TimeDerivative.h"

#include "JEUk_DG_DGRate2D.h"
#include "JEUk_Gen_Self.h"
#include "JEUk_Mo_StressDiv2D.h"
#include "JEUk_Stress_NV_Dev2D.h"
#include "JEUk_Stress_NV_HS2D.h"

#include "Gen_SelfNegative.h"
#include "Gen_SelfNegativeFromRate.h"
#include "JLCR_DeformGradient.h"
#include "JLCR_StressDivergence.h"

#include "JLCR_StressConstitutiveElasticRate.h"
#include "JLCR_CalcDeformRotTensors.h"
#include "JLCR_CalcStressRate.h"
#include "JLCR_CalcVelTensor.h"
#include "JUtils_GetVarType.h"

#include "JLCR_StressRotationRate.h"
#include "Gen_Dummy.h"
#include "JLCR_CalcRotatedElasticityTensor.h"
#include "JLCR_CalcDefVelGradient.h"
#include "Gen_SelfRate.h"

#include "ZTest_StressDivBasic.h"
#include "ZTest_Velocity.h"
#include "ZTest_NewmarkBetaAcceleration.h"
#include "ZTest_Stress.h"
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

  //----------------
  registerKernel(JEUk_Mass_Convec2D);
  registerKernel(JEUk_Mass_ConvecFull2D);

  registerKernel(JEUk_Mo_BodyF);
  registerKernel(JEUk_Mo_Convec2D);
  registerKernel(JEUk_Mo_NV_Dev2D);
  registerKernel(JEUk_Mo_NV_HS2D);
  registerKernel(JEUk_Mo_Pressure);
  registerKernel(JEUk_Mo_TimeDerivative);

  registerKernel(JEUk_DG_DGRate2D);
  registerKernel(JEUk_Gen_Self);
  registerKernel(JEUk_Mo_StressDiv2D);
  registerKernel(JEUk_Stress_NV_Dev2D);
  registerKernel(JEUk_Stress_NV_HS2D);

  registerKernel(Gen_SelfNegative);
  registerKernel(Gen_SelfNegativeFromRate);
  registerKernel(JLCR_DeformGradient);
  registerKernel(JLCR_StressDivergence);

  registerKernel(JLCR_StressConstitutiveElasticRate);
  registerMaterial(JLCR_CalcDeformRotTensors);
  registerMaterial(JLCR_CalcStressRate);
  registerMaterial(JLCR_CalcVelTensor);


  registerKernel(JLCR_StressRotationRate);
  registerKernel(Gen_Dummy);
  registerMaterial(JLCR_CalcRotatedElasticityTensor);
  registerMaterial(JLCR_CalcDefVelGradient);
  registerKernel(Gen_SelfRate);

  registerKernel(ZTest_StressDivBasic);
  registerKernel(ZTest_Velocity);
  registerMaterial(ZTest_NewmarkBetaAcceleration);
  registerMaterial(ZTest_Stress);
}

// External entry point for dynamic syntax association
extern "C" void EcoliApp__associateSyntax(Syntax & syntax, ActionFactory & action_factory) { EcoliApp::associateSyntax(syntax, action_factory); }
void
EcoliApp::associateSyntax(Syntax & /*syntax*/, ActionFactory & /*action_factory*/)
{
}
