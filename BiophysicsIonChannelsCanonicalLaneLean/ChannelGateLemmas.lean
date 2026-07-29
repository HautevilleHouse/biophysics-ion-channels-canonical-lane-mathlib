import HautevilleHouse.BiophysicsIonChannels.ChannelCoreObjects

namespace HautevilleHouse
namespace BiophysicsIonChannels

def gateClosed (A : AdmittedIonChannel) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmittedIonChannel) :
    gateClosed A := by
  exact A.gateWitness

end BiophysicsIonChannels
end HautevilleHouse
