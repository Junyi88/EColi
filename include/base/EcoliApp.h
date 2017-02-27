#ifndef ECOLIAPP_H
#define ECOLIAPP_H

#include "MooseApp.h"

class EcoliApp;

template<>
InputParameters validParams<EcoliApp>();

class EcoliApp : public MooseApp
{
public:
  EcoliApp(InputParameters parameters);
  virtual ~EcoliApp();

  static void registerApps();
  static void registerObjects(Factory & factory);
  static void associateSyntax(Syntax & syntax, ActionFactory & action_factory);
};

#endif /* ECOLIAPP_H */
