import HautevilleHouse.BiophysicsIonChannelsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure GatingVariable where
  name : String
  activation : Prop
  inactivation : Prop
  steadyState : Prop
  timeConstant : Prop

structure IonChannelModel where
  channelName : String
  conductance : Prop
  gatingVariables : List GatingVariable
  voltageDependence : Prop
  ionSelectivity : Prop

def ChannelConductance (g : IonChannelModel) : Prop := g.conductance

def ModelAdmissible (g : IonChannelModel) : Prop :=
  g.conductance ∧ g.voltageDependence ∧ g.ionSelectivity

structure IonChannelEvidence (g : IonChannelModel) where
  conductanceClosed : g.conductance
  voltageDependenceClosed : g.voltageDependence
  ionSelectivityClosed : g.ionSelectivity

theorem ion_channel_model_closed (g : IonChannelModel) (E : IonChannelEvidence g) :
    ModelAdmissible g := by
  exact And.intro E.conductanceClosed (And.intro E.voltageDependenceClosed E.ionSelectivityClosed)

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse