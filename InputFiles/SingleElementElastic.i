#=======================================================
#:Global Params
[GlobalParams]
  outputs = exodus
  displacements = 'disp_x disp_y'
[]

#=======================================================
#:Mesh
[Mesh] #Mesh: Generate Mesh
  type = GeneratedMesh
  dim = 2
  elem_type = Quad4
  nx = 1
  ny = 1
  nz = 1
  xmin = -0.5
  xmax = 0.5
  ymin = -0.5
  ymax = 0.5
[]

#=======================================================
#:Variables
[Variables]
 [./disp_x]
 [../]

 [./disp_y]
 [../]
[]


#=======================================================
#:BCs
[BCs]
  [./top]
    boundary                     = top
    enable                       = 1
    function                     = '0.1*t'
    type                         = FunctionPresetBC
    variable                     = disp_y
  [../]

  [./bottom]
    boundary                     = bottom
    enable                       = 1
    value = 0.0
    type                         = PresetBC
    variable                     = disp_y
  [../]
[]

#=======================================================
#:AuxVariables
[AuxVariables]
  [./strain_xx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./strain_yy]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./strain_xy]
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
  [./stress_xy]
    family = MONOMIAL
    order = CONSTANT
  [../]

  [./stress_VM]
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
    variable = strain_xx
    rank_two_tensor = total_strain
    index_i = 1
    index_j = 1
  [../]
  [./strain_xy]
    type = RankTwoAux
    variable = strain_xy
    rank_two_tensor = total_strain
    index_i = 0
    index_j = 1
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
  [./stress_xy]
    type = RankTwoAux
    variable = stress_xy
    rank_two_tensor = stress
    index_i = 0
    index_j = 1
  [../]

  [./Von_Mises_stress]
    type = RankTwoScalarAux
    variable = stress_VM
    rank_two_tensor = stress
    scalar_type = VonMisesStress
  [../]
[]


#=======================================================
#:Materials
[Materials]
  [./elasticity_tensor]
    compute                     = 1
    enable                      = 1
    implicit                    = 1
    poissons_ratio              = 0.33
    type                        = ComputeIsotropicElasticityTensor
    youngs_modulus              = 70.0e3
  [../]

  [./strain]
    type = ComputeFiniteStrain
    displacements = 'disp_x disp_y'
  [../]

  [./stress]
    type = ComputeFiniteStrainElasticStress
  [../]
[]

#=======================================================
#:Kernels
[Kernels]
  [./TensorMechanics]
      displacements = 'disp_x disp_y'
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
  solve_type = 'NEWTON'  # OR PJFNK
  petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type'
  petsc_options_value = 'asm      ilu          nonzero'
  l_max_its = 40
  nl_max_its = 30
  nl_abs_tol = 1e-8
  end_time = 1.0
   dtmax   = 1.0e-2
   start_time                 = 0.0
 [./TimeStepper]
    # Turn on time stepping
    type = IterationAdaptiveDT
    dt = 1.0e-1
    cutback_factor = 0.8
    growth_factor = 1.5
    optimal_iterations = 20
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

[Debug]
  #active                  = __all__ # If specified only the blocks named will be visited and made active
  show_actions            =0      # Print out the actions being executed
  show_material_props     = 0       # Print out the material properties supplied for each block, face, neighbor,
                                    # and/or sideset
  show_parser             = 0       # Shows parser block extraction and debugging information
  #show_top_residuals      = 0       # The number of top residuals to print out (0 = no output)
  #show_var_residual       =         # Variables for which residuals will be sent to the output file
  #show_var_residual_norms = 0       # Print the residual norms of the individual solution variables at each
  #                                  # nonlinear iteration
[]
