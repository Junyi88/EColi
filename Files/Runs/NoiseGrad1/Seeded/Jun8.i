#====================================================================
# Global Params
[GlobalParams]
  #outputs = exodus
  #penalty = 1e3
  #displacements = 'disp_x disp_y'
  #order = second
[]
#[Mesh]
#  #MOOSE supports reading field data from ExodusII, XDA/XDR, and mesh checkpoint files (.e, .xda, .xdr, .cp)
#  file =./Files/Runs/NoiseGrad1/Seeded/Jun3Fast_R0_out.e
#  #This method of restart is only supported on serial meshes
#  #distribution = serial
#[]

#[MeshModifiers]
#  [./SubdomainBoundingBox1]
#    block_id                     = 1
#    bottom_left                  = '2.0 0.0 0.0'
#    location                     = INSIDE
#    top_right                    = '3.0 10.0 0.0'
#    type                         = SubdomainBoundingBox
#  [../]
#  [./SubdomainBoundingBox2]
#    block_id                     = 2
#    bottom_left                  = '7.0 0.0 0.0'
#    location                     = INSIDE
#    top_right                    = '8.0 10.0 0.0'
#    type                         = SubdomainBoundingBox
#  [../]
#[]
#
#
##====================================================================
## Variables
#[Variables]
#  # order parameter
#  [./eta1]
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = eta1
#    initial_from_file_timestep = LATEST
#  [../]
#
#  [./eta2]
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = eta2
#    initial_from_file_timestep = LATEST
#  [../]
#
#  [./La_eta]
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = La_eta
#    initial_from_file_timestep = LATEST
#  [../]
#
#  [./c]
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = c
#    initial_from_file_timestep = LATEST
#  [../]
#
#  [./w]
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = w
#    initial_from_file_timestep = LATEST
#  [../]
##----------
#  [./q1]
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = q1
#    initial_from_file_timestep = LATEST
#  [../]
#
#  [./q2]
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = q2
#    initial_from_file_timestep = LATEST
#  [../]
#
#  [./LaQ]   # Lagrangian
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = LaQ
#    initial_from_file_timestep = LATEST
#  [../]
##=======
#  [./phi1]
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = phi1
#    initial_from_file_timestep = LATEST
#  [../]
#[]
#====================================================================
# Mesh
[Mesh]
  type = GeneratedMesh
  dim = 2
  elem_type = QUAD4
  nx = 200
  ny = 1
  nz = 0
  xmin = 0
  xmax = 1.0e1
  ymin = 0
  ymax = 1.0e1
  zmin = 0
  zmax = 0
[]

[MeshModifiers]
  [./SubdomainBoundingBox1]
    block_id                     = 1
    bottom_left                  = '2.0 0.0 0.0'
    location                     = INSIDE
    top_right                    = '3.0 10.0 0.0'
    type                         = SubdomainBoundingBox
  [../]
  [./SubdomainBoundingBox2]
    block_id                     = 2
    bottom_left                  = '7.0 0.0 0.0'
    location                     = INSIDE
    top_right                    = '8.0 10.0 0.0'
    type                         = SubdomainBoundingBox
  [../]
[]


#====================================================================
# Variables
[Variables]
  # order parameter
  [./eta1]
    order = FIRST
    family = LAGRANGE
  [../]

  [./eta2]
    order = FIRST
    family = LAGRANGE
  [../]

  [./La_eta]
    order = FIRST
    family = LAGRANGE
  [../]

  [./c]
    order = FIRST
    family = LAGRANGE
  [../]

  [./w]
    order = FIRST
    family = LAGRANGE
  [../]
#----------
  [./q1]
    order = FIRST
    family = LAGRANGE
  [../]

  [./q2]
    order = FIRST
    family = LAGRANGE
  [../]

  [./LaQ]   # Lagrangian
    order = FIRST
    family = LAGRANGE
  [../]
