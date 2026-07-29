import BiophysicsIonChannelsCanonicalLaneLean.VoltageGating

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure ConductanceModelPackage {P : IonChannelStatesPackage} {V : VoltageGatingPackage P} where
  conductanceFormula : Prop
  currentEquation : Prop
  rectification : Prop

structure ConductanceModelEvidence {P : IonChannelStatesPackage} {V : VoltageGatingPackage P} (C : ConductanceModelPackage V) where
  conductanceFormulaClosed : C.conductanceFormula
  currentEquationClosed : C.currentEquation
  rectificationClosed : C.rectification

def ConductanceModelClosed {P : IonChannelStatesPackage} {V : VoltageGatingPackage P} (C : ConductanceModelPackage V) : Prop :=
  C.conductanceFormula ∧ C.currentEquation ∧ C.rectification

theorem conductance_model_closed_from_evidence {P : IonChannelStatesPackage} {V : VoltageGatingPackage P} (C : ConductanceModelPackage V) (E : ConductanceModelEvidence C) :
    ConductanceModelClosed C := by
  exact And.intro E.conductanceFormulaClosed (And.intro E.currentEquationClosed E.rectificationClosed)

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse