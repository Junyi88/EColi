/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef JUNYISMOOTHCIRCLEBASEIC_H
#define JUNYISMOOTHCIRCLEBASEIC_H

#include "Kernel.h"
#include "InitialCondition.h"
#include "MooseRandom.h"

// System includes
#include <string>

// Forward Declarations
class JunyiSmoothCircleBaseIC;

template<>
InputParameters validParams<JunyiSmoothCircleBaseIC>();

/**
 * SmoothcircleBaseIC is the base class for all initial conditions that create circles. The circles can have sharp interfaces or a finite interface width. Note that all children must resize _radii and _centers.
 */
class JunyiSmoothCircleBaseIC : public InitialCondition
{
public:
  JunyiSmoothCircleBaseIC(const InputParameters & parameters);

  virtual Real value(const Point & p);
  virtual RealGradient gradient(const Point & p);

  virtual void initialSetup();

protected:
  virtual Real computeCircleValue(const Point & p, const Point & center, const Real & radius, const Real & variation);
  virtual RealGradient computeCircleGradient(const Point & p, const Point & center, const Real & radius, const Real & variation);

  virtual void computeCircleRadii() = 0;
  virtual void computeCircleCenters() = 0;

  MooseMesh & _mesh;

  Real _invalue;
  Real _outvalue;
  Real _int_width;
  bool _3D_spheres;
  bool _zero_gradient;

  unsigned int _num_dim;

  std::vector<Point> _centers;
  std::vector<Real> _radii;
  std::vector<Real> _variation;

  MooseRandom _random;
  MooseRandom _randomVal;
};

#endif //SMOOTHCIRCLEBASEIC_H
