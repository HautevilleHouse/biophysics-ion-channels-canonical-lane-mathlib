import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure IonChannelAdmittedObject where
  channelType : String
  conductance : Prop
  gatingMechanism : Prop
  conclusion : Prop

structure AdmissibleClass where
  object : IonChannelAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse