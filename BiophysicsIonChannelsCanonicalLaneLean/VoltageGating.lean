import BiophysicsIonChannelsCanonicalLaneLean.IonChannelStates

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure VoltageGatingPackage {P : IonChannelStatesPackage} where
  voltageDependence : Prop
  activationCurve : Prop
  deactivationCurve : Prop
  gatingCharge : Prop

structure VoltageGatingEvidence {P : IonChannelStatesPackage} (V : VoltageGatingPackage P) where
  voltageDependenceClosed : V.voltageDependence
  activationCurveClosed : V.activationCurve
  deactivationCurveClosed : V.deactivationCurve
  gatingChargeClosed : V.gatingCharge

def VoltageGatingClosed {P : IonChannelStatesPackage} (V : VoltageGatingPackage P) : Prop :=
  V.voltageDependence ∧ V.activationCurve ∧ V.deactivationCurve ∧ V.gatingCharge

theorem voltage_gating_closed_from_evidence {P : IonChannelStatesPackage} (V : VoltageGatingPackage P) (E : VoltageGatingEvidence V) :
    VoltageGatingClosed V := by
  exact And.intro E.voltageDependenceClosed (And.intro E.activationCurveClosed (And.intro E.deactivationCurveClosed E.gatingChargeClosed))

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse