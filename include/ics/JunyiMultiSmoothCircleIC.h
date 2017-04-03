/****************************************************************/
/* MOOSE - Multiphysics Object Oriented Simulation Environment  */
/*                                                              */
/*          All contents are licensed under LGPL V2.1           */
/*             See LICENSE for full restrictions                */
/****************************************************************/
#ifndef JUNYIMULTISMOOTHCIRCLEIC_H
#define JUNYIMULTISMOOTHCIRCLEIC_H

#include "Kernel.h"
#include "JunyiSmoothCircleBaseIC.h"
#include "MooseRandom.h"
// System includes
#include <string>

// Forward Declarations
class JunyiMultiSmoothCircleIC;

template<>
InputParameters validParams<JunyiMultiSmoothCircleIC>();

/**
 * MultismoothCircleIC creates multiple SmoothCircles (number = numbub) that are randomly
 * positioned around the domain, with a minimum spacing equal to bubspac
 */
class JunyiMultiSmoothCircleIC : public JunyiSmoothCircleBaseIC
{
public:
  JunyiMultiSmoothCircleIC(const InputParameters & parameters);

  virtual void initialSetup();

protected:
  virtual void computeCircleRadii();
  virtual void computeCircleCenters();

  const unsigned int _numbub;
  const Real _bubspac;

  const unsigned int _max_num_tries;

  const Real _radius;
  const Real _radius_variation;
  const MooseEnum _radius_variation_type;
  const Real _variation_invalue;

  Point _bottom_left;
  Point _top_right;
  Point _range;
};

#endif //MULTISMOOTHCIRCLEIC_H
