 #=======================================================
 #:Global Params
 [GlobalParams]
   outputs = exodus
   penalty = 1e3
   displacements = 'disp_x disp_y'
 []

 #=======================================================
 #:Mesh

 [Mesh] #Mesh: Generate Mesh
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

 [Mesh] #Mesh: Load Mesh
   file =/home/jl1908/projects/EColi/Files/Runs/Ohnuma/Kenel_1D_C37TxB_R0_out.e
 []

 #=======================================================
 #:MeshModifiers
[MeshModifiers]
 [./SubdomainBoundingBox1]
   block_id                     = 1
   location                     = INSIDE
   top_right                    = '6.0 6.0 0.0'
   bottom_left                  = '2.0 2.0 0.0'
   type                         = SubdomainBoundingBox
 [../]
[]

#=======================================================
#:Variables
[Variables]
 [./eta1]
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eta1
   initial_from_file_timestep = LATEST
 [../]

 [./disp_x]
   initial_from_file_var = disp_x
   initial_from_file_timestep = LATEST
 [../]

 [./disp_y]
   initial_from_file_var = disp_y
   initial_from_file_timestep = LATEST
 [../]
[]



#=======================================================
#:ICs
[ICs]
  [./ConstantIC]
  block                        =    0
  type                         = ConstantIC
  value                        = 0.02
  variable                     = eta
  [../]

  [./BoundingBoxIC]
    block                        = 0
    inside                       = 0
    outside                      = 0
    type                         = BoundingBoxIC
    variable                     = (required)
    x1                           = (required)
    x2                           = (required)
    y1                           = (required)
    y2                           = (required)
    z1                           = 0
    z2                           = 0
  [../]

  [./FunctionIC]
    block                        =
    function                     = (required)
    type                         = FunctionIC
    variable                     = (required)
  [../]

  [./RandomIC1]
    max                    = 1.047197551
    min                    = 0.5235987756
    seed                   = 24579
    type                   = RandomIC
    variable               = R
  [../]

  [./JunyiMultiSmoothCircleIC1]
    3D_spheres             = 0     # in 3D, whether the objects are spheres or columns
    bubspac                = 2.0                  # minimum spacing of bubbles, measured from center to center
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

  [./SmoothCircleIC]
    3D_spheres             = 1                           # in 3D, whether the objects are spheres or columns
    block                  =                             # The list of block ids (SubdomainID) that this object will be applied
    boundary               =                             # The list of boundary IDs from the mesh where this boundary condition ...
                                                         # applies
    control_tags           =                             # Adds user-defined labels for accessing object parameters via control ...
                                                         # logic. ...
                                                         # Group: Advanced
    enable                 = 1                           # Set the enabled status of the MooseObject. ...
                                                         # Group: Advanced
    int_width              = 0                           # The interfacial width of the void surface.  Defaults to sharp interface
    invalue                = (required)                  # The variable value inside the circle
    outvalue               = (required)                  # The variable value outside the circle
    radius                 = (required)                  # The radius of a circle
    rand_seed              = 12345                       # Seed value for the random number generator
    type                   = SmoothCircleIC
    variable               = (required)                  # The variable this initial condition is supposed to provide values for.
    x1                     = (required)                  # The x coordinate of the circle center
    y1                     = (required)                  # The y coordinate of the circle center
    z1                     = 0                           # The z coordinate of the circle center
    zero_gradient          = 0                           # Set the gradient DOFs to zero. This can avoid numerical problems with ...
                                                         # higher order shape functions and overlapping circles.
  [../]
[]

#=======================================================
#:BCs
[BCs]
  [./Periodic]
    [./c_bcs]
      auto_direction = 'x y'
    [../]
  [../]

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

#=======================================================
#:UserObjects
[UserObjects]
  [./ConservedNormalNoise1]
    execute_on                   = TIMESTEP_BEGIN              # Set to (nonlinear|linear|timestep_end|timestep_begin|custom) to execute ...
    seed                         = 201                           # The seed for the master random number generator
    type                         = ConservedNormalNoise
    use_displaced_mesh           = 0                           # Whether or not this object should use the displaced mesh for computation. .
  [../]
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


#=======================================================
#:AuxVariables
[AuxVariables]
  [./CNoise]
    order = FIRST
    family = LAGRANGE
  [../]

  #==============================
  [./GlobalFreeEnergy]
      variable = Fglobal
      type = KKSGlobalFreeEnergy
      fa_name = fl
      fb_name = fs
      w = 2.5
  [../]

  [./elastic_strain_xx]
    family = MONOMIAL
    order = CONSTANT
  [../]
  [./elastic_strain_yy]
    family = MONOMIAL
    order = CONSTANT
  [../]
[]

#=======================================================
#:AuxKernels
[AuxKernels]
  [./FunctionAux2]
    function                     = 't'
    type                         = FunctionAux
    variable                     = time
  [../]

  [./JunyiAngle2Value1]
    type                         = JunyiAngle2Value
    Switch                       = SWT
    SwitchValues                 = S
    RndValues                    = R
    Component                    = 1
    variable                     = Junyi1
  [../]

  [./VariableGradientComponent4]
    component                    = 'y'
    gradient_variable            = 'q2'
    type                         = VariableGradientComponent
    variable                     = 'grad_q2y'
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

  [./elastic_strain_xx]
    type = RankTwoAux
    variable = elastic_strain_xx
    rank_two_tensor = elastic_strain
    index_i = 0
    index_j = 0
  [../]

  [./total_strain_xx]
    type = RankTwoAux
    variable = total_strain_xx
    rank_two_tensor = total_strain
    index_i = 0
    index_j = 0
  [../]

  [./ElasticEnergyAux]
    base_name                    =                             # Mechanical property base name
    block                        =                             # The list of block ids (SubdomainID) that this object will be applied
    boundary                     =                             # The list of boundary IDs from the mesh where this boundary condition ...
                                                               # applies
    control_tags                 =                             # Adds user-defined labels for accessing object parameters via control ...
                                                               # logic. ...
                                                               # Group: Advanced
    enable                       = 1                           # Set the enabled status of the MooseObject. ...
                                                               # Group: Advanced
    execute_on                   = LINEAR                      # Set to (nonlinear|linear|timestep_end|timestep_begin|custom) to execute ...
                                                               # only at that moment
    seed                         = 0                           # The seed for the master random number generator ...
                                                               # Group: Advanced
    type                         = ElasticEnergyAux
    use_displaced_mesh           = 0                           # Whether or not this object should use the displaced mesh for computation. ...
                                                               # Note that in the case this is true but no displacements are provided ...
                                                               # in the Mesh block the undisplaced mesh will still be used. ...
                                                               # Group: Advanced
    variable                     = (required)                  # The name of the variable that this object applies to
  [../]

  [./MaterialRealAux]
    block                        =                             # The list of block ids (SubdomainID) that this object will be applied
    boundary                     =                             # The list of boundary IDs from the mesh where this boundary condition ...
                                                               # applies
    control_tags                 =                             # Adds user-defined labels for accessing object parameters via control ...
                                                               # logic. ...
                                                               # Group: Advanced
    enable                       = 1                           # Set the enabled status of the MooseObject. ...
                                                               # Group: Advanced
    execute_on                   = LINEAR                      # Set to (nonlinear|linear|timestep_end|timestep_begin|custom) to execute ...
                                                               # only at that moment
    factor                       = 1                           # The factor by which to multiply your material property for visualization
    offset                       = 0                           # The offset to add to your material property for visualization
    property                     = (required)                  # The scalar material property name
    seed                         = 0                           # The seed for the master random number generator ...
                                                               # Group: Advanced
    type                         = MaterialRealAux
    use_displaced_mesh           = 0                           # Whether or not this object should use the displaced mesh for computation. ...
                                                               # Note that in the case this is true but no displacements are provided ...
                                                               # in the Mesh block the undisplaced mesh will still be used. ...
                                                               # Group: Advanced
    variable                     = (required)                  # The name of the variable that this object applies to
  [../]

  [./<TotalFreeEnergy>]
    # Total free energy (both the bulk and gradient parts), where the bulk free energy has been defined
    # in a material
    additional_free_energy = 0.0             # Coupled variable holding additional free energy contributions
                                             # to be summed up
    block                  =                 # The list of block ids (SubdomainID) that this object
                                             # will be applied
    boundary               =                 # The list of boundary IDs from the mesh where this boundary
                                             # condition applies
    control_tags           =                 # Adds user-defined labels for accessing object parameters
                                             # via control logic.
                                             # Group: Advanced
    enable                 = 1               # Set the enabled status of the MooseObject.
                                             # Group: Advanced
    execute_on             = LINEAR          # Set to (nonlinear|linear|timestep_end|timestep_begin|custom)
                                             # to execute only at that moment
    f_name                 = F               # Base name of the free energy function
    interfacial_vars       =                 # Variable names that contribute to interfacial energy
    kappa_names            =                 # Vector of kappa names corresponding to each variable
                                             # name in interfacial_vars in the same order.
    seed                   = 0               # The seed for the master random number generator
                                             # Group: Advanced
    type                   = TotalFreeEnergy
    use_displaced_mesh     = 0               # Whether or not this object should use the displaced mesh
                                             # for computation.  Note that in the case this is true
                                             # but no displacements are provided in the Mesh block the
                                             # undisplaced mesh will still be used.
                                             # Group: Advanced
    variable               = (required)      # The name of the variable that this object applies to
  [../]

  [./ParsedAux]
    args                         =                             # coupled variables
    block                        =                             # The list of block ids (SubdomainID) that this object will be applied
    boundary                     =                             # The list of boundary IDs from the mesh where this boundary condition ...
                                                               # applies
    constant_expressions         =                             # Vector of values for the constants in constant_names (can be an FParser ...
                                                               # expression)
    constant_names               =                             # Vector of constants used in the parsed function (use this for kB etc.)
    control_tags                 =                             # Adds user-defined labels for accessing object parameters via control ...
                                                               # logic. ...
                                                               # Group: Advanced
    disable_fpoptimizer          = 0                           # Disable the function parser algebraic optimizer ...
                                                               # Group: Advanced
    enable                       = 1                           # Set the enabled status of the MooseObject. ...
                                                               # Group: Advanced
    enable_ad_cache              = 1                           # Enable cacheing of function derivatives for faster startup time ...
                                                               # Group: Advanced
    enable_auto_optimize         = 1                           # Enable automatic immediate optimization of derivatives ...
                                                               # Group: Advanced
    enable_jit                   = 1                           # Enable just-in-time compilation of function expressions for faster evaluation ...
                                                               # Group: Advanced
    execute_on                   = LINEAR                      # Set to (nonlinear|linear|timestep_end|timestep_begin|custom) to execute ...
                                                               # only at that moment
    fail_on_evalerror            = 0                           # Fail fatally if a function evaluation returns an error code (otherwise ...
                                                               # just pass on NaN) ...
                                                               # Group: Advanced
    function                     = (required)                  # function expression
    seed                         = 0                           # The seed for the master random number generator ...
                                                               # Group: Advanced
    type                         = ParsedAux
    use_displaced_mesh           = 0                           # Whether or not this object should use the displaced mesh for computation. ...
                                                               # Note that in the case this is true but no displacements are provided ...
                                                               # in the Mesh block the undisplaced mesh will still be used. ...
                                                               # Group: Advanced
    variable                     = (required)                  # The name of the variable that this object applies to
  [../]

  [./Von_Mises_stress]
    type = RankTwoScalarAux
    variable = Von_Mises_stress
    rank_two_tensor = stress
    scalar_type = VonMisesStress
  [../]
[]

#=======================================================
#:Materials
[Materials]

  [./TimeStepMaterial]
    compute                      = 1                           # When false MOOSE will not call compute methods on this material, compute ...
    enable                       = 1
    implicit                     = 1
    outputs                      = none
    prop_dt                      = dt                          # Material property to store the current dt
    prop_time                    = time                        # Material property to store the current time
    prop_time_step               = time_step                   # Material property to store the current time step number
    type                         = TimeStepMaterial
  [../]

  # Shared Constants
  [./consts]
    type = GenericConstantMaterial
    prop_names  = 'Leta  kappaEta kappa_c'
    prop_values = '6.4e1 0.15e-1  0.0625e-8'
  [../]

  # Direction
  [./HQ]
    type = DerivativeParsedMaterial
    f_name = HQ
    function = '(0.25e-2)*Te'
    args = 'Te'
    derivative_order             = 1
    outputs = exodus
  [../]

  [./PQ]
    type = DerivativeParsedMaterial
    f_name = PQ
    function = '(1.0-eta1)^2'
    args = 'eta1'
    derivative_order             = 1
  [../]

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

  [./LQ]
    type = DerivativeParsedMaterial
    f_name = LQ
    constant_names = 'LQMin LQMax'
    constant_expressions = '1e-4 0.64e2'
    #constant_names = 'L00 L11 L10 L01'
    #constant_expressions = '0.64e3 0.64e1 1e-2 0.64e3'
    #material_property_names = 'h1:=h1(eta1)  hp1:=hp1(phi1)'
    function = 'LQMax+(LQMin-LQMax)*(1.0-(eta1^3)*(10.0-15.0*eta1+6.0*(eta1^2)))'
    #function = '(L11+L00-L10-L01)*h1*hp1+hp1*(L10-L00)+h1*(L01-L00)+L00'
    args = 'eta1'
    derivative_order             = 1
    outputs = exodus
  [../]
  [./MagNoiseQ]
    type = ParsedMaterial
    f_name = MagNoiseQ
    args = 'Te time'
    #constant_names = 'A B'
    #constant_expressions = '0.001 0.006908'
    function = '(3.0e2)*exp(-30.0*time)'
    #outputs = exodus
  [../]

  # Penalty
  [./g_eta1]
    type = BarrierFunctionMaterial
    g_order = SIMPLE
    eta = eta1
    function_name  = g1
    well_only                    = 1
  [../]
  [./g_eta2]
    type = BarrierFunctionMaterial
    g_order = SIMPLE
    eta = eta2
    function_name  = g2
    well_only                    = 1
  [../]
  [./Penalty1]
    type = DerivativeParsedMaterial
    f_name =Pen1
    material_property_names = 'g1:=g1(eta1)  g2:=g2(eta2)'
    function = '(g1+g2)*1.0'
    args = 'eta1 eta2'
    derivative_order             = 1
    outputs = exodus
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

  [./CrossTermBarrierFunctionMaterial]
    W_ij                         = (required)                  # Terms controlling barrier height set W=1 in DerivativeMultiPhaseMaterial ...
    etas                         = (required)                  # eta_i order parameters, one for each h
    function_name                = g                           # actual name for g(eta_i)
    g_order                      = SIMPLE                      # Polynomial order of the barrier function g(eta)
    outputs                      = none                        # Vector of output names were you would like to restrict the output of ...
    type                         = CrossTermBarrierFunctionMaterial
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
  function ='(sqrt(eta1^2)*MLq+sqrt(eta2^2)*Malpha+sqrt(eta3^2)*Mbeta+sqrt(eta4^2)*Malpha2+sqrt(eta5^2)*Mgamma)/d2F'
   outputs = exodus
  [../]

  #----------------------------------------------------
  # Chemical Energy

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

  ## Eigenstrain
  [./elasticity_tensor]
    type = ComputeElasticityTensor
    fill_method                  = symmetric9
    C_ijkl                       = '175.0e1 88.7e1 62.3e1 175.0e1 62.3e1 220.0e1 62.2e1 62.2e1 43.15e1'
  [../]

  [./e1]
    # eigenstrain per Kelvin for crystal 1
    type = GenericConstantRankTwoTensor
    tensor_values = '-0.0277 0.0093 0.0828 0.1768 0 0'
    tensor_name = e1
  [../]
  [./e2]
    # eigenstrain per Kelvin for crystal 2
    type = GenericConstantRankTwoTensor
    tensor_values = '-0.0277 0.0093 0.0828 -0.1768 0 0'
    tensor_name = e2
  [../]


  [./func1]
    type = DerivativeParsedMaterial
    # thermal expansion at 300K is zero
    function = eta51^2
    f_name = fe1
    args = 'eta51'
  [../]
  [./func2]
    type = DerivativeParsedMaterial
    # thermal expansion at 300K is zero
    function = eta52^2
    f_name = fe2
    args = 'eta52'
  [../]

  [./eigenstrain]
    type = CompositeEigenstrain
    tensors = 'e1 e2 '
    weights = 'fe1 fe2 '
    args = 'eta51 eta52 '
      eigenstrain_name             = EigenStrain
  [../]

  [./ElasticEnergyMaterial]
    args                         = 'eta51 eta52 '                  # Arguments of F() - use vector coupling
    derivative_order             = 3                           # Maximum order of derivatives taken (2 or 3)
    f_name                       = FEl                           # Base name of the free energy function (used to name the material properties)
    outputs                      = exodus                        # Vector of output names were you would like to restrict the output of ...
    type                         = ElasticEnergyMaterial
  [../]

  [./strain]
    type = ComputeSmallStrain
    displacements = 'disp_x disp_y'
    eigenstrain_names        = EigenStrain
  [../]
  [./stress]
    type = ComputeLinearElasticStress
    eigenstrain_names        = EigenStrain
  [../]

[./stress]
    type = ComputeMultiPlasticityStress
    ep_plastic_tolerance = 1e-9
    plastic_models = J2
  [../]
  [./DerivativeSumMaterial]
    args                         = (required)                  # Arguments of the free energy functions being summed - use vector coupling
    block                        =                             # The list of block ids (SubdomainID) that this object will be applied
    boundary                     =                             # The list of boundary IDs from the mesh where this boundary condition ...
                                                               # applies
    compute                      = 1                           # When false MOOSE will not call compute methods on this material, compute ...
                                                               # then must be called retrieving the Material object via MaterialPropertyInterface::getMaterial ...
                                                               # and calling the computeProerties method. Non-computed Materials are not ...
                                                               # sorted for dependencies.
    constant                     = 0                           # Constant to be added to the prefactor multiplied sum. ...
                                                               # Group: Advanced
    control_tags                 =                             # Adds user-defined labels for accessing object parameters via control ...
                                                               # logic. ...
                                                               # Group: Advanced
    derivative_order             = 3                           # Maximum order of derivatives taken (2 or 3)
    displacement_gradients       =                             # Vector of displacement gradient variables (see Modules/PhaseField/DisplacementGradients ...
                                                               # action)
    enable                       = 1                           # Set the enabled status of the MooseObject. ...
                                                               # Group: Advanced
    f_name                       = F                           # Base name of the free energy function (used to name the material properties)
    implicit                     = 1                           # Determines whether this object is calculated using an implicit or explicit ...
                                                               # form ...
                                                               # Group: Advanced
    output_properties            =                             # List of material properties, from this material, to output (outputs must ...
                                                               # also be defined to an output type) ...
                                                               # Group: Outputs
    outputs                      = none                        # Vector of output names were you would like to restrict the output of ...
                                                               # variables(s) associated with this object ...
                                                               # Group: Outputs
    prefactor                    =                             # Prefactor to multiply the sum term with. ...
                                                               # Group: Advanced
    seed                         = 0                           # The seed for the master random number generator ...
                                                               # Group: Advanced
    sum_materials                =                             # Base name of the free energy function (used to name the material properties)
    third_derivatives            =                             # Flag to indicate if third derivatives are needed
    type                         = DerivativeSumMaterial
    use_displaced_mesh           = 0                           # Whether or not this object should use the displaced mesh for computation. ...
                                                               # Note that in the case this is true but no displacements are provided ...
                                                               # in the Mesh block the undisplaced mesh will still be used. ...
                                                               # Group: Advanced
  [../]
  #----------------------------------------------------
  #  Noise
  [./MagNoiseE]
    type = ParsedMaterial
    f_name = MagNoiseEta
    args = 'time'
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

  #----------------------------------------------------
  # Fattbert
  [./f_liquid]
    type = DerivativeParsedMaterial
    f_name = fl
    args = 'c Te'
    derivative_order             = 2
    constant_names = 'p00 p01 p02 p03
                       p04 p05 p10 p11
                       p12 p13 p14 p20
                       p21 p22 p23 p30
                       p31 p32 p40 p41
                       p50 Magni'
    constant_expressions = '9.1623365976e+03  -2.8397028407e+01 -6.3156575278e-02 3.6018344131e-05
                          -1.3096609499e-08 1.9520979641e-12  1.4418965627e+04  -1.7780325545e+01
                          -1.7659941963e-03 2.1352800637e-07  -4.0732675928e-11 -1.2227000000e+04
                          6.1461747534e+01  -9.2378867299e-15 4.6453032206e-18 4.8450000000e+03
                          -5.5622129201e+01 -5.3990255022e-15 -1.9380000000e+03 2.8001564601e+01
                          -1.3443386108e-08 0.130208333333'
    function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                 (p04*(Te^4))+(p05*(Te^5))+
                 c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (c^4)*(p40+p41*Te)+(c^5)*p50)'
    outputs = exodus
  [../]

  [./f_solid]
    type = DerivativeParsedMaterial
    f_name = fs
    args = 'c Te'
    derivative_order             = 2
    constant_names = 'p00 p01 p02 p03
                       p04 p05 p10 p11
                       p12 p13 p14 p20
                       p21 p22 p23 p30
                       p31 p32 p40 p41
                       p50 Magni'
    constant_expressions = '-2.6259204035e+03 -2.2552529566e+01 -5.5150997498e-02 2.7658754078e-05
                            -9.2031160367e-09 1.3081318578e-12 2.1346450020e+04 -1.8475075045e+01
                            -1.4585383098e-03 2.3099493761e-07 -9.6645911860e-11 -2.3810003210e+03
                            4.9554247534e+01 -8.0343184025e-15 3.5403201913e-18 -1.3857999786e+04
                            -4.1805129201e+01 -3.3800359527e-15 -4.0160000000e+03 2.6621564601e+01
                            -9.2352019506e-09  0.130208333333'
    function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                 (p04*(Te^4))+(p05*(Te^5))+
                 c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (c^4)*(p40+p41*Te)+(c^5)*p50)'
    outputs = exodus
  [../]

  [./DerivativeTwoPhaseMaterial]
    args                         = 'c Te'
    W                            = 2.5                           # Energy barrier for the phase transformation from A to B
    derivative_order             = 3                           # Maximum order of derivatives taken (2 or 3)
    eta                          = 'eta'                  # Order parameter
    f_name                       = 'F'                           # Base name of the free energy function (used to name the material properties)
    fa_name                      = 'fl'                  # Phase A material (at eta=0)
    fb_name                      = 'fs'                  # Phase A material (at eta=1)
    g                            = 'g'                           # Barrier Function Material that provides g(eta)
    h                            = 'h'                           # Switching Function Material that provides h(eta)
    implicit                     = 1                           # Determines whether this object is calculated using an implicit or explicit ...
    outputs                      = none                        # Vector of output names were you would like to restrict the output of ...
                                                               # variables(s) associated with this object
    type                         = DerivativeTwoPhaseMaterial
  [../]

  # Heat
  [./Heat1]
    type = GenericConstantMaterial
    prop_names = 'thermal_conductivity specific_heat density'
    prop_values = '1.0 1.0 1.0' # W/m*K, J/kg-K, kg/m^3 @ 296K48
  [../]
[]

#=======================================================
#:Kernels
[Kernels]

  ## Eigenstrains
  [./TensorMechanics]
      displacements = 'disp_x disp_y'
      eigenstrain_names        = EigenStrain
  [../]

  #==========================================================
  # Concentration
  # Cs
  [./w_dot]
    variable = w
    v = c
    type = CoupledTimeDerivative
  [../]
  [./coupled_res]
    args = 'eta1 eta2 eta3 eta4 eta5 Te c'
    variable = w
    type = SplitCHWRes
    mob_name = M
  [../]
  [./coupled_parsed]
    args = 'eta1 eta2 eta3 eta4 eta5 Te'
    variable = c
    type = SplitCHParsed
    f_name = F
    kappa_name = kappa_c
    w = w
  [../]

  [./ConservedLangevinNoise]
    amplitude                    = 1.0
    multiplier                   = MagNoiseC
    noise                        = ConservedNormalNoise1
    seed                         = 201
    type                         = ConservedLangevinNoise
    variable                     = c
    save_in                      = CNoise
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
    args = 'eta2 eta3 eta4 eta5 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface1]
    type = ACMultiInterface
    variable = eta1
    etas = 'eta1 eta2 eta3 eta4 eta5'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta1]
    h_name                       = h1
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta1
  [../]
  [./LangevinNoise_eta1]
    amplitude                    = 1.0
    multiplier                   = MagNoiseEta
    seed                         = 1001
    type                         = LangevinNoise
    variable                     = eta1
    save_in                      = eta1Noise
  [../]
  [./ACBulkPen1]
    type = AllenCahn
    variable = eta1
    args = 'eta2 eta3 eta4 eta5 Te c'
    mob_name = Leta
    f_name = Pen1
  [../]

  [./PusztaiBulkEta1]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2 eta3 eta4 eta5'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Leta'
    P_name                       = 'PQ'
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
    args = 'eta1 eta3 eta4 eta5 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface2]
    type = ACMultiInterface
    variable = eta2
    etas = 'eta1 eta2 eta3 eta4 eta5'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta2]
    h_name                       = h2
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta2
  [../]
  [./LangevinNoise_eta2]
    amplitude                    = 1.0
    multiplier                   = MagNoiseEta
    seed                         = 1201
    type                         = LangevinNoise
    variable                     = eta2
    save_in                      = eta2Noise
  [../]

  [./PusztaiBulkEta2]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta1 eta3 eta4 eta5'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Leta'
    P_name                       = 'PQ'
    type                         = PusztaiACBulk
    variable                     = eta2
    variable_H                   = 1
    variable_L                   = 1
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta3
  [./eta3_dot]
    type                         = TimeDerivative
    variable                     = eta3
  [../]
  [./ACBulk3]
    type = AllenCahn
    variable = eta3
    args = 'eta1 eta2 eta4 eta5 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface3]
    type = ACMultiInterface
    variable = eta3
    etas = 'eta1 eta2 eta3 eta4 eta5'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta3]
    h_name                       = h3
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta3
  [../]
  [./LangevinNoise_eta3]
    amplitude                    = 1.0
    multiplier                   = MagNoiseEta
    seed                         = 1301
    type                         = LangevinNoise
    variable                     = eta3
    save_in                      = eta3Noise
  [../]
  [./PusztaiBulkEta3]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2 eta1 eta4 eta5'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Leta'
    P_name                       = 'PQ'
    type                         = PusztaiACBulk
    variable                     = eta3
    variable_H                   = 1
    variable_L                   = 1
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta4
  [./eta4_dot]
    type                         = TimeDerivative
    variable                     = eta4
  [../]
  [./ACBulk4]
    type = AllenCahn
    variable = eta4
    args = 'eta2 eta3 eta1 eta5 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface4]
    type = ACMultiInterface
    variable = eta4
    etas = 'eta1 eta2 eta3 eta4 eta5'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta4]
    h_name                       = h4
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta4
  [../]
  [./LangevinNoise_eta4]
    amplitude                    = 1.0
    multiplier                   = MagNoiseEta
    seed                         = 1401
    type                         = LangevinNoise
    variable                     = eta4
    save_in                      = eta4Noise
  [../]
  [./PusztaiBulkEta4]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2 eta3 eta1 eta5'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Leta'
    P_name                       = 'PQ'
    type                         = PusztaiACBulk
    variable                     = eta4
    variable_H                   = 1
    variable_L                   = 1
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta5
  [./eta5_dot]
    type                         = TimeDerivative
    variable                     = eta5
  [../]
  [./ACBulk5]
    type = AllenCahn
    variable = eta5
    args = 'eta2 eta3 eta4 eta1 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface5]
    type = ACMultiInterface
    variable = eta5
    etas = 'eta1 eta2 eta3 eta4 eta5'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta5]
    h_name                       = h5
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta5
  [../]
  [./LangevinNoise_eta5]
    amplitude                    = 1.0
    multiplier                   = MagNoiseEta
    seed                         = 5001
    type                         = LangevinNoise
    variable                     = eta5
    save_in                      = eta5Noise
  [../]
  [./PusztaiBulkEta5]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2 eta3 eta4 eta1'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Leta'
    P_name                       = 'PQ'
    type                         = PusztaiACBulk
    variable                     = eta5
    variable_H                   = 1
    variable_L                   = 1
  [../]

  #--------------------------------------------------------------------------
  # Langrange Eta
  [./SwitchingFunctionConstraintLagrange]
    enable                       = 1
    epsilon                      = 1e-09
    etas                         = 'eta1 eta2 eta3 eta4 eta5'
    h_names                      = 'h1 h2 h3 h4 h5'
    h_names                      = 'hs1 hs2 hs3 hs4 hs5'
    type                         = SwitchingFunctionConstraintLagrange
    variable                     = La_eta
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
      Args                         = 'eta1 eta2 eta3 eta4 eta5 c Te'
      Qs                           =  'q2'
      H_name                       = 'HQ'
      L_name                       = 'LQ '
      P_name                       = 'PQ'
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

    [./ACInterfaceQ1]
      args                         =  'eta1 eta2 eta3 eta4 eta5 Te c q2'
      kappa_name                   = 'kappaQ'
      mob_name                     = 'LQ'
      type                         = ACInterface
      variable                     = 'q1'
      variable_L                   = 1
    [../]
    [./LangevinNoise_q1]
      amplitude                    = 1.0
      multiplier                   = MagNoiseQ
      seed                         = 8432541
      type                         = LangevinNoise
      variable                     = q1
      #save_in                      = q1Noise
    [../]
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
      Args                         = 'eta1 eta2 eta3 eta4 eta5 c Te'
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
    [./ACInterfaceQ2]
      args                         =  'eta1 eta2 eta3 eta4 eta5 Te c q1'
      kappa_name                   = 'kappaQ'
      mob_name                     = 'LQ'
      type                         = ACInterface
      variable                     = 'q2'
      variable_L                   = 1
    [../]

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


    # ---------------------------------------------
    # Fattbert
    # enforce c = (1-h(eta))*cl + h(eta)*cs
    [./PhaseConc]
      type = KKSPhaseConcentration
      ca       = cl
      variable = cs
      c        = c
      eta      = eta
    [../]

    # enforce pointwise equality of chemical potentials
    [./ChemPotSolute]
      type = KKSPhaseChemicalPotential
      args_a   = 'Te'
      args_b   = 'Te'
      variable = cl
      cb       = cs
      fa_name  = fl
      fb_name  = fs
    [../]

    #
    # Cahn-Hilliard Equation
    #
    [./CHBulk]
      type = KKSSplitCHCRes
      args_a   = 'Te'
      variable = c
      ca       = cl
      cb       = cs
      fa_name  = fl
      fb_name  = fs
      w        = w
    [../]

    [./dcdt]
      type = CoupledTimeDerivative
      variable = w
      v = c
    [../]
    [./ckernel]
      type = SplitCHWRes
      mob_name = M
      variable = w
    [../]
    [./coupled_parsed]
        variable = c
        type = SplitCHParsed
        f_name = f_dummy
        kappa_name = kappa_c
        w = w
      [../]

    # Allen-Cahn Equation
    #
    [./AllenCahnPenalty]
      enable                       = 1                           # Set the enabled status of the MooseObject.
      f_name                       = 'Pen1'                  # Base name of the free energy function F defined in a DerivativeParsedMaterial
      implicit                     = 1                           # Determines whether this object is calculated using an implicit or explicit ...
                                                                 # form
      mob_name                     = 'Leta'                           # The mobility used with the kernel
      type                         = AllenCahn
      variable                     = 'eta Te'                   # The name of the variable that this Kernel operates on
    [../]
    [./ACBulkF]
      type = KKSACBulkF
      variable = eta
      fa_name  = fl
      fb_name  = fs
      w        = 2.5
      args = 'cl cs Te'
      mob_name = 'Leta'
    [../]
    [./ACBulkC]
      type = KKSACBulkC
      args = 'cl cs Te'
      variable = eta
      ca       = cl
      cb       = cs
      fa_name  = fl
      fb_name  = fs
      mob_name = 'Leta'
    [../]
    [./ACInterface]
      type = ACInterface
      variable = eta
      kappa_name = kappa_eta
          mob_name = 'Leta'
    [../]
    [./detadt]
      type = TimeDerivative
      variable = eta
    [../]
    [./PusztaiBulkEta]
      Correction_y0                      = 1.0
      Correction_Z                      = 1.0
      Args                          = 'c Te'
      Qs                           = 'q1 q2'
      H_name                       = 'HQ'
      implicit                     = 1

      L_name                     = 'Leta'
      P_name                       = 'P1'
      type                         = PusztaiACBulk
      variable                     = eta
      variable_H                   = 1
      variable_L                   = 1
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
  [./HeatSource]
    type                         = HeatSource
    value                        = -400.0
    variable                     = Te
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
  solve_type = 'NEWTON'  # OR PJFNK
  petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type'
  petsc_options_value = 'asm      ilu          nonzero'
  l_max_its = 40
  nl_max_its = 30
  nl_abs_tol = 1e-8
  end_time = 2.2
   dtmax   = 1.0e-3
   start_time                 = 0.00778596352
 [./TimeStepper]
    # Turn on time stepping
    type = IterationAdaptiveDT
    dt = 1.0e-5
    cutback_factor = 0.8
    growth_factor = 1.5
    optimal_iterations = 12
  [../]
[]

##===============================================================
##: Outputs
[Outputs]
  interval                       = 10
  exodus = true
  console = false
  print_perf_log = true
  output_initial = true
  #print_linear_residuals         = 0
[]
