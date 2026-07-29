import HautevilleHouse.BiophysicsIonChannels.ChannelCoreObjects

namespace HautevilleHouse
namespace BiophysicsIonChannels

structure ChannelSelectivityPackage where
  ionicRadiusSelectivity : Prop
  chargeSelectivity : Prop
  hydrationEnergy : Prop
  bindingSiteAffinity : Prop

structure ChannelSelectivityEvidence (S : ChannelSelectivityPackage) where
  ionicRadiusSelectivityClosed : S.ionicRadiusSelectivity
  chargeSelectivityClosed : S.chargeSelectivity
  hydrationEnergyClosed : S.hydrationEnergy
  bindingSiteAffinityClosed : S.bindingSiteAffinity

def ChannelSelectivityClosed (S : ChannelSelectivityPackage) : Prop :=
  S.ionicRadiusSelectivity ∧ S.chargeSelectivity ∧ S.hydrationEnergy ∧ S.bindingSiteAffinity

theorem channel_selectivity_closed_from_evidence
    (S : ChannelSelectivityPackage) (E : ChannelSelectivityEvidence S) :
    ChannelSelectivityClosed S := by
  exact And.intro E.ionicRadiusSelectivityClosed
    (And.intro E.chargeSelectivityClosed
      (And.intro E.hydrationEnergyClosed E.bindingSiteAffinityClosed))

end BiophysicsIonChannels
end HautevilleHouse
