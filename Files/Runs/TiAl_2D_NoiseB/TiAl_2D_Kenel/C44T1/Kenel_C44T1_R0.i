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
  nx = 100
  ny = 100
  nz = 0
  xmin = 0
  xmax = 1.0e2
  ymin = 0
  ymax = 1.0e2
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

  [./LaQ]
    order = FIRST
    family = LAGRANGE
  [../]
[]
