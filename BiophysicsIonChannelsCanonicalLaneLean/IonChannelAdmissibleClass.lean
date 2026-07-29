import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure IonChannelAdmissibleClass where
  channelObject : IonChannelObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : IonChannelAdmissibleClass) : Prop :=
  IonChannelWitnessClosed A.channelObject ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse