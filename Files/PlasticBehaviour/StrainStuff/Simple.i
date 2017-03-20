#====================================================================
# Global Params
[GlobalParams]
  outputs = exodus
  penalty = 1e3
[]

#====================================================================
# Mesh
# Create A 10 by 10 by 10 mm mesh
[Mesh]
  type = GeneratedMesh
  dim = 3
  elem_type = Hex8
  nx = 10
  ny = 10
  nz = 10
  xmin = 0
  xmax = 1.0e1
  ymin = 0
  ymax = 1.0e1
  zmin = 0
  zmax = 1.0e1
[]

#====================================================================
# Variables
[Variables]
  [./disp_x]
  [../]
  [./disp_y]
  [../]
  [./disp_z]
  [../]
[]

#====================================================================
# Initial Conditions
[ICs]

[]

#====================================================================
# Boundary Conditions
[BCs]
# This is where we set the boundary conditions
  #[./left]
  #  type = PresetBC
  #  variable = disp_x
  #  boundary = left
  #  value = 0.0
  #[../]
  [./bottom]
    type = PresetBC
    variable = disp_y
    boundary = bottom
    value = 0.0
  [../]
  #[./top]
  #  type = PresetBC
  #  variable = disp_y
  #  boundary = top
  #  value = 0.1
  #[../]
  [./front]
    type = PresetBC
    variable = disp_z
    boundary = front
    value = 0.0
  [../]

  [./top]
    boundary                     = top
    enable                       = 1
    function                     = '0.1*t'
    type                         = FunctionPresetBC
    variable                     = disp_y
  [../]
[]

#====================================================================
# UserObjects
[UserObjects]
  [./str]
    type = TensorMechanicsHardeningCubic
    value_0 = 2.4e2
    value_residual = 3.0e2
    internal_0 = 0
    internal_limit = 0.005
  [../]
  [./J2]
    type = TensorMechanicsPlasticJ2
    yield_strength = str
    yield_function_tolerance = 1E-3
    internal_constraint_tolerance = 1E-9
  [../]
[]

#====================================================================
# AuxVariables
[AuxVariables]
  [./elastic_strain_xx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./elastic_strain_yy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./elastic_strain_zz]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./elastic_strain_xy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./elastic_strain_xz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./elastic_strain_yz]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./total_strain_xx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./total_strain_yy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./total_strain_zz]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./total_strain_xy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./total_strain_xz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./total_strain_yz]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./plastic_strain_xx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./plastic_strain_yy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./plastic_strain_zz]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./plastic_strain_xy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./plastic_strain_xz]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./plastic_strain_yz]
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

  [./Von_Mises_stress]
    family = MONOMIAL
    order = CONSTANT
  [../]
[]

#====================================================================
# AuxKernels
[AuxKernels]
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

  [./plastic_strain_xx]
    type = RankTwoAux
    variable = plastic_strain_xx
    rank_two_tensor = plastic_strain
    index_i = 0
    index_j = 0
  [../]
  [./plastic_strain_yy]
    type = RankTwoAux
    variable = plastic_strain_yy
    rank_two_tensor = plastic_strain
    index_i = 1
    index_j = 1
  [../]
  [./plastic_strain_zz]
    type = RankTwoAux
    variable = plastic_strain_zz
    rank_two_tensor = plastic_strain
    index_i = 2
    index_j = 2
  [../]

  [./plastic_strain_xy]
    type = RankTwoAux
    variable = plastic_strain_xy
    rank_two_tensor = plastic_strain
    index_i = 0
    index_j = 1
  [../]
  [./plastic_strain_xz]
    type = RankTwoAux
    variable = plastic_strain_xz
    rank_two_tensor = plastic_strain
    index_i = 0
    index_j = 2
  [../]
  [./plastic_strain_yz]
    type = RankTwoAux
    variable = plastic_strain_yz
    rank_two_tensor = plastic_strain
    index_i = 1
    index_j = 2
  [../]

  [./elastic_strain_xx]
    type = RankTwoAux
    variable = elastic_strain_xx
    rank_two_tensor = elastic_strain
    index_i = 0
    index_j = 0
  [../]
  [./elastic_strain_yy]
    type = RankTwoAux
    variable = elastic_strain_yy
    rank_two_tensor = elastic_strain
    index_i = 1
    index_j = 1
  [../]
  [./elastic_strain_zz]
    type = RankTwoAux
    variable = elastic_strain_zz
    rank_two_tensor = elastic_strain
    index_i = 2
    index_j = 2
  [../]

  [./elastic_strain_xy]
    type = RankTwoAux
    variable = elastic_strain_xy
    rank_two_tensor = elastic_strain
    index_i = 0
    index_j = 1
  [../]
  [./elastic_strain_xz]
    type = RankTwoAux
    variable = elastic_strain_xz
    rank_two_tensor = elastic_strain
    index_i = 0
    index_j = 2
  [../]
  [./elastic_strain_yz]
    type = RankTwoAux
    variable = elastic_strain_yz
    rank_two_tensor = elastic_strain
    index_i = 1
    index_j = 2
  [../]

  [./total_strain_xx]
    type = RankTwoAux
    variable = total_strain_xx
    rank_two_tensor = total_strain
    index_i = 0
    index_j = 0
  [../]
  [./total_strain_yy]
    type = RankTwoAux
    variable = total_strain_yy
    rank_two_tensor = total_strain
    index_i = 1
    index_j = 1
  [../]
  [./total_strain_zz]
    type = RankTwoAux
    variable = total_strain_zz
    rank_two_tensor = total_strain
    index_i = 2
    index_j = 2
  [../]

  [./total_strain_xy]
    type = RankTwoAux
    variable = total_strain_xy
    rank_two_tensor = total_strain
    index_i = 0
    index_j = 1
  [../]
  [./total_strain_xz]
    type = RankTwoAux
    variable = total_strain_xz
    rank_two_tensor = total_strain
    index_i = 0
    index_j = 2
  [../]
  [./total_strain_yz]
    type = RankTwoAux
    variable = total_strain_yz
    rank_two_tensor = total_strain
    index_i = 1
    index_j = 2
  [../]

  [./Von_Mises_stress]
    type = RankTwoScalarAux
    variable = Von_Mises_stress
    rank_two_tensor = stress
    scalar_type = VonMisesStress
  [../]
[]

##===============================================================
# Materials
[Materials]
  # This is where we define the material properties
  # Assume isotropic material. We can do non-isotropic also
    [./elasticity_tensor]
      type = ComputeIsotropicElasticityTensor
      youngs_modulus = 70.0e3
      poissons_ratio = 0.3
    [../]
    # Assume small strain
    [./strain]
      type = ComputeFiniteStrain
      displacements = 'disp_x disp_y disp_z'
      outputs = exodus
    [../]
    # Assume Stress is Linear elastic
    #[./stress]
    #  type = ComputeLinearElasticStress
    #[../]

    [./stress]
      type = ComputeMultiPlasticityStress
      ep_plastic_tolerance = 1e-9
      plastic_models = J2
    [../]
[]


# =======================================================
# Kernels
# This is where the calculations occur
[Kernels]
  [./TensorMechanics]
      displacements = 'disp_x disp_y disp_z'
  [../]
[]

##===============================================================
##: Postprocessors
[Postprocessors]
  [./ave_stress_bottom]
    type = SideAverageValue
    variable = stress_zz
    boundary = bottom
  [../]
  [./ave_strain_bottom]
    type = SideAverageValue
    variable = total_strain_zz
    boundary = bottom
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
  solve_type = 'NEWTON'
  petsc_options_iname = '-pc_type -sub_pc_type -pc_asm_overlap -ksp_gmres_restart'
  petsc_options_value = 'asm      lu           1               101'

  l_max_its = 40
  nl_max_its = 20
  nl_abs_tol = 1e-8
  end_time = 5.0
   dtmax   = 1.0e-2
   start_time                 = 0
 [./TimeStepper]
    # Turn on time stepping
    type = IterationAdaptiveDT
    dt = 1.0e-2
    cutback_factor = 0.8
    growth_factor = 1.5
    optimal_iterations = 8
  [../]
[]

#[Executioner]
#  type = Transient
#  end_time = 1.0
#
#  solve_type = 'NEWTON'
#
#  petsc_options_iname = '-pc_type -sub_pc_type -pc_asm_overlap -ksp_gmres_restart'
#  petsc_options_value = 'asm      lu           1               101'
#[]

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
