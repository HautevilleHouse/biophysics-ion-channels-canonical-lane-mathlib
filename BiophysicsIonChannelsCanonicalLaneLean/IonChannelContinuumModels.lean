/-
# Continuum Electrodiffusion Models for Ion Channels
-/

import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiophysicsIonChannelsCanonicalLaneLean.IonChannelAdmissibleClass

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure PoissonNernstPlanckModel where
  domain : ℝ³
  ionConcentrations : ℝ → ℝ → ℝ³ → ℝ
  electrostaticPotential : ℝ³ → ℝ
  diffusionCoefficients : ℝ → ℝ → ℝ
  driftTerms : ℝ³ → ℝ³
  poissonEquation : Prop
  nernstPlanckEquation : Prop
  boundaryConditions : Prop

structure PNPEvidence (P : PoissonNernstPlanckModel) where
  poissonEquationClosed : P.poissonEquation
  nernstPlanckEquationClosed : P.nernstPlanckEquation
  boundaryConditionsClosed : P.boundaryConditions

def PNPClosed (P : PoissonNernstPlanckModel) : Prop :=
  P.poissonEquation ∧ P.nernstPlanckEquation ∧ P.boundaryConditions

theorem pnp_closed_from_evidence (P : PoissonNernstPlanckModel) (E : PNPEvidence P) : PNPClosed P := by
  exact And.intro E.poissonEquationClosed (And.intro E.nernstPlanckEquationClosed E.boundaryConditionsClosed)

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse