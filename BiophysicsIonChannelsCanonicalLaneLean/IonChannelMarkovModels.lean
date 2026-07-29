/-
# Markov State Models for Ion Channels
-/

import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiophysicsIonChannelsCanonicalLaneLean.IonChannelAdmissibleClass

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure MarkovStateModel where
  stateCount : ℕ
  transitionRates : Matrix ℝ ℝ
  stationaryDistribution : Vector ℝ
  detailedBalance : Prop
  ergodicity : Prop
  conductanceData : ℝ → ℝ
  modelClosed : detailedBalance ∧ ergodicity

structure MarkovModelEvidence (M : MarkovStateModel) where
  detailedBalanceClosed : M.detailedBalance
  ergodicityClosed : M.ergodicity

def MarkovModelClosed (M : MarkovStateModel) : Prop :=
  M.detailedBalance ∧ M.ergodicity

theorem markov_model_closed_from_evidence (M : MarkovStateModel) (E : MarkovModelEvidence M) :
    MarkovModelClosed M := by
  exact And.intro E.detailedBalanceClosed E.ergodicityClosed

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse