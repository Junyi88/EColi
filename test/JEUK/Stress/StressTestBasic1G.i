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
  nx = 1
  ny = 1000
  nz = 0
  xmin = 0.0
  xmax = 0.1
  ymin = 0.0
  ymax = 0.1
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



  #--------------
    [./Stress11]
    [../]
    [./Stress22]
    [../]
    [./Stress12]
    [../]
    [./Stress21]
    [../]

[]

#=======================================================
[ICs]
  [./BoundingBoxIC_rho]
    block                        = 0
    inside                       = 1.0
    outside                      = 1.0
    type                         = BoundingBoxIC
    variable                     = rho
    x1                           = 0.0
    x2                           = 0.1
    y1                           = 0.07
    y2                           = 0.09
    z1                           = 0
    z2                           = 0
  [../]

[]

[BCs]
#  [./top_v1]
#    type = PresetBC
#    variable = v1
#    boundary = top
#    value = 0.0
#  [../]
#  [./top_v2]
#    type = PresetBC
#    variable = v2
#    boundary = top
#    value = 0.0
#  [../]

#  [./bot_v1]
#    type = PresetBC
#    variable = v1
#    boundary = bottom
#    value = 0.0
#  [../]
  [./bot_v2]
    type = PresetBC
    variable = v2
    boundary = bottom
    value = 0.0
  [../]

  [./left_v1]
    type = PresetBC
    variable = v1
    boundary = left
    value = 0.0
  [../]
#  [./left_v2]
#    type = PresetBC
#    variable = v2
#    boundary = left
#    value = 0.0
#  [../]

  [./right_v1]
    type = PresetBC
    variable = v1
    boundary = right
    value = 0.0
  [../]
#  [./right_v2]
#    type = PresetBC
#    variable = v2
#    boundary = right
#    value = 0.0
#  [../]


[]

##=======================================================
[Kernels]
  # -- Mass
  [./rho_dot]
    type = TimeDerivative
    variable = rho
  [../]
  [./rho_Convec]
    type = JEUk_Mass_Convec2D
    variable = rho
    velocities = 'v1 v2'
  [../]

  # -- V1
  [./v1_dot]
    type                         = JEUk_Mo_TimeDerivative
    variable                     = v1
    rho = rho
  [../]
  [./v1_convec]
    type                         = JEUk_Mo_Convec2D
    variable                     = v1
    OtherVel = v2
    rho = rho
    Component = 1
  [../]
  [./v1_StressDiv]
    type                         = JEUk_Mo_StressDiv2D
    variable                     = v1
    Stresses = 'Stress11 Stress12'
    Component = 1
  [../]

  # -- V2
  [./v2_dot]
    type                         = JEUk_Mo_TimeDerivative
    variable                     = v2
    rho = rho
  [../]
  [./v2_convec]
    type                         = JEUk_Mo_Convec2D
    variable                     = v1
    OtherVel = v1
    rho = rho
    Component = 2
  [../]
  [./v2_StressDiv]
    type                         = JEUk_Mo_StressDiv2D
    variable                     = v2
    Stresses = 'Stress22 Stress21'
    Component = 2
  [../]

  [./v2_Body]
    type                         = JEUk_Mo_BodyF
    variable                     = v2
    rho = rho
    BodyForce = -1.0
  [../]

  # -- Stress11
  [./S11_Self]
    type                         = JEUk_Gen_Self
    variable                     = Stress11
  [../]
  [./S11_HS]
    type                         = JEUk_Stress_NV_HS2D
    variable                     = Stress11
    Velocities = 'v1 v2'
    Lambda = -0.2
    Mu = 0.3
  [../]

  # -- Stress22
  [./S22_Self]
    type                         = JEUk_Gen_Self
    variable                     = Stress22
  [../]
  [./S22_HS]
    type                         = JEUk_Stress_NV_HS2D
    variable                     = Stress22
    Velocities = 'v1 v2'
    Lambda = -0.2
    Mu = 0.3
  [../]

  # -- Stress12
  [./S12_Self]
    type                         = JEUk_Gen_Self
    variable                     = Stress12
  [../]
  [./S12_Dev]
    type                         = JEUk_Stress_NV_Dev2D
    variable                     = Stress12
    Velocities = 'v1 v2'
    Mu = 0.3
    Component1 = 1
    Component2 = 2
  [../]


  # -- Stress21
  [./S21_Self]
    type                         = JEUk_Gen_Self
    variable                     = Stress21
  [../]
  [./S21_Dev]
    type                         = JEUk_Stress_NV_Dev2D
    variable                     = Stress21
    Velocities = 'v2 v1'
    Mu = 0.3
    Component1 = 2
    Component2 = 1
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
  end_time = 1.0
   dtmax   = 0.001
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
