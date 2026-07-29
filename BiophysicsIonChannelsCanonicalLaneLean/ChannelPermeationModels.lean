import HautevilleHouse.BiophysicsIonChannels.ChannelCoreObjects

namespace HautevilleHouse
namespace BiophysicsIonChannels

structure PermeationModelPackage where
  nernstPlanckEquation : Prop
  poissonNernstPlanck : Prop
  brownianDynamics : Prop
  rateTheoryModels : Prop

structure PermeationModelEvidence (P : PermeationModelPackage) where
  nernstPlanckEquationClosed : P.nernstPlanckEquation
  poissonNernstPlanckClosed : P.poissonNernstPlanck
  brownianDynamicsClosed : P.brownianDynamics
  rateTheoryModelsClosed : P.rateTheoryModels

def PermeationModelClosed (P : PermeationModelPackage) : Prop :=
  P.nernstPlanckEquation ∧ P.poissonNernstPlanck ∧ P.brownianDynamics ∧ P.rateTheoryModels

theorem permeation_model_closed_from_evidence
    (P : PermeationModelPackage) (E : PermeationModelEvidence P) :
    PermeationModelClosed P := by
  exact And.intro E.nernstPlanckEquationClosed
    (And.intro E.poissonNernstPlanckClosed
      (And.intro E.brownianDynamicsClosed E.rateTheoryModelsClosed))

end BiophysicsIonChannels
end HautevilleHouse
