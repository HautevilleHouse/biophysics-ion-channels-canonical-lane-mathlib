import canonicalLaneMathlib.AdmissibleClass
import BiophysicsIonChannelsCanonicalLaneLean.IonChannelModel

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure HodgkinHuxleyKineticsPackage (M : IonChannelModel) where
  alpha : M.gatingParticles → Float → Float
  beta : M.gatingParticles → Float → Float
  steadyState : M.gatingParticles → Float → Float
  timeConstant : M.gatingParticles → Float → Float
  voltageClampData : Prop
  rateEquationWellDefined : Prop

structure HodgkinHuxleyKineticsEvidence {M : IonChannelModel} (K : HodgkinHuxleyKineticsPackage M) where
  alphaPositive : ∀ n : Fin M.gatingParticles, ∀ v : Float, K.alpha n v > 0.0
  betaPositive : ∀ n : Fin M.gatingParticles, ∀ v : Float, K.beta n v > 0.0
  steadyStateNormalized : ∀ n : Fin M.gatingParticles, ∀ v : Float, K.steadyState n v ∈ Set.Icc (0 : Float) 1
  voltageClampDataClosed : K.voltageClampData
  rateEquationWellDefinedClosed : K.rateEquationWellDefined

def HodgkinHuxleyKineticsClosed {M : IonChannelModel} (K : HodgkinHuxleyKineticsPackage M) : Prop :=
  (∀ n : Fin M.gatingParticles, ∀ v : Float, K.alpha n v > 0.0 ∧ K.beta n v > 0.0) ∧
  (∀ n : Fin M.gatingParticles, ∀ v : Float, K.steadyState n v ≥ 0.0 ∧ K.steadyState n v ≤ 1.0) ∧
  K.voltageClampData ∧ K.rateEquationWellDefined

theorem hodgkin_huxley_kinetics_closed_from_evidence {M : IonChannelModel} (K : HodgkinHuxleyKineticsPackage M)
    (E : HodgkinHuxleyKineticsEvidence K) : HodgkinHuxleyKineticsClosed K := by
  refine And.intro (fun n v => And.intro (E.alphaPositive n v) (E.betaPositive n v))
    (And.intro (fun n v => And.intro (E.steadyStateNormalized n v).left (E.steadyStateNormalized n v).right)
      (And.intro E.voltageClampDataClosed E.rateEquationWellDefinedClosed))

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse