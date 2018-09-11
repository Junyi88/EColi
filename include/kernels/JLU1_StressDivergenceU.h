#ifndef JLU1_StressDivergenceU_H
#define JLU1_StressDivergenceU_H

#include "Kernel.h"
#include "JvarMapInterface.h"
#include "DerivativeMaterialInterface.h"
#include "Material.h"
#include "RankTwoTensor.h"
#include "RankFourTensor.h"

// Forward Declaration
class JLU1_StressDivergenceU;

template <>
InputParameters validParams<JLU1_StressDivergenceU>();

//----------------------------------------------------------------
class JLU1_StressDivergenceU : public DerivativeMaterialInterface<JvarMapKernelInterface<Kernel> >
{
public:
  JLU1_StressDivergenceU(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual() override;
  virtual Real computeQpJacobian() override;
  virtual Real computeQpOffDiagJacobian(unsigned int jvar) override;

  unsigned int WhichJacobianVariable(unsigned int var);

// ------------------------------
  unsigned int _Component_I;
  std::vector<unsigned int> _Other_Components;
  const MaterialProperty<RankTwoTensor> & _Stress;
  const MaterialProperty<RankFourTensor> & _elasticity_tensor;
  std::vector<unsigned int> _n_vars;

  unsigned int _N;
  Real _Accumulator;
  Real _PlaceHolder0;
};

#endif
