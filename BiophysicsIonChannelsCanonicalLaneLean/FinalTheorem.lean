import canonicalLaneMathlib.AdmissibleClass
import BiophysicsIonChannelsCanonicalLaneLean.IonChannelModel
import BiophysicsIonChannelsCanonicalLaneLean.HodgkinHuxleyKinetics

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure IonChannelAdmittedObject where
  model : IonChannelModel
  kinetics : HodgkinHuxleyKineticsPackage model
  modelClosed : IonChannelModelClosed model
  kineticsClosed : HodgkinHuxleyKineticsClosed kinetics

structure AdmissibleClass where
  object : IonChannelAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.modelClosed ∧ A.object.kineticsClosed

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact And.intro A.object.modelClosed A.object.kineticsClosed

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedIonChannelClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ion_channel_endgame (A : AdmissibleClass) : ConstrainedIonChannelClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse