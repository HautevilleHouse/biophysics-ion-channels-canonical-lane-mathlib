import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiophysicsIonChannelsCanonicalLaneLean.IonChannelAdmissibleClass
import HautevilleHouse.BiophysicsIonChannelsCanonicalLaneLean.IonChannelBridgeLemmas

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

def ConstrainedIonChannelClosure (A : IonChannelAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ion_channel_endgame (A : IonChannelAdmissibleClass) :
    ConstrainedIonChannelClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse