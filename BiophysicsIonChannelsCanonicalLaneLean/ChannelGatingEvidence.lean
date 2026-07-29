import HautevilleHouse.BiophysicsIonChannels.ChannelCoreObjects

namespace HautevilleHouse
namespace BiophysicsIonChannels

structure ChannelGatingPackage where
  voltageGating : Prop
  ligandGating : Prop
  mechanoSensitivity : Prop
  gatingKinetics : Prop

structure ChannelGatingEvidence (G : ChannelGatingPackage) where
  voltageGatingClosed : G.voltageGating
  ligandGatingClosed : G.ligandGating
  mechanoSensitivityClosed : G.mechanoSensitivity
  gatingKineticsClosed : G.gatingKinetics

def ChannelGatingClosed (G : ChannelGatingPackage) : Prop :=
  G.voltageGating ∧ G.ligandGating ∧ G.mechanoSensitivity ∧ G.gatingKinetics

theorem channel_gating_closed_from_evidence
    (G : ChannelGatingPackage) (E : ChannelGatingEvidence G) :
    ChannelGatingClosed G := by
  exact And.intro E.voltageGatingClosed
    (And.intro E.ligandGatingClosed
      (And.intro E.mechanoSensitivityClosed E.gatingKineticsClosed))

end BiophysicsIonChannels
end HautevilleHouse
