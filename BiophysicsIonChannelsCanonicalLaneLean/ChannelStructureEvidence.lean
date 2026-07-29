import HautevilleHouse.BiophysicsIonChannels.ChannelCoreObjects

namespace HautevilleHouse
namespace BiophysicsIonChannels

structure ChannelStructurePackage where
  alphaHelixBundle : Prop
  selectivityFilterComposition : Prop
  transMembraneDomain : Prop
  poreRadius : Prop

structure ChannelStructureEvidence (P : ChannelStructurePackage) where
  alphaHelixBundleClosed : P.alphaHelixBundle
  selectivityFilterCompositionClosed : P.selectivityFilterComposition
  transMembraneDomainClosed : P.transMembraneDomain
  poreRadiusClosed : P.poreRadius

def ChannelStructureClosed (P : ChannelStructurePackage) : Prop :=
  P.alphaHelixBundle ∧ P.selectivityFilterComposition ∧ P.transMembraneDomain ∧ P.poreRadius

theorem channel_structure_closed_from_evidence
    (P : ChannelStructurePackage) (E : ChannelStructureEvidence P) :
    ChannelStructureClosed P := by
  exact And.intro E.alphaHelixBundleClosed
    (And.intro E.selectivityFilterCompositionClosed
      (And.intro E.transMembraneDomainClosed E.poreRadiusClosed))

end BiophysicsIonChannels
end HautevilleHouse
