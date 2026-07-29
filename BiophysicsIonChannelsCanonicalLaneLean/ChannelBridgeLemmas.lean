import HautevilleHouse.BiophysicsIonChannels.ChannelCoreObjects

namespace HautevilleHouse
namespace BiophysicsIonChannels

def bridgeClosed (A : AdmittedIonChannel) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : AdmittedIonChannel) :
    bridgeClosed A := by
  exact A.object.conclusion

end BiophysicsIonChannels
end HautevilleHouse
