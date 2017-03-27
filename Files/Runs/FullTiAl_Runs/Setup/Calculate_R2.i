#=======================================================
#:Global Params
[GlobalParams]
  outputs = exodus
  penalty = 1e3
  displacements = 'disp_x disp_y'
[]

#=======================================================
#:Mesh
[Mesh] #Mesh: Load Mesh
  file =/work/jl1908/DropZone/X1/Calculate_R1_out.e
[]

#=======================================================
#:Variables
[Variables]
 [./eta1] # Liquid
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eta1
   initial_from_file_timestep = 14
 [../]
 [./eta2] # Beta
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eta2
   initial_from_file_timestep = 14
 [../]
 [./eta3] #Alpha
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eta3
   initial_from_file_timestep = 14
 [../]
 [./eta4] #Alpha2
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eta4
   initial_from_file_timestep = 14
 [../]

 [./eta51] # Gamma
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eta51
   initial_from_file_timestep = 14
 [../]
 [./eta52] # Gamma
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eta52
   initial_from_file_timestep = 14
 [../]
 [./eta53] # Gamma
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eta53
   initial_from_file_timestep = 14
 [../]
 [./eta54] # Gamma
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eta54
   initial_from_file_timestep = 14
 [../]
 [./eta55] # Gamma
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eta55
   initial_from_file_timestep = 14
 [../]
 [./eta56] # Gamma
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = eta56
   initial_from_file_timestep = 14
 [../]

 [./c]
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = c
   initial_from_file_timestep = 14
 [../]
 [./w]
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = w
   initial_from_file_timestep = 14
 [../]

 [./q1]
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = q1
   initial_from_file_timestep = 14
 [../]
 [./q2]
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = q2
   initial_from_file_timestep = 14
 [../]

 [./La_eta]
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = La_eta
   initial_from_file_timestep = 14
 [../]
 [./LaQ]
   order = FIRST
   family = LAGRANGE
   initial_from_file_var = LaQ
   initial_from_file_timestep = 14
 [../]

 [./disp_x]
 [../]
 [./disp_y]
 [../]

 #[./SWITCH]
 #  order = FIRST
 #  family = LAGRANGE
 #[../]
 #[./SWITCH_ANGLE]
 #  order = FIRST
 #  family = LAGRANGE
 #[../]
 #[./RANDOM_ANGLE]
 #  order = FIRST
 #  family = LAGRANGE
 #[../]
[]

#=======================================================
#:ICs

#=======================================================
#:BCs
[BCs]
  [./Periodic]
    [./c_bcs]
      auto_direction = 'x y'
    [../]
  [../]
[]

#=======================================================
#:UserObjects
[UserObjects]
  [./ConservedNormalNoise1]
    execute_on                   = TIMESTEP_BEGIN
    seed                         = 201
    type                         = ConservedNormalNoise
  [../]
[]

#=======================================================
#:AuxVariables
[AuxVariables]
  #[./Preq1]
  #[../]
  #[./Preq2]
  #[../]
  [./Te]
  [../]
[]

#=======================================================
#:AuxKernels
[AuxKernels]
  #[./JunyiAngle2Value1]
  #  type                         = JunyiAngle2Value
  #  Switch                       = SWITCH
  #  SwitchValues                 = SWITCH_ANGLE
  #  RndValues                    = RANDOM_ANGLE
  #  Component                    = 1
  #  variable                     = Preq1
  #[../]
  #[./JunyiAngle2Value1]
  #  type                         = JunyiAngle2Value
  #  Switch                       = SWITCH
  #  SwitchValues                 = SWITCH_ANGLE
  #  RndValues                    = RANDOM_ANGLE
  #  Component                    = 1
  #  variable                     = Preq2
  #[../]

  [./FunctionAuxTe]
    function                     = '2000.0-1000.0*t'
    type                         = FunctionAux
    variable                     = Te
  [../]
[]

#=======================================================
#:Materials
[Materials]
  # Shared Constants
  [./consts]
    type = GenericConstantMaterial
    prop_names  = 'Leta  kappaEta kappa_c w_ij kappaQ'
    #prop_values = '0.64e15 5.784626776e-14  0.0 5.784626776e-14'
    prop_values = '0.64e3 5.784626776e-2  0.0 5.784626776e-2 1.0e-8'
  [../]

  #=====================================================================
  # Angle Stuff
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
    constant_expressions = '1e-8 0.64e2'
    #constant_names = 'L00 L11 L10 L01'
    #constant_expressions = '0.64e3 0.64e1 1e-2 0.64e3'
    #material_property_names = 'h1:=h1(eta1)  hp1:=hp1(phi1)'
    function = 'LQMax+(LQMin-LQMax)*(1.0-(eta1^3)*(10.0-15.0*eta1+6.0*(eta1^2)))'
    #function = '(L11+L00-L10-L01)*h1*hp1+hp1*(L10-L00)+h1*(L01-L00)+L00'
    args = 'eta1'
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
    outputs = none
  [../]
  [./switching2]
    type = SwitchingFunctionMaterial
    function_name = h2
    eta = eta2
    h_order = HIGH
    outputs = none
  [../]
  [./switching3]
    type = SwitchingFunctionMaterial
    function_name = h3
    eta = eta3
    h_order = HIGH
    outputs = none
  [../]
  [./switching4]
    type = SwitchingFunctionMaterial
    function_name = h4
    eta = eta4
    h_order = HIGH
    outputs = none
  [../]

  [./switching51]
    type = SwitchingFunctionMaterial
    function_name = h51
    eta = eta51
    h_order = HIGH
    outputs = none
  [../]
  [./switching52]
    type = SwitchingFunctionMaterial
    function_name = h52
    eta = eta52
    h_order = HIGH
    outputs = none
  [../]
  [./switching53]
    type = SwitchingFunctionMaterial
    function_name = h53
    eta = eta53
    h_order = HIGH
    outputs = none
  [../]
  [./switching54]
    type = SwitchingFunctionMaterial
    function_name = h54
    eta = eta54
    h_order = HIGH
    outputs = none
  [../]
  [./switching55]
    type = SwitchingFunctionMaterial
    function_name = h55
    eta = eta55
    h_order = HIGH
    outputs = none
  [../]
  [./switching56]
    type = SwitchingFunctionMaterial
    function_name = h56
    eta = eta56
    h_order = HIGH
    outputs = none
  [../]

  [./CrossTermBarrierFunctionMaterial]
    W_ij                         = '0 5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 0 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 0 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 0 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2 0
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    0 5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 0 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 0 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 0 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2
                                    5.784626776e-2 5.784626776e-2 5.784626776e-2 5.784626776e-2 0'
    etas                         = 'eta1 eta2 eta3 eta4 eta51
                                    eta52 eta53 eta54 eta55 eta56'
    function_name                = getas
    g_order                      = SIMPLE
    type                         = CrossTermBarrierFunctionMaterial
    outputs = none
  [../]

  [./free_energy]
    type = DerivativeMultiPhaseMaterial
    f_name = F
    fi_names = 'FLq  Falpha Falpha2 Fbeta Fgamma Fgamma Fgamma Fgamma Fgamma Fgamma'
    hi_names = 'h1  h2 h3 h4 h51 h52 h53 h54 h55 h56'
    etas     = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
    args = 'Te c'
    g=getas
    W = 1.0
    derivative_order             = 2
    outputs = exodus
  [../]

  [./hL1]
    type = DerivativeParsedMaterial
    f_name = hL1
    function = 'eta1'
    args = 'eta1'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL2]
    type = DerivativeParsedMaterial
    f_name = hL2
    function = 'eta2'
    args = 'eta2'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL3]
    type = DerivativeParsedMaterial
    f_name = hL3
    function = 'eta3'
    args = 'eta3'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL4]
    type = DerivativeParsedMaterial
    f_name = hL4
    function = 'eta4'
    args = 'eta4'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]

  [./hL51]
    type = DerivativeParsedMaterial
    f_name = hL51
    function = 'eta51'
    args = 'eta51'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL52]
    type = DerivativeParsedMaterial
    f_name = hL52
    function = 'eta52'
    args = 'eta52'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL53]
    type = DerivativeParsedMaterial
    f_name = hL53
    function = 'eta53'
    args = 'eta53'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL54]
    type = DerivativeParsedMaterial
    f_name = hL54
    function = 'eta54'
    args = 'eta54'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL55]
    type = DerivativeParsedMaterial
    f_name = hL55
    function = 'eta55'
    args = 'eta55'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL56]
    type = DerivativeParsedMaterial
    f_name = hL56
    function = 'eta56'
    args = 'eta56'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]

  #----------------------------------------------------
  # Energies
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
                            1e-4'
    function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                 (p04*(Te^4))+(p05*(Te^5))+
                 c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (c^4)*(p40+p41*Te)+(c^5)*p50)'
    outputs = none
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
                            0.09659036028e-3'
    function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                 (p04*(Te^4))+(p05*(Te^5))+
                 c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (c^4)*(p40+p41*Te)+(c^5)*p50)'
    outputs = none
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
                            0.09880446596e-3'
    function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                 (p04*(Te^4))+(p05*(Te^5))+
                 c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (c^4)*(p40+p41*Te)+(c^5)*p50)'
    outputs = none
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
                            0.09755145839e-3'
    function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                 (p04*(Te^4))+(p05*(Te^5))+
                 c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (c^4)*(p40+p41*Te)+(c^5)*p50)'
    outputs = none
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
                            0.1019264091e-3'
    function = 'Magni*(p00+p01*Te+(p02*(Te^2))+(p03*(Te^3))+
                 (p04*(Te^4))+(p05*(Te^5))+
                 c*(p10+p11*Te+(p12*(Te^2))+(p13*(Te^3))+(p14*(Te^4)))+
                 (c^2)*(p20+p21*Te+(p22*(Te^2))+(p23*(Te^3)))+
                 (c^3)*(p30+p31*Te+(p32*(Te^2)))+
                 (c^4)*(p40+p41*Te)+(c^5)*p50)'
    outputs = none
  [../]

  # =====================
  # Mobility
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
   outputs = none
  [../]

  [./Malpha]
    type = ParsedMaterial
    f_name = Malpha
    args = 'c Te'
    constant_names = 'Mag kb Da0 Qa1 Db0 Qb1'
    constant_expressions = '1e12 8.6173303e-5 1.35e-3 3.14 6.6e-3 3.41'
   function ='Mag*(c*Da0*exp(-Qa1/(kb*Te))+(1-c)*Db0*exp(-Qb1/(kb*Te)))'
   outputs = none
  [../]

  [./Mbeta]
    type = ParsedMaterial
    f_name = Mbeta
    args = 'c Te'
    constant_names = 'Mag kb Da0 Qa1 Qa2 Db0 Qb1 Qb2'
    constant_expressions = '1e12 8.6173303e-5 3.53e-4 3.4 1335.0 1.94e-4 3.36 1266.0 '
   function ='Mag*(c*Da0*exp(-Qa1/(kb*Te))*exp(Qa2/(kb*Te^2))+
               (1-c)*Db0*exp(-Qb1/(kb*Te))*exp(Qb2/(kb*Te^2)))'
   outputs = none
  [../]

  [./Malpha2]
    type = ParsedMaterial
    f_name = Malpha2
    args = 'c Te'
    constant_names = 'Mag kb Da0 Qa1 Db0 Qb1'
    constant_expressions = '1e12 8.6173303e-5 2.24e-5 2.99 2.32e-1 4.08'
   function ='Mag*(c*Da0*exp(-Qa1/(kb*Te))+(1-c)*Db0*exp(-Qb1/(kb*Te)))'
   outputs = none
  [../]

  [./Mgamma]
    type = ParsedMaterial
    f_name = Mgamma
    args = 'c Te'
    constant_names = 'Mag kb Da0 Qa1 Db0 Qb1'
    constant_expressions = '1e12 8.6173303e-5 1.43e-6 2.59 2.11e-2 3.71'
   function ='Mag*(c*Da0*exp(-Qa1/(kb*Te))+(1-c)*Db0*exp(-Qb1/(kb*Te)))'
   outputs = none
  [../]

  [./Mob]
    type = ParsedMaterial
    f_name = M
    args = 'c eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56 Te'
    material_property_names = 'MLq:=MLq(c,Te)
                               Malpha:=Malpha(c,Te)
                               Mbeta:=Mbeta(c,Te)
                               Malpha2:=Malpha2(c,Te)
                               Mgamma:=Mgamma(c,Te)
                               d2F:=D[F(Te,c),c,c]'
  function ='10.0*(sqrt(eta1^2)*MLq+sqrt(eta2^2)*Malpha+sqrt(eta3^2)*Malpha2+sqrt(eta4^2)*Mbeta+
            sqrt((eta51^2)+(eta52^2)+(eta53^2)+(eta54^2)+(eta55^2)+(eta56^2))*Mgamma)/d2F'
   outputs = exodus
  [../]


  ## Eigenstrain
  [./elasticity_tensor]
    type = ComputeElasticityTensor
    fill_method                  = symmetric9
    C_ijkl                       = '220.0e1 62.3e1 62.3e1
                                    175.0e1 88.7e1 220.0e1
                                    43.15e1 62.2e1 62.2e1'
    outputs                      = none
  [../]

  [./e1]
    type = GenericConstantRankTwoTensor
    tensor_values = '0.0392   -0.0167   -0.0300         0         0    0.1768'
    tensor_name = e1
    outputs                      = none
  [../]
  [./e2]
    type = GenericConstantRankTwoTensor
    tensor_values = '0.0392   -0.0167   -0.0300         0         0   -0.1768'
    tensor_name = e2
    outputs                      = none
  [../]

  [./e3]
    type = GenericConstantRankTwoTensor
    tensor_values = '0.0392   -0.0267   -0.0200    0.0058   -0.1531   -0.0884'
    tensor_name = e3
    outputs                      = none
  [../]
  [./e4]
    type = GenericConstantRankTwoTensor
    tensor_values = '0.0392   -0.0267   -0.0200    0.0058    0.1531    0.0884'
    tensor_name = e4
    outputs                      = none
  [../]
  [./e5]
    type = GenericConstantRankTwoTensor
    tensor_values = '0.0392   -0.0267   -0.0200   -0.0058    0.1531   -0.0884'
    tensor_name = e5
    outputs                      = none
  [../]
  [./e6]
    type = GenericConstantRankTwoTensor
    tensor_values = '0.0392   -0.0267   -0.0200   -0.0058   -0.1531    0.0884'
    tensor_name = e6
    outputs                      = none
  [../]

  [./funce1]
    type = DerivativeParsedMaterial
    function = eta51^2
    f_name = fe1
    args = 'eta51'
    outputs                      = none
  [../]
  [./funce2]
    type = DerivativeParsedMaterial
    function = eta52^2
    f_name = fe2
    args = 'eta52'
    outputs                      = none
  [../]
  [./funce3]
    type = DerivativeParsedMaterial
    function = eta53^2
    f_name = fe3
    args = 'eta53'
    outputs                      = none
  [../]
  [./funce4]
    type = DerivativeParsedMaterial
    function = eta54^2
    f_name = fe4
    args = 'eta54'
    outputs                      = none
  [../]
  [./funce5]
    type = DerivativeParsedMaterial
    function = eta55^2
    f_name = fe5
    args = 'eta55'
    outputs                      = none
  [../]
  [./funce6]
    type = DerivativeParsedMaterial
    function = eta56^2
    f_name = fe6
    args = 'eta56'
    outputs                      = none
  [../]

  [./eigenstrain]
    type = CompositeEigenstrain
    tensors = 'e1 e2 e3 e4 e5 e6'
    weights = 'fe1 fe2 fe3 fe4 fe5 fe6'
    args = 'eta51 eta52 eta53 eta54 eta55 eta56'
      eigenstrain_name             = EigenStrain
      outputs                      = exodus
  [../]

  [./ElasticEnergyMaterial]
    args                         = 'eta51 eta52 eta53 eta54 eta55 eta56'                  # Arguments of F() - use vector coupling
    derivative_order             = 2                          # Maximum order of derivatives taken (2 or 3)
    f_name                       = FEl                           # Base name of the free energy function (used to name the material properties)
    #outputs                      = none                        # Vector of output names were you would like to restrict the output of ...
    type                         = ElasticEnergyMaterial
    outputs                      = exodus
  [../]

  [./strain]
    type = ComputeSmallStrain
    displacements = 'disp_x disp_y'
    eigenstrain_names        = EigenStrain
    outputs                      = exodus
  [../]
  [./stress]
    type = ComputeLinearElasticStress
    eigenstrain_names        = EigenStrain
    outputs                      = exodus
  [../]

  #----------------------------------------------------
  #  Noise
  [./MagNoiseE]
    type = ParsedMaterial
    f_name = MagNoiseEta
    #args = 'time'
    function='2.0'
    outputs = none
  [../]

  [./MagNoiseC]
    type = ParsedMaterial
    f_name = MagNoiseC
    #args = 'time'
    #constant_names = 'A B'
    #constant_expressions = '0.001 0.006908'
    function='1.0'
    outputs = none
  [../]
[]

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
    args = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56 Te c'
    variable = w
    type = SplitCHWRes
    mob_name = M
  [../]
  [./coupled_parsed]
    args = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56 Te'
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
    #save_in                      = CNoise
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
    args = 'eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface1]
    type = ACMultiInterface
    variable = eta1
    etas = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta
                   kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta1]
    h_name                       = hL1
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
    #save_in                      = eta1Noise
  [../]
  #[./ACBulkPen1]
  #  type = AllenCahn
  #  variable = eta1
  #  args = 'eta2 eta3 eta4 eta5 Te c'
  #  mob_name = Leta
  #  f_name = Pen1
  #[../]

  [./PusztaiBulkEta1]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2 eta3 eta4 eta51
                                    eta52 eta53 eta54 eta55 eta56'
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
    args = 'eta1 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface2]
    type = ACMultiInterface
    variable = eta2
    etas = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta
                   kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta2]
    h_name                       = hL2
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
    #save_in                      = eta2Noise
  [../]

  [./PusztaiBulkEta2]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta1 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
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
    args = 'eta1 eta2 eta4 eta51 eta52 eta53 eta54 eta55 eta56 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface3]
    type = ACMultiInterface
    variable = eta3
    etas = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta
                   kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta3]
    h_name                       = hL3
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
    #save_in                      = eta3Noise
  [../]
  [./PusztaiBulkEta3]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2 eta1 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
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
    args = 'eta2 eta3 eta1 eta51 eta52 eta53 eta54 eta55 eta56 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface4]
    type = ACMultiInterface
    variable = eta4
    etas = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta
                   kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta4]
    h_name                       = hL4
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
    #save_in                      = eta4Noise
  [../]
  [./PusztaiBulkEta4]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2 eta3 eta1 eta51 eta52 eta53 eta54 eta55 eta56'
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
  # Eta51
  [./eta51_dot]
    type                         = TimeDerivative
    variable                     = eta51
  [../]
  [./ACBulk51]
    type = AllenCahn
    variable = eta51
    args = 'eta2 eta3 eta4 eta1 eta52 eta53 eta54 eta55 eta56 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface51]
    type = ACMultiInterface
    variable = eta51
    etas = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta
                   kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta51]
    h_name                       = hL51
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta51
  [../]
  [./LangevinNoise_eta51]
    amplitude                    = 1.0
    multiplier                   = MagNoiseEta
    seed                         = 5001
    type                         = LangevinNoise
    variable                     = eta51
    #save_in                      = eta5Noise
  [../]
  [./PusztaiBulkEta51]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2 eta3 eta4 eta1 eta52 eta53 eta54 eta55 eta56'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Leta'
    P_name                       = 'PQ'
    type                         = PusztaiACBulk
    variable                     = eta51
    variable_H                   = 1
    variable_L                   = 1
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta52
  [./eta52_dot]
    type                         = TimeDerivative
    variable                     = eta52
  [../]
  [./ACBulk52]
    type = AllenCahn
    variable = eta52
    args = 'eta2 eta3 eta4 eta1 eta51 eta53 eta54 eta55 eta56 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface52]
    type = ACMultiInterface
    variable = eta52
    etas = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta
                   kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta52]
    h_name                       = hL52
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta52
  [../]
  [./LangevinNoise_eta52]
    amplitude                    = 1.0
    multiplier                   = MagNoiseEta
    seed                         = 5201
    type                         = LangevinNoise
    variable                     = eta52
    #save_in                      = eta5Noise
  [../]
  [./PusztaiBulkEta52]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2 eta3 eta4 eta1 eta51 eta53 eta54 eta55 eta56'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Leta'
    P_name                       = 'PQ'
    type                         = PusztaiACBulk
    variable                     = eta52
    variable_H                   = 1
    variable_L                   = 1
  [../]

  #--------------------------------------------------------------------------
  # Eta53
  [./eta53_dot]
    type                         = TimeDerivative
    variable                     = eta53
  [../]
  [./ACBulk53]
    type = AllenCahn
    variable = eta53
    args = 'eta2 eta3 eta4 eta1 eta52 eta51 eta54 eta55 eta56 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface53]
    type = ACMultiInterface
    variable = eta53
    etas = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta
                   kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta53]
    h_name                       = hL53
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta53
  [../]
  [./LangevinNoise_eta53]
    amplitude                    = 1.0
    multiplier                   = MagNoiseEta
    seed                         = 5301
    type                         = LangevinNoise
    variable                     = eta53
    #save_in                      = eta5Noise
  [../]
  [./PusztaiBulkEta53]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2 eta3 eta4 eta1 eta52 eta51 eta54 eta55 eta56'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Leta'
    P_name                       = 'PQ'
    type                         = PusztaiACBulk
    variable                     = eta53
    variable_H                   = 1
    variable_L                   = 1
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta54
  [./eta54_dot]
    type                         = TimeDerivative
    variable                     = eta54
  [../]
  [./ACBulk54]
    type = AllenCahn
    variable = eta54
    args = 'eta2 eta3 eta4 eta1 eta52 eta53 eta51 eta55 eta56 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface54]
    type = ACMultiInterface
    variable = eta54
    etas = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta
                   kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta54]
    h_name                       = hL54
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta54
  [../]
  [./LangevinNoise_eta54]
    amplitude                    = 1.0
    multiplier                   = MagNoiseEta
    seed                         = 5401
    type                         = LangevinNoise
    variable                     = eta54
    #save_in                      = eta5Noise
  [../]
  [./PusztaiBulkEta54]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2 eta3 eta4 eta1 eta52 eta53 eta51 eta55 eta56'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Leta'
    P_name                       = 'PQ'
    type                         = PusztaiACBulk
    variable                     = eta54
    variable_H                   = 1
    variable_L                   = 1
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta55
  [./eta55_dot]
    type                         = TimeDerivative
    variable                     = eta55
  [../]
  [./ACBulk55]
    type = AllenCahn
    variable = eta55
    args = 'eta2 eta3 eta4 eta1 eta52 eta53 eta54 eta51 eta56 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface55]
    type = ACMultiInterface
    variable = eta55
    etas = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta
                   kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta55]
    h_name                       = hL55
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta55
  [../]
  [./LangevinNoise_eta55]
    amplitude                    = 1.0
    multiplier                   = MagNoiseEta
    seed                         = 5501
    type                         = LangevinNoise
    variable                     = eta55
    #save_in                      = eta5Noise
  [../]
  [./PusztaiBulkEta55]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2 eta3 eta4 eta1 eta52 eta53 eta54 eta51 eta56'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Leta'
    P_name                       = 'PQ'
    type                         = PusztaiACBulk
    variable                     = eta55
    variable_H                   = 1
    variable_L                   = 1
  [../]

  #--------------------------------------------------------------------------
  # Allen-Cahn Equation
  # Eta56
  [./eta56_dot]
    type                         = TimeDerivative
    variable                     = eta56
  [../]
  [./ACBulk56]
    type = AllenCahn
    variable = eta56
    args = 'eta2 eta3 eta4 eta1 eta52 eta53 eta54 eta55 eta51 Te c'
    mob_name = Leta
    f_name = F
  [../]
  [./ACInterface56]
    type = ACMultiInterface
    variable = eta56
    etas = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
    mob_name = Leta
    kappa_names = 'kappaEta kappaEta kappaEta kappaEta kappaEta
                   kappaEta kappaEta kappaEta kappaEta kappaEta'
  [../]
  [./SwitchingFunctionConstraintEta56]
    h_name                       = hL56
    implicit                     = 1
    lambda                       = La_eta
    type                         = SwitchingFunctionConstraintEta
    variable                     = eta56
  [../]
  [./LangevinNoise_eta56]
    amplitude                    = 1.0
    multiplier                   = MagNoiseEta
    seed                         = 5601
    type                         = LangevinNoise
    variable                     = eta56
    #save_in                      = eta5Noise
  [../]
  [./PusztaiBulkEta56]
    Correction_y0   = 1.0
    Correction_Z   = 1.0
    Args                         = 'c Te eta2 eta3 eta4 eta1 eta52 eta53 eta54 eta55 eta51'
    Qs                           = 'q1 q2'
    H_name                       = 'HQ'
    L_name                       = 'Leta'
    P_name                       = 'PQ'
    type                         = PusztaiACBulk
    variable                     = eta56
    variable_H                   = 1
    variable_L                   = 1
  [../]


  #--------------------------------------------------------------------------
  # Langrange Eta
  [./SwitchingFunctionConstraintLagrange]
    enable                       = 1
    epsilon                      = 1e-09
    etas                         = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56'
    #h_names                      = 'h1 h2 h3 h4 h5'
    h_names                      = 'hL1 hL2 hL3 hL4 hL51 hL52 hL53 hL54 hL55 hL56'
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
      Args                         = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56 c Te'
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
      args                         =  'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56 Te c q2'
      kappa_name                   = 'kappaQ'
      mob_name                     = 'LQ'
      type                         = ACInterface
      variable                     = 'q1'
      variable_L                   = 1
    [../]
    #[./LangevinNoise_q1]
    #  amplitude                    = 1.0
    #  multiplier                   = MagNoiseQ
    #  seed                         = 8432541
    #  type                         = LangevinNoise
    #  variable                     = q1
    #  #save_in                      = q1Noise
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
      Args                         = 'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56 c Te'
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
      args                         =  'eta1 eta2 eta3 eta4 eta51 eta52 eta53 eta54 eta55 eta56 Te c q1'
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

    # SWITCH
      #[./SWITCH_dot]
      #  type                         = TimeDerivative
      #  variable                     = SWITCH
      #[../]
      #[./SWITCH_ANGLE_dot]
      #  type                         = TimeDerivative
      #  variable                     = SWITCH_ANGLE
      #[../]
      #[./RANDOM_ANGLE_dot]
      #  type                         = TimeDerivative
      #  variable                     = RANDOM_ANGLE
      #[../]
[]

##===============================================================
##: Postprocessors
#[Postprocessors]
#  [./ave_stress_bottom]
#    type = SideAverageValue
#    variable = stress_zz
#    boundary = bottom
#  [../]
#  [./ave_strain_bottom]
#    type = SideAverageValue
#    variable = total_strain_zz
#    boundary = bottom
#  [../]
#[]

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
   start_time                 = 0.01067148
 [./TimeStepper]
    # Turn on time stepping
    type = IterationAdaptiveDT
    dt = 1.0e-6
    cutback_factor = 0.8
    growth_factor = 1.5
    optimal_iterations = 12
  [../]
[]

##===============================================================
##: Outputs
[Outputs]
  interval                       = 1
  exodus = true
  console = false
  print_perf_log = true
  output_initial = true
  #print_linear_residuals         = 0
[]
