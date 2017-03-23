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
  xmax = 5.0e1
  ymin = 0
  ymax = 5.0e1
  zmin = 0
  zmax = 0
[]

#=======================================================
#:Variables
[Variables]
 [./eta1] # Liquid
   order = FIRST
   family = LAGRANGE
 [../]
 [./eta2] # Beta
   order = FIRST
   family = LAGRANGE
 [../]
 [./eta3] #Alpha
   order = FIRST
   family = LAGRANGE
 [../]
 [./eta4] #Alpha2
   order = FIRST
   family = LAGRANGE
 [../]

 [./eta51] # Gamma
   order = FIRST
   family = LAGRANGE
 [../]
 [./eta52] # Gamma
   order = FIRST
   family = LAGRANGE
 [../]
 [./eta53] # Gamma
   order = FIRST
   family = LAGRANGE
 [../]
 [./eta54] # Gamma
   order = FIRST
   family = LAGRANGE
 [../]
 [./eta55] # Gamma
   order = FIRST
   family = LAGRANGE
 [../]
 [./eta56] # Gamma
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

 [./disp_x]
 [../]
 [./disp_y]
 [../]

 [./SWITCH]
   order = FIRST
   family = LAGRANGE
 [../]
 [./SWITCH_ANGLE]
   order = FIRST
   family = LAGRANGE
 [../]
 [./RANDOM_ANGLE]
   order = FIRST
   family = LAGRANGE
 [../]
[]

#=======================================================
#:ICs
[ICs]
  [./eta1_IC]
    type                         = ConstantIC
    value                        = 0.93
    variable                     = eta1
  [../]
  [./eta2_IC]
    type                         = ConstantIC
    value                        = 0.01
    variable                     = eta2
  [../]
  [./eta3_IC]
    type                         = ConstantIC
    value                        = 0.01
    variable                     = eta3
  [../]
  [./eta4_IC]
    type                         = ConstantIC
    value                        = 0.01
    variable                     = eta4
  [../]

  [./eta51_IC]
    type                         = ConstantIC
    value                        = 0.005
    variable                     = eta51
  [../]
  [./eta51_IC]
    type                         = ConstantIC
    value                        = 0.005
    variable                     = eta51
  [../]
  [./eta51_IC]
    type                         = ConstantIC
    value                        = 0.005
    variable                     = eta51
  [../]
  [./eta51_IC]
    type                         = ConstantIC
    value                        = 0.005
    variable                     = eta51
  [../]
  [./eta51_IC]
    type                         = ConstantIC
    value                        = 0.005
    variable                     = eta51
  [../]
  [./eta51_IC]
    type                         = ConstantIC
    value                        = 0.005
    variable                     = eta51
  [../]

  [./c_IC]
    type                         = ConstantIC
    value                        = 0.46
    variable                     = c
  [../]

  [./SWITCH_IC]
    3D_spheres             = 0
    bubspac                = 2.0
    invalue                = 1.0
    numbub                 = 15
    numtries               = 1000
    outvalue               = 0.0
    radius                 = 10.0
    radius_variation       = 2.0
    radius_variation_type  = NORMAL
    randPoint_seed         = 1985
    randVal_seed           = 35465
    type                   = JunyiMultiSmoothCircleIC
    variable               = SWITCH
    variation_invalue      = 0.5235987756
    zero_gradient          = 0
  [../]
  [./SWITCH_ANGLE_IC]
    3D_spheres             = 0
    bubspac                = 2.0
    invalue                = 0.5235987756
    numbub                 = 15
    numtries               = 1000
    outvalue               = 0.0
    radius                 = 10.0
    radius_variation       = 2.0
    radius_variation_type  = NORMAL
    randPoint_seed         = 1985
    randVal_seed           = 35465
    type                   = JunyiMultiSmoothCircleIC
    variable               = SWITCH_ANGLE
    variation_invalue      = 0.1745
    zero_gradient          = 0
  [../]
  [./RANDOM_ANGLE_IC]
    max                    = 0.6981317008
    min                    = 0.3490658504
    seed                   = 24579
    type                   = RandomIC
    variable               = RANDOM_ANGLE
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
  [./Preq1]
  [../]
  [./Preq2]
  [../]
[]

#=======================================================
#:AuxKernels
[AuxKernels]
  [./JunyiAngle2Value1]
    type                         = JunyiAngle2Value
    Switch                       = SWITCH
    SwitchValues                 = SWITCH_ANGLE
    RndValues                    = RANDOM_ANGLE
    Component                    = 1
    variable                     = Preq1
  [../]
  [./JunyiAngle2Value1]
    type                         = JunyiAngle2Value
    Switch                       = SWITCH
    SwitchValues                 = SWITCH_ANGLE
    RndValues                    = RANDOM_ANGLE
    Component                    = 1
    variable                     = Preq2
  [../]
[]

#=======================================================
#:Materials
[Materials]
  # Shared Constants
  [./consts]
    type = GenericConstantMaterial
    prop_names  = 'Leta  kappaEta kappa_c w_ij'
    #prop_values = '0.64e15 5.784626776e-14  0.0 5.784626776e-14'
    prop_values = '0.64e3 5.784626776e-2  0.0 5.784626776e-2'
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
    W_ij                         = 'w_ij w_ij w_ij w_ij w_ij
                                    w_ij w_ij w_ij w_ij w_ij'
    etas                         = 'eta1 eta2 eta3 eta4 eta51
                                    eta52 eta53 eta54 eta55 eta56'
    function_name                = getas
    g_order                      = SIMPLE
    type                         = CrossTermBarrierFunctionMaterial
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
    outputs = none
  [../]

  [./hL1]
    type = DerivativeParsedMaterial
    f_name = hL1
    function = 'eta1'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL2]
    type = DerivativeParsedMaterial
    f_name = hL2
    function = 'eta2'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL3]
    type = DerivativeParsedMaterial
    f_name = hL3
    function = 'eta3'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL4]
    type = DerivativeParsedMaterial
    f_name = hL4
    function = 'eta4'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]

  [./hL51]
    type = DerivativeParsedMaterial
    f_name = hL51
    function = 'eta51'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL52]
    type = DerivativeParsedMaterial
    f_name = hL52
    function = 'eta52'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL53]
    type = DerivativeParsedMaterial
    f_name = hL53
    function = 'eta53'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL54]
    type = DerivativeParsedMaterial
    f_name = hL54
    function = 'eta54'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL55]
    type = DerivativeParsedMaterial
    f_name = hL55
    function = 'eta55'
    outputs = none
    derivative_order             = 1
    outputs = none
  [../]
  [./hL56]
    type = DerivativeParsedMaterial
    f_name = hL56
    function = 'eta56'
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
                               d2F:=D[F(Te,c),c,c]
                                h1:=h1(eta1)
                                h2:=h2(eta2)
                                h3:=h3(eta3)
                                h4:=h4(eta4)
                                h5:=h5(eta5)'
  function ='10.0*(sqrt(eta1^2)*MLq+sqrt(eta2^2)*Malpha+sqrt(eta3^2)*Malpha2+sqrt(eta4^2)*Mabeta+
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
    # eigenstrain per Kelvin for crystal 1
    type = GenericConstantRankTwoTensor
    tensor_values = '-0.0052 0.0149 -0.0221 0 0.1531 0.2652'
    tensor_name = e1
    outputs                      = none
  [../]
  [./e2]
    # eigenstrain per Kelvin for crystal 2
    type = GenericConstantRankTwoTensor
    tensor_values = '-0.0052 0.0149 -0.0221 0 -0.1531 -0.2652'
    tensor_name = e2
    outputs                      = none
  [../]

  [./e3]
    # eigenstrain per Kelvin for crystal 1
    type = GenericConstantRankTwoTensor
    tensor_values = '-0.0052 -0.0128 0.0057 0.0160 0.0 0.0'
    tensor_name = e3
    outputs                      = none
  [../]
  [./e4]
    # eigenstrain per Kelvin for crystal 2
    type = GenericConstantRankTwoTensor
    tensor_values = '-0.0052 0.0149 -0.0221 0 -0.1531 -0.2652'
    tensor_name = e4
    outputs                      = none
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

[]
