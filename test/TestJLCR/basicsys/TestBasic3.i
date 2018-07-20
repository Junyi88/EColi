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

 [./Stress_xx]
   order = FIRST
   family = LAGRANGE
 [../]
 [./Stress_xy]
   order = FIRST
   family = LAGRANGE
 [../]
 [./Stress_xz]
   order = FIRST
   family = LAGRANGE
 [../]
 [./Stress_yx]
   order = FIRST
   family = LAGRANGE
 [../]
 [./Stress_yy]
   order = FIRST
   family = LAGRANGE
 [../]
 [./Stress_yz]
   order = FIRST
   family = LAGRANGE
 [../]
 [./Stress_zx]
   order = FIRST
   family = LAGRANGE
 [../]
 [./Stress_zy]
   order = FIRST
   family = LAGRANGE
 [../]
 [./Stress_zz]
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
  [./bottom]
    type = PresetBC
    variable = u_y
    boundary = bottom
    value = 0.0
  [../]

  [./top]
    boundary                     = top
    enable                       = 1
    function                     = '0.1*t'
    type                         = FunctionPresetBC
    variable                     = u_y
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
[]

#=======================================================
#:AuxKernels
[AuxKernels]
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
    type = ComputeElasticityTensor
    fill_method                  = symmetric9
    C_ijkl                       = '175.0e1 88.7e1 62.3e1 175.0e1 62.3e1 220.0e1 62.2e1 62.2e1 43.15e1'
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
[]

#====================================
#:Kernels
[Kernels]
#  [./Dummy_v_x]
#    type = Gen_Dummy
#    variable = v_x
#  [../]
#  [./Dummy_v_y]
#    type = Gen_Dummy
#    variable = v_y
#  [../]
#  [./Dummy_v_z]
#    type = Gen_Dummy
#    variable = v_z
#  [../]

#------------------------------------------


 

#----------------------------------------
#  [./v_x_self]
#    type = Gen_SelfNegativeFromRate
#    variable = u_x
#    v = v_x
#  [../]
#  [./v_y_self]
#    type = Gen_SelfNegativeFromRate
#    variable = u_y
#    v = v_y
#  [../] 
#  [./v_z_self]
#    type = Gen_SelfNegativeFromRate
#    variable = u_z
#    v = v_z
#  [../]

#  [./u_x_dot]
#    type                         = TimeDerivative
#    variable                     = u_x
#  [../]
#  [./u_y_dot]
#    type                         = TimeDerivative
#    variable                     = u_y
#  [../] 
#  [./u_z_dot]
#    type                         = TimeDerivative
#    variable                     = u_z
#  [../]

# ********
#   [./Dummy_u_x]
#    type = Gen_Dummy
#    variable = u_x
#  [../]
#  [./Dummy_u_y]
#    type = Gen_Dummy
#    variable = u_y
#  [../]
#  [./Dummy_u_z]
#    type = Gen_Dummy
#    variable = u_z
#  [../]

 [./u_x_dot]
    variable = v_x
    v = u_x
    type = CoupledTimeDerivative
  [../]
  [./v_x]
     variable = v_x
     type = Gen_SelfNegative
  [../]

[./u_y_dot]
   variable = v_y
   v = u_y
   type = CoupledTimeDerivative
 [../]
  [./v_y]
     variable = v_y
     type = Gen_SelfNegative
  [../]

 [./u_z_dot]
    variable = v_z
    v = u_z
    type = CoupledTimeDerivative
  [../]
  [./v_z]
     variable = v_z
     type = Gen_SelfNegative
  [../]

# ****************
   [./SR_xx]
     type = JLCR_StressConstitutiveElasticRate
     variable = Stress_xx
     Velocity = 'v_x v_y v_z'
     Component_I = 1
     Component_J = 1
   [../]
   [./SR_xy]
     type = JLCR_StressConstitutiveElasticRate
     variable = Stress_xy
     Velocity = 'v_x v_y v_z'
     Component_I = 1
     Component_J = 2
   [../]
   [./SR_xz]
     type = JLCR_StressConstitutiveElasticRate
     variable = Stress_xz
     Velocity = 'v_x v_y v_z'
     Component_I = 1
     Component_J = 3
   [../]

   [./SR_yx]
     type = JLCR_StressConstitutiveElasticRate
     variable = Stress_yx
     Velocity = 'v_x v_y v_z'
     Component_I = 2
     Component_J = 1
   [../]
   [./SR_yy]
     type = JLCR_StressConstitutiveElasticRate
     variable = Stress_yy
     Velocity = 'v_x v_y v_z'
     Component_I = 2
     Component_J = 2
   [../]
   [./SR_yz]
     type = JLCR_StressConstitutiveElasticRate
     variable = Stress_yz
     Velocity = 'v_x v_y v_z'
     Component_I = 2
     Component_J = 3
   [../]

   [./SR_zx]
     type = JLCR_StressConstitutiveElasticRate
     variable = Stress_zx
     Velocity = 'v_x v_y v_z'
     Component_I = 3
     Component_J = 1
   [../]
   [./SR_zy]
     type = JLCR_StressConstitutiveElasticRate
     variable = Stress_zy
     Velocity = 'v_x v_y v_z'
     Component_I = 3
     Component_J = 2
   [../]
   [./SR_zz]
     type = JLCR_StressConstitutiveElasticRate
     variable = Stress_zz
     Velocity = 'v_x v_y v_z'
     Component_I = 3
     Component_J = 3
   [../]

# ---------------------------------------
  [./sd_xx]
    type = TimeDerivative
    variable = Stress_xx
  [../]
  [./sd_xy]
    type = TimeDerivative
    variable = Stress_xy
  [../]
  [./sd_xz]
    type = TimeDerivative
    variable = Stress_xz
  [../]

  [./sd_yx]
    type = TimeDerivative
    variable = Stress_yx
  [../]
  [./sd_yy]
    type = TimeDerivative
    variable = Stress_yy
  [../]
  [./sd_yz]
    type = TimeDerivative
    variable = Stress_yz
  [../]

  [./sd_zx]
    type = TimeDerivative
    variable = Stress_zx
  [../]
  [./sd_zy]
    type = TimeDerivative
    variable = Stress_zy
  [../]
  [./sd_zz]
    type = TimeDerivative
    variable = Stress_zz
  [../]

#-----------------------------------------------------
  [./StressDev_x]
    type = JLCR_StressDivergence
    variable = u_x
    Stresses = 'Stress_xx Stress_xy Stress_xz'
  [../]
  [./StressDev_y]
    type = JLCR_StressDivergence
    variable = u_y
    Stresses = 'Stress_yx Stress_yy Stress_yz'
  [../]
  [./StressDev_z]
    type = JLCR_StressDivergence
    variable = u_z
    Stresses = 'Stress_zx Stress_zy Stress_zz'
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
  solve_type = 'PJFNK' #'NEWTON'  # OR PJFNK
  petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type'
  petsc_options_value = 'asm      ilu          nonzero'
  l_max_its = 40
  nl_max_its = 30
  nl_abs_tol = 1e-8
  end_time = 2.2
   dtmax   = 1.0e-3
   start_time                 = 0.00778596352
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






































