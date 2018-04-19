#=======================================================
[GlobalParams]
  # displacements = 'u_x u_y'
  outputs = exodus
[]

#=======================================================
[Mesh]
  type = GeneratedMesh
  dim = 2
  elem_type = QUAD4
  nx = 100
  ny = 100
  nz = 0
  xmin = -50.0
  xmax = 50.0
  ymin = -50.0
  ymax = 50.0
  zmin = 0
  zmax = 0
[]

#=======================================================
[Variables]
  [./rho]
  [../]

  [./v1]
  [../]

  [./v2]
  [../]
[]

#=======================================================
[ICs]
  [./BoundingBoxIC_rho]
    block                        = 0
    inside                       = 2.0
    outside                      = 1.0
    type                         = BoundingBoxIC
    variable                     = rho
    x1                           = -30.0
    x2                           = -25.0
    y1                           = -30
    y2                           = -25.0
    z1                           = 0
    z2                           = 0
  [../]

  [./ConstantIC_v1]
  block                        =    0
  type                         = ConstantIC
  value                        = 1.0
  variable                     = v1
  [../]

  [./ConstantIC_v2]
  block                        =    0
  type                         = ConstantIC
  value                        = 2.0
  variable                     = v2
  [../]
[]

##=======================================================
[Kernels]
  [./rho_dot]
    type = TimeDerivative
    variable = rho
  [../]
  [./rho_Convec]
    type = JEUk_Mass_Convec2D
    variable = rho
    velocities = 'v1 v2'
  [../]

  [./v1_dot]
    type                         = TimeDerivative
    variable                     = v1
  [../]
  [./v2_dot]
    type                         = TimeDerivative
    variable                     = v2
  [../]
[]
