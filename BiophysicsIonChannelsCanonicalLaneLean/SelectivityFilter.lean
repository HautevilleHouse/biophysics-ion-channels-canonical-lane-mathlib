import HautevilleHouse.BiophysicsIonChannelsCanonicalLaneLean.IonChannelModels

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure IonBindingSite where
  ionName : String
  bindingAffinity : Prop
  coordinationGeometry : Prop

structure SelectivityFilterPackage where
  poreRadius : Prop
  bindingSites : List IonBindingSite
  dehydrationEnergy : Prop
  selectivitySequence : Prop

structure SelectivityEvidence (S : SelectivityFilterPackage) where
  poreRadiusClosed : S.poreRadius
  bindingSitesOccupied : S.bindingSites.length ≥ 1
  selectivitySequenceClosed : S.selectivitySequence

def SelectivityFilterClosed (S : SelectivityFilterPackage) : Prop :=
  S.poreRadius ∧ (S.bindingSites.length ≥ 1) ∧ S.selectivitySequence

theorem selectivity_filter_closed (S : SelectivityFilterPackage) (E : SelectivityEvidence S) :
    SelectivityFilterClosed S := by
  exact And.intro E.poreRadiusClosed (And.intro E.bindingSitesOccupied E.selectivitySequenceClosed)

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse