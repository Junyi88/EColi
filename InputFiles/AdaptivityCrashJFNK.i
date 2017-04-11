#=======================================================
#:Global Params
[GlobalParams]
  outputs = exodus
  penalty = 1e3
  displacements = 'disp_x disp_y disp_z'
  # use_displaced_mesh = false
[]

#=======================================================
#:Mesh
[Mesh] #Mesh: Generate Mesh
  type = GeneratedMesh
  dim = 3
  elem_type = Hex8
  nx = 2
  ny = 2
  nz = 1
  xmin = -10.0e-1
  xmax = 10.0e-1
  ymin = -10.0e-1
  ymax = 10.0e-1
  zmin = 0.0
  zmax =2.5e-1
  #partitioner      = linear
[]

#=======================================================
#:Variables
[Variables]
 [./disp_x]
 [../]

 [./disp_y]
 [../]

 [./disp_z]
 [../]

 [./Te]
 [../]
[]


#=======================================================
#:BCs
[BCs]
  [./FunctionNeumannBC_Laser]
    boundary                     = front
    function                     = '(2*20.0/(3.141592654*(0.26^2)))*exp(-2.0*((x)^2+(y)^2)/(0.26^2))'
    save_in                      = LaserPower
    type                         = FunctionNeumannBC
    variable                     = Te
  [../]

  [./back]
    type = PresetBC
    variable = disp_z
    boundary = back
    value = 0.0
  [../]
[]


#=======================================================
#:Adaptivity
[Adaptivity]
  marker = errorfrac
  #step=10
  [./Indicators]
    [./error]
      type = GradientJumpIndicator
      variable = Te
      outputs                    = exodus
    [../]
  [../]

  [./Markers]
    [./errorfrac]
      type = ErrorToleranceMarker
      refine = 1e-4
      coarsen = 0.0
      indicator = error
      outputs                    = exodus
    [../]
  [../]

[]

#=======================================================
#:AuxVariables
[AuxVariables]
  [./LaserPower]
    order = FIRST
    family = LAGRANGE
  [../]

  [./strain_xx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./strain_yy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./strain_zz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./strain_xy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./strain_xz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./strain_yz]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./Pstrain_xx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Pstrain_yy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Pstrain_zz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Pstrain_xy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Pstrain_xz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./Pstrain_yz]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./stress_xx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./stress_yy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./stress_zz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./stress_xy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./stress_xz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./stress_yz]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./stress_vm]
    family = MONOMIAL
    order = CONSTANT
  [../]
[]

#=======================================================
#:AuxKernels
[AuxKernels]
  [./strain_xx]
    type = RankTwoAux
    variable = strain_xx
    rank_two_tensor = total_strain
    index_i = 0
    index_j = 0
  [../]
  [./strain_yy]
    type = RankTwoAux
    variable = strain_yy
    rank_two_tensor = total_strain
    index_i = 1
    index_j = 1
  [../]
  [./strain_zz]
    type = RankTwoAux
    variable = strain_zz
    rank_two_tensor = total_strain
    index_i = 2
    index_j = 2
  [../]
  [./strain_xy]
    type = RankTwoAux
    variable = strain_xy
    rank_two_tensor = total_strain
    index_i = 0
    index_j = 1
  [../]
  [./strain_xz]
    type = RankTwoAux
    variable = strain_xz
    rank_two_tensor = total_strain
    index_i = 0
    index_j = 2
  [../]
  [./strain_yz]
    type = RankTwoAux
    variable = strain_yz
    rank_two_tensor = total_strain
    index_i = 1
    index_j = 2
  [../]

  [./Pstrain_xx]
    type = RankTwoAux
    variable = Pstrain_xx
    rank_two_tensor = plastic_strain
    index_i = 0
    index_j = 0
  [../]
  [./Pstrain_yy]
    type = RankTwoAux
    variable = Pstrain_yy
    rank_two_tensor = plastic_strain
    index_i = 1
    index_j = 1
  [../]
  [./Pstrain_zz]
    type = RankTwoAux
    variable = Pstrain_zz
    rank_two_tensor = plastic_strain
    index_i = 2
    index_j = 2
  [../]
  [./Pstrain_xy]
    type = RankTwoAux
    variable = Pstrain_xy
    rank_two_tensor = plastic_strain
    index_i = 0
    index_j = 1
  [../]
  [./Pstrain_xz]
    type = RankTwoAux
    variable = Pstrain_xz
    rank_two_tensor = plastic_strain
    index_i = 0
    index_j = 2
  [../]
  [./Pstrain_yz]
    type = RankTwoAux
    variable = Pstrain_yz
    rank_two_tensor = plastic_strain
    index_i = 1
    index_j = 2
  [../]

  [./stress_xx]
    type = RankTwoAux
    variable = stress_xx
    rank_two_tensor = stress
    index_i = 0
    index_j = 0
  [../]
  [./stress_yy]
    type = RankTwoAux
    variable = stress_yy
    rank_two_tensor = stress
    index_i = 1
    index_j = 1
  [../]
  [./stress_zz]
    type = RankTwoAux
    variable = stress_zz
    rank_two_tensor = stress
    index_i = 2
    index_j = 2
  [../]
  [./stress_xy]
    type = RankTwoAux
    variable = stress_xy
    rank_two_tensor = stress
    index_i = 0
    index_j = 1
  [../]
  [./stress_xz]
    type = RankTwoAux
    variable = stress_xz
    rank_two_tensor = stress
    index_i = 0
    index_j = 2
  [../]
  [./stress_yz]
    type = RankTwoAux
    variable = stress_yz
    rank_two_tensor = stress
    index_i = 1
    index_j = 2
  [../]
  [./Von_Mises_stress]
    type = RankTwoScalarAux
    variable = stress_vm
    rank_two_tensor = stress
    scalar_type = VonMisesStress
  [../]
[]

#=======================================================
#:ICs
[ICs]
  [./ConstantIC]
    type                         = ConstantIC
    value                        = 273.15
    variable                     = Te
  [../]
[]

#=======================================================
#:Materials
[Materials]
  [./TimeStepMaterial]
    compute                      = 1
    enable                       = 1
    implicit                     = 1
    outputs                      = none
    prop_dt                      = dt
    prop_time                    = time
    prop_time_step               = time_step
    type                         = TimeStepMaterial
  [../]

  [./elasticity_tensor]
    type = ComputeElasticityTensor
    fill_method                  = symmetric9
    C_ijkl                       = '175.0e3 88.7e3 62.3e3 175.0e3 62.3e3 220.0e3 62.2e3 62.2e3 43.15e3'
  [../]

  [./strain]
    type = ComputeFiniteStrain
    displacements = 'disp_x disp_y disp_z'
    eigenstrain_names        = EigenStrain
  [../]

  [./stress]
    #type = ComputeFiniteStrainElasticStress
    type = ComputeMultiPlasticityStress
    ep_plastic_tolerance = 1e-9
    plastic_models = J2
  [../]

#===================================================
  [./ComputeVariableEigenstrain]
    args                         = 'Te'
    eigen_base                   = '11.8e-6 11.8e-6 11.8e-6 0 0 0'
    eigenstrain_name             = EigenStrain
    outputs                      = exodus
    prefactor                    = Tediff
    type                         = ComputeVariableEigenstrain
    #use_displaced_mesh           = 0
    #incremental_form             = 0
  [../]

  [./Tediff]
    type = DerivativeParsedMaterial
    f_name = Tediff
    function = 'Te-273.15'
    args = 'Te'
    derivative_order             = 1
    outputs = none
  [../]
  #
  [./specific_heat]
    type = ParsedMaterial
    f_name = specific_heat
    function = '(1.0e6)*(650.9)'
    args = 'Te'
    outputs = exodus
  [../]

  # Heat
  [./Heat1]
    type = GenericConstantMaterial
    prop_names = 'thermal_conductivity density'
    prop_values = '15.0 4000e-12'
  [../]
[]

#=======================================================
#:UserObjects
[UserObjects]
  #[./str]
  #  execute_on                   = TIMESTEP_END
  #  #internal_0                   = 0
  #  rate                         = 397.6262
  #  type                         = TensorMechanicsHardeningCutExponential
  #  value_0                      = 376.7034
  #  value_residual               =  644.68
  #[../]

  [./str]
    execute_on                   = TIMESTEP_END
    type                         = TensorMechanicsHardeningConstant
    value                      = 300.0
  [../]

  [./J2]
    type = TensorMechanicsPlasticJ2
    yield_strength = str
    yield_function_tolerance = 1E-3
    internal_constraint_tolerance = 1E-9
  [../]
[]

#=======================================================
#:Kernels
[Kernels]
  ## Eigenstrains
  [./TensorMechanics]
      displacements = 'disp_x disp_y disp_z'
      eigenstrain_names        = EigenStrain
  [../]

  #==============================
  # Heat
  [./heat_conduction]
    type = HeatConduction
    variable = Te
  [../]
  [./heat_conduction_time_derivative]
    type = HeatConductionTimeDerivative
    variable = Te
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
  solve_type = 'JFNK'  # OR PJFNK
  petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type'
  petsc_options_value = 'asm      ilu          nonzero'
  l_max_its = 40
  nl_max_its = 30
  nl_abs_tol = 1e-12
  end_time = 1.0
   dtmax   = 1.0e-2
   start_time                 = 0.0
 [./TimeStepper]
    # Turn on time stepping
    type = IterationAdaptiveDT
    dt = 1.0e-6
    cutback_factor = 0.8
    growth_factor = 1.5
    optimal_iterations = 30
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