#=======
  [./phi1]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[ICs]
  #====================================================================
  [./ConstantIC_0_eta1]
    block                  = 0
    type                         = ConstantIC
    value                        = 0.98
    variable                     = eta1
  [../]
  [./ConstantIC_0_eta2]
    block                  = 0
    type                         = ConstantIC
    value                        = 0.02
    variable                     = eta2
  [../]

  [./ConstantIC_0_c]
    block                  = 0
    type                         = ConstantIC
    value                        = 0.445
    variable                     = c
  [../]

  [./ConstantIC_0_q1]
    block                  = 0
    type                         = ConstantIC
    value                        = 0.7071067812
    variable                     = q1
  [../]

  [./ConstantIC_0_q2]
    block                  = 0
    type                         = ConstantIC
    value                        = 0.7071067812
    variable                     = q2
  [../]

  [./ConstantIC_0_phi1]
    block                  = 0
    type                         = ConstantIC
    value                        = 0.99
    variable                     = phi1
  [../]
  #====================================================================
  #[./ConstantIC_1_eta1]
  #  block                  = 1
  #  type                         = ConstantIC
  #  value                        = 0.02
  #  variable                     = eta1
  #[../]
  #[./ConstantIC_1_eta2]
  #  block                  = 1
  #  type                         = ConstantIC
  #  value                        = 0.98
  #  variable                     = eta2
  #[../]
  #
  #[./ConstantIC_1_c]
  #  block                  = 1
  #  type                         = ConstantIC
  #  value                        = 0.42
  #  variable                     = c
  #[../]

  [./ConstantIC_1_q1]
    block                  = 1
    type                         = ConstantIC
    value                        = 0.6
    variable                     = q1
  [../]

  [./ConstantIC_1_q2]
    block                  = 1
    type                         = ConstantIC
    value                        = 0.8
    variable                     = q2
  [../]

  [./ConstantIC_1_phi1]
    block                  = 1
    type                         = ConstantIC
    value                        = 0.99
    variable                     = phi1
  [../]

  #[./BoundingBoxIC_1_q1]
  #  block                  =  1                           # The list of block ids (SubdomainID) that this object will be applied
  #  inside                 = 0.6                           # The value of the variable inside the box
  #  outside                = 0.7071067812                           # The value of the variable outside the box
  #  type                   = BoundingBoxIC
  #  variable               = q1                  # The variable this initial condition is supposed to provide values for.
  #  x1                     = 2.2                 # The x coordinate of the lower left-hand corner of the box
  #  x2                     = 2.8                 # The x coordinate of the upper right-hand corner of the box
  #  y1                     = 0.0                  # The y coordinate of the lower left-hand corner of the box
  #  y2                     = 10.0                  # The y coordinate of the upper right-hand corner of the box
  #  z1                     = 0                           # The z coordinate of the lower left-hand corner of the box
  #  z2                     = 0                           # The z coordinate of the upper right-hand corner of the box
  #[../]
  #
  #[./BoundingBoxIC_1_q2]
  #  block                  =  1                           # The list of block ids (SubdomainID) that this object will be applied
  #  inside                 = 0.8                           # The value of the variable inside the box
  #  outside                = 0.7071067812                           # The value of the variable outside the box
  #  type                   = BoundingBoxIC
  #  variable               = q2                  # The variable this initial condition is supposed to provide values for.
  #  x1                     = 2.2                 # The x coordinate of the lower left-hand corner of the box
  #  x2                     = 2.8                 # The x coordinate of the upper right-hand corner of the box
  #  y1                     = 0.0                  # The y coordinate of the lower left-hand corner of the box
  #  y2                     = 10.0                  # The y coordinate of the upper right-hand corner of the box
  #  z1                     = 0                           # The z coordinate of the lower left-hand corner of the box
  #  z2                     = 0                           # The z coordinate of the upper right-hand corner of the box
  #[../]

  [./BoundingBoxIC_1_eta1]
    block                  =  1                           # The list of block ids (SubdomainID) that this object will be applied
    inside                 = 0.01                           # The value of the variable inside the box
    outside                = 0.99                           # The value of the variable outside the box
    type                   = BoundingBoxIC
    variable               = eta1                  # The variable this initial condition is supposed to provide values for.
    x1                     = 2.1                 # The x coordinate of the lower left-hand corner of the box
    x2                     = 2.9                 # The x coordinate of the upper right-hand corner of the box
    y1                     = 0.0                  # The y coordinate of the lower left-hand corner of the box
    y2                     = 10.0                  # The y coordinate of the upper right-hand corner of the box
    z1                     = 0                           # The z coordinate of the lower left-hand corner of the box
    z2                     = 0                           # The z coordinate of the upper right-hand corner of the box
  [../]

  [./BoundingBoxIC_1_eta2]
    block                  =  1                           # The list of block ids (SubdomainID) that this object will be applied
    inside                 = 0.99                           # The value of the variable inside the box
    outside                = 0.01                           # The value of the variable outside the box
    type                   = BoundingBoxIC
    variable               = eta2                  # The variable this initial condition is supposed to provide values for.
    x1                     = 2.1                 # The x coordinate of the lower left-hand corner of the box
    x2                     = 2.9                 # The x coordinate of the upper right-hand corner of the box
    y1                     = 0.0                  # The y coordinate of the lower left-hand corner of the box
    y2                     = 10.0                  # The y coordinate of the upper right-hand corner of the box
    z1                     = 0                           # The z coordinate of the lower left-hand corner of the box
    z2                     = 0                           # The z coordinate of the upper right-hand corner of the box
  [../]

  [./BoundingBoxIC_1_c]
    block                  =  1                           # The list of block ids (SubdomainID) that this object will be applied
    inside                 = 0.42                           # The value of the variable inside the box
    outside                = 0.445                           # The value of the variable outside the box
    type                   = BoundingBoxIC
    variable               = c                  # The variable this initial condition is supposed to provide values for.
    x1                     = 2.1                 # The x coordinate of the lower left-hand corner of the box
    x2                     = 2.9                 # The x coordinate of the upper right-hand corner of the box
    y1                     = 0.0                  # The y coordinate of the lower left-hand corner of the box
    y2                     = 10.0                  # The y coordinate of the upper right-hand corner of the box
    z1                     = 0                           # The z coordinate of the lower left-hand corner of the box
    z2                     = 0                           # The z coordinate of the upper right-hand corner of the box
  [../]
  #====================================================================
  #[./ConstantIC_2_eta1]
  #  block                  = 2
  #  type                         = ConstantIC
  #  value                        = 0.02
  #  variable                     = eta1
  #[../]
  #[./ConstantIC_2_eta2]
  #  block                  = 2
  #  type                         = ConstantIC
  #  value                        = 0.98
  #  variable                     = eta2
  #[../]
  #
  #[./ConstantIC_2_c]
  #  block                  = 2
  #  type                         = ConstantIC
  #  value                        = 0.42
  #  variable                     = c
  #[../]

  [./ConstantIC_2_q1]
    block                  = 2
    type                         = ConstantIC
    value                        = 0.8
    variable                     = q1
  [../]

  [./ConstantIC_2_q2]
    block                  = 2
    type                         = ConstantIC
    value                        = 0.6
    variable                     = q2
  [../]
  #
  #[./BoundingBoxIC_2_q1]
  #  block                  =  2                           # The list of block ids (SubdomainID) that this object will be applied
  #  inside                 = 0.8                           # The value of the variable inside the box
  #  outside                = 0.7071067812                           # The value of the variable outside the box
  #  type                   = BoundingBoxIC
  #  variable               = q1                  # The variable this initial condition is supposed to provide values for.
  #  x1                     = 7.2                 # The x coordinate of the lower left-hand corner of the box
  #  x2                     = 7.8                # The x coordinate of the upper right-hand corner of the box
  #  y1                     = 0.0                  # The y coordinate of the lower left-hand corner of the box
  #  y2                     = 10.0                  # The y coordinate of the upper right-hand corner of the box
  #  z1                     = 0                           # The z coordinate of the lower left-hand corner of the box
  #  z2                     = 0                           # The z coordinate of the upper right-hand corner of the box
  #[../]
  #
  #[./BoundingBoxIC_2_q2]
  #  block                  =  2                           # The list of block ids (SubdomainID) that this object will be applied
  #  inside                 = 0.6                           # The value of the variable inside the box
  #  outside                = 0.7071067812                           # The value of the variable outside the box
  #  type                   = BoundingBoxIC
  #  variable               = q2                  # The variable this initial condition is supposed to provide values for.
  #  x1                     = 7.2                 # The x coordinate of the lower left-hand corner of the box
  #  x2                     = 7.8                 # The x coordinate of the upper right-hand corner of the box
  #  y1                     = 0.0                  # The y coordinate of the lower left-hand corner of the box
  #  y2                     = 10.0                  # The y coordinate of the upper right-hand corner of the box
  #  z1                     = 0                           # The z coordinate of the lower left-hand corner of the box
  #  z2                     = 0                           # The z coordinate of the upper right-hand corner of the box
  #[../]

  [./ConstantIC_2_phi1]
    block                  = 2
    type                         = ConstantIC
    value                        = 0.99
    variable                     = phi1
  [../]
  [./BoundingBoxIC_2_eta1]
    block                  =  2                           # The list of block ids (SubdomainID) that this object will be applied
    inside                 = 0.01                           # The value of the variable inside the box
    outside                = 0.99                           # The value of the variable outside the box
    type                   = BoundingBoxIC
    variable               = eta1                  # The variable this initial condition is supposed to provide values for.
    x1                     = 7.1                 # The x coordinate of the lower left-hand corner of the box
    x2                     = 7.9                 # The x coordinate of the upper right-hand corner of the box
    y1                     = 0.0                  # The y coordinate of the lower left-hand corner of the box
    y2                     = 10.0                  # The y coordinate of the upper right-hand corner of the box
    z1                     = 0                           # The z coordinate of the lower left-hand corner of the box
    z2                     = 0                           # The z coordinate of the upper right-hand corner of the box
  [../]

  [./BoundingBoxIC_2_eta2]
    block                  =  2                           # The list of block ids (SubdomainID) that this object will be applied
    inside                 = 0.99                           # The value of the variable inside the box
    outside                = 0.01                           # The value of the variable outside the box
    type                   = BoundingBoxIC
    variable               = eta2                  # The variable this initial condition is supposed to provide values for.
    x1                     = 7.1                 # The x coordinate of the lower left-hand corner of the box
    x2                     = 7.9                 # The x coordinate of the upper right-hand corner of the box
    y1                     = 0.0                  # The y coordinate of the lower left-hand corner of the box
    y2                     = 10.0                  # The y coordinate of the upper right-hand corner of the box
    z1                     = 0                           # The z coordinate of the lower left-hand corner of the box
    z2                     = 0                           # The z coordinate of the upper right-hand corner of the box
  [../]

  [./BoundingBoxIC_2_c]
    block                  =  2                           # The list of block ids (SubdomainID) that this object will be applied
    inside                 = 0.42                           # The value of the variable inside the box
    outside                = 0.445                           # The value of the variable outside the box
    type                   = BoundingBoxIC
    variable               = c                  # The variable this initial condition is supposed to provide values for.
    x1                     = 7.1                 # The x coordinate of the lower left-hand corner of the box
    x2                     = 7.9                 # The x coordinate of the upper right-hand corner of the box
    y1                     = 0.0                  # The y coordinate of the lower left-hand corner of the box
    y2                     = 10.0                  # The y coordinate of the upper right-hand corner of the box
    z1                     = 0                           # The z coordinate of the lower left-hand corner of the box
    z2                     = 0                           # The z coordinate of the upper right-hand corner of the box
  [../]
[]

#====================================================================
# Boundary Conditions
[BCs]
  [./Periodic]
    [./c_bcs]
      auto_direction = 'x y'
    [../]
  [../]
[]

[UserObjects]

[]

#====================================================================
# AuxVariables
[AuxVariables]
  [./Te]
  [../]

  [./time]
  [../]

  [./grad_q1x]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./grad_q2x]
    order = CONSTANT
    family = MONOMIAL
  [../]

  [./grad_q1y]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./grad_q2y]
    order = CONSTANT
    family = MONOMIAL
  [../]


[]

#====================================================================
# AuxKernels
[AuxKernels]
  [./FunctionAux1]
    #function                     = '2000.0-1709.0*tanh(9.452*t)'
    #function                     = '2000.0-1706.0*tanh(2.402*time)'
    #function                     = '2000.0-1702.0*tanh(1.111*time)'
    #function                     = '2000.0-1708.0*tanh(0.6115*time)'
    #function                     = '2000.0-1710.0*tanh(0.3942*time)'
    function                     = '1800.0'
    type                         = FunctionAux
    variable                     = Te
  [../]
  [./FunctionAux2]
    function                     = 't'
    type                         = FunctionAux
    variable                     = time
  [../]

  [./VariableGradientComponent1]
    component                    = 'x'                            # The gradient component to compute
    gradient_variable            = 'q1'                  # The variable from which to compute the gradient component
    seed                         = 0                           # The seed for the master random number generator
    type                         = VariableGradientComponent
    variable                     = 'grad_q1x'                  # The name of the variable that this object applies to
  [../]

  [./VariableGradientComponent2]
    component                    = 'x'                            # The gradient component to compute
    gradient_variable            = 'q2'                  # The variable from which to compute the gradient component
    seed                         = 0                           # The seed for the master random number generator
    type                         = VariableGradientComponent
    variable                     = 'grad_q2x'                  # The name of the variable that this object applies to
  [../]
  [./VariableGradientComponent3]
    component                    = 'y'                            # The gradient component to compute
    gradient_variable            = 'q1'                  # The variable from which to compute the gradient component
    seed                         = 0                           # The seed for the master random number generator
    type                         = VariableGradientComponent
    variable                     = 'grad_q1y'                  # The name of the variable that this object applies to
  [../]

  [./VariableGradientComponent4]
    component                    = 'y'                            # The gradient component to compute
    gradient_variable            = 'q2'                  # The variable from which to compute the gradient component
    seed                         = 0                           # The seed for the master random number generator
    type                         = VariableGradientComponent
    variable                     = 'grad_q2y'                  # The name of the variable that this object applies to
  [../]
[]

##===============================================================
# Materials
[Materials]

  # Shared Constants
  [./consts]
    type = GenericConstantMaterial
    prop_names  = 'Leta  kappaEta kappa_c kappaQ kappaphi1'
   prop_values = '6.4e2 0.0625e-2  0.0625e-8 0.0 1.0e-3'
      #prop_values = '6.4e2 0.0625e-2  0.26e-4  0.0625e-6'
  [../]


  [./HQ]
    type = DerivativeParsedMaterial
    f_name = HQ
    #function = '(0.25e-2)*Te'
    function = '1.0'
    args = 'Te'
    derivative_order             = 1
    outputs = exodus
  [../]

  [./HQeta]
    type = DerivativeParsedMaterial
    f_name = HQeta
    #function = '(0.25e-2)*Te'
    function = '1.0e-4'
    args = 'Te'
    derivative_order             = 1
    outputs = exodus
  [../]

  [./PQ]
    type = DerivativeParsedMaterial
    f_name = PQ
    function = '(phi1^2)'
    args = 'phi1'
    derivative_order             = 2
  [../]

  # Mobility
  [./LQ]
    type = DerivativeParsedMaterial
    f_name = LQ
    constant_names = 'LQMin LQMax'
    #constant_expressions = '1e-4 0.64e2'
    constant_expressions = '1e-3 0.64e3'
    material_property_names = 'h1:=h1(eta1)  hp1:=hp1(phi1)'
    function = 'LQMax+(LQMin-LQMax)*(1.0-(eta1^3)*(10.0-15.0*eta1+6.0*(eta1^2)))'
    #function = '0.0'
    #function = 'LQMin+(LQMax-LQMin)*(h1*hp1+0.0*h1-hp1+1.0)'
    args = 'eta1 phi1'
    derivative_order             = 1
    outputs = exodus
  [../]

  # Angle
  [./phase_free_energy_hq1]
    type = DerivativeParsedMaterial
    f_name = hq1
    function = 'q1^2'
    args = 'q1'
  derivative_order             = 1
  [../]

  [./phase_free_energy_hq2]
    type = DerivativeParsedMaterial
    f_name = hq2
    function = 'q2^2'
    args = 'q2'
  derivative_order             = 1
  [../]

  #=====================================================================
  # AllenCahn Stuff
  # Swtiching and well functions
  [./switching1]
    type = SwitchingFunctionMaterial
    function_name = h1
    eta = eta1
    h_order = HIGH
  [../]
  [./switching2]
    type = SwitchingFunctionMaterial
    function_name = h2
    eta = eta2
    h_order = HIGH
  [../]

  [./barrier]
    type = MultiBarrierFunctionMaterial
    etas = 'eta1 eta2'
    function_name                = getas                           # actual name for g(eta_i)
    g_order                      = SIMPLE
    well_only                    = 0
  [../]

  # Total Free Energy
    [./free_energy]
      type = DerivativeMultiPhaseMaterial
      f_name = F
      fi_names = 'FLq  Fbeta'
      hi_names = 'h1  h2'
      etas     = 'eta1 eta2'
      args = 'Te c'
      g=getas
      W = 0.5e-2
    derivative_order             = 2
    [../]

