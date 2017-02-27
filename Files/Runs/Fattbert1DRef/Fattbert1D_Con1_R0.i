[Mesh]
  type = GeneratedMesh
  dim = 2
  elem_type = QUAD4
  nx = 1000
  ny = 1
  nz = 0
  xmin = 0
  xmax = 2.0e1
  ymin = 0
  ymax = 2.0e1
  zmin = 0
  zmax = 0
[]
[MeshModifiers]
  [./SubdomainBoundingBox1]
    block_id                     = 1                 # Subdomain id to set for inside/outside the bounding box
    block_name                   =                             # Subdomain name to set for inside/outside the bounding box (optional)

    control_tags                 =                             # Adds user-defined labels for accessing object parameters via control ...
                                                               # logic.
    depends_on                   =                             # The MeshModifiers that this modifier relies upon (i.e. must execute before ...
                                                               # this one)
    enable                       = 1                           # Set the enabled status of the MooseObject.
    force_prepare                = 0                           # Normally all MeshModifiers run before the mesh is prepared for use. This ...
                                                               # flag can be set on an individual modifier to force preperation between ...
                                                               # modifiers where they might be needed.
    location                     = INSIDE                      # Control of where the subdomain id is to be set
    #top_right                    = '0.5665e-1 2.0e-1 0.0'                  # The bottom left point (in x,y,z with spaces in-between).
    #bottom_left                  = '0.4335e-1 0.0 0.0'                  # The bottom left point (in x,y,z with spaces in-between).
    top_right                    = '0.5865e1 2.0e1 0.0'                  # The bottom left point (in x,y,z with spaces in-between).
    bottom_left                  = '0.4135e1 0.0 0.0'
    type                         = SubdomainBoundingBox
  [../]
  [./SubdomainBoundingBox2]
    block_id                     = 2                 # Subdomain id to set for inside/outside the bounding box
    block_name                   =                             # Subdomain name to set for inside/outside the bounding box (optional)

    control_tags                 =                             # Adds user-defined labels for accessing object parameters via control ...
                                                               # logic.
    depends_on                   =                             # The MeshModifiers that this modifier relies upon (i.e. must execute before ...
                                                               # this one)
    enable                       = 1                           # Set the enabled status of the MooseObject.
    force_prepare                = 0                           # Normally all MeshModifiers run before the mesh is prepared for use. This ...
                                                               # flag can be set on an individual modifier to force preperation between ...
                                                               # modifiers where they might be needed.
    location                     = INSIDE                      # Control of where the subdomain id is to be set
    top_right                    = '1.5865e1 2.0e1 0.0'                  # The bottom left point (in x,y,z with spaces in-between).
    bottom_left                  = '1.4131e1 0.0 0.0'                  # The bottom left point (in x,y,z with spaces in-between).
    #top_right                    = '1.5665e-1 2.0e-1 0.0'                  # The bottom left point (in x,y,z with spaces in-between).
    #bottom_left                  = '1.4331e-1 0.0 0.0'                  # The bottom left point (in x,y,z with spaces in-between).
    type                         = SubdomainBoundingBox
  [../]
[]


# =======================================================
# Variables
[Variables]
  # order parameter
  [./eta]
    order = FIRST
    family = LAGRANGE
  [../]

  # hydrogen concentration
  [./c]
    order = FIRST
    family = LAGRANGE
  [../]

  # chemical potential
  [./w]
    order = FIRST
    family = LAGRANGE
  [../]

  # Liquid phase solute concentration
  [./cl]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.7244
  [../]
  # Solid phase solute concentration
  [./cs]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.9163
  [../]

  # Temperature
  [./Te]
    order = FIRST
    family = LAGRANGE
    initial_condition = 1423.0
  [../]

  [./q1]   # Mole fraction of Cr (unitless)
    order = FIRST
    family = LAGRANGE
    #initial_condition = 0.8
  [../]

  [./q2]   # Mole fraction of Cr (unitless)
    order = FIRST
    family = LAGRANGE
    #initial_condition = 0.6
  [../]

  [./LaQ]   # Lagrangian
    order = FIRST
    family = LAGRANGE
  [../]
[]

#[Functions]
#  [./ic_func_eta]
#    type = ParsedFunction
#    value = 0.95*(1.0-tanh((x)/sqrt(2.0)))
#  [../]
#  [./ic_func_c]
#    type = ParsedFunction
#    value = '0.9163*(0.95*(1.0-tanh(x/sqrt(2.0))))^3*(6*(0.95*(1.0-tanh(x/sqrt(2.0))))^2-15*(0.95*(1.0-tanh(x/sqrt(2.0))))+10)+0.7244*(1-(0.95*(1.0-tanh(x/sqrt(2.0))))^3*(6*(0.95*(1.0-tanh(x/sqrt(2.0))))^2-15*(0.95*(1.0-tanh(x/sqrt(2.0))))+10))'
#  [../]
#[]

[ICs]
  #====================================================================
  [./ConstantIC_0_eta]
    block                        =    0
    type                         = ConstantIC
    value                        = 0.02
    variable                     = eta
  [../]
  [./ConstantIC_0_c]
    block                        =    0
    type                         = ConstantIC
    value                        = 0.7244
    variable                     = c
  [../]
  [./ConstantIC_0_q1]
    block                        =    0                         # The list of block ids (SubdomainID) that this object will be applied
    type                         = ConstantIC
    value                        = 0.70710678118                 # The value to be set in IC
    variable                     = q1                  # The variable this initial condition is supposed to provide values for.
  [../]
  [./ConstantIC_0_q2]
    block                        =    0                         # The list of block ids (SubdomainID) that this object will be applied
    type                         = ConstantIC
    value                        = 0.70710678118                 # The value to be set in IC
    variable                     = q2                  # The variable this initial condition is supposed to provide values for.
  [../]
  #====================================================================
  [./ConstantIC_1_eta]
    block                        =    1
    type                         = ConstantIC
    value                        = 0.98
    variable                     = eta
  [../]
  [./ConstantIC_1_c]
    block                        =    1
    type                         = ConstantIC
    value                        = 0.9163
    variable                     = c
  [../]
  [./ConstantIC_1_q1]
    block                        =    1                         # The list of block ids (SubdomainID) that this object will be applied
    type                         = ConstantIC
    value                        = 0.6                 # The value to be set in IC
    variable                     = q1                  # The variable this initial condition is supposed to provide values for.
  [../]
  [./ConstantIC_1_q2]
    block                        =    1                         # The list of block ids (SubdomainID) that this object will be applied
    type                         = ConstantIC
    value                        = 0.8                 # The value to be set in IC
    variable                     = q2                  # The variable this initial condition is supposed to provide values for.
  [../]
  #====================================================================
  [./ConstantIC_2_eta]
    block                        =    2
    type                         = ConstantIC
    value                        = 0.98
    variable                     = eta
  [../]
  [./ConstantIC_2_c]
    block                        =    2
    type                         = ConstantIC
    value                        = 0.9163
    variable                     = c
  [../]
  [./ConstantIC_2_q1]
    block                        =    2                         # The list of block ids (SubdomainID) that this object will be applied
    type                         = ConstantIC
    value                        = 0.8                 # The value to be set in IC
    variable                     = q1                  # The variable this initial condition is supposed to provide values for.
  [../]
  [./ConstantIC_2_q2]
    block                        =    2                         # The list of block ids (SubdomainID) that this object will be applied
    type                         = ConstantIC
    value                        = 0.6                 # The value to be set in IC
    variable                     = q2                  # The variable this initial condition is supposed to provide values for.
  [../]
[]

#[Mesh]
#  #MOOSE supports reading field data from ExodusII, XDA/XDR, and mesh checkpoint files (.e, .xda, .xdr, .cp)
#  file =/Files/Examples/Fattber1D/Fattbert1D_Con1_R0_out.e
#  #This method of restart is only supported on serial meshes
#  #distribution = serial
#[]
#
##[Variables]
##  [./nodal]
##     family = LAGRANGE
##     order = FIRST
##     initial_from_file_var = nodal
##     initial_from_file_timestep = 7266
##  [../]
##[]
#
#
###===============================================================
###: Section Mesh
#[GlobalParams]
#  outputs = exodus
#  penalty = 1e3
#[]
#
###===============================================================
###: Section Variables
#[Variables]
#
#  [./eta]
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = eta
#    initial_from_file_timestep = 12
#  [../]
#
#  [./cl]   # Mole fraction of Cr (unitless)
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = cl
#    initial_from_file_timestep = 12
#  [../]
#
#  [./cs]   # Phase
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = cs
#    initial_from_file_timestep = 12
#  [../]
#
#  [./q1]   # Mole fraction of Cr (unitless)
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = q1
#    initial_from_file_timestep = 12
#  [../]
#
#  [./q2]   # Mole fraction of Cr (unitless)
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = q2
#    initial_from_file_timestep = 12
#  [../]
#
#  [./LaQ]   # Phase
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = LaQ
#    initial_from_file_timestep = 12
#  [../]
#
#  [./Te]
#    #initial_condition = 1600 # Start at room Teperature13
#    initial_from_file_var = Te
#    initial_from_file_timestep = 12
#  [../]
#
#  [./c]
#    #initial_condition = 0.45 # Start at room Teperature13
#    initial_from_file_var = c
#    initial_from_file_timestep = 12
#  [../]
#
#  [./w]   # Phase
#    order = FIRST
#    family = LAGRANGE
#    initial_from_file_var = w
#    initial_from_file_timestep = 12
#  [../]
#[]

[BCs]
  #[./left_c]
  #  type = DirichletBC
  #  variable = 'c'
  #  boundary = 'left'
  #  value = 0.5
  #[../]
  #[./left_eta]
  #  type = DirichletBC
  #  variable = 'eta'
  #  boundary = 'left'
  #  value = 0.5
  #[../]
  [./Periodic]
    [./c_bcs]
      auto_direction = 'x y'
    [../]
  [../]
[]

[AuxVariables]
  [./Fglobal]
    order = CONSTANT
    family = MONOMIAL
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

##===============================================================
# Materials
[Materials]
  # Shared Constants
  [./consts]
    type = GenericConstantMaterial
    prop_names  = 'kappa_eta kappaQ walleta
                   Leta '
    #prop_values = '0.0625 0.09765625 2.5
    #               6.4 0.25 1423.0'
    prop_values = '0.0625 0.09765625 2.5
                  6.4 '
  [../]
  [./HQ]
    type = DerivativeParsedMaterial
    f_name = HQ
    function = '0.25*Te'
    args = 'Te'
    derivative_order             = 1
    outputs = exodus
  [../]

  [./g_eta2]
    type = BarrierFunctionMaterial
    g_order = SIMPLE
    eta = eta
    function_name  = g2
    well_only                    = 1
  [../]
  [./Penalty1]
    type = DerivativeParsedMaterial
    f_name =Pen1
    material_property_names = 'g2:=g2(eta)'
    function = 'g2*1.0e3'
    args = 'eta Te'
    derivative_order             = 2
    outputs = exodus
  [../]
  # Interpolation funcions
  #[./h]
  #  type = DerivativeParsedMaterial
  #  f_name = h
  #  function = '(eta^3)*(10.0-15.0*eta+6.0*(eta^2))'
  #  args = 'eta'
  #  derivative_order             = 2
  #[../]
  #
  #[./g]
  #  type = DerivativeParsedMaterial
  #  f_name = g
  #  function = '1.0*(eta^2)*(1-(eta^2))'
  #  args = 'eta'
  #  derivative_order             = 2
  #[../]
  # h(eta)
  [./h_eta]
    type = SwitchingFunctionMaterial
    h_order = HIGH
    eta = eta
  [../]

  # g(eta)
  [./g_eta]
    type = BarrierFunctionMaterial
    g_order = SIMPLE
    eta = eta
  [../]
  [./P1]
    type = DerivativeParsedMaterial
    f_name = P1
    function = '(eta^2)'
    args = 'eta'
    derivative_order             = 2
  [../]

  # Mobilities
  [./LQ]
    type = DerivativeParsedMaterial
    f_name = LQ
    constant_names = 'LQMin LQMax'
    #constant_expressions = '1e-6 0.64'
    constant_expressions = '1e-6 0.64'
    function = 'LQMin+(LQMax-LQMin)*(1.0-(eta^3)*(10.0-15.0*eta+6.0*(eta^2)))'
    #function = '0.0'
    args = 'eta'
    derivative_order             = 2
    outputs = exodus
  [../]

#*****************************************************************
[./ML]
  type = ParsedMaterial
  f_name = ML
  args = 'c Te'
  constant_names = 'Rg'
  constant_expressions = '8.31451e-3'
 function ='(1-c)*c*(
            (1-c)*exp((
                  (1-c)*(-35.92187-0.143615506*Te)+
                  c*(-46.35323-0.1371055487*Te)
            )/(Rg*Te))+
                c*exp((
                (1-c)*(-35.92187-0.143615506*Te)+
                c*(-46.35323-0.1383202967*Te)
            )/(Rg*Te))
            )/(Rg*Te)'
 outputs = exodus
[../]

  [./MS]
    type = ParsedMaterial
    f_name = MS
    args = 'c Te'
    constant_names = 'Rg'
    constant_expressions = '8.31451e-3'
   function ='(1-c)*c*(
              (1-c)*exp((
                    (1-c)*(-188.8-0.09130041728*Te)+
                    c*(-287.0-0.0698003897*Te)+
                    (1-c)*c*(136.2)+
                    (1-c)*c*(1-2*c)*(-42.8)
              )/(Rg*Te))+
                  c*exp((
                    (1-c)*(-176.6-0.09570043912*Te)+
                    c*(-306.5-0.02580012026*Te)+
                    (1-c)*c*(232.3-0.1362*Te)+
                    (1-c)*c*(1-2*c)*(-15.9)
              )/(Rg*Te))
              )/(Rg*Te)'
   outputs = exodus
  [../]

  [./Mob]
    type = ParsedMaterial
    f_name = M
    args = 'c eta Te'
    material_property_names = 'MS:=MS(c,Te)   ML:=ML(c,Te)'
    constant_names = 'Rg Mag1'
    constant_expressions = '8.31451e-3 7.68e9'
  function ='(MS+(ML-MS)*(1.0-(eta^3)*(10.0-15.0*eta+6.0*(eta^2))))*Mag1'
  # function ='0.001'
   outputs = exodus
  [../]

  #[./Mob]
  #  type = ParsedMaterial
  #  f_name = M
  #  args = 'c Te eta'
  #  material_property_names = 'MS:=MS[c,Te]   ML:=ML[c,Te]'
  #  constant_names = 'Rg Mag1'
  #  constant_expressions = '8.31451e-3 7.68e-3'
  # function ='(MS+(ML-MS)*(1.0-(eta^3)*(10.0-15.0*eta+6.0*(eta^2))))*Mag1'
  # outputs = exodus
  #[../]
  # Energies
  #----------------------------------------------------
  [./f_liquid]
    type = DerivativeParsedMaterial
    f_name = fl
    args = 'cl Te'
    derivative_order             = 3
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
                 cl*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (cl^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (cl^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (cl^4)*(p40+p41*Te)+(cl^5)*p50)'
    outputs = exodus
  [../]

  #----------------------------------------------------
  [./f_solid]
    type = DerivativeParsedMaterial
    f_name = fs
    args = 'cs Te'
    derivative_order             = 3
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
                 cs*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (cs^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (cs^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (cs^4)*(p40+p41*Te)+(cs^5)*p50)'
    outputs = exodus
  [../]

  # Heat
  #-----------------------------------------------------------
  [./Heat1]
    type = GenericConstantMaterial
    prop_names = 'thermal_conductivity specific_heat density'
    prop_values = '1.0 1.0 1.0' # W/m*K, J/kg-K, kg/m^3 @ 296K48
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

[]

# =======================================================
# Kernels
[Kernels]
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

  #
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
  #[./PusztaiBulkEta]
  #  Correction_y0   = 1.0
  #  Correction_Z   = 1.0
  #  Args                          = 'c Te'                             # Vector of Etas this object depends on
  #  Qs                           = 'q1 q2'                            # Vector of Qs this object depends on
  #  H_name                       = 'HQ'                           # The energy constant of the non-grain boundary phases
  #  implicit                     = 1                           # Determines whether this object is calculated using an implicit or explicit ...
  #                                                             # form
  #  L_name                     = 'Leta'                           # The mobility used with the kernel
  #  P_name                       = 'P1'                  # Interpolation function for phases
  #  type                         = PusztaiACBulk
  #  variable                     = eta                 # The name of the variable that this Kernel operates on
  #  variable_H                   = 1                          # The mobility is a function of any MOOSE variable (if this is set to false ...
  #                                                             # L must be constant over the entire domain!)
  #  variable_L                   = 1                           # The mobility is a function of any MOOSE variable (if this is set to false ...
  #                                                             # L must be constant over the entire domain!)
  #[../]

  #==============================
  # temperature
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
      #function                     = '(-2.37e4)*exp(-13.1802*t)+(2.1729)*exp(0.0078*t)'
      #function                     = '(-2.6061e3)*exp(-1.4315*t)+(6.7976)*exp(0.0296*t)'
      #function                     = '(-880.8589)*exp(-0.4421*t)+(8.7685)*exp(0.1709*t)'
      #value                        = -400.0                           # Value of heat source. Multiplied by function if present.
      value                        = 0.0
      variable                     = Te                # The name of the variable that this Kernel operates on
    [../]

    # -----------------------------------------------------------
    # Q1
      [./q1_dot]
        type                         = TimeDerivative
        variable                     = q1
      [../]

      #[./PusztaiInterface1]
      #  Correction_y0                      = 1.0
      #  Correction_Z                      = 1.0
      #  Args                         = 'eta c Te'
      #  Qs                           =  'q2'
      #  H_name                       = 'HQ'
      #  L_name                       = 'LQ '
      #  P_name                       = 'P1'
      #  type                         = PusztaiQsBulk
      #  variable                     = q1
      #  variable_H                   = 1
      #  variable_L                   = 1
      #[../]

      [./SwitchingFunctionConstraintq1]
        h_name                       = hq1
        implicit                     = 1
        lambda                       = LaQ
        type                         = SwitchingFunctionConstraintEta
        variable                     = q1
      [../]

      [./ACInterfaceQ1]
        args                         =  'eta c q2'
        kappa_name                   = 'kappaQ'
        mob_name                     = 'LQ'
        type                         = ACInterface
        variable                     = 'q1'
        variable_L                   = 1
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

      #[./PusztaiInterface2]
      #  Correction_y0                     = 1.0
      #  Correction_Z                      = 1.0
      #  Args                         = 'eta c Te'
      #  Qs                           =  'q1'
      #  H_name                       = 'HQ'
      #  implicit                     = 1
      #  L_name                     = 'LQ '
      #  P_name                       = 'P1'
      #  type                         = PusztaiQsBulk
      #  variable                     = q2
      #  variable_H                   = 1
      #
      #  variable_L                   = 1
      #[../]

      [./ACInterfaceQ2]
        args                         =  'eta c q1'
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


[]

[AuxKernels]
  [./GlobalFreeEnergy]
    variable = Fglobal
    type = KKSGlobalFreeEnergy
    fa_name = fl
    fb_name = fs
    w = 2.5
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
# PJFNK
  petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type'
  petsc_options_value = 'asm      ilu          nonzero'

  l_max_its = 40
  nl_max_its = 30
  #nl_abs_tol = 1e-8
  nl_abs_tol = 1e-8
  end_time = 0.75
  dt = 1.0e-3
  #scheme                     =explicit-euler
#  [./TimeIntegrator]
#   type = ExplicitEuler
#[../]

#[./TimeStepper]
#    # Turn on time stepping
#    type = IterationAdaptiveDT
#    dt = 1.0e-7
#    cutback_factor = 0.8
#    growth_factor = 2.0
#    optimal_iterations = 7
#  [../]
[]
#[Adaptivity]
#  marker = errorfrac
#  steps = 2
#
#  [./Indicators]
#    [./error]
#      type = GradientJumpIndicator
#      variable = q1
#    [../]
#  [../]
#
#  [./Markers]
#    [./errorfrac]
#      type = ErrorFractionMarker
#      refine = 0.5
#      coarsen = 0.2
#      indicator = error
#    [../]
#  [../]
#[]
#[ExecutionerOLD]
#  type = Transient
#  solve_type = NEWTON
#  l_max_its = 30
#  l_tol = 1e-6
#  nl_max_its = 30
#  nl_abs_tol = 1e-9
#  dtmax                      = 1e-2                       # The maximum timestep size in an adaptive run
#  dtmin                      = 1e-14                       # The minimum timestep size in an adaptive run
#  end_time = 1.0   # 1 day. We only need to run this long enough to verify
#                     # the model is working properly.
#  petsc_options_iname = '-pc_type -ksp_gmres_restart -sub_ksp_type
#                         -sub_pc_type -pc_asm_overlap'
#  petsc_options_value = 'asm      31                  preonly
#                         ilu          1'
#  dt = 0.1
#[]
[Outputs]
  interval                       = 1
  exodus = true
  console = true
  print_perf_log = true
  output_initial = true
[]
