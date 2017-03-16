
[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 80
  ny = 40
  nz = 0
  xmin = -20
  xmax = 20
  ymin = 0
  ymax = 20
  zmin = 0
  zmax = 0
  elem_type = QUAD4
[]

[GlobalParams]
  derivative_order = 2
  enable_jit = true
  displacements = 'disp_x disp_y'
[]

# AuxVars to compute the free energy density for outputting
[AuxVariables]
  # order parameters
  [./eta1]
    [./InitialCondition]
      type = FunctionIC
      function = 'if(x<0,0,1)'
    [../]
  [../]
  [./eta2]
    [./InitialCondition]
      type = FunctionIC
      function = 'if(x<0,1,0)'
    [../]
  [../]

  # Temperature
  [./T]
    [./InitialCondition]
      type = FunctionIC
      function = y+300
    [../]
  [../]
[]

[Variables]
  # Mesh displacement
  [./disp_x]
  [../]
  [./disp_y]
  [../]
[]

[Kernels]
  # Set up stress divergence kernels
  [./TensorMechanics]
  [../]
[]

[Materials]
  #
  # Compute the thermal expansion in the bicrystal
  #
  [./e1]
    # eigenstrain per Kelvin for crystal 1
    type = GenericConstantRankTwoTensor
    tensor_values = '0.01 -0.01 0 0 0 0'
    tensor_name = e1
  [../]
  [./e2]
    # eigenstrain per Kelvin for crystal 2
    type = GenericConstantRankTwoTensor
    tensor_values = '-0.01 0.01 0 0 0 0'
    tensor_name = e2
  [../]

  # the next to materials are the factors multiplied onto the "per Kelvin tensors"
  [./func1]
    type = DerivativeParsedMaterial
    # thermal expansion at 300K is zero
    function = eta1*(T-300)
    f_name = f1
    args = 'eta1 T'
  [../]
  [./func2]
    type = DerivativeParsedMaterial
    # thermal expansion at 300K is zero
    function = eta2*(T-300)
    f_name = f2
    args = 'eta2 T'
  [../]

  # this material computes f1*e1+f2*e2 and sets it as the Eigenstrain
  [./eigenstrain]
    type = CompositeEigenstrain
    tensors = 'e1 e2'
    weights = 'f1 f2'
    args = 'eta1 eta2 T'
  [../]

  #
  # Set up the elasticity tensor for the bicrystal
  #
  [./C1]
    # elasticity tensor for crystal 1
    type = ComputeElasticityTensor
    C_ijkl = '10 10'
    base_name = C1
    fill_method = symmetric_isotropic
  [../]
  [./C2]
    type = ComputeElasticityTensor
    # elasticity tensor for crystal 2
    C_ijkl = '5 5'
    base_name = C2
    fill_method = symmetric_isotropic
  [../]
  # the next to materials are the factors multiplied onto the elasticityy tensors
  # I'm taking just the value of teh order parameters for teh respective crystals
  # this just creates a tensor material that is C1 in crystal 1 and C2 in crystal 2
  # TODO (for you): create a class that rotates an elasticity tensor using the Euler angles
  # from an EBSD file
  [./weight1]
    type = DerivativeParsedMaterial
    # thermal expansion at 300K is zero
    function = eta1
    f_name = g1
    args = 'eta1 T'
  [../]
  [./weight2]
    type = DerivativeParsedMaterial
    # thermal expansion at 300K is zero
    function = eta2
    f_name = g2
    args = 'eta2'
  [../]
  [./elasticity]
    type = CompositeElasticityTensor
    tensors = 'C1 C2'
    weights = 'g1 g2'
    args = 'eta1 eta2'
  [../]

  #
  # Compute stress and strain
  #
  [./strain]
    type = ComputeSmallStrain
    block = 0
    displacements = 'disp_x disp_y'
  [../]
  [./stress]
    type = ComputeLinearElasticStress
    block = 0
  [../]
[]

[BCs]
  # at the botton face the thermal expansion should be zero
  [./bottom_y]
    type = PresetBC
    variable = disp_y
    boundary = 'bottom'
    value = 0
  [../]
  [./bottom_x]
    type = PresetBC
    variable = disp_x
    boundary = 'bottom'
    value = 0
  [../]
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

[Executioner]
  type = Steady

  solve_type = 'PJFNK'
  petsc_options_iname = '-pc_type -sub_pc_type'
  petsc_options_value = 'asm      ilu'

  l_max_its = 30
  nl_max_its = 10
  l_tol = 1.0e-4
  nl_rel_tol = 1.0e-8
  nl_abs_tol = 1.0e-10
[]

[Outputs]
  execute_on = 'timestep_end'
  print_linear_residuals = false
  exodus = true
[]
