import BiophysicsIonChannelsCanonicalLaneLean.ConductanceModel

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure MarkovKineticsPackage {P : IonChannelStatesPackage} {V : VoltageGatingPackage P} {C : ConductanceModelPackage V} where
  transitionRates : Prop
  detailedBalance : Prop
  stationaryDistribution : Prop

structure MarkovKineticsEvidence {P : IonChannelStatesPackage} {V : VoltageGatingPackage P} {C : ConductanceModelPackage V} (M : MarkovKineticsPackage C) where
  transitionRatesClosed : M.transitionRates
  detailedBalanceClosed : M.detailedBalance
  stationaryDistributionClosed : M.stationaryDistribution

def MarkovKineticsClosed {P : IonChannelStatesPackage} {V : VoltageGatingPackage P} {C : ConductanceModelPackage V} (M : MarkovKineticsPackage C) : Prop :=
  M.transitionRates ∧ M.detailedBalance ∧ M.stationaryDistribution

theorem markov_kinetics_closed_from_evidence {P : IonChannelStatesPackage} {V : VoltageGatingPackage P} {C : ConductanceModelPackage V} (M : MarkovKineticsPackage C) (E : MarkovKineticsEvidence M) :
    MarkovKineticsClosed M := by
  exact And.intro E.transitionRatesClosed (And.intro E.detailedBalanceClosed E.stationaryDistributionClosed)

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse