import HautevilleHouse.BiophysicsIonChannelsCanonicalLaneLean.IonChannelModels

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure VoltageSensorDomain where
  sensorName : String
  totalCharge : Prop
  activationCurve : Prop
  transitionRates : Prop

structure VoltageSensorActivationPackage where
  sensor : VoltageSensorDomain
  voltageDependence : Prop
  gatingCurrent : Prop
  activationEnergy : Prop

structure ActivationEvidence (P : VoltageSensorActivationPackage) where
  voltageDependenceClosed : P.voltageDependence
  gatingCurrentClosed : P.gatingCurrent
  activationEnergyClosed : P.activationEnergy

def VoltageSensorActivationClosed (P : VoltageSensorActivationPackage) : Prop :=
  P.voltageDependence ∧ P.gatingCurrent ∧ P.activationEnergy

theorem voltage_sensor_activation_closed (P : VoltageSensorActivationPackage)
    (E : ActivationEvidence P) : VoltageSensorActivationClosed P := by
  exact And.intro E.voltageDependenceClosed (And.intro E.gatingCurrentClosed E.activationEnergyClosed)

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse