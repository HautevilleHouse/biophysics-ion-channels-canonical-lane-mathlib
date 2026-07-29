import BiophysicsIonChannelsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure IonChannelStatesPackage where
  stateSpace : Type
  openProbability : Prop
  closedProbability : Prop
  inactivatedProbability : Prop

structure IonChannelStatesEvidence (P : IonChannelStatesPackage) where
  openProbabilityClosed : P.openProbability
  closedProbabilityClosed : P.closedProbability
  inactivatedProbabilityClosed : P.inactivatedProbability

def IonChannelStatesClosed (P : IonChannelStatesPackage) : Prop :=
  P.openProbability ∧ P.closedProbability ∧ P.inactivatedProbability

theorem ion_channel_states_closed_from_evidence (P : IonChannelStatesPackage) (E : IonChannelStatesEvidence P) :
    IonChannelStatesClosed P := by
  exact And.intro E.openProbabilityClosed (And.intro E.closedProbabilityClosed E.inactivatedProbabilityClosed)

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse