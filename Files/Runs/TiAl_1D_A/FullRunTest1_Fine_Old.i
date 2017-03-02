##===============================================================
##: Section Mesh
[Mesh]
  # generate a 2D, 500 mu_m x 500 mu_m mesh
  type = GeneratedMesh
  dim = 2
  elem_type = QUAD4
  nx = 25
  ny = 25
  nz = 0
  xmin = 0
  xmax = 1.0
  ymin = 0
  ymax = 1.0
  zmin = 0
  zmax = 0
[]

##===============================================================
##: Section Mesh
[GlobalParams]
  outputs = exodus
  penalty = 1e3
[]

##===============================================================
##: Section Variables
[Variables]

  [./eta1]
    order = FIRST
    family = LAGRANGE
  [../]

  [./eta2]   # Mole fraction of Cr (unitless)
    order = FIRST
    family = LAGRANGE
  [../]

  [./eta3]   # Mole fraction of Cr (unitless)
    order = FIRST
    family = LAGRANGE
  [../]

  [./La1]   # Phase
    order = FIRST
    family = LAGRANGE
  [../]

  [./q1]   # Mole fraction of Cr (unitless)
    order = FIRST
    family = LAGRANGE
  [../]

  [./q2]   # Mole fraction of Cr (unitless)
    order = FIRST
    family = LAGRANGE
  [../]

  [./LaQ]   # Phase
    order = FIRST
    family = LAGRANGE
  [../]

  [./Te]
    initial_condition = 1950 # Start at room Teperature13
  [../]

  [./c]
    #initial_condition = 0.45 # Start at room Teperature13
  [../]

  [./w]   # Phase
    order = FIRST
    family = LAGRANGE
  [../]
[]

##===============================================================
##: Section Boundary Condition
[BCs]
  # periodic BC as is usually done on phase-field models
  [./Periodic]
    [./c_bcs]
      auto_direction = 'x y'
    [../]
  [../]
[]

##===============================================================
##: Section Kernels
[Kernels]
  # Cs
  [./w_dot]
    variable = w
    v = c
    type = CoupledTimeDerivative
  [../]
  [./coupled_res]
    args = 'eta1 eta2 eta3 Te c'
    variable = w
    type = SplitCHWRes
    mob_name = Mob
  [../]
  [./coupled_parsed]
    args = 'eta1 eta2 eta3 Te'
    variable = c
    type = SplitCHParsed
    f_name = F
    kappa_name = k_c
    w = w
  [../]
  [./ConservedLangevinNoise]
    amplitude                    = 1.0                 # Amplitude
    multiplier                   = MagNoiseC
    noise                        = ConservedNormalNoise1                 # ConservativeNoise userobject that produces the random numbers
    seed                         = 201                           # The seed for the master random number generator
    type                         = ConservedLangevinNoise
    variable                     = c                  # The name of the variable that this Kernel operates on
    save_in                      = CNoise
  [../]
  #--------------------------------------------------------------------------
  # Eta1
  [./eta1_dot]
    type                         = TimeDerivative
    variable                     = eta1
  [../]
  [./ACBulk1]
    type = AllenCahn
    variable = eta1
    args = 'eta2 eta3 Te c'
    mob_name = L1
    f_name = F
  [../]
  [./ACInterface1]
    type = ACMultiInterface
    variable = eta1
    etas = 'eta1 eta2 eta3'
    mob_name = L1
    kappa_names = 'kappa11 kappa12 kappa13'
  [../]
  [./SwitchingFunctionConstraintEta1]
    h_name                       = h1                            # Switching Function Materials that provides h(eta_i)
    implicit                     = 1
    lambda                       = La1                 # Lagrange multiplier
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta1                 # The name of the variable that this Kernel operates on
  [../]
  [./PusztaiBulkEta1]
    Args                          = 'eta2 eta3 Te c'                             # Vector of Etas this object depends on
    Qs                           = 'q1 q2'                            # Vector of Qs this object depends on
    H_name                       = 'HQ'                           # The energy constant of the non-grain boundary phases
    implicit                     = 1                           # Determines whether this object is calculated using an implicit or explicit ...
                                                               # form
    L_name                     = 'L1'                           # The mobility used with the kernel
    P_name                       = 'P1'                  # Interpolation function for phases
    type                         = PusztaiBulk
    variable                     = eta1                 # The name of the variable that this Kernel operates on
    variable_H                   = 1                          # The mobility is a function of any MOOSE variable (if this is set to false ...
                                                               # L must be constant over the entire domain!)
    variable_L                   = 1                           # The mobility is a function of any MOOSE variable (if this is set to false ...
                                                               # L must be constant over the entire domain!)
  [../]
  [./LangevinNoise_eta1]
    amplitude                    = 1.0               # Amplitude
    multiplier                   = MagNoiseEta
    seed                         = 301                           # The seed for the master random number generator
    type                         = LangevinNoise
    variable                     = eta1                 # The name of the variable that this Kernel operates on
    save_in                      = eta1Noise
  [../]

  #--------------------------------------------------------------------------
  # Eta2
  [./eta2_dot]
    type                         = TimeDerivative
    variable                     = eta2
  [../]
  [./ACBulk2]
    type = AllenCahn
    variable = eta2
    args = 'eta1 eta3 Te c'
    mob_name = L1
    f_name = F
  [../]
  [./ACInterface2]
    type = ACMultiInterface
    variable = eta2
    etas = 'eta1 eta2 eta3'
    mob_name = L1
    kappa_names = 'kappa21 kappa22 kappa23'
  [../]
  [./SwitchingFunctionConstraintEta2]
    h_name                       = h2                           # Switching Function Materials that provides h(eta_i)
    implicit                     = 1
    lambda                       = La1                 # Lagrange multiplier
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta2                 # The name of the variable that this Kernel operates on
  [../]
  [./PusztaiBulkEta2]
    Args                         = 'eta1 eta3 Te c'                             # Vector of Etas this object depends on
    Qs                           = 'q1 q2'                            # Vector of Qs this object depends on
    H_name                       = 'HQ'                           # The energy constant of the non-grain boundary phases
    implicit                     = 1                           # Determines whether this object is calculated using an implicit or explicit ...
                                                               # form
    L_name                     = 'L1'                           # The mobility used with the kernel
    P_name                       = 'P1'                  # Interpolation function for phases
    type                         = PusztaiBulk
    variable                     = eta2                 # The name of the variable that this Kernel operates on
    variable_H                   = 1                          # The mobility is a function of any MOOSE variable (if this is set to false ...
                                                               # L must be constant over the entire domain!)
    variable_L                   = 1                           # The mobility is a function of any MOOSE variable (if this is set to false ...
                                                               # L must be constant over the entire domain!)
  [../]
  [./LangevinNoise_eta2]
    amplitude                    = 1.0               # Amplitude
    multiplier                   = MagNoiseEta
    seed                         = 302                           # The seed for the master random number generator
    type                         = LangevinNoise
    variable                     = eta2                 # The name of the variable that this Kernel operates on
    save_in                      = eta2Noise
  [../]
  #--------------------------------------------------------------------------
  # Eta3
  [./eta3_dot]
    type                         = TimeDerivative
    variable                     = eta3
  [../]
  [./ACBulk3]
    type = AllenCahn
    variable = eta3
    args = 'eta1 eta2 Te c'
    mob_name = L1
    f_name = F
  [../]
  [./ACInterface3]
    type = ACMultiInterface
    variable = eta3
    etas = 'eta1 eta2 eta3'
    mob_name = L1
    kappa_names = 'kappa31 kappa32 kappa33'
  [../]
  [./SwitchingFunctionConstraintEta3]
    h_name                       = h3                           # Switching Function Materials that provides h(eta_i)
    implicit                     = 1
    lambda                       = La1                 # Lagrange multiplier
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta3                 # The name of the variable that this Kernel operates on
  [../]
  [./PusztaiBulkEta3]
    Args                         = 'eta1 eta2 Te c'                             # Vector of Etas this object depends on
    Qs                           = 'q1 q2'                            # Vector of Qs this object depends on
    H_name                       = 'HQ'                           # The energy constant of the non-grain boundary phases
    implicit                     = 1                           # Determines whether this object is calculated using an implicit or explicit ...
                                                               # form
    L_name                     = 'L1'                           # The mobility used with the kernel
    P_name                       = 'P1'                  # Interpolation function for phases
    type                         = PusztaiBulk
    variable                     = eta3                 # The name of the variable that this Kernel operates on
    variable_H                   = 1                          # The mobility is a function of any MOOSE variable (if this is set to false ...
                                                               # L must be constant over the entire domain!)
    variable_L                   = 1                           # The mobility is a function of any MOOSE variable (if this is set to false ...
                                                               # L must be constant over the entire domain!)
  [../]
  #--------------------------------------------------------------------------
  # Langrange Eta
  [./SwitchingFunctionConstraintLagrange]
    enable                       = 1                           # Set the enabled status of the MooseObject.
    epsilon                      = 1e-09                       # Shift factor to avoid a zero pivot
    etas                         = 'eta1 eta2 eta3'                  # eta_i order parameters, one for each h
    h_names                      = 'h1 h2 h3'                            # Switching Function Materials that provide h(eta_i)
    implicit                     = 1                           # Determines whether this object is calculated using an implicit or explicit ...
    type                         = SwitchingFunctionConstraintLagrange
    variable                     = La1                  # The name of the variable that this Kernel operates on
  [../]

  #--------------------------------------------------------------------------
  # Q1
  [./q1_dot]
    type                         = TimeDerivative
    variable                     = q1
  [../]

  [./PusztaiInterface1]
    DelQPin                      = 1.0
    DelQMax                      = 1.0
    Args                         = 'eta1 eta2 eta3 Te c'                            # Vector of Etas this object depends on
    Qs                           =  'q2'                           # Vector of Qs this object depends on
    H_name                       = 'HQ'                           # The energy constant of the non-grain boundary phases
    implicit                     = 1                           # Determines whether this object is calculated using an implicit or explicit ...
    L_name                     = 'LQ '                          # The mobility used with the kernel
    P_name                       = 'P1'                  # Interpolation function for phases
    type                         = PusztaiInterface
    variable                     = q1                  # The name of the variable that this Kernel operates on
    variable_H                   = 1                          # The mobility is a function of any MOOSE variable (if this is set to false ...
                                                               # L must be constant over the entire domain!)
    variable_L                   = 1                           # The mobility is a function of any MOOSE variable (if this is set to false ...
                                                               # L must be constant over the entire domain!)
  [../]

  [./SwitchingFunctionConstraintq1]
    h_name                       = hq1                           # Switching Function Materials that provides h(eta_i)
    implicit                     = 1
    lambda                       = LaQ                 # Lagrange multiplier
    type                         = SwitchingFunctionConstraintEta
    variable                     = q1                # The name of the variable that this Kernel operates on
  [../]
  [./LangevinNoise_q1]
    amplitude                    = 1.0               # Amplitude
    multiplier                   = MagNoiseQ
    seed                         = 801                           # The seed for the master random number generator
    type                         = LangevinNoise
    variable                     = q1                 # The name of the variable that this Kernel operates on
    save_in                      = q1Noise
  [../]
  #--------------------------------------------------------------------------
  # Q2
  [./q2_dot]
    type                         = TimeDerivative
    variable                     = q2
  [../]

  [./SwitchingFunctionConstraintq2]
    h_name                       = hq2                           # Switching Function Materials that provides h(eta_i)
    implicit                     = 1
    lambda                       = LaQ                 # Lagrange multiplier
    type                         = SwitchingFunctionConstraintEta
    variable                     = q2                # The name of the variable that this Kernel operates on
  [../]

  [./PusztaiInterface2]
    DelQPin                      = 1.0
    DelQMax                      = 1.0
    Args                         = 'eta1 eta2 eta3 Te c'                            # Vector of Etas this object depends on
    Qs                           =  'q1'                           # Vector of Qs this object depends on
    H_name                       = 'HQ'                           # The energy constant of the non-grain boundary phases
    implicit                     = 1                           # Determines whether this object is calculated using an implicit or explicit ...
    L_name                     = 'LQ '                          # The mobility used with the kernel
    P_name                       = 'P1'                  # Interpolation function for phases
    type                         = PusztaiInterface
    variable                     = q2                  # The name of the variable that this Kernel operates on
    variable_H                   = 1                          # The mobility is a function of any MOOSE variable (if this is set to false ...
                                                               # L must be constant over the entire domain!)
    variable_L                   = 1                           # The mobility is a function of any MOOSE variable (if this is set to false ...
                                                               # L must be constant over the entire domain!)
  [../]

  #--------------------------------------------------------------------------
  # Langrange Q
  [./SwitchingFunctionConstraintLagrangeQ]
    enable                       = 1                           # Set the enabled status of the MooseObject.
    epsilon                      = 1e-09                       # Shift factor to avoid a zero pivot
    etas                         = 'q1 q2'                  # eta_i order parameters, one for each h
    h_names                      = 'hq1 hq2'                            # Switching Function Materials that provide h(eta_i)
    implicit                     = 1                           # Determines whether this object is calculated using an implicit or explicit ...
    type                         = SwitchingFunctionConstraintLagrange
    variable                     = LaQ                  # The name of the variable that this Kernel operates on
  [../]
  #------------------------------------------------------------
  # Te
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
    function                     = '(-2.37e4)*exp(-13.1802*t)+(2.1729)*exp(0.0078*t)'
    #function                     = '(-2.6061e3)*exp(-1.4315*t)+(6.7976)*exp(0.0296*t)'
    #function                     = '(-880.8589)*exp(-0.4421*t)+(8.7685)*exp(0.1709*t)'
    value                        = 0.92                           # Value of heat source. Multiplied by function if present.
    variable                     = Te                # The name of the variable that this Kernel operates on
  [../]
[]
# variable_H                   = 0
# variable_L                   = 0

##===============================================================
##: Section Initial Condition
[ICs]

  [./c]
    type = BoundingBoxIC
    variable = c
    x1 = 0.4
    x2 = 0.6
    y1 = 0.4
    y2 = 0.6
    inside = '0.46'
    outside = '0.46'
  [../]
  [./Eta1]
    type                   = ConstantIC
    value                  = 0.92
    variable               = eta1
  [../]
  [./Eta2]
    type                   = ConstantIC
    value                  = 0.04
    variable               = eta2
  [../]
  [./Eta3]
    type                   = ConstantIC
    value                  = 0.04
    variable               = eta3
  [../]

  #[./q1]
  #  type                   = ConstantIC
  #  value                  = 0.8
  #  variable               = q1
  #[../]
  #
  #[./q2]
  #  type                   = ConstantIC
  #  value                  = 0.6
  #  variable               = q2
  #[../]

  [./q1IC]
    type = BoundingBoxIC
    variable = q1
    x1 = 0.25
    x2 = 0.75
    y1 = 0.25
    y2 = 0.75
    inside = '0.8'
    outside = '0.8'
  [../]
  [./q2IC]
    type = BoundingBoxIC
    variable = q2
    x1 = 0.25
    x2 = 0.75
    y1 = 0.25
    y2 = 0.75
    inside = '0.6'
    outside = '0.6'
  [../]


[]

##===============================================================
##: Section AuxVariables
[AuxVariables]
  [./grad_q1]
    order = CONSTANT
    family = MONOMIAL
  [../]
  [./grad_q2]
    order = CONSTANT
    family = MONOMIAL
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

  [./q1Noise]
    order = FIRST
    family = LAGRANGE
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

##===============================================================
##: Section AuxKernels
[AuxKernels]
  [./VariableGradientComponent1]
    component                    = 'x'                            # The gradient component to compute
    gradient_variable            = 'q1'                  # The variable from which to compute the gradient component
    seed                         = 0                           # The seed for the master random number generator
    type                         = VariableGradientComponent
    variable                     = 'grad_q1'                  # The name of the variable that this object applies to
  [../]

  [./VariableGradientComponent2]
    component                    = 'x'                            # The gradient component to compute
    gradient_variable            = 'q2'                  # The variable from which to compute the gradient component
    seed                         = 0                           # The seed for the master random number generator
    type                         = VariableGradientComponent
    variable                     = 'grad_q2'                  # The name of the variable that this object applies to
  [../]
[]

##===============================================================
##: Section Materials
[Materials]
    [./consts]
      type = GenericConstantMaterial
      prop_names  = 'kappa11 kappa12 kappa13
                     kappa21 kappa22 kappa23
                     kappa31 kappa32 kappa33  k_c'
      prop_values = '1e-3    1e-4    1e-4
                     1e-4    1e-3    1e-4
                     1e-4    1e-4    1e-3   1e-4'
    [../]

    [./HQ]
      type = DerivativeParsedMaterial
      f_name = HQ
      constant_names = 'A1 A2 A3 A4 A5'
      constant_expressions = '19.0 0.0 1400.0 0.007 1.0'
      function = 'A5+(A1*(A2+1.0/(1.0+exp(-A4*(Te-A3)))))'
      #function = '10.0'
      args = 'Te'
    derivative_order             = 2
    [../]

    [./LQ]
      type = DerivativeParsedMaterial
      f_name = LQ
      #function = '(0.4437e-4)*exp(0.002709*Te)'
      function = 1.0e1
      args = 'Te'
    derivative_order             = 2
    [../]

    [./L1]
      type = DerivativeParsedMaterial
      f_name = L1
      #function = '(0.4437e-1)*exp(0.002709*Te)'
      function=1.0e3
      args = 'Te'
    derivative_order             = 2
    [../]

    [./Mob]
      type = DerivativeParsedMaterial
      f_name = Mob
      #function = '(0.4437e-2)*exp(0.002709*Te)'
      #function=1.0e-3
      material_property_names = 'P1:=P1(eta1,eta2)'
      function = '(1.0e-3)*P1'
      args = 'Te eta1 eta2'
    derivative_order             = 2
    [../]
    #========================================
    [./etasummat]
      type = ParsedMaterial
      f_name = etasum
      args = 'eta1 eta2'
      material_property_names = 'h1 h2'
      function = 'h1+h2'
    [../]

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

    [./barrier]
      type = MultiBarrierFunctionMaterial
      etas = 'eta1 eta2 eta3'
      well_only                    = 1
    [../]

    #[./phase_free_energy_1]
    #  type = DerivativeParsedMaterial
    #  f_name = F1
    #  function = '5.0*(eta1^3)*(6*eta1*eta1-15*eta1+10)'
    #  args = 'eta1 q1 q2'
    #derivative_order             = 2
    #[../]
    #
    #[./phase_free_energy_2]
    #  type = DerivativeParsedMaterial
    #  f_name = F2
    #  constant_names = 'B2 B1 B0'
    #  constant_expressions = '500.0 -600.0 135.0'
    #  function = '50.0*(eta2^3)*(6*eta2*eta2-15*eta2+10)'
    #  args = 'eta2 q1 q2'
    #derivative_order             = 2
    #[../]

    #[./phase_free_energy_1]
    #  type = DerivativeParsedMaterial
    #  f_name = h1
    #  function = '(eta1^3)*(6*eta1*eta1-15*eta1+10)'
    #  args = 'eta1'
    #derivative_order             = 2
    #[../]
    #
    #[./phase_free_energy_2]
    #  type = DerivativeParsedMaterial
    #  f_name = h2
    #  function = '(eta2^3)*(6*eta2*eta2-15*eta2+10)'
    #  args = 'eta2'
    #derivative_order             = 2
    #[../]

    [./phase_free_energy_P1]
      type = DerivativeParsedMaterial
      f_name = P1
      material_property_names = 'h1:=h1(eta1) h2:=h2(eta2)'
      function = 'h1+h2'
      args = 'eta1 eta2'
    derivative_order             = 2
    [../]

    #[./phase_free_energy_1]
    #  type = DerivativeParsedMaterial
    #  f_name = F1
    #  function = '5.0'
    #  args = 'eta1 q1 q2'
    #derivative_order             = 2
    #[../]
    #
    #[./phase_free_energy_2]
    #  type = DerivativeParsedMaterial
    #  f_name = F2
    #  function = '50.0'
    #  args = 'eta2 q1 q2'
    #derivative_order             = 2
    #[../]

    [./free_energy]
      type = DerivativeMultiPhaseMaterial
      f_name = F
      fi_names = 'F1  F2 F3 '
      hi_names = 'h1  h2 h3'
      etas     = 'eta1 eta2 eta3'
      args = 'Te c'
      W = 1
    derivative_order             = 2
    [../]
    #----------------------------------------------------
    [./f_gamma]
      type = DerivativeParsedMaterial
      f_name = F1
      args = 'c Te'
      derivative_order             = 2
      constant_names = 'p00 p01 p02 p03
                         p04 p05 p10 p11
                         p12 p13 p14 p20
                         p21 p22 p23 p30
                         p31 p32 p40 p41
                         p50 Magni'
      constant_expressions = '2.88310194e+03  -6.86395322  -5.16068378e-02
                              2.16736974e-05  -6.23144736e-09  7.56347885e-13
                              -1.20766436e+05  -1.01432531  1.61901928e-03
                              -1.28016107e-06  4.45757528e-10  8.09518002e+04
                              5.51957322e+01  -3.92474963e-07  4.73560858e-11
                              -9.83431159e+04  -6.91365347e+01  1.72707033e-07
                              3.14395593e+05  1.71563324e+01  -1.82804901e+05
                              1e-3'
      function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                   (p04*(Te^4))+(p05*(Te^5))+
                   c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                   (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                   (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                   (c^4)*(p40+p41*Te)+(c^5)*p50)'
      outputs = exodus
    [../]

    #----------------------------------------------------
    [./f_alpha2]
      type = DerivativeParsedMaterial
      f_name = F2
      args = 'c Te'
      derivative_order             = 2
      constant_names = 'p00 p01 p02 p03
                         p04 p05 p10 p11
                         p12 p13 p14 p20
                         p21 p22 p23 p30
                         p31 p32 p40 p41
                         p50 Magni'
      constant_expressions = '5.05736671e+02  -1.91902307e+01  -1.70014130e-02
                               -1.93896532e-05  1.40208599e-08  -2.82501261e-12
                               -1.59389369e+05  -8.95611300e+00  7.31056240e-02
                               -3.21054959e-05  4.71465540e-09  2.26536475e+05
                               -1.16286249e+02  -2.72469334e-02  9.84348761e-06
                               7.00550475e+04  1.65095964e+02  -8.39412596e-03
                               -3.10117507e+05  -6.34047647e+01  1.87082121e+05
                               1e-3'
      function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                   (p04*(Te^4))+(p05*(Te^5))+
                   c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                   (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                   (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                   (c^4)*(p40+p41*Te)+(c^5)*p50)'
      outputs = exodus
    [../]

    #----------------------------------------------------
    [./f_grainboundary]
      type = DerivativeParsedMaterial
      f_name = F3
      args = 'c Te'
      derivative_order             = 2
      constant_names = 'p00 p01 p02 p03
                         p04 p05 p10 p11
                         p12 p13 p14 p20
                         p21 p22 p23 p30
                         p31 p32 p40 p41
                         p50 Magni'
      constant_expressions = '4.64810287e+03	-1.77193896e+01	-2.72784656e-02
                              -4.29139038e-06	6.60830665e-09	-1.57158390e-12
                              -1.11203655e+05	4.32822228e+00	3.02413413e-02
                              -2.23363118e-05	4.14464270e-09	-5.36289235e+04
                              -5.49851465e+01	2.51802905e-02	4.00334103e-06
                              5.06217841e+05	3.44774170e+01	-2.81131738e-02
                              -5.47181686e+05	1.21469581e+00	2.13639403e+05
                              1.00000000e-03'
      function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                   (p04*(Te^4))+(p05*(Te^5))+
                   c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                   (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                   (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                   (c^4)*(p40+p41*Te)+(c^5)*p50)'
      outputs = exodus
    [../]
    #========================================
    [./qsummat]
      type = ParsedMaterial
      f_name = qsum
      args = 'q1 q2'
      material_property_names = 'hq1 hq2'
      function = 'hq1+hq2'
    [../]

    [./qsummat2]
      type = ParsedMaterial
      f_name = qsum2
      args = 'q1 q2'
      function = 'q1^2+q2^2'
    [../]

    [./barrierQ]
      type = MultiBarrierFunctionMaterial
      etas = 'q1 q2'
      function_name                = gQ
      well_only                    = 1
    [../]

    [./phase_free_energy_hq1]
      type = DerivativeParsedMaterial
      f_name = hq1
      function = 'q1^2'
      args = 'q1'
    derivative_order             = 2
    [../]

    [./phase_free_energy_hq2]
      type = DerivativeParsedMaterial
      f_name = hq2
      function = 'q2^2'
      args = 'q2'
    derivative_order             = 2
    [../]

    #-----------------------------------------------------------
    [./Heat1]
      type = GenericConstantMaterial
      block = 0
      prop_names = 'thermal_conductivity specific_heat density'
      prop_values = '1.0 1.0 1.0' # W/m*K, J/kg-K, kg/m^3 @ 296K48
    [../]
#-------------------------------------------------------------------
#[./Mob]
#  type = DerivativeParsedMaterial
#  f_name = Mob
#  args = 'c eta1 eta2 Te'
#  material_property_names = 'd2F:=D[F_tot(c,eta),c,c]'
#  constant_names = 'D0gamma Qgamma
#                     D0alpha2 Qalpha2
#                    Rg kVm cVm'
#  constant_expressions = '2.8e2 295e3 1e3 312e3 8.31445 -0.2086e5 0.4048e5'
#  #function = 'if(tem>200.0,
#  #             ((kVm*eta+cVm)^2)*(((D0gamma*exp(-Qgamma/(Rg*tem)))*abs(eta))+
#  #             ((D0alpha2*exp(-Qalpha2/(Rg*tem)))*(1-abs(eta))))/d2F,
#  #             ((kVm*eta+cVm)^2)*(((D0gamma*exp(-Qgamma/(Rg*200.0)))*abs(eta))+
#  #             ((D0alpha2*exp(-Qalpha2/(Rg*200.0)))*(1-abs(eta))))/d2F)'
#  function = ' ((kVm*eta+cVm)^2)*(((D0gamma*exp(-Qgamma/(Rg*Te)))*eta1)+
#               ((D0alpha2*exp(-Qalpha2/(Rg*Te)))*(eta2)))/d2F'
#[../]



[./MagNoiseE]
  type = ParsedMaterial
  f_name = MagNoiseEta
  args = 'Te'
  #constant_names = 'A B'
  #constant_expressions = '0.001 0.006908'
  #function = 'A*exp(B*Te)'
  #function = '100.0'
  constant_names = 'A1 A2 A3 A4 A5'
  constant_expressions = '1000.0 0.0 1500.0 0.01 10.0'
  function = 'A5+(A1*(A2+1.0/(1.0+exp(-A4*(Te-A3)))))'
  #outputs = exodus
[../]

[./MagNoiseQ]
  type = ParsedMaterial
  f_name = MagNoiseQ
  args = 'Te'
  #constant_names = 'A B'
  constant_names = 'A1 A2 A3 A4 A5'
  constant_expressions = '1000.0 0.0 1500.0 0.01 10.0'
  function = 'A5+(A1*(A2+1.0/(1.0+exp(-A4*(Te-A3)))))'
  #function = 'A*exp(B*Te)'
  #outputs = exodus
[../]

[./MagNoiseC]
  type = ParsedMaterial
  f_name = MagNoiseC
  args = 'Te'
  constant_names = 'A1 A2 A3 A4 A5'
  constant_expressions = '1000.0 0.0 1500.0 0.01 10.0'
  function = 'A5+(A1*(A2+1.0/(1.0+exp(-A4*(Te-A3)))))'
  #function = 'A*exp(B*Te)'
  #function = '200'

  #outputs = exodus
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
##: Postprocessors
#[Postprocessors]
  # The total free energy of the simulation cell to observe the energy reduction.
  #[./total_free_energy]
  #  type = ElementIntegralVariablePostprocessor
  #  variable = local_energy
  #[../]
#[]

##===============================================================
##: Executioner
[Executioner]
  type = Transient
  solve_type = NEWTON
  l_max_its = 8
  l_tol = 1e-6
  nl_max_its = 8
  nl_abs_tol = 1e-9
  dtmax                      = 1e-2                       # The maximum timestep size in an adaptive run
  dtmin                      = 1e-12                       # The minimum timestep size in an adaptive run
  end_time = 1.0   # 1 day. We only need to run this long enough to verify
                     # the model is working properly.
  petsc_options_iname = '-pc_type -ksp_gmres_restart -sub_ksp_type
                         -sub_pc_type -pc_asm_overlap'
  petsc_options_value = 'asm      31                  preonly
                         ilu          1'
  dt = 1e-4
[]

##===============================================================
##: Outputs
[Outputs]
  exodus = true
  console = false
[]
