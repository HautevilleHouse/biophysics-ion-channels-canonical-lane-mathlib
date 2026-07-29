import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BiophysicsIonChannelsCanonicalLaneLean.IonChannelAdmissibleClass

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

def bridgeClosed (A : IonChannelAdmissibleClass) : Prop :=
  IonChannelWitnessClosed A.channelObject

theorem bridge_from_admissible_class (A : IonChannelAdmissibleClass) :
    bridgeClosed A := by
  exact A.channelObject.conclusion

def gateClosed (A : IonChannelAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : IonChannelAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse