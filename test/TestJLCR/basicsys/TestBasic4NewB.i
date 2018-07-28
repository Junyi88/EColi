 #=======================================================
 #:Global Params
 [GlobalParams]
   outputs = exodus
   penalty = 1e3
   displacements = 'u_x u_y u_z'
 []

 #=======================================================
 #:Mesh

 [Mesh] #Mesh: Generate Mesh
   type = GeneratedMesh
   dim = 3
   elem_type = HEX8
   nx = 1
   ny = 1
   nz = 1
   xmin = 0
   xmax = 1.0
   ymin = 0
   ymax = 1.0
   zmin = 0
   zmax = 1.0
 []

#=====================================================
#:Variables
[Variables]
 [./u_x]
   order = FIRST
   family = LAGRANGE
 [../]
 [./u_y]
   order = FIRST
   family = LAGRANGE
 [../]
 [./u_z]
   order = FIRST
   family = LAGRANGE
 [../]

 [./v_x]
   order = FIRST
   family = LAGRANGE
 [../]
 [./v_y]
   order = FIRST
   family = LAGRANGE
 [../]
 [./v_z]
   order = FIRST
   family = LAGRANGE
 [../]

 [./a_x]
   order = FIRST
   family = LAGRANGE
 [../]
 [./a_y]
   order = FIRST
   family = LAGRANGE
 [../]
 [./a_z]
   order = FIRST
   family = LAGRANGE
 [../]

[]

#=======================================================
#:BCs
[BCs]
  [./front]
    type = PresetBC
    variable = u_z
    boundary = front
    value = 0.0
  [../]
  [./left]
    type = PresetBC
    variable = u_x
    boundary = left
    value = 0.0
  [../]

  #[./bottom]
  #  type = PresetBC
  #  variable = u_y
  #  boundary = bottom
  #  value = 0.0
  #[../]

  [./top]
    boundary                     = top
    enable                       = 1
    function                     = '0.1*t'
    type                         = FunctionPresetBC
    variable                     = u_y
  [../]

  [./bottom]
    boundary                     = bottom
    enable                       = 1
    function                     = '0.1*t'
    type                         = FunctionPresetBC
    variable                     = u_y
  [../]


  [./topy]
    boundary                     = top
    enable                       = 1
    function                     = '0.0'
    type                         = FunctionPresetBC
    variable                     = a_y
  [../]

  [./bottomy]
    boundary                     = bottom
    enable                       = 1
    function                     = '0.0'
    type                         = FunctionPresetBC
    variable                     = a_y
  [../]
  #[./Stress_xx]
  #  type = PresetBC
  #  variable = Stress_xx
  #  boundary = 'top bottom left right front back'
  #  value = 0.0
  #[../]
  #
  #[./Stress_zz]
  #  type = PresetBC
  #  variable = Stress_zz
  #  boundary = 'top bottom left right front back'
  #  value = 0.0
  #[../]
[]

[ICs]
  [./ConstantIC_ax]
  type                         = ConstantIC
  value                        = 0.0
  variable                     = a_x
  [../]
  [./ConstantIC_ay]
  type                         = ConstantIC
  value                        = 0.0
  variable                     = a_y
  [../]
  [./ConstantIC_az]
  type                         = ConstantIC
  value                        = 0.0
  variable                     = a_z
  [../]

  [./ConstantIC_vx]
  type                         = ConstantIC
  value                        = 0.0
  variable                     = v_x
  [../]
  [./ConstantIC_vy]
  type                         = ConstantIC
  value                        = 0.1
  variable                     = v_y
  [../]
  [./ConstantIC_vz]
  type                         = ConstantIC
  value                        = 0.0
  variable                     = v_z
  [../]
[]

#=======================================================
#:AuxVariables
[AuxVariables]
  [./F_xx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./F_xy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./F_xz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./F_yx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./F_yy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./F_yz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./F_zx]
    family = MONOMIAL
    order = CONSTANT
  [../]
   [./F_zy]
    family = MONOMIAL
    order = CONSTANT
  [../]
 [./F_zz]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./s_xx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./s_xy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./s_xz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./s_yx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./s_yy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./s_yz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./s_zx]
    family = MONOMIAL
    order = CONSTANT
  [../]
   [./s_zy]
    family = MONOMIAL
    order = CONSTANT
  [../]
 [./s_zz]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./d_xx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./d_xy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./d_xz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./d_yx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./d_yy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./d_yz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./d_zx]
    family = MONOMIAL
    order = CONSTANT
  [../]
   [./d_zy]
    family = MONOMIAL
    order = CONSTANT
  [../]
 [./d_zz]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./L_xx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./L_xy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./L_xz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./L_yx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./L_yy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./L_yz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./L_zx]
    family = MONOMIAL
    order = CONSTANT
  [../]
   [./L_zy]
    family = MONOMIAL
    order = CONSTANT
  [../]
 [./L_zz]
    family = MONOMIAL
    order = CONSTANT
  [../]


  [./Stress_xx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Stress_xy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Stress_xz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Stress_yx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Stress_yy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Stress_yz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Stress_zx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Stress_zy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Stress_zz]
    family = MONOMIAL
    order = CONSTANT
  [../]
[]

#=======================================================
#:AuxKernels
[AuxKernels]
  [./Stress_xx]
    type = RankTwoAux
    variable = Stress_xx
    rank_two_tensor = Stress
    index_i = 0
    index_j = 0
  [../]
  [./Stress_xy]
    type = RankTwoAux
    variable = Stress_xy
    rank_two_tensor = Stress
    index_i = 0
    index_j = 1
  [../]
  [./Stress_xz]
    type = RankTwoAux
    variable = Stress_xz
    rank_two_tensor = Stress
    index_i = 0
    index_j = 2
  [../]

  [./Stress_yx]
    type = RankTwoAux
    variable = Stress_yx
    rank_two_tensor = Stress
    index_i = 1
    index_j = 0
  [../]
  [./Stress_yy]
    type = RankTwoAux
    variable = Stress_yy
    rank_two_tensor = Stress
    index_i = 1
    index_j = 1
  [../]
  [./Stress_yz]
    type = RankTwoAux
    variable = Stress_yz
    rank_two_tensor = Stress
    index_i = 1
    index_j = 2
  [../]

  [./Stress_zx]
    type = RankTwoAux
    variable = Stress_zx
    rank_two_tensor = Stress
    index_i = 2
    index_j = 0
  [../]
  [./Stress_zy]
    type = RankTwoAux
    variable = Stress_zy
    rank_two_tensor = Stress
    index_i = 2
    index_j = 1
  [../]
  [./Stress_zz]
    type = RankTwoAux
    variable = Stress_zz
    rank_two_tensor = Stress
    index_i = 2
    index_j = 2
  [../]

  #=====
  [./F_xx]
    type = RankTwoAux
    variable = F_xx
    rank_two_tensor = Deformation_Gradient
    index_i = 0
    index_j = 0
  [../]
  [./F_xy]
    type = RankTwoAux
    variable = F_xy
    rank_two_tensor = Deformation_Gradient
    index_i = 0
    index_j = 1
  [../]
  [./F_xz]
    type = RankTwoAux
    variable = F_xz
    rank_two_tensor = Deformation_Gradient
    index_i = 0
    index_j = 2
  [../]

  [./F_yx]
    type = RankTwoAux
    variable = F_yx
    rank_two_tensor = Deformation_Gradient
    index_i = 1
    index_j = 0
  [../]
  [./F_yy]
    type = RankTwoAux
    variable = F_yy
    rank_two_tensor = Deformation_Gradient
    index_i = 1
    index_j = 1
  [../]
  [./F_yz]
    type = RankTwoAux
    variable = F_yz
    rank_two_tensor = Deformation_Gradient
    index_i = 1
    index_j = 2
  [../]

  [./F_zx]
    type = RankTwoAux
    variable = F_zx
    rank_two_tensor = Deformation_Gradient
    index_i = 2
    index_j = 0
  [../]
  [./F_zy]
    type = RankTwoAux
    variable = F_zy
    rank_two_tensor = Deformation_Gradient
    index_i = 2
    index_j = 1
  [../]
  [./F_zz]
    type = RankTwoAux
    variable = F_zz
    rank_two_tensor = Deformation_Gradient
    index_i = 2
    index_j = 2
  [../]

  [./s_xx]
    type = RankTwoAux
    variable = s_xx
    rank_two_tensor = Stress_Rate
    index_i = 0
    index_j = 0
  [../]
  [./s_xy]
    type = RankTwoAux
    variable = s_xy
    rank_two_tensor = Stress_Rate
    index_i = 0
    index_j = 1
  [../]
  [./s_xz]
    type = RankTwoAux
    variable = s_xz
    rank_two_tensor = Stress_Rate
    index_i = 0
    index_j = 2
  [../]

  [./s_yx]
    type = RankTwoAux
    variable = s_yx
    rank_two_tensor = Stress_Rate
    index_i = 1
    index_j = 0
  [../]
  [./s_yy]
    type = RankTwoAux
    variable = s_yy
    rank_two_tensor = Stress_Rate
    index_i = 1
    index_j = 1
  [../]
  [./s_yz]
    type = RankTwoAux
    variable = s_yz
    rank_two_tensor = Stress_Rate
    index_i = 1
    index_j = 2
  [../]

  [./s_zx]
    type = RankTwoAux
    variable = s_zx
    rank_two_tensor = Stress_Rate
    index_i = 2
    index_j = 0
  [../]
  [./s_zy]
    type = RankTwoAux
    variable = s_zy
    rank_two_tensor = Stress_Rate
    index_i = 2
    index_j = 1
  [../]
  [./s_zz]
    type = RankTwoAux
    variable = s_zz
    rank_two_tensor = Stress_Rate
    index_i = 2
    index_j = 2
  [../]

  [./d_xx]
    type = RankTwoAux
    variable = d_xx
    rank_two_tensor = DeformV_Gradient
    index_i = 0
    index_j = 0
  [../]
  [./d_xy]
    type = RankTwoAux
    variable = d_xy
    rank_two_tensor = DeformV_Gradient
    index_i = 0
    index_j = 1
  [../]
  [./d_xz]
    type = RankTwoAux
    variable = d_xz
    rank_two_tensor = DeformV_Gradient
    index_i = 0
    index_j = 2
  [../]

  [./d_yx]
    type = RankTwoAux
    variable = d_yx
    rank_two_tensor = DeformV_Gradient
    index_i = 1
    index_j = 0
  [../]
  [./d_yy]
    type = RankTwoAux
    variable = d_yy
    rank_two_tensor = DeformV_Gradient
    index_i = 1
    index_j = 1
  [../]
  [./d_yz]
    type = RankTwoAux
    variable = d_yz
    rank_two_tensor = DeformV_Gradient
    index_i = 1
    index_j = 2
  [../]

  [./d_zx]
    type = RankTwoAux
    variable = d_zx
    rank_two_tensor = DeformV_Gradient
    index_i = 2
    index_j = 0
  [../]
  [./d_zy]
    type = RankTwoAux
    variable = d_zy
    rank_two_tensor = DeformV_Gradient
    index_i = 2
    index_j = 1
  [../]
  [./d_zz]
    type = RankTwoAux
    variable = d_zz
    rank_two_tensor = DeformV_Gradient
    index_i = 2
    index_j = 2
  [../]

  [./L_xx]
    type = RankTwoAux
    variable = L_xx
    rank_two_tensor = Velocity_Gradient
    index_i = 0
    index_j = 0
  [../]
  [./L_xy]
    type = RankTwoAux
    variable = L_xy
    rank_two_tensor = Velocity_Gradient
    index_i = 0
    index_j = 1
  [../]
  [./L_xz]
    type = RankTwoAux
    variable = L_xz
    rank_two_tensor = Velocity_Gradient
    index_i = 0
    index_j = 2
  [../]

  [./L_yx]
    type = RankTwoAux
    variable = L_yx
    rank_two_tensor = Velocity_Gradient
    index_i = 1
    index_j = 0
  [../]
  [./L_yy]
    type = RankTwoAux
    variable = L_yy
    rank_two_tensor = Velocity_Gradient
    index_i = 1
    index_j = 1
  [../]
  [./L_yz]
    type = RankTwoAux
    variable = L_yz
    rank_two_tensor = Velocity_Gradient
    index_i = 1
    index_j = 2
  [../]

  [./L_zx]
    type = RankTwoAux
    variable = L_zx
    rank_two_tensor = Velocity_Gradient
    index_i = 2
    index_j = 0
  [../]
  [./L_zy]
    type = RankTwoAux
    variable = L_zy
    rank_two_tensor = Velocity_Gradient
    index_i = 2
    index_j = 1
  [../]
  [./L_zz]
    type = RankTwoAux
    variable = L_zz
    rank_two_tensor = Velocity_Gradient
    index_i = 2
    index_j = 2
  [../]
[]



#=======================================================
#:Materials
[Materials]
 [./DeformatinGradients_ux]
  type = JLCR_CalcDefVelGradient
  outputs = exodus
  displacements = 'u_x u_y u_z'
  velocities = 'v_x v_y v_z'
 [../]

  [./elasticity_tensor]
    #type = ComputeElasticityTensor
    #fill_method                  = symmetric9
    #C_ijkl                       = '175.0e1 88.7e1 62.3e1 175.0e1 62.3e1 220.0e1 62.2e1 62.2e1 43.15e1'
    type = ComputeIsotropicElasticityTensor
    youngs_modulus = 70.0
    poissons_ratio = 0.3
  [../]

  [./rot_elasticity_tensor]
    type = JLCR_CalcRotatedElasticityTensor
    outputs = exodus
#    velocities = 'v_x v_y v_z'
  [../]

  [./StressRate]
    type = JLCR_CalcStressRate
    outputs = exodus
  [../]

  [./Accelerations]
    type = ZTest_NewmarkBetaAcceleration
    outputs = exodus
    displacements = 'u_x u_y u_z'
    velocities = 'v_x v_y v_z'
    Beta = 0.25
  [../]

  [./ZTest_Stress1]
    type = ZTest_Stress
    outputs = exodus
  [../]
[]

#====================================
#:Kernels
[Kernels]
    #[./ZTest_StressDivBasic_x]
    #  type = ZTest_StressDivBasic
    #  variable = u_x
    #  Other_Disp= 'u_y u_z'
    #  component = 0
    #  Gamma = 0.5
    #  Beta = 0.25
    #[../]
    #
    #[./ZTest_StressDivBasic_y]
    #  type = ZTest_StressDivBasic
    #  variable = u_y
    #  Other_Disp= 'u_x u_z'
    #  component = 1
    #  Gamma = 0.5
    #  Beta = 0.25
    #[../]
    #
    #[./ZTest_StressDivBasic_z]
    #  type = ZTest_StressDivBasic
    #  variable = u_z
    #  Other_Disp= 'u_x u_y'
    #  component = 2
    #  Gamma = 0.5
    #  Beta = 0.25
    #[../]

    [./ZTest_a_x]
      type = ZTest_AccelerationSplit
      variable = a_x
      Velocity = v_x
      Displacement = 'u_x'
      Beta = 0.25
    [../]
    [./ZTest_a_y]
      type = ZTest_AccelerationSplit
      variable = a_y
      Velocity = v_y
      Displacement = 'u_y'
      Beta = 0.25
    [../]
    [./ZTest_a_z]
      type = ZTest_AccelerationSplit
      variable = a_z
      Velocity = v_z
      Displacement = 'u_z'
      Beta = 0.25
    [../]

    [./ZTest_Velocity_x]
      type = ZTest_VelocitySplit
      variable = v_x
      Acceleration = 'a_x'
      Gamma = 0.5
    [../]
    [./ZTest_Velocity_y]
      type = ZTest_VelocitySplit
      variable = v_y
      Acceleration = 'a_y'
      Gamma = 0.5
    [../]
    [./ZTest_Velocity_z]
      type = ZTest_VelocitySplit
      variable = v_z
      Acceleration = 'a_z'
      Gamma = 0.5
    [../]

      [./Dummy_v_x]
        type = Gen_Dummy
        variable = u_x
      [../]
      [./Dummy_v_y]
        type = Gen_Dummy
        variable = u_y
      [../]
      [./Dummy_v_z]
        type = Gen_Dummy
        variable = u_z
      [../]
[]

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
  solve_type = 'NEWTON' #'NEWTON'  # OR PJFNK
  petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type'
  petsc_options_value = 'asm      ilu          nonzero'
  l_max_its = 40
  nl_max_its = 30
  nl_abs_tol = 1e-12
  end_time = 0.1
   dtmax   = 1.0e-2
  dtmin = 1.0e-4
   start_time                 = 0.0
 [./TimeStepper]
    # Turn on time stepping
    type = IterationAdaptiveDT
    dt = 1.0e-2
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
  print_linear_residuals         = 1
[]
