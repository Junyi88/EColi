#=======================================================
#:Global Params
[GlobalParams]
  outputs = exodus
  penalty = 1e3
[]

#=======================================================
#:Mesh
[Mesh] #Mesh: Generate Mesh
  type = GeneratedMesh
  dim = 2
  elem_type = QUAD4
  nx = 50
  ny = 50
  nz = 0
  xmin = 0
  xmax = 5.0e1
  ymin = 0
  ymax = 5.0e1
  zmin = 0
  zmax = 0
[]

#=======================================================
#:Variables
[Variables]
 [./eta1] # Liquid
   order = FIRST
   family = LAGRANGE
 [../]
 [./eta51] # Gamma
   order = FIRST
   family = LAGRANGE
 [../]

 [./c]
   order = FIRST
   family = LAGRANGE
 [../]
 [./w]
   order = FIRST
   family = LAGRANGE
 [../]

 [./La_eta]
   order = FIRST
   family = LAGRANGE
 [../]
[]


#=======================================================
#:ICs
[ICs]

  [./eta1_IC]
    3D_spheres             = 0
    enable                 = 1
    invalue                = 0.01
    outvalue               = 0.99
    radius                 = 8
    type                   = SmoothCircleIC
    variable               = eta1
    x1                     = 25.0
    y1                     = 25.0
    z1                     = 0
  [../]

  [./eta51_IC]
    3D_spheres             = 0
    enable                 = 1
    invalue                = 0.99
    outvalue               = 0.01
    radius                 = 8
    type                   = SmoothCircleIC
    variable               = eta51
    x1                     = 25.0
    y1                     = 25.0
    z1                     = 0
  [../]

  [./c_IC]
    3D_spheres             = 0
    enable                 = 1
    invalue                = 0.54
    outvalue               = 0.56
    radius                 = 8
    type                   = SmoothCircleIC
    variable               = c
    x1                     = 25.0
    y1                     = 25.0
    z1                     = 0
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
  [./FtotV]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./Feta1Raw]
    family = MONOMIAL
    order = CONSTANT
  [../]

[]

#=======================================================
#:AuxKernels
[AuxKernels]
  [./FunctionAuxTe]
    function                     = '1700.0'
    type                         = FunctionAux
    variable                     = Te
  [../]

  [./TotalFreeEnergy1]
    f_name                       = FLq
    type                         = TotalFreeEnergy
    variable                     = Feta1
  [../]

  [./TotalFreeEnergy2]
    f_name                       = Fgamma
    type                         = TotalFreeEnergy
    variable                     = Feta2
  [../]

  [./TotalFreeEnergy0]
    f_name                       = Ftot
    type                         = TotalFreeEnergy
    variable                     = FtotV
  [../]

  [./MaterialRealAux]
    enable                       = 1                           # Set the enabled status of the MooseObject. ...
                                                               # Group: Advanced
    execute_on                   = LINEAR                      # Set to (nonlinear|linear|timestep_end|timestep_begin|custom) to execute ...
                                                               # only at that moment
    factor                       = 1                           # The factor by which to multiply your material property for visualization
    offset                       = 0                           # The offset to add to your material property for visualization
    property                     = FLq                  # The scalar material property name
    type                         = MaterialRealAux
    variable                     = Feta1Raw                  # The name of the variable that this object applies to
  [../]
[]


#=======================================================
#:Materials
[Materials]

  #----------------------------------------------------
  #  Noise
  #[./MagNoiseE]
  #  type = ParsedMaterial
  #  f_name = MagNoiseEta
  #  #args = 'time'
  #  function='5.0e1'
  #  #outputs = exodus
  #[../]
  #
  #[./MagNoiseC]
  #  type = ParsedMaterial
  #  f_name = MagNoiseC
  #  #args = 'time'
  #  #constant_names = 'A B'
  #  #constant_expressions = '0.001 0.006908'
  #  function='1.0e-13'
  #  #outputs = exodus
  #[../]

  # Shared Constants
  [./consts]
    type = GenericConstantMaterial
    prop_names  = 'Leta  kappaEta kappa_c'
    prop_values = '0.64e15 10.0e-16  0.0'
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
  [./switching51]
    type = SwitchingFunctionMaterial
    function_name = h51
    eta = eta51
    h_order = HIGH
    outputs = none
  [../]


  [./g_eta1]
    type = BarrierFunctionMaterial
    g_order = SIMPLE
    eta = eta1
    function_name  = g1
    well_only                    = 1
    outputs = none
  [../]
  [./g_eta51]
    type = BarrierFunctionMaterial
    g_order = SIMPLE
    eta = eta51
    function_name  = g51
    well_only                    = 1
    outputs = none
  [../]

  [./CrossTermBarrierFunctionMaterial]
    W_ij                         = '0 2.5e-15
                                    2.5e-15 0'
    etas                         = 'eta1 eta51'
    function_name                = getas
    g_order                      = SIMPLE
    type                         = CrossTermBarrierFunctionMaterial
    outputs = none
  [../]

  [./free_energy]
    type = DerivativeMultiPhaseMaterial
    f_name = F
    fi_names = 'FLq  Fgamma'
    hi_names = 'h1  h51'
    etas     = 'eta1 eta51'
    args = 'Te c'
    g=getas
    W = 1.0
    derivative_order             = 2
    outputs = none
  [../]

  [./DerivativeSumMaterial]
    args                         = 'eta1 eta51 Te c'                 # Arguments of the free energy functions being summed - use vector coupling
    compute                      = 1                           # When false MOOSE will not call compute methods on this material, compute ...
    derivative_order             = 2                           # Maximum order of derivatives taken (2 or 3)
    enable                       = 1                           # Set the enabled status of the MooseObject. ...
                                                               # Group: Advanced
    f_name                       = Ftot                           # Base name of the free energy function (used to name the material properties)
    implicit                     = 1                           # Determines whether this object is calculated using an implicit or explicit ...
    outputs                      = exodus                        # Vector of output names were you would like to restrict the output of ...
    sum_materials                = 'F'                             # Base name of the free energy function (used to name the material properties)
    type                         = DerivativeSumMaterial
  [../]

  [./free_energyP]
    type = DerivativeParsedMaterial
    f_name = FP
    material_property_names = 'g1:=g1(eta1)  g51:=g51(eta51)'
    function = '(g1+g51)*1.0e-11'
    args = 'eta1 eta51'
    outputs = none
    derivative_order             = 1
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
  [./hL51]
    type = DerivativeParsedMaterial
    f_name = hL51
    function = 'eta51'
    args = 'eta51'
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

  [./f_gamma]
    type = DerivativeParsedMaterial
    f_name = Fgamma
    args = 'c Te'
    derivative_order             = 2
    constant_names = 'p00 p01 p02 p03
                       p04 p05 p10 p11
                       p12 p13 p14 p20
                       p21 p22 p23 p30
                       p31 p32 p40 p41
                       p50 Magni'
    constant_expressions = '2.6638132921e+03 -5.9596432918e+00 -5.1919540632e-02
                            2.1787365474e-05 -6.1640114011e-09 7.3786451035e-13
                            -1.2067738847e+05 -1.6973439104e+01 2.2276568302e-03
                            -2.6513855167e-06 4.6705803557e-10 1.3085084300e+05
                            1.4329451979e+02 2.1924007070e-03 1.1798624645e-06
                            -4.0025092112e+05 -1.9871973943e+02 -2.5277310381e-03
                            7.4249390180e+05 7.3850873223e+01 -3.5744112976e+05
                            1e-16'
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

  [./Mgamma]
    type = ParsedMaterial
    f_name = Mgamma
    args = 'c Te'
    constant_names = 'Mag kb Da0 Qa1 Db0 Qb1'
    constant_expressions = '1e12 8.6173303e-5 1.43e-6 2.59 2.11e-2 3.71'
   function ='Mag*(c*Da0*exp(-Qa1/(kb*Te))+(1-c)*Db0*exp(-Qb1/(kb*Te)))'
   outputs = none
  [../]
  [./Mob]
    type = ParsedMaterial
    f_name = M
    args = 'c eta1 eta51 Te'
    material_property_names = 'MLq:=MLq(c,Te)
                               Malpha:=Malpha(c,Te)
                               Mbeta:=Mbeta(c,Te)
                               Malpha2:=Malpha2(c,Te)
                               Mgamma:=Mgamma(c,Te)
                               d2F:=D[F(Te,c),c,c]'
  function ='(sqrt(eta1^2)*MLq+
            sqrt((eta51^2))*Mgamma)/d2F'
   outputs = exodus
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
    args = 'eta1 eta51 Te c'
    variable = w
    type = SplitCHWRes
    mob_name = M
  [../]
  [./coupled_parsed]
    args = 'eta1 eta51 Te'
    variable = c
    type = SplitCHParsed
    f_name = F
    kappa_name = kappa_c
    w = w
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
    args = 'eta51 Te c'
    mob_name = Leta
    f_name = Ftot
  [../]
  [./ACInterface1]
    type = ACMultiInterface
    variable = eta1
    etas = 'eta1 eta51 '
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
  [./ACBulk1P]
    type = AllenCahn
    variable = eta1
    args = 'eta51 Te c'
    mob_name = Leta
    f_name = FP
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta51
  [./eta51_dot]
    type                         = TimeDerivative
    variable                     = eta51
  [../]
  [./ACBulk51]
    type = AllenCahn
    variable = eta51
    args = 'eta1 Te c'
    mob_name = Leta
    f_name = Ftot
  [../]
  [./ACInterface51]
    type = ACMultiInterface
    variable = eta51
    etas = 'eta1 eta51'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta51]
    h_name                       = hL51
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta51
  [../]
  [./ACBulk51P]
    type = AllenCahn
    variable = eta51
    args = 'eta1 Te c'
    mob_name = Leta
    f_name = FP
  [../]

  #--------------------------------------------------------------------------
  # Langrange Eta
  [./SwitchingFunctionConstraintLagrange]
    enable                       = 1
    epsilon                      = 1e-09
    etas                         = 'eta1 eta51'
    #h_names                      = 'h1 h2 h3 h4 h5'
    h_names                      = 'hL1 hL51'
    type                         = SwitchingFunctionConstraintLagrange
    variable                     = La_eta
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
  l_max_its = 40
  nl_max_its = 30
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
  interval                       = 1
  exodus = true
  console = true
  print_perf_log = true
  output_initial = true
  print_linear_residuals         = 0
[]
