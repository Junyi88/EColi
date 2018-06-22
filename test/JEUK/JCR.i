#======================================================= 
[GlobalParams] 
  displacements = 'u_x u_y u_z' 
  outputs = exodus 
  # use_displaced_mesh           = 1 
[] 
 
#==================================================================== 
# Mesh 
[Mesh] 
  type = GeneratedMesh 
  dim = 3 
  elem_type = HEX8 
  nx = 10 
  ny = 10 
  nz = 10 
  xmin = 0 
  xmax = 1.0 
  ymin = 0 
  ymax = 1.0 
  zmin = 0 
  zmax = 1.0 
[] 
 
#==================================================================== 
# Variables 
[Variables] 
  # order parameter 
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
 
  [./F11] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
  [./F12] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
  [./F13] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
 
  [./F21] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
  [./F22] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
  [./F23] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
 
  [./F31] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
  [./F32] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
  [./F33] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
 
 
  [./Stress11] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
  [./Stress12] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
  [./Stress13] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
 
  [./Stress21] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
  [./Stress22] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
  [./Stress23] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
 
  [./Stress31] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
  [./Stress32] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
  [./Stress33] 
    order = FIRST 
    family = LAGRANGE 
  [../] 
[] 
 
#======================================================= 
#:BCs 
[BCs] 
 
  [./left] 
    type = PresetBC 
    variable = u_x 
    boundary = left 
    value = 0.0 
  [../] 
 
  [./front] 
    type = PresetBC 
    variable = u_z 
    boundary = front 
    value = 0.0 
  [../] 
 
  [./top] 
    boundary                     = top 
    enable                       = 1 
    function                     = '0.1*t' 
    type                         = FunctionPresetBC 
    variable                     = u_y 
  [../] 
 
  [./bottom] 
    type = PresetBC 
    variable = u_y 
    boundary = bottom 
    value = 0.0 
  [../] 
[] 
 
#======================================================= 
#:AuxVariables 
[AuxVariables] 
  #============================== 
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
  #============================== 
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
 
  #============================== 
  [./F11_x] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F11_y] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F11_z] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
 
  [./F22_x] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F22_y] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F22_z] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
 
  [./F33_x] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F33_y] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F33_z] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
 
  [./F12_x] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F12_y] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F12_z] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
 
  [./F13_x] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F13_y] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F13_z] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
 
  [./F21_x] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F21_y] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F21_z] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
 
  [./F23_x] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F23_y] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F23_z] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
 
  [./F31_x] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F31_y] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F31_z] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
 
  [./F32_x] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F32_y] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
  [./F32_z] 
    family = MONOMIAL 
    order = CONSTANT 
  [../] 
 
[] 
 
#======================================================= 
#:ICs 
[ICs] 
  [./ConstantIC_F11] 
  type                         = ConstantIC 
  value                        = 1.0 
  variable                     = F11 
  [../] 
  [./ConstantIC_F22] 
  type                         = ConstantIC 
  value                        = 1.0 
  variable                     = F22 
  [../] 
  [./ConstantIC_F33] 
  type                         = ConstantIC 
  value                        = 1.0 
  variable                     = F33 
  [../] 
[] 
#======================================================= 
#:Materials 
[Materials] 
 
  [./elasticity_tensor] 
    type = ComputeIsotropicElasticityTensor 
    youngs_modulus = 70.0 
    poissons_ratio = 0.3 
  [../] 
 
#  [./JLCR_CalcDeformRotTensors] 
#    displacements                 = 'u_x u_y u_z' 
#    type                          = JLCR_CalcDeformRotTensors 
#    use_displaced_mesh                      = 1 
#  [../] 
 
  [./JLCR_CalcVelTensor] 
    velocities                 = 'u_x u_y u_z' 
    type              = JLCR_CalcVelTensor 
  [../] 
#  [./JLCR_CalcStressRate] 
#    displacements                 = 'u_x u_y u_z' 
#    type              = JLCR_CalcStressRate 
#  [../] 
[] 
 
#======================================================= 
#:Kernels 
[Kernels] 
 #-------------------------- 
 [./u_x_dot] 
   variable = u_x 
   type = TimeDerivative 
 [../] 
 #[./u_x_dotN] 
 #  variable = u_x 
 #  v = v_x 
 #  type = Gen_SelfNegativeFromRate 
 #[../] 
 
 [./u_y_dot] 
   variable = u_y 
   type = TimeDerivative 
 [../] 
 #[./u_y_dotN] 
 #  variable = u_y 
 #  v = v_y 
 #  type = Gen_SelfNegativeFromRate 
 #[../] 
 
 [./u_z_dot] 
   variable = u_z 
   type = TimeDerivative 
 [../] 
 #[./u_z_dotN] 
 #  variable = u_z 
 #  v = v_z 
 #  type = Gen_SelfNegativeFromRate 
 #[../] 
 #----------------------- 
 [./dv_x_dot] 
   variable = v_x 
   v = u_x 
   coef = 1.0e-6 
   type = CoefCoupledTimeDerivative 
 [../] 
 #[./JLCR_StressDivergence_x] 
 #  variable = v_x 
 #  Stresses = 'Stress11 Stress12 Stress13' 
 #  type = JLCR_StressDivergence 
 #[../] 
 
 [./dv_y_dot] 
   variable = v_y 
   v = u_y 
   coef = 1.0e-6 
   type = CoefCoupledTimeDerivative 
 [../] 
 #[./JLCR_StressDivergence_y] 
 #  variable = v_y 
 #  Stresses = 'Stress21 Stress22 Stress23' 
 #  type = JLCR_StressDivergence 
 #[../] 
 
 [./dv_z_dot] 
   variable = v_z 
   v = u_z 
   coef = 1.0e-6 
   type = CoefCoupledTimeDerivative 
 [../] 
 #[./JLCR_StressDivergence_z] 
 #  variable = v_z 
 #  Stresses = 'Stress31 Stress32 Stress33' 
 #  type = JLCR_StressDivergence 
 #[../] 
 
 
 #---------------------- 
 [./Stress_dot_11] 
   variable = Stress11 
   type = TimeDerivative 
 [../] 
 #[./Stress_Rate11] 
 #  variable = Stress11 
 #  Component_I = 1 
 #  Component_J = 1 
 #  Velocity = 'v_x v_y v_z' 
 #  type = JLCR_StressConstitutiveElasticRate 
 #[../] 
 
 [./Stress_dot_12] 
	variable = Stress12 
   type = TimeDerivative 
 [../] 
 #[./Stress_Rate12] 
 #  variable = Stress12 
 #  Component_I = 1 
 #  Component_J = 2 
 #  Velocity = 'v_x v_y v_z' 
 #  type = JLCR_StressConstitutiveElasticRate 
 #[../] 
 
 [./Stress_dot_13] 
   variable = Stress13 
   type = TimeDerivative 
 [../] 
 #[./Stress_Rate13] 
 #  variable = Stress13 
 #  Component_I = 1 
 #  Component_J = 3 
 #  Velocity = 'v_x v_y v_z' 
 #  type = JLCR_StressConstitutiveElasticRate 
 #[../] 
 
 [./Stress_dot_21] 
   variable = Stress21 
   type = TimeDerivative 
 [../] 
 #[./Stress_Rate21] 
 #  variable = Stress21 
 #  Component_I = 2 
 #  Component_J = 1 
 #  Velocity = 'v_x v_y v_z' 
 #  type = JLCR_StressConstitutiveElasticRate 
 #[../] 
 
 [./Stress_dot_22] 
   variable = Stress22 
   type = TimeDerivative 
 [../] 
 #[./Stress_Rate22] 
 #  variable = Stress22 
 #  Component_I = 2 
 #  Component_J = 2 
 #  Velocity = 'v_x v_y v_z' 
 #  type = JLCR_StressConstitutiveElasticRate 
 #[../] 
 
 [./Stress_dot_23] 
   variable = Stress23 
   type = TimeDerivative 
 [../] 
 #[./Stress_Rate23] 
 #  variable = Stress23 
 #  Component_I = 2 
 #  Component_J = 3 
 #  Velocity = 'v_x v_y v_z' 
 #  type = JLCR_StressConstitutiveElasticRate 
 #[../] 
 
 [./Stress_dot_31] 
   variable = Stress31 
   type = TimeDerivative 
 [../] 
 #[./Stress_Rate31] 
 #  variable = Stress31 
 #  Component_I = 3 
 #  Component_J = 1 
 #  Velocity = 'v_x v_y v_z' 
 #  type = JLCR_StressConstitutiveElasticRate 
 #[../] 
 
 [./Stress_dot_32] 
   variable = Stress32 
   type = TimeDerivative 
 [../] 
 #[./Stress_Rate32] 
 #  variable = Stress32 
 #  Component_I = 3 
 #  Component_J = 2 
 #  Velocity = 'v_x v_y v_z' 
 #  type = JLCR_StressConstitutiveElasticRate 
 #[../] 
 
 [./Stress_dot_33] 
   variable = Stress33 
   type = TimeDerivative 
 [../] 
 #[./Stress_Rate33] 
 #  variable = Stress33 
 #  Component_I = 3 
 #  Component_J = 3 
 #  Velocity = 'v_x v_y v_z' 
 #  type = JLCR_StressConstitutiveElasticRate 
 #[../] 
 
 #----------------------- 
  [./F11] 
    type                         = JLCR_DeformGradient 
    variable                     = F11 
    F_other = 'F12 F13' 
    Displacement = 'u_x' 
    Component_I = 1 
    Component_J = 1 
    use_displaced_mesh           = 1 
  [../] 
  [./F12] 
    type                         = JLCR_DeformGradient 
    variable                     = F12 
    F_other = 'F11 F13' 
    Displacement = 'u_x' 
    Component_I = 1 
    Component_J = 2 
    use_displaced_mesh           = 1 
  [../] 
  [./F13] 
    type                         = JLCR_DeformGradient 
    variable                     = F13 
    F_other = 'F11 F12' 
    Displacement = 'u_x' 
    Component_I = 1 
    Component_J = 3 
    use_displaced_mesh           = 1 
  [../] 
 
  [./F21] 
    type                         = JLCR_DeformGradient 
    variable                     = F21 
    F_other = 'F22 F23' 
    Displacement = 'u_y' 
    Component_I = 2 
    Component_J = 1 
    use_displaced_mesh           = 1 
  [../] 
  [./F22] 
    type                         = JLCR_DeformGradient 
    variable                     = F22 
    F_other = 'F21 F23' 
    Displacement = 'u_y' 
    Component_I = 2 
    Component_J = 2 
    use_displaced_mesh           = 1 
  [../] 
  [./F23] 
    type                         = JLCR_DeformGradient 
    variable                     = F23 
    F_other = 'F21 F22' 
    Displacement = 'u_y' 
    Component_I = 2 
    Component_J = 3 
    use_displaced_mesh           = 1 
  [../] 
 
  [./F31] 
    type                         = JLCR_DeformGradient 
    variable                     = F31 
    F_other = 'F32 F33' 
    Displacement = 'u_z' 
    Component_I = 3 
    Component_J = 1 
    use_displaced_mesh           = 1 
  [../] 
  [./F32] 
    type                         = JLCR_DeformGradient 
    variable                     = F32 
    F_other = 'F31 F33' 
    Displacement = 'u_z' 
    Component_I = 3 
    Component_J = 2 
    use_displaced_mesh           = 1 
  [../] 
  [./F33] 
    type                         = JLCR_DeformGradient 
    variable                     = F33 
    F_other = 'F31 F32' 
    Displacement = 'u_z' 
    Component_I = 3 
    Component_J = 3 
    use_displaced_mesh           = 1 
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
   dtmax   = 1.0e-1 
   start_time                 = 0.0 
 [./TimeStepper] 
    # Turn on time stepping 
    type = IterationAdaptiveDT 
    dt = 1.0e-2 
    cutback_factor = 0.8 
    growth_factor = 1.5 
    optimal_iterations = 5 
  [../] 
[] 
 
##=============================================================== 
##: Outputs 
[Outputs] 
  interval                       = 10 
  exodus = true 
  console = true 
  print_perf_log = true 
  output_initial = true 
  print_linear_residuals         = 0 
[] 