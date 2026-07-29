/-
# Hodgkin-Huxley Model Package
-/

import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiophysicsIonChannelsCanonicalLaneLean.IonChannelAdmissibleClass

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure HodgkinHuxleyModel where
  membraneCapacitance : ℝ
  sodiumConductance : ℝ
  potassiumConductance : ℝ
  leakConductance : ℝ
  nGate : ℝ → ℝ → ℝ
  mGate : ℝ → ℝ → ℝ
  hGate : ℝ → ℝ → ℝ
  voltageDynamics : ℝ → ℝ → ℝ
  gateDynamics : (ℝ → ℝ) → ℝ→ ℝ → ℝ
  actionPotentialCaptured : Prop
  refractoryPeriodCaptured : Prop
  modelValid : actionPotentialCaptured ∧ refractoryPeriodCaptured

structure HodgkinHuxleyEvidence (M : HodgkinHuxleyModel) where
  actionPotentialCapturedClosed : M.actionPotentialCaptured
  refractoryPeriodCapturedClosed : M.refractoryPeriodCaptured

def HodgkinHuxleyClosed (M : HodgkinHuxleyModel) : Prop :=
  M.actionPotentialCaptured ∧ M.refractoryPeriodCaptured

theorem hodgkin_huxley_closed_from_evidence (M : HodgkinHuxleyModel) (E : HodgkinHuxleyEvidence M) :
    HodgkinHuxleyClosed M := by
  exact And.intro E.actionPotentialCapturedClosed E.refractoryPeriodCapturedClosed

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse