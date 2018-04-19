#=======================================================
[GlobalParams]
  # displacements = 'u_x u_y'
  outputs = exodus
[]

#=======================================================
[Mesh]
  type = GeneratedMesh
  dim = 2
  elem_type = QUAD4
  nx = 100
  ny = 100
  nz = 0
  xmin = -1.0
  xmax = 1.0
  ymin = -1.0
  ymax = 1.0
  zmin = 0
  zmax = 0
[]

#=======================================================
[Variables]
  [./rho]
  [../]

  [./v1]
  [../]

  [./v2]
  [../]
[]

#=======================================================
[ICs]
  [./BoundingBoxIC_rho]
    block                        = 0
    inside                       = 2.0
    outside                      = 1.0
    type                         = BoundingBoxIC
    variable                     = rho
    x1                           = -0.1
    x2                           = 0.2
    y1                           = -0.1
    y2                           = 0.2
    z1                           = 0
    z2                           = 0
  [../]

  [./FunctionIC_v1]
    function                     = 10.0*(1.0-x*x)*(1.0-y*y)
    type                         = FunctionIC
    variable                     = v1
  [../]
  [./FunctionIC_v2]
    function                     = 50.0*(1.0-x*x)*(1.0-y*y)
    type                         = FunctionIC
    variable                     = v2
  [../]

  # [./ConstantIC_v1]
  # block                        =    0
  # type                         = ConstantIC
  # value                        = 1.0
  # variable                     = v1
  # [../]
  #
  # [./ConstantIC_v2]
  # block                        =    0
  # type                         = ConstantIC
  # value                        = 2.0
  # variable                     = v2
  # [../]
[]

##=======================================================
[Kernels]
  [./rho_dot]
    type = TimeDerivative
    variable = rho
  [../]
  [./rho_Convec]
    type = JEUk_Mass_Convec2D
    variable = rho
    velocities = 'v1 v2'
  [../]

  [./v1_dot]
    type                         = TimeDerivative
    variable                     = v1
  [../]
  [./v2_dot]
    type                         = TimeDerivative
    variable                     = v2
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
  solve_type = 'PJFNK'  #'NEWTON'  # OR PJFNK
  petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type'
  petsc_options_value = 'asm      ilu          nonzero'
  l_max_its = 15
  nl_max_its = 10
  nl_abs_tol = 1e-12
  end_time = 5.0
   dtmax   = 0.1
   start_time                 = 0.0
 [./TimeStepper]
    # Turn on time stepping
    type = IterationAdaptiveDT
    dt = 1.0e-4
    cutback_factor = 0.5
    growth_factor = 1.5
    optimal_iterations = 8
  [../]
[]

##===============================================================
##: Outputs
[Outputs]
  interval                       = 1
  exodus = true
  console = true
  #console =true
  print_perf_log = true
  output_initial = true
  print_linear_residuals         = 0
  use_displaced                   = 1

[]
