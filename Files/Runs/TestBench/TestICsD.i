#====================================================================
# Global Params
[GlobalParams]
  outputs = exodus
  penalty = 1e3
[]

#====================================================================
# Mesh
[Mesh]
  type = GeneratedMesh
  dim = 2
  elem_type = QUAD4
  nx = 200
  ny = 200
  nz = 0
  xmin = 0
  xmax = 1.0e1
  ymin = 0
  ymax = 1.0e1
  zmin = 0
  zmax = 0
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

  [./eta3]
    order = FIRST
    family = LAGRANGE
  [../]

  [./eta4]
    order = FIRST
    family = LAGRANGE
  [../]

  [./eta5]
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

  [./q1]
    order = FIRST
    family = LAGRANGE
  [../]

  [./q2]
    order = FIRST
    family = LAGRANGE
  [../]

  [./SWT]
    #order = FIRST
    #family = LAGRANGE
  [../]

  [./S]
    #order = FIRST
    #family = LAGRANGE
  [../]

  [./R]
    #order = FIRST
    #family = LAGRANGE
  [../]

[]

[ICs]
  #====================================================================
  [./ConstantIC_0_eta1]
    type                         = ConstantIC
    value                        = 0.90
    variable                     = eta1
  [../]
  [./ConstantIC_0_eta2]
    type                         = ConstantIC
    value                        = 0.025
    variable                     = eta2
  [../]
  [./ConstantIC_0_eta3]
    type                         = ConstantIC
    value                        = 0.025
    variable                     = eta3
  [../]
  [./ConstantIC_0_eta4]
    type                         = ConstantIC
    value                        = 0.025
    variable                     = eta4
  [../]
  [./ConstantIC_0_eta5]
    type                         = ConstantIC
    value                        = 0.025
    variable                     = eta5
  [../]

  [./ConstantIC_0_c]
    type                         = ConstantIC
    value                        = 0.46
    variable                     = c
  [../]

  [./RandomIC1]
    enable                 = 1                           # Set the enabled status of the MooseObject.
    max                    = 1.047197551                           # Upper bound of the randomly generated values
    min                    = 0.5235987756                           # Lower bound of the randomly generated values
    seed                   = 24579                           # Seed value for the random number generator
    type                   = RandomIC
    variable               = R                 # The variable this initial condition is supposed to provide values for.
  [../]

  #[./FunctionIC1]
  #  enable                       = 1                           # Set the enabled status of the MooseObject.
  #  function                     = '1.0-q1'                 # The initial condition function.
  #  type                         = FunctionIC
  #  variable                     = q2                 # The variable this initial condition is supposed to provide values for.
  #[../]

  #[./MultiSmoothCircleIC]
  #  3D_spheres                   = 0                           # in 3D, whether the objects are spheres or columns
  #  bubspac                      = 1.0                  # minimum spacing of bubbles, measured from center to center
  #  enable                       = 1                           # Set the enabled status of the MooseObject.
  #  int_width                    = 0                           # The interfacial width of the void surface.  Defaults to sharp interface
  #  invalue                      = 1.2                  # The variable value inside the circle
  #  numbub                       = 2                  # The number of bubbles to place
  #  numtries                     = 1000                        # The number of tries
  #  outvalue                     = 0.2                  # The variable value outside the circle
  #  radius                       = 2                 # Mean radius value for the circles
  #  radius_variation             = 0                          # Plus or minus fraction of random variation in the bubble radius for uniform, ...
  #                                                             # standard deviation for normal
  #  radius_variation_type        = none                        # Type of distribution that random circle radii will follow
  #  rand_seed                    = 12345                       # Seed value for the random number generator
  #  type                         = MultiSmoothCircleIC
  #  variable                     = S                  # The variable this initial condition is supposed to provide values for.
  #  zero_gradient                = 0                           # Set the gradient DOFs to zero. This can avoid numerical problems with ...
  #                                                             # higher order shape functions and overlapping circles.
  #[../]
  ##
  #[./MultiSmoothCircleIC2]
  #  3D_spheres                   = 0                           # in 3D, whether the objects are spheres or columns
  #  bubspac                      = 1.0                  # minimum spacing of bubbles, measured from center to center
  #  enable                       = 1                           # Set the enabled status of the MooseObject.
  #  int_width                    = 0                           # The interfacial width of the void surface.  Defaults to sharp interface
  #  invalue                      = 1                  # The variable value inside the circle
  #  numbub                       = 2                  # The number of bubbles to place
  #  numtries                     = 1000                        # The number of tries
  #  outvalue                     = 0                  # The variable value outside the circle
  #  radius                       = 2                 # Mean radius value for the circles
  #  radius_variation             = 0                           # Plus or minus fraction of random variation in the bubble radius for uniform, ...
  #                                                             # standard deviation for normal
  #  radius_variation_type        = none                        # Type of distribution that random circle radii will follow
  #  rand_seed                    = 12345                       # Seed value for the random number generator
  #  type                         = MultiSmoothCircleIC
  #  variable                     = SWT                  # The variable this initial condition is supposed to provide values for.
  #  zero_gradient                = 0                           # Set the gradient DOFs to zero. This can avoid numerical problems with ...
  #                                                             # higher order shape functions and overlapping circles.
  #[../]

  #
  #[./RndSmoothCircleIC]
  #  3D_spheres             = 1                           # in 3D, whether the objects are spheres or columns
  #  block                  =                             # The list of block ids (SubdomainID) that this object will be applied
  #  boundary               =                             # The list of boundary IDs from the mesh where this boundary condition ...
  #                                                       # applies
  #  control_tags           =                             # Adds user-defined labels for accessing object parameters via control ...
  #                                                       # logic.
  #  enable                 = 1                           # Set the enabled status of the MooseObject.
  #  int_width              = 0                           # The interfacial width of the void surface.  Defaults to sharp interface
  #  invalue                = (required)                  # The variable value inside the circle
  #  outvalue               = (required)                  # The variable value outside the circle
  #  radius                 = (required)                  # The radius of a circle
  #  rand_seed              = 12345                       # Seed value for the random number generator
  #  type                   = RndSmoothCircleIC
  #  variable               = (required)                  # The variable this initial condition is supposed to provide values for.
  #  variation_invalue      = (required)                  # Plus or minus this amount on the invalue
  #  variation_outvalue     = (required)                  # Plus or minus this amount on the outvalue
  #  x1                     = (required)                  # The x coordinate of the circle center
  #  y1                     = (required)                  # The y coordinate of the circle center
  #  z1                     = 0                           # The z coordinate of the circle center
  #  zero_gradient          = 0                           # Set the gradient DOFs to zero. This can avoid numerical problems with ...
  #                                                       # higher order shape functions and overlapping circles.
  #[../]
  #
  #[./RndSmoothCircleIC]
  #  3D_spheres             = 1                           # in 3D, whether the objects are spheres or columns
  #  block                  =                             # The list of block ids (SubdomainID) that this object will be applied
  #  boundary               =                             # The list of boundary IDs from the mesh where this boundary condition ...
  #                                                       # applies
  #  control_tags           =                             # Adds user-defined labels for accessing object parameters via control ...
  #                                                       # logic.
  #  enable                 = 1                           # Set the enabled status of the MooseObject.
  #  int_width              = 0                           # The interfacial width of the void surface.  Defaults to sharp interface
  #  invalue                = (required)                  # The variable value inside the circle
  #  outvalue               = (required)                  # The variable value outside the circle
  #  radius                 = (required)                  # The radius of a circle
  #  rand_seed              = 12345                       # Seed value for the random number generator
  #  type                   = RndSmoothCircleIC
  #  variable               = (required)                  # The variable this initial condition is supposed to provide values for.
  #  variation_invalue      = (required)                  # Plus or minus this amount on the invalue
  #  variation_outvalue     = (required)                  # Plus or minus this amount on the outvalue
  #  x1                     = (required)                  # The x coordinate of the circle center
  #  y1                     = (required)                  # The y coordinate of the circle center
  #  z1                     = 0                           # The z coordinate of the circle center
  #  zero_gradient          = 0                           # Set the gradient DOFs to zero. This can avoid numerical problems with ...
  #                                                       # higher order shape functions and overlapping circles.
  #[../]
  [./JunyiMultiSmoothCircleIC1]
    3D_spheres             = 0                           # in 3D, whether the objects are spheres or columns
    bubspac                = 2.0                  # minimum spacing of bubbles, measured from center to center
    enable                 = 1                           # Set the enabled status of the MooseObject. ...
                                                         # Group: Advanced
    int_width              = 0                           # The interfacial width of the void surface.  Defaults to sharp interface
    invalue                = 0.7853981634                  # The variable value inside the circle
    numbub                 = 15                  # The number of bubbles to place
    numtries               = 1000                        # The number of tries
    outvalue               = 0.0                  # The variable value outside the circle
    radius                 = 0.6                  # Mean radius value for the circles
    radius_variation       = 0.1                           # Plus or minus fraction of random variation in the bubble radius for uniform, ...
                                                         # standard deviation for normal
    radius_variation_type  = NORMAL                        # Type of distribution that random circle radii will follow
    randPoint_seed         = 1985                       # Seed value for the random number generator
    randVal_seed           = 35465                       # Seed value for the random number generator
    type                   = JunyiMultiSmoothCircleIC
    variable               = S                # The variable this initial condition is supposed to provide values for.
    variation_invalue      = 0.5235987756                  # Plus or minus this amount on the invalue
    zero_gradient          = 0                           # Set the gradient DOFs to zero. This can avoid numerical problems with ...
                                                         # higher order shape functions and overlapping circles.
  [../]

  [./JunyiMultiSmoothCircleIC2]
    3D_spheres             = 0                           # in 3D, whether the objects are spheres or columns
    bubspac                = 2.0                  # minimum spacing of bubbles, measured from center to center
    enable                 = 1                           # Set the enabled status of the MooseObject. ...
                                                         # Group: Advanced
    int_width              = 0                           # The interfacial width of the void surface.  Defaults to sharp interface
    invalue                = 1                  # The variable value inside the circle
    numbub                 = 15                  # The number of bubbles to place
    numtries               = 1000                        # The number of tries
    outvalue               = 0.0                  # The variable value outside the circle
    radius                 = 0.6                  # Mean radius value for the circles
    radius_variation       = 0.1                           # Plus or minus fraction of random variation in the bubble radius for uniform, ...
                                                         # standard deviation for normal
    radius_variation_type  = NORMAL                        # Type of distribution that random circle radii will follow
    randPoint_seed         = 1985                       # Seed value for the random number generator
    randVal_seed           = 35465                       # Seed value for the random number generator
    type                   = JunyiMultiSmoothCircleIC
    variable               = SWT                # The variable this initial condition is supposed to provide values for.
    variation_invalue      = 0.0                  # Plus or minus this amount on the invalue
    zero_gradient          = 0                           # Set the gradient DOFs to zero. This can avoid numerical problems with ...
                                                         # higher order shape functions and overlapping circles.
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
  [./ConservedNormalNoise1]
    execute_on                   = TIMESTEP_BEGIN              # Set to (nonlinear|linear|timestep_end|timestep_begin|custom) to execute ...
    seed                         = 201                           # The seed for the master random number generator
    type                         = ConservedNormalNoise
    use_displaced_mesh           = 0                           # Whether or not this object should use the displaced mesh for computation. .
  [../]
[]

#====================================================================
# AuxVariables
[AuxVariables]
  [./Te]
  [../]

  [./time]
  [../]

  [./CNoise]
    order = FIRST
    family = LAGRANGE
  [../]

  [./eta1Noise]
    order = FIRST
    family = LAGRANGE
  [../]
  [./eta2Noise]
    order = FIRST
    family = LAGRANGE
  [../]
  [./eta3Noise]
    order = FIRST
    family = LAGRANGE
  [../]
  [./eta4Noise]
    order = FIRST
    family = LAGRANGE
  [../]
  [./eta5Noise]
    order = FIRST
    family = LAGRANGE
  [../]

  [./Junyi1]
    #order = FIRST
    #family = LAGRANGE
  [../]
  [./Junyi2]
    #order = FIRST
    #family = LAGRANGE
  [../]
[]

#====================================================================
# AuxKernels
[AuxKernels]
  [./FunctionAux1]
    function                     = '2000.0-1709.0*tanh(9.452*t)'
    #function                     = '2000.0-1706.0*tanh(2.402*time)'
    #function                     = '2000.0-1702.0*tanh(1.111*time)'
    #function                     = '2000.0-1708.0*tanh(0.6115*time)'
    #function                     = '2000.0-1710.0*tanh(0.3942*time)'
    type                         = FunctionAux
    variable                     = Te
  [../]
  [./FunctionAux2]
    function                     = 't'
    type                         = FunctionAux
    variable                     = time
  [../]

  [./JunyiAngle2Value1]
    #function                     = 't'
    type                         = JunyiAngle2Value
    Switch                       = SWT
    SwitchValues                 = S
    RndValues                    = R
    Component                    = 1
    variable                     = Junyi1
  [../]
  [./JunyiAngle2Value2]
    #function                     = 't'
    type                         = JunyiAngle2Value
    Switch                       = SWT
    SwitchValues                 = S
    RndValues                    = R
    Component                    = 2
    variable                     = Junyi2
  [../]
[]

##===============================================================
# Materials
[Materials]
  # Shared Constants
  [./consts]
    type = GenericConstantMaterial
    prop_names  = 'Leta  kappaEta kappa_c'
   prop_values = '6.4e2 0.0105e-2  0.0625e-8'
      #prop_values = '6.4e2 0.0625e-2  0.26e-4  0.0625e-6'
  [../]

  # Penalty
    #[./g_eta1]
    #  type = BarrierFunctionMaterial
    #  g_order = SIMPLE
    #  eta = eta1
    #  function_name  = g1
    #  well_only                    = 1
    #[../]
    #[./g_eta2]
    #  type = BarrierFunctionMaterial
    #  g_order = SIMPLE
    #  eta = eta2
    #  function_name  = g2
    #  well_only                    = 1
    #[../]
    #[./g_eta3]
    #  type = BarrierFunctionMaterial
    #  g_order = SIMPLE
    #  eta = eta3
    #  function_name  = g3
    #  well_only                    = 1
    #[../]
    #[./g_eta4]
    #  type = BarrierFunctionMaterial
    #  g_order = SIMPLE
    #  eta = eta4
    #  function_name  = g4
    #  well_only                    = 1
    #[../]
    #[./g_eta5]
    #  type = BarrierFunctionMaterial
    #  g_order = SIMPLE
    #  eta = eta5
    #  function_name  = g5
    #  well_only                    = 1
    #[../]
    #[./Penalty1]
    #  type = DerivativeParsedMaterial
    #  f_name =Pen1
    #  material_property_names = 'g1:=g1(eta1)  g2:=g2(eta2) g3:=g3(eta3)
    #                             g4:=g4(eta4)  g5:=g5(eta5) '
    #  function = '(g1+g2+g3+g4+g5)*0.0'
    #  args = 'eta1 eta2 eta3 eta4 eta5'
    #  derivative_order             = 1
    #  outputs = exodus
    #[../]


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
  [./switching3]
    type = SwitchingFunctionMaterial
    function_name = h3
    eta = eta3
    h_order = HIGH
  [../]
  [./switching4]
    type = SwitchingFunctionMaterial
    function_name = h4
    eta = eta4
    h_order = HIGH
  [../]
  [./switching5]
    type = SwitchingFunctionMaterial
    function_name = h5
    eta = eta5
    h_order = HIGH
  [../]



  [./barrier]
    type = MultiBarrierFunctionMaterial
    etas = 'eta1 eta2 eta3 eta4 eta5'
    function_name                = getas                           # actual name for g(eta_i)
    g_order                      = SIMPLE
    well_only                    = 0
  [../]

  # Total Free Energy
    [./free_energy]
      type = DerivativeMultiPhaseMaterial
      f_name = F
      fi_names = 'FLq  Falpha Fbeta Falpha2 Fgamma'
      hi_names = 'h1  h2 h3 h4 h5'
      etas     = 'eta1 eta2 eta3 eta4 eta5'
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

  [./Malpha]
    type = ParsedMaterial
    f_name = Malpha
    args = 'c Te'
    constant_names = 'Mag kb Da0 Qa1 Db0 Qb1'
    constant_expressions = '1e12 8.6173303e-5 1.35e-3 3.14 6.6e-3 3.41'
   function ='Mag*(c*Da0*exp(-Qa1/(kb*Te))+(1-c)*Db0*exp(-Qb1/(kb*Te)))'
   outputs = exodus
  [../]

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

  [./Malpha2]
    type = ParsedMaterial
    f_name = Malpha2
    args = 'c Te'
    constant_names = 'Mag kb Da0 Qa1 Db0 Qb1'
    constant_expressions = '1e12 8.6173303e-5 2.24e-5 2.99 2.32e-1 4.08'
   function ='Mag*(c*Da0*exp(-Qa1/(kb*Te))+(1-c)*Db0*exp(-Qb1/(kb*Te)))'
   outputs = exodus
  [../]

  [./Mgamma]
    type = ParsedMaterial
    f_name = Mgamma
    args = 'c Te'
    constant_names = 'Mag kb Da0 Qa1 Db0 Qb1'
    constant_expressions = '1e12 8.6173303e-5 1.43e-6 2.59 2.11e-2 3.71'
   function ='Mag*(c*Da0*exp(-Qa1/(kb*Te))+(1-c)*Db0*exp(-Qb1/(kb*Te)))'
   outputs = exodus
  [../]

  [./Mob]
    type = ParsedMaterial
    f_name = M
    args = 'c eta1 eta2 eta3 eta4 eta5 Te'
    material_property_names = 'MLq:=MLq(c,Te)
                               Malpha:=Malpha(c,Te)
                               Mbeta:=Mbeta(c,Te)
                               Malpha2:=Malpha2(c,Te)
                               Mgamma:=Mgamma(c,Te)
                               d2F:=D[F(Te,c),c,c]+1e-4
                                h1:=h1(eta1)
                                h2:=h2(eta2)
                                h3:=h3(eta3)
                                h4:=h4(eta4)
                                h5:=h5(eta5)'
    #constant_names = 'Rg Mag1'
    #constant_expressions = '8.31451e-3 7.68e9'
  #function ='(eta1*MLq+eta2*Malpha+eta3*Mbeta+eta4*Malpha2+eta5*Mgamma)/d2F'
  function ='(sqrt(eta1^2)*MLq+sqrt(eta2^2)*Malpha+sqrt(eta3^2)*Mbeta+sqrt(eta4^2)*Malpha2+sqrt(eta5^2)*Mgamma)/d2F'
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

  [./f_alpha]
    type = DerivativeParsedMaterial
    f_name = Falpha
    args = 'c Te'
    derivative_order             = 2
    constant_names = 'p00 p01 p02 p03
                       p04 p05 p10 p11
                       p12 p13 p14 p20
                       p21 p22 p23 p30
                       p31 p32 p40 p41
                       p50 Magni'
    constant_expressions = '-3.1881586246e+03 -6.6454835114e+00 -5.1147191881e-02
                            2.1213860103e-05 -6.0184366866e-09 7.1930122787e-13
                            -1.2873451191e+05 9.1916785814e+00 1.6187664885e-03
                            -1.2801175881e-06 4.4575924138e-10 1.3416400000e+05
                            1.9888747534e+01 -1.0597114675e-15 3.2812054056e-19
                            6.0855776676e-09 -5.7527129201e+01 2.0964865291e-16
                            -4.8483441620e-09 2.8763564601e+01 1.4153994351e-09
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

  [./f_alpha2]
    type = DerivativeParsedMaterial
    f_name = Falpha2
    args = 'c Te'
    derivative_order             = 2
    constant_names = 'p00 p01 p02 p03
                       p04 p05 p10 p11
                       p12 p13 p14 p20
                       p21 p22 p23 p30
                       p31 p32 p40 p41
                       p50 Magni'
    constant_expressions = '-2.1269910087e+03 -7.7644152076e+00 -5.0782482359e-02
                             2.1134355331e-05 -6.0111839349e-09 7.1457143620e-13
                             -1.4728581929e+05 3.3052339895e+01 -1.2705758576e-03
                             -1.4036222737e-06 4.3849455306e-10 1.3254392046e+05
                             -4.6607168697e+01 7.4493154748e-03 3.2820836665e-07
                             1.5834227706e+05 3.1789786285e+00 -5.4311712711e-03
                             -2.4075800686e+05 1.2564474874e+01 1.0140109227e+05
                            1e-3'
    function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                 (p04*(Te^4))+(p05*(Te^5))+
                 c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (c^4)*(p40+p41*Te)+(c^5)*p50)'
    outputs = exodus
  [../]

  [./f_gamma]
    type = DerivativeParsedMaterial
    f_name = Fgamma
    args = 'c Te'
    derivative_order             = 2
    constant_names = 'p00 p01 p02 p03
                       p04 p05 p10 p11
                       p12 p13 p14 p20
                       p21 p22 p23 p30
                       p31 p32 p40 p41
                       p50 Magni'
    constant_expressions = '2.6638132921e+03 -5.9596432918e+00 -5.1919540632e-02
                            2.1787365474e-05 -6.1640114011e-09 7.3786451035e-13
                            -1.2067738847e+05 -1.6973439104e+01 2.2276568302e-03
                            -2.6513855167e-06 4.6705803557e-10 1.3085084300e+05
                            1.4329451979e+02 2.1924007070e-03 1.1798624645e-06
                            -4.0025092112e+05 -1.9871973943e+02 -2.5277310381e-03
                            7.4249390180e+05 7.3850873223e+01 -3.5744112976e+05
                            1e-3'
    function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                 (p04*(Te^4))+(p05*(Te^5))+
                 c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (c^4)*(p40+p41*Te)+(c^5)*p50)'
    outputs = exodus
  [../]


#  Noise
  [./MagNoiseE]
    type = ParsedMaterial
    f_name = MagNoiseEta
    args = 'time'
    #constant_names = 'A B'
    function='2.0'
    #outputs = exodus
  [../]

  [./MagNoiseC]
    type = ParsedMaterial
    f_name = MagNoiseC
    args = 'time'
    #constant_names = 'A B'
    #constant_expressions = '0.001 0.006908'
    function='1.0'
    #outputs = exodus
  [../]

[]


# =======================================================
# Kernels
[Kernels]
  #[./MORON_dot]
  #  variable = MORON
  #  type = TimeDerivative
  #[../]
#==========================================================
# Concentration
  # Cs
  [./c_dot]
    variable = c
    type = TimeDerivative
  [../]
  [./w_dot]
    variable = w
    type = TimeDerivative
  [../]

  #[./w_dot]
  #  variable = w
  #  v = c
  #  type = CoupledTimeDerivative
  #[../]
  #[./coupled_res]
  #  args = 'eta1 eta2 eta3 eta4 eta5 Te c'
  #  variable = w
  #  type = SplitCHWRes
  #  mob_name = M
  #[../]
  #[./coupled_parsed]
  #  args = 'eta1 eta2 eta3 eta4 eta5 Te'
  #  variable = c
  #  type = SplitCHParsed
  #  f_name = F
  #  kappa_name = kappa_c
  #  w = w
  #[../]

  #[./ConservedLangevinNoise]
  #  amplitude                    = 1.0
  #  multiplier                   = MagNoiseC
  #  noise                        = ConservedNormalNoise1
  #  seed                         = 201
  #  type                         = ConservedLangevinNoise
  #  variable                     = c
  #  save_in                      = CNoise
  #[../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta1
  [./eta1_dot]
    type                         = TimeDerivative
    variable                     = eta1
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta2
  [./eta2_dot]
    type                         = TimeDerivative
    variable                     = eta2
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta3
  [./eta3_dot]
    type                         = TimeDerivative
    variable                     = eta3
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta4
  [./eta4_dot]
    type                         = TimeDerivative
    variable                     = eta4
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta5
  [./eta5_dot]
    type                         = TimeDerivative
    variable                     = eta5
  [../]

  #--------------------------------------------------------------------------
  # Langrange Eta
  [./SwitchingFunctionConstraintLagrange]
    enable                       = 1
    epsilon                      = 1e-09
    etas                         = 'eta1 eta2 eta3 eta4 eta5'
    h_names                      = 'h1 h2 h3 h4 h5'
    type                         = SwitchingFunctionConstraintLagrange
    variable                     = La_eta
  [../]


  [./q1_dot]
    variable = q1
    type = TimeDerivative
  [../]

  [./q2_dot]
    variable = q2
    type = TimeDerivative
  [../]

  [./S_dot]
    variable = S
    type = TimeDerivative
  [../]

  [./SWT_dot]
    variable = SWT
    type = TimeDerivative
  [../]

  [./R_dot]
    variable = R
    type = TimeDerivative
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
  nl_max_its = 20
  nl_abs_tol = 1e-8
  end_time = 5.0
   dtmax   = 1.0e-1
   start_time                 = 0
 [./TimeStepper]
    # Turn on time stepping
    type = IterationAdaptiveDT
    dt = 5.0e-6
    cutback_factor = 0.8
    growth_factor = 1.5
    optimal_iterations = 8
  [../]
[]

[Postprocessors]
  #[./ave_stress_bottom]
  #  type = SideAverageValue
  #  variable = stress_zz
  #  boundary = bottom
  #[../]
  #[./ave_strain_bottom]
  #  type = SideAverageValue
  #  variable = strain_zz
  #  boundary = bottom
  #[../]
[]

[Outputs]
  interval                       = 1
  exodus = true
  console = true
  print_perf_log = true
  output_initial = true
  #print_linear_residuals         = 0
[]
