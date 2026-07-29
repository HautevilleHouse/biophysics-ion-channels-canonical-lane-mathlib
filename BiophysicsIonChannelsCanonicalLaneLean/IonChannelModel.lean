import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure IonChannelModel where
  channelType : Type
  gatingParticles : Nat
  conductance : Float
  reversalPotential : Float
  openStateProbability : Prop
  inactivatedStateProbability : Prop

structure IonChannelModelEvidence (M : IonChannelModel) where
  conductancePositive : M.conductance > 0.0
  reversalPotentialFinite : M.reversalPotential ≠ 0.0
  probabilitySummation : M.openStateProbability ∧ M.inactivatedStateProbability → M.openStateProbability ∨ M.inactivatedStateProbability
  gatingParticlesDefined : M.gatingParticles ≥ 0

def IonChannelModelClosed (M : IonChannelModel) : Prop :=
  M.conductance > 0.0 ∧ M.reversalPotential ≠ 0.0 ∧
  (M.openStateProbability ∨ M.inactivatedStateProbability)

theorem ion_channel_model_closed_from_evidence (M : IonChannelModel) (E : IonChannelModelEvidence M) :
    IonChannelModelClosed M := by
  refine And.intro E.conductancePositive (And.intro E.reversalPotentialFinite ?_)
  exact Or.elim E.probabilitySummation (fun h => h) (fun h => h)

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse