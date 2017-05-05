#=======================================================
#:Global Params
[GlobalParams]
  outputs = exodus
  penalty = 1e3
  # use_displaced_mesh = false
[]

#=======================================================
#:Mesh
[Mesh] #Mesh: Generate Mesh
  type = GeneratedMesh
  dim = 3
  elem_type = Hex8
  nx = 4
  ny = 4
  nz = 2
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
#:Kernels
[Kernels]

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
    dt = 1.0e-5
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
