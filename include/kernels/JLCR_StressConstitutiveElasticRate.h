#ifndef JLCR_StressConstitutiveElasticRate_H
#define JLCR_StressConstitutiveElasticRate_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"
#include "JUtils_GetVarType.h"
#include "RankFourTensor.h"
#include "RankTwoTensor.h"

// Forward Declaration
class JLCR_StressConstitutiveElasticRate;

template <>
InputParameters validParams<JLCR_StressConstitutiveElasticRate>();

//----------------------------------------------------------------
class JLCR_StressConstitutiveElasticRate : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JLCR_StressConstitutiveElasticRate(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;
  virtual unsigned int WhichJacobianVariable(unsigned var);

  const unsigned int _nvar;

  unsigned int _componentI;
  unsigned int _componentJ;

  std::vector<const VariableValue *> _v;
  std::vector<const VariableGradient *> _grad_v;
  std::vector<unsigned int> _v_num;


  // const VariableValue & _v1;
  // const VariableValue & _v2;
  // const VariableValue & _v3;
  //
  // const VariableGradient & _grad_v1;
  // const VariableGradient & _grad_v2;
  // const VariableGradient & _grad_v3;
  //
  // unsigned int _v1_var_number;
  // unsigned int _v2_var_number;
  // unsigned int _v3_var_number;

  const MaterialProperty<RankFourTensor> & _elasticity_tensor;
  const MaterialProperty<RankTwoTensor> & _StressRate;

  Real _StressJac;
  unsigned int _num_v;
};

#endif // COUPLEDTIMEDERIVATIVE_H
