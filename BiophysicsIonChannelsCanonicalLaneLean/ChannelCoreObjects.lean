import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiophysicsIonChannels

structure IonChannelObject where
  channelType : String
  selectivityFilterDefined : Prop
  gatingMechanismKnown : Prop
  permeationCharacterized : Prop
  conclusion : selectivityFilterDefined ∧ gatingMechanismKnown ∧ permeationCharacterized

structure AdmittedIonChannel where
  object : IonChannelObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmittedIonChannel) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BiophysicsIonChannels
end HautevilleHouse
