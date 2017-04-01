#=======================================================
#:Global Params
[GlobalParams]
  outputs = exodus
  penalty = 1e3
[]

[Mesh] #Mesh: Load Mesh
  file =/work/jl1908/DropZone/SimpleCases/CaseC/CaseC_LN_R1_out.e
[]

#=======================================================
#:UserObjects
[UserObjects]
  [./ConservedNormalNoise1]
    execute_on                   = TIMESTEP_BEGIN              # Set to (nonlinear|linear|timestep_end|timestep_begin|custom) to execute ...
    seed                         = 201                           # The seed for the master random number generator
    type                         = ConservedNormalNoise
    use_displaced_mesh           = 0                           # Whether or not this object should use the displaced mesh for computation. .
  [../]
[]

#=======================================================
#:MeshModifiers
[MeshModifiers]
  [./SubdomainBoundingBox1]
    block_id                     = 1
    location                     = INSIDE
    top_right                    = '25.0 18.0 0.0'
    bottom_left                  = '15.0 8.0 0.0'
    type                         = SubdomainBoundingBox
  [../]
  [./SubdomainBoundingBox2]
    block_id                     = 2
    location                     = INSIDE
    top_right                    = '33.0 50.0 0.0'
    bottom_left                  = '23.0 40.0 0.0'
    type                         = SubdomainBoundingBox
  [../]
  [./SubdomainBoundingBox3]
    block_id                     = 3
    location                     = INSIDE
    top_right                    = '50.0 43.0 0.0'
    bottom_left                  = '42.0 33.0 0.0'
    type                         = SubdomainBoundingBox
  [../]
[]
#=======================================================
#:Variables
[Variables]
 [./eta1] # Liquid
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eta1
   initial_from_file_timestep = LATEST
 [../]
 [./eta2] # Beta
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eta2
   initial_from_file_timestep = LATEST
 [../]

 [./c]
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = c
   initial_from_file_timestep = LATEST
 [../]
 [./w]
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = w
   initial_from_file_timestep = LATEST
 [../]

 [./La_eta]
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = La_eta
   initial_from_file_timestep = LATEST
 [../]

 [./q1]
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eq1
   initial_from_file_timestep = LATEST
 [../]
 [./q2]
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eq2
   initial_from_file_timestep = LATEST
 [../]

 [./LaQ]
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = LaQ
   initial_from_file_timestep = LATEST
 [../]
[]


#=======================================================
#:ICs
[ICs]
  [./ConstantIC_0_eta1]
    block                        =    0
    type                         = ConstantIC
    value                        = 0.99
    variable                     = eta1
  [../]
  [./ConstantIC_0_eta2]
    block                        =    0
    type                         = ConstantIC
    value                        = 0.01
    variable                     = eta2
  [../]
  [./ConstantIC_0_c]
    block                        =    0
    type                         = ConstantIC
    value                        = 0.3
    variable                     = c
  [../]

  #=============================
  [./eta1_IC_1]
    block                        =    1
    3D_spheres             = 1
    enable                 = 1
    invalue                = 0.99
    outvalue               = 0.99
    radius                 = 5
    type                   = SmoothCircleIC
    variable               = eta1
    x1                     = 20.0
    y1                     = 13.0
    z1                     = 0
  [../]
  [./eta2_IC_1]
    block                        =    1
    3D_spheres             = 1
    enable                 = 1
    invalue                = 0.01
    outvalue               = 0.01
    radius                 = 5
    type                   = SmoothCircleIC
    variable               = eta2
    x1                     = 20.0
    y1                     = 13.0
    z1                     = 0
  [../]
  [./ConstantIC_1_c]
    block                        =    1
    type                         = ConstantIC
    value                        = 0.3
    variable                     = c
  [../]

  #=============================
  [./eta1_IC_2]
    block                        =    2
    3D_spheres             = 1
    enable                 = 1
    invalue                = 0.99
    outvalue               = 0.99
    radius                 = 5
    type                   = SmoothCircleIC
    variable               = eta1
    x1                     = 28.0
    y1                     = 45.0
    z1                     = 0
  [../]
  [./eta2_IC_2]
    block                        =    2
    3D_spheres             = 1
    enable                 = 1
    invalue                = 0.01
    outvalue               = 0.01
    radius                 = 5
    type                   = SmoothCircleIC
    variable               = eta2
    x1                     = 28.0
    y1                     = 45.0
    z1                     = 0
  [../]
  [./ConstantIC_2_c]
    block                        =    2
    type                         = ConstantIC
    value                        = 0.3
    variable                     = c
  [../]

  #=============================
  [./eta1_IC_3]
    block                        =    3
    3D_spheres             = 1
    enable                 = 1
    invalue                = 0.99
    outvalue               = 0.99
    radius                 = 3
    type                   = SmoothCircleIC
    variable               = eta1
    x1                     = 47.0
    y1                     = 38.0
    z1                     = 0
  [../]
  [./eta2_IC_3]
    block                        =    3
    3D_spheres             = 1
    enable                 = 1
    invalue                = 0.01
    outvalue               = 0.01
    radius                 = 3
    type                   = SmoothCircleIC
    variable               = eta2
    x1                     = 47.0
    y1                     = 38.0
    z1                     = 0
  [../]
  [./ConstantIC_3_c]
    block                        =   3
    type                         = ConstantIC
    value                        = 0.3
    variable                     = c
  [../]
[]

#=======================================================
#:BCs
[BCs]
  [./Periodic]
    [./c_bcs]
      auto_direction = 'x y'
    [../]
  [../]
[]

#=======================================================
#:AuxVariables
[AuxVariables]
  [./Te]
  [../]

  [./Feta1]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Feta2]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./FtotAux]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./FEta1a]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./FEta2a]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./AuxMob]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./CNoise]
    order = FIRST
    family = LAGRANGE
  [../]
  [./eta1Noise]
    order = FIRST
    family = LAGRANGE
  [../]
  [./eta2Noise]
    order = FIRST
    family = LAGRANGE
  [../]
[]

#=======================================================
#:AuxKernels
[AuxKernels]
  [./FunctionAuxTe]
    function                     = '1800.0'
    type                         = FunctionAux
    variable                     = Te
  [../]

  [./TotalFreeEnergy1]
    f_name                       = FLq
    type                         = TotalFreeEnergy
    variable                     = Feta1
  [../]

  [./TotalFreeEnergy2]
    f_name                       = Fbeta
    type                         = TotalFreeEnergy
    variable                     = Feta2
  [../]

  [./TotalFreeEnergy0]
    f_name                       = F
    type                         = TotalFreeEnergy
    variable                     = FtotAux
  [../]

  [./MaterialRealAuxEta1]
    execute_on                   = LINEAR                      # Set to (nonlinear|linear|timestep_end|timestep_begin|custom) to execute ...
    property                     = FLq                 # The scalar material property name
    type                         = MaterialRealAux
    variable                     = FEta1a                  # The name of the variable that this object applies to
  [../]
  [./MaterialRealAuxEta2]
    execute_on                   = LINEAR                      # Set to (nonlinear|linear|timestep_end|timestep_begin|custom) to execute ...
    property                     = Fbeta                  # The scalar material property name
    type                         = MaterialRealAux
    variable                     = FEta2a                  # The name of the variable that this object applies to
  [../]
  [./MaterialRealAuxMob]
    execute_on                   = LINEAR                      # Set to (nonlinear|linear|timestep_end|timestep_begin|custom) to execute ...
    property                     = M                  # The scalar material property name
    type                         = MaterialRealAux
    variable                     = AuxMob                  # The name of the variable that this object applies to
  [../]
[]


#=======================================================
#:Materials
[Materials]
  [./MagNoiseE]
    type = ParsedMaterial
    f_name = MagNoiseEta
    #args = 'time'
    function='2.0e2'
    #outputs = exodus
  [../]

  [./MagNoiseC]
    type = ParsedMaterial
    f_name = MagNoiseC
    #args = 'time'
    #constant_names = 'A B'
    #constant_expressions = '0.001 0.006908'
    function='1.0e-13'
    #outputs = exodus
  [../]
  # Direction
  [./HQ]
    type = DerivativeParsedMaterial
    f_name = HQ
    function = '(0.25e-15)*Te'
    args = 'Te'
    derivative_order             = 1
    outputs = exodus
  [../]

  [./PQ]
    type = DerivativeParsedMaterial
    f_name = PQ
    function = '(1.0-eta1)^2'
    args = 'eta1'
    derivative_order             = 1
  [../]

  [./phase_free_energy_hq1]
    type = DerivativeParsedMaterial
    f_name = hq1
    function = 'q1^2'
    args = 'q1'
  derivative_order             = 1
  [../]

  [./phase_free_energy_hq2]
    type = DerivativeParsedMaterial
    f_name = hq2
    function = 'q2^2'
    args = 'q2'
  derivative_order             = 1
  [../]

  [./LQ]
    type = DerivativeParsedMaterial
    f_name = LQ
    constant_names = 'LQMin LQMax'
    constant_expressions = '1e-4 0.64e2'
    #constant_names = 'L00 L11 L10 L01'
    #constant_expressions = '0.64e3 0.64e1 1e-2 0.64e3'
    #material_property_names = 'h1:=h1(eta1)  hp1:=hp1(phi1)'
    function = 'LQMax+(LQMin-LQMax)*(1.0-(eta1^3)*(10.0-15.0*eta1+6.0*(eta1^2)))'
    #function = '(L11+L00-L10-L01)*h1*hp1+hp1*(L10-L00)+h1*(L01-L00)+L00'
    args = 'eta1'
    derivative_order             = 1
    outputs = exodus
  [../]
  # Shared Constants
  [./consts]
    type = GenericConstantMaterial
    prop_names  = 'Leta  kappaEta kappa_c kappaQ'
    prop_values = '0.64e15 10.0e-16  10.0e-18  10.0e-18'
        #prop_values = '0.64e15 7.91e-9  0.0'
  [../]

  #=====================================================================
  # AllenCahn Stuff
  # Swtiching and well functions
  [./switching1]
    type = SwitchingFunctionMaterial
    function_name = h1
    eta = eta1
    h_order = HIGH
    outputs = none
  [../]
  [./switching2]
    type = SwitchingFunctionMaterial
    function_name = h2
    eta = eta2
    h_order = HIGH
    outputs = none
  [../]


  [./CrossTermBarrierFunctionMaterial]
    W_ij                         = '0 2.5e-15
                                    2.5e-15  0'
    etas                         = 'eta1 eta2'
    function_name                = getas
    g_order                      = SIMPLE
    type                         = CrossTermBarrierFunctionMaterial
    outputs = none
  [../]

  [./free_energy]
    type = DerivativeMultiPhaseMaterial
    f_name = F
    fi_names = 'FLq  Fbeta'
    hi_names = 'h1  h2'
    etas     = 'eta1 eta2'
    args = 'Te c'
    g=getas
    W = 1.0
    derivative_order             = 2
    outputs = none
  [../]

  [./hL1]
    type = DerivativeParsedMaterial
    f_name = hL1
    function = 'eta1'
    args = 'eta1'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL2]
    type = DerivativeParsedMaterial
    f_name = hL2
    function = 'eta2'
    args = 'eta2'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]

  #----------------------------------------------------
  # Energies
  [./f_liquid]
    type = DerivativeParsedMaterial
    f_name = FLq
    args = 'c Te'
    derivative_order             = 2
    constant_names = 'p00 p01 p02 p03
                       p04 p05 p10 p11
                       p12 p13 p14 p20
                       p21 p22 p23 p30
                       p31 p32 p40 p41
                       p50 Magni'
    constant_expressions = '8.7780161556e+03 -1.2269392908e+01 -5.3974669165e-02
                            2.3795971676e-05 -7.0373969388e-09 8.5029289714e-13
                            -1.1908549357e+05 9.2784159449e+00 2.9882766850e-03
                            -1.9724115037e-06 6.1486768166e-10 1.6527400000e+05
                            -2.3628252466e+01 -3.3241082786e-15 8.1998878285e-19
                            -1.4167800000e+05 6.0696870799e+01 2.9710053783e-16
                            9.4452000000e+04 -5.0052435399e+01 1.7972457986e-09
                            1e-16'
    function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                 (p04*(Te^4))+(p05*(Te^5))+
                 c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (c^4)*(p40+p41*Te)+(c^5)*p50)'
    outputs = none
  [../]

  [./Fbeta]
    type = DerivativeParsedMaterial
    f_name = Fbeta
    args = 'c Te'
    derivative_order             = 2
    constant_names = 'p00 p01 p02 p03
                       p04 p05 p10 p11
                       p12 p13 p14 p20
                       p21 p22 p23 p30
                       p31 p32 p40 p41
                       p50 Magni'
    constant_expressions = '4.0403477073e+03 -1.5383307606e+01 -5.0132828567e-02
                            2.2316045634e-05 -6.3380061813e-09 7.4811009307e-13
                            -1.3873501737e+05 4.5270933220e+01 -1.6255753482e-02
                            -7.8166312425e-08 5.7006371612e-10 5.4012870345e+04
                            1.6555043548e+01 2.2241561125e-02 -1.7709187604e-06
                            2.4341844426e+05 -1.3424422238e+02 -5.6909906122e-03
                            -2.0397528441e+05 7.8394064019e+01 4.7887120626e+04
                            10.0e-17'
    function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                 (p04*(Te^4))+(p05*(Te^5))+
                 c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (c^4)*(p40+p41*Te)+(c^5)*p50)'
    outputs = none
  [../]

  # =====================
  # Mobility
  #==================================================================
  # Cahn hilliard
  # Mobilities
  [./MLq]
    type = ParsedMaterial
    f_name = MLq
    args = 'c Te'
    constant_names = 'Mag Rg D0 Q1'
    constant_expressions = '1e12 8.31451e-3 4.29e-7 36.3'
   function ='Mag*D0*exp(-Q1/(Rg*Te))'
   outputs = none
  [../]

  [./Mbeta]
    type = ParsedMaterial
    f_name = Mbeta
    args = 'c Te'
    constant_names = 'Mag kb Da0 Qa1 Qa2 Db0 Qb1 Qb2'
    constant_expressions = '1e12 8.6173303e-5 3.53e-4 3.4 1335.0 1.94e-4 3.36 1266.0 '
   function ='Mag*(c*Da0*exp(-Qa1/(kb*Te))*exp(Qa2/(kb*Te^2))+
               (1-c)*Db0*exp(-Qb1/(kb*Te))*exp(Qb2/(kb*Te^2)))'
   outputs = none
  [../]
  [./Mob]
    type = ParsedMaterial
    f_name = M
    args = 'c eta1 eta2 Te'
    material_property_names = 'MLq:=MLq(c,Te)
                               Malpha:=Malpha(c,Te)
                               Mbeta:=Mbeta(c,Te)
                               Malpha2:=Malpha2(c,Te)
                               Mgamma:=Mgamma(c,Te)
                               d2F:=D[F(Te,c),c,c]'
  function ='(sqrt(eta1^2)*MLq+sqrt(eta2^2)*Mbeta)/d2F'
   outputs = none
  [../]
[]

[Kernels]

  #==========================================================
  # Concentration
  # Cs
  [./w_dot]
    variable = w
    v = c
    type = CoupledTimeDerivative
  [../]
  [./coupled_res]
    args = 'eta1 eta2 Te c'
    variable = w
    type = SplitCHWRes
    mob_name = M
  [../]
  [./coupled_parsed]
    args = 'eta1 eta2 Te'
    variable = c
    type = SplitCHParsed
    f_name = F
    kappa_name = kappa_c
    w = w
  [../]
  [./ConservedLangevinNoise]
    amplitude                    = 1.0
    multiplier                   = MagNoiseC
    noise                        = ConservedNormalNoise1
    seed                         = 201
    type                         = ConservedLangevinNoise
    variable                     = c
    save_in                      = CNoise
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta1
  [./eta1_dot]
    type                         = TimeDerivative
    variable                     = eta1
  [../]
  [./ACBulk1]
    type = AllenCahn
    variable = eta1
    args = 'eta2 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface1]
    type = ACMultiInterface
    variable = eta1
    etas = 'eta1 eta2'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta1]
    h_name                       = hL1
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta1
  [../]
  [./PusztaiBulkEta1]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Leta'
    P_name                       = 'PQ'
    type                         = PusztaiACBulk
    variable                     = eta1
    variable_H                   = 1
    variable_L                   = 1
  [../]
  [./LangevinNoise_eta1]
    amplitude                    = 1.0
    multiplier                   = MagNoiseEta
    seed                         = 1001
    type                         = LangevinNoise
    variable                     = eta1
    save_in                      = eta1Noise
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta2
  [./eta2_dot]
    type                         = TimeDerivative
    variable                     = eta2
  [../]
  [./ACBulk2]
    type = AllenCahn
    variable = eta2
    args = 'eta1 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface2]
    type = ACMultiInterface
    variable = eta2
    etas = 'eta1 eta2'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta2]
    h_name                       = hL2
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta2
  [../]
  [./PusztaiBulkEta2]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta1'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Leta'
    P_name                       = 'PQ'
    type                         = PusztaiACBulk
    variable                     = eta2
    variable_H                   = 1
    variable_L                   = 1
  [../]
  [./LangevinNoise_eta2]
    amplitude                    = 1.0
    multiplier                   = MagNoiseEta
    seed                         = 2001
    type                         = LangevinNoise
    variable                     = eta2
    save_in                      = eta2Noise
  [../]

  #--------------------------------------------------------------------------
  # Langrange Eta
  [./SwitchingFunctionConstraintLagrange]
    enable                       = 1
    epsilon                      = 1e-09
    etas                         = 'eta1 eta2'
    #h_names                      = 'h1 h2 h3 h4 h5'
    h_names                      = 'hL1 hL2'
    type                         = SwitchingFunctionConstraintLagrange
    variable                     = La_eta
  [../]

  # -----------------------------------------------------------
  # Q1
    [./q1_dot]
      type                         = TimeDerivative
      variable                     = q1
    [../]

    [./PusztaiInterface1]
      Correction_y0                      = 1.0
      Correction_Z                      = 1.0
      Args                         = 'eta1 eta2  c Te'
      Qs                           =  'q2'
      H_name                       = 'HQ'
      L_name                       = 'LQ '
      P_name                       = 'PQ'
      type                         = PusztaiQsBulk
      variable                     = q1
      variable_H                   = 1
      variable_L                   = 1
    [../]

    [./SwitchingFunctionConstraintq1]
      h_name                       = hq1
      implicit                     = 1
      lambda                       = LaQ
      type                         = SwitchingFunctionConstraintEta
      variable                     = q1
    [../]

    [./ACInterfaceQ1]
      args                         =  'eta1 eta2 Te c q2'
      kappa_name                   = 'kappaQ'
      mob_name                     = 'LQ'
      type                         = ACInterface
      variable                     = 'q1'
      variable_L                   = 1
    [../]

    # -----------------------------------------------------------
    # Q2
    [./q2_dot]
      type                         = TimeDerivative
      variable                     = q2
    [../]

    [./SwitchingFunctionConstraintq2]
      h_name                       = hq2
      implicit                     = 1
      lambda                       = LaQ
      type                         = SwitchingFunctionConstraintEta
      variable                     = q2
    [../]

    [./PusztaiInterface2]
      Correction_y0                     = 1.0
      Correction_Z                      = 1.0
      Args                         = 'eta1 eta2  c Te'
      Qs                           =  'q1'
      H_name                       = 'HQ'
      implicit                     = 1
      L_name                     = 'LQ '
      P_name                       = 'PQ'
      type                         = PusztaiQsBulk
      variable                     = q2
      variable_H                   = 1

      variable_L                   = 1
    [../]
    [./ACInterfaceQ2]
      args                         =  'eta1 eta2 Te c q1'
      kappa_name                   = 'kappaQ'
      mob_name                     = 'LQ'
      type                         = ACInterface
      variable                     = 'q2'
      variable_L                   = 1
    [../]

    #--------------------------------------------------------------------------
    # Langrange Q
    [./SwitchingFunctionConstraintLagrangeQ]
      enable                       = 1
      epsilon                      = 1e-09
      etas                         = 'q1 q2'
      h_names                      = 'hq1 hq2'
      implicit                     = 1
      type                         = SwitchingFunctionConstraintLagrange
      variable                     = LaQ
    [../]

[]

##===============================================================
##: Postprocessors
#[Postprocessors]
#  [./ave_stress_bottom]
#    type = SideAverageValue
#    variable = stress_zz
#    boundary = bottom
#  [../]
#  [./ave_strain_bottom]
#    type = SideAverageValue
#    variable = total_strain_zz
#    boundary = bottom
#  [../]
#[]

##===============================================================
##: Preconditioning
[Preconditioning]
  [./coupled]
    type = SMP
    full = true
  [../]
[]

##===============================================================
##: Executioner
[Executioner]
  type = Transient
  solve_type = 'NEWTON'  # OR PJFNK
  petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type'
  petsc_options_value = 'asm      ilu          nonzero'
  l_max_its = 30
  nl_max_its = 20
  nl_abs_tol = 1e-8
  end_time = 2.2
   dtmax   = 1.0e-4
   start_time                 = 0.0
 [./TimeStepper]
    # Turn on time stepping
    type = IterationAdaptiveDT
    dt = 1.0e-5
    cutback_factor = 0.8
    growth_factor = 1.5
    optimal_iterations = 12
  [../]
[]

##===============================================================
##: Outputs
[Outputs]
  interval                       = 10
  exodus = true
  console = false
  print_perf_log = true
  output_initial = true
  #print_linear_residuals         = 0
[]