#==================================================================
# Cahn hilliard
# Mobilities
  [./MLq]
    type = ParsedMaterial
    f_name = MLq
    args = 'c Te'
    constant_names = 'Mag Rg D0 Q1'
    constant_expressions = '1e12 8.31451e-3 4.29e-7 36.3'
   function ='Mag*D0*exp(-Q1/(Rg*Te))'
   outputs = exodus
  [../]

  #[./Malpha]
  #  type = ParsedMaterial
  #  f_name = Malpha
  #  args = 'c Te'
  #  constant_names = 'Mag kb Da0 Qa1 Db0 Qb1'
  #  constant_expressions = '1e12 8.6173303e-5 1.35e-3 3.14 6.6e-3 3.41'
  # function ='Mag*(c*Da0*exp(-Qa1/(kb*Te))+(1-c)*Db0*exp(-Qb1/(kb*Te)))'
  # outputs = exodus
  #[../]

  [./Mbeta]
    type = ParsedMaterial
    f_name = Mbeta
    args = 'c Te'
    constant_names = 'Mag kb Da0 Qa1 Qa2 Db0 Qb1 Qb2'
    constant_expressions = '1e12 8.6173303e-5 3.53e-4 3.4 1335.0 1.94e-4 3.36 1266.0 '
   function ='Mag*(c*Da0*exp(-Qa1/(kb*Te))*exp(Qa2/(kb*Te^2))+
               (1-c)*Db0*exp(-Qb1/(kb*Te))*exp(Qb2/(kb*Te^2)))'
   outputs = exodus
  [../]

  #[./Malpha2]
  #  type = ParsedMaterial
  #  f_name = Malpha2
  #  args = 'c Te'
  #  constant_names = 'Mag kb Da0 Qa1 Db0 Qb1'
  #  constant_expressions = '1e12 8.6173303e-5 2.24e-5 2.99 2.32e-1 4.08'
  # function ='Mag*(c*Da0*exp(-Qa1/(kb*Te))+(1-c)*Db0*exp(-Qb1/(kb*Te)))'
  # outputs = exodus
  #[../]
  #
  #[./Mgamma]
  #  type = ParsedMaterial
  #  f_name = Mgamma
  #  args = 'c Te'
  #  constant_names = 'Mag kb Da0 Qa1 Db0 Qb1'
  #  constant_expressions = '1e12 8.6173303e-5 1.43e-6 2.59 2.11e-2 3.71'
  # function ='Mag*(c*Da0*exp(-Qa1/(kb*Te))+(1-c)*Db0*exp(-Qb1/(kb*Te)))'
  # outputs = exodus
  #[../]

  [./Mob]
    type = ParsedMaterial
    f_name = M
    args = 'c eta1 eta2 Te'
    material_property_names = 'MLq:=MLq(c,Te)
                               Mbeta:=Mbeta(c,Te)
                               d2F:=D[F(Te,c),c,c]+1e-4
                                h1:=h1(eta1)
                                h2:=h2(eta2)'
    #constant_names = 'Rg Mag1'
    #constant_expressions = '8.31451e-3 7.68e9'
  #function ='(eta1*MLq+eta2*Malpha+eta3*Mbeta+eta4*Malpha2+eta5*Mgamma)/d2F'
  function ='(sqrt(eta1^2)*MLq+sqrt(eta2^2)*Mbeta)/d2F'
  #function ='(h1*MLq+h2*Malpha+h3*Mbeta+h4*Malpha2+h5*Mgamma)/d2F'
  # function ='2.0e2'
   outputs = exodus
  [../]

  # Energy 1
  #----------------------------------------------------
  [./f_liquid]
    type = DerivativeParsedMaterial
    f_name = FLq
    args = 'c Te'
    derivative_order             = 2
    constant_names = 'p00 p01 p02 p03
                       p04 p05 p10 p11
                       p12 p13 p14 p20
                       p21 p22 p23 p30
                       p31 p32 p40 p41
                       p50 Magni'
    constant_expressions = '8.7780161556e+03 -1.2269392908e+01 -5.3974669165e-02
                            2.3795971676e-05 -7.0373969388e-09 8.5029289714e-13
                            -1.1908549357e+05 9.2784159449e+00 2.9882766850e-03
                            -1.9724115037e-06 6.1486768166e-10 1.6527400000e+05
                            -2.3628252466e+01 -3.3241082786e-15 8.1998878285e-19
                            -1.4167800000e+05 6.0696870799e+01 2.9710053783e-16
                            9.4452000000e+04 -5.0052435399e+01 1.7972457986e-09
                            1e-3'
    function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                 (p04*(Te^4))+(p05*(Te^5))+
                 c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (c^4)*(p40+p41*Te)+(c^5)*p50)'
    outputs = exodus
  [../]


  [./Fbeta]
    type = DerivativeParsedMaterial
    f_name = Fbeta
    args = 'c Te'
    derivative_order             = 2
    constant_names = 'p00 p01 p02 p03
                       p04 p05 p10 p11
                       p12 p13 p14 p20
                       p21 p22 p23 p30
                       p31 p32 p40 p41
                       p50 Magni'
    constant_expressions = '4.0403477073e+03 -1.5383307606e+01 -5.0132828567e-02
                            2.2316045634e-05 -6.3380061813e-09 7.4811009307e-13
                            -1.3873501737e+05 4.5270933220e+01 -1.6255753482e-02
                            -7.8166312425e-08 5.7006371612e-10 5.4012870345e+04
                            1.6555043548e+01 2.2241561125e-02 -1.7709187604e-06
                            2.4341844426e+05 -1.3424422238e+02 -5.6909906122e-03
                            -2.0397528441e+05 7.8394064019e+01 4.7887120626e+04
                            1e-3'
    function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                 (p04*(Te^4))+(p05*(Te^5))+
                 c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (c^4)*(p40+p41*Te)+(c^5)*p50)'
    outputs = exodus
  [../]


#======================================
[./switchingphi1]
  type = SwitchingFunctionMaterial
  function_name = hp1
  eta = phi1
  h_order = HIGH
[../]
#[./switchingphi1pen]
#  type = SwitchingFunctionMaterial
#  function_name = hp1pen
#  eta = phi1
#  h_order = HIGH
#  well_only=1
#[../]
[./switchingphi1pen]
  enable                       = 1                           # Set the enabled status of the MooseObject.
  eta                          = phi1                            # Order parameter variable
  function_name                = hp1pen                          # actual name for f(eta), i.e. 'h' or 'g'
  g_order                      = SIMPLE                      # Polynomial order of the barrier function g(eta)
    type                       = BarrierFunctionMaterial                                             # in the Mesh block the undisplaced mesh will still be used.
  well_only                    = 1                          # Make the g zero in [0:1] so it only contributes to enforcing the eta ...
[../]
[./Fphi]
  #type = ParsedMaterial
  type = DerivativeParsedMaterial
  f_name = Fphi
  args = 'phi1'
  material_property_names = 'hp1:=hp1(phi1)'
  #args = 'c Te'
  derivative_order             = 2
  function = '-20*(3.5e-2)*hp1'
  outputs = exodus
[../]

[./FphiPen]
  #type = ParsedMaterial
  type = DerivativeParsedMaterial
  f_name = Fphipen
  args = 'phi1'
  material_property_names = 'hp1pen:=hp1pen(phi1)'
  #args = 'c Te'
  derivative_order             = 2
  function = '20*(3.5)*hp1pen'
  outputs = exodus
[../]

[./Lphi]
  type = ParsedMaterial
  #type = DerivativeParsedMaterial
  f_name = Lphi
  #args = 'c Te'
  #derivative_order             = 1
  function = '6.4e3'
  outputs = exodus
[../]
[]


# =======================================================
# Kernels
[Kernels]


#==========================================================
# Concentration
  # Cs
  [./w_dot]
    variable = w
    v = c
    type = CoupledTimeDerivative
  [../]
  [./coupled_res]
    args = 'eta1 eta2 Te c'
    variable = w
    type = SplitCHWRes
    mob_name = M
  [../]
  [./coupled_parsed]
    args = 'eta1 eta2 Te'
    variable = c
    type = SplitCHParsed
    f_name = F
    kappa_name = kappa_c
    w = w
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta1
  [./eta1_dot]
    type                         = TimeDerivative
    variable                     = eta1
  [../]
  [./ACBulk1]
    type = AllenCahn
    variable = eta1
    args = 'eta2 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface1]
    type = ACMultiInterface
    variable = eta1
    etas = 'eta1 eta2 '
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta1]
    h_name                       = h1
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta1
  [../]
  [./PusztaiBulkEta1]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2'
    Qs                           = 'q1 q2'
    H_name                       = 'HQeta'
    L_name                       = 'Leta'
    P_name                       = 'h1'
    type                         = PusztaiACBulk
    variable                     = eta1
    variable_H                   = 1
    variable_L                   = 1
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta2
  [./eta2_dot]
    type                         = TimeDerivative
    variable                     = eta2
  [../]
  [./ACBulk2]
    type = AllenCahn
    variable = eta2
    args = 'eta1 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface2]
    type = ACMultiInterface
    variable = eta2
    etas = 'eta1 eta2'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta2]
    h_name                       = h2
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta2
  [../]
  #--------------------------------------------------------------------------
  # Langrange Eta
  [./SwitchingFunctionConstraintLagrange]
    enable                       = 1
    epsilon                      = 1e-09
    etas                         = 'eta1 eta2'
    h_names                      = 'h1 h2'
    type                         = SwitchingFunctionConstraintLagrange
    variable                     = La_eta
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # phi1
  [./phi1_dot]
    type                         = TimeDerivative
    variable                     = phi1
  [../]
  [./ACBulkphi1]
    type = AllenCahn
    variable = phi1
    args = 'Te c'
    mob_name = Lphi
    f_name = Fphi
  [../]
  [./ACBulkphi1pen]
    type = AllenCahn
    variable = phi1
    args = 'Te c'
    mob_name = Lphi
    f_name = Fphipen
  [../]
  [./ACInterfacephi1]
    type = ACMultiInterface
    variable = phi1
    etas = 'phi1 '
    mob_name = Lphi
    kappa_names = 'kappaphi1'
  [../]
  [./PusztaiBulkphi1]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta1 eta2'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Lphi'
    P_name                       = 'PQ'
    type                         = PusztaiACBulk
    variable                     = phi1
    variable_H                   = 1
    variable_L                   = 1
  [../]



  # -----------------------------------------------------------
  # Q1
    [./q1_dot]
      type                         = TimeDerivative
      variable                     = q1
    [../]

    [./PusztaiInterface1]
      Correction_y0                      = 1.0
      Correction_Z                      = 1.0
      Args                         = 'eta1 eta2 phi1 c Te'
      Qs                           =  'q2'
      H_name                       = 'HQ'
      L_name                       = 'LQ '
      P_name                       = 'PQ'
      type                         = PusztaiQsBulk
      variable                     = q1
      variable_H                   = 1
      variable_L                   = 1
    [../]

    [./PusztaiInterface1eta]
      Correction_y0                      = 1.0
      Correction_Z                      = 1.0
      Args                         = 'eta1 eta2 phi1 c Te'
      Qs                           =  'q2'
      H_name                       = 'HQeta'
      L_name                       = 'LQ '
      P_name                       = 'h1'
      type                         = PusztaiQsBulk
      variable                     = q1
      variable_H                   = 1
      variable_L                   = 1
    [../]

    [./SwitchingFunctionConstraintq1]
      h_name                       = hq1
      implicit                     = 1
      lambda                       = LaQ
      type                         = SwitchingFunctionConstraintEta
      variable                     = q1
    [../]

    #[./ACInterfaceQ1]
    #  args                         =  'eta1 eta2 phi1 c q2'
    #  kappa_name                   = 'kappaQ'
    #  mob_name                     = 'LQ'
    #  type                         = ACInterface
    #  variable                     = 'q1'
    #  variable_L                   = 1
    #[../]

    # -----------------------------------------------------------
    # Q2
    [./q2_dot]
      type                         = TimeDerivative
      variable                     = q2
    [../]

    [./SwitchingFunctionConstraintq2]
      h_name                       = hq2
      implicit                     = 1
      lambda                       = LaQ
      type                         = SwitchingFunctionConstraintEta
      variable                     = q2
    [../]

    [./PusztaiInterface2]
      Correction_y0                     = 1.0
      Correction_Z                      = 1.0
      Args                         = 'eta1 eta2 phi1 c Te'
      Qs                           =  'q1'
      H_name                       = 'HQ'
      implicit                     = 1
      L_name                     = 'LQ '
      P_name                       = 'PQ'
      type                         = PusztaiQsBulk
      variable                     = q2
      variable_H                   = 1

      variable_L                   = 1
    [../]
    [./PusztaiInterface2eta]
      Correction_y0                     = 1.0
      Correction_Z                      = 1.0
      Args                         = 'eta1 eta2 phi1 c Te'
      Qs                           =  'q1'
      H_name                       = 'HQeta'
      implicit                     = 1
      L_name                     = 'LQ '
      P_name                       = 'h1'
      type                         = PusztaiQsBulk
      variable                     = q2
      variable_H                   = 1

      variable_L                   = 1
    [../]
    #[./ACInterfaceQ2]
    #  args                         =  'eta1 eta2 phi1 c q1'
    #  kappa_name                   = 'kappaQ'
    #  mob_name                     = 'LQ'
    #  type                         = ACInterface
    #  variable                     = 'q2'
    #  variable_L                   = 1
    #[../]

    #--------------------------------------------------------------------------
    # Langrange Q
    [./SwitchingFunctionConstraintLagrangeQ]
      enable                       = 1
      epsilon                      = 1e-09
      etas                         = 'q1 q2'
      h_names                      = 'hq1 hq2'
      implicit                     = 1
      type                         = SwitchingFunctionConstraintLagrange
      variable                     = LaQ
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
# OR PJFNK
  petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type'
  petsc_options_value = 'asm      ilu          nonzero'

  l_max_its = 40
  nl_max_its = 40
  nl_abs_tol = 1e-8
  end_time = 1.0
   dtmax   = 1.0e-3
   start_time                 = 0
 [./TimeStepper]
    # Turn on time stepping
    type = IterationAdaptiveDT
    dt = 5.0e-6
    cutback_factor = 0.8
    growth_factor = 1.5
    optimal_iterations = 18
  [../]
[]

[Outputs]
  interval                       = 1
  exodus = true
  console = true
  print_perf_log = true
  output_initial = true
  print_linear_residuals         = 0
[]
