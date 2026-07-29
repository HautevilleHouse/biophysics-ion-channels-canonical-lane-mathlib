import BiophysicsIonChannelsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiophysicsIonChannelsCanonicalLaneLean

structure LigandGatingPackage (A : IonChannelAdmissibleClass) where
  ligandBindingSite : Prop
  doseResponseCurve : Prop
  openProbabilityDependence : Prop
  desensitizationMechanism : Prop

structure LigandGatingEvidence {A : IonChannelAdmissibleClass} (L : LigandGatingPackage A) where
  ligandBindingSiteClosed : L.ligandBindingSite
  doseResponseCurveClosed : L.doseResponseCurve
  openProbabilityDependenceClosed : L.openProbabilityDependence
  desensitizationMechanismClosed : L.desensitizationMechanism

def LigandGatingClosed {A : IonChannelAdmissibleClass} (L : LigandGatingPackage A) : Prop :=
  L.ligandBindingSite ∧ L.doseResponseCurve ∧ L.openProbabilityDependence ∧ L.desensitizationMechanism

theorem ligand_gating_closed_from_evidence {A : IonChannelAdmissibleClass}
    (L : LigandGatingPackage A) (E : LigandGatingEvidence L) : LigandGatingClosed L := by
  exact And.intro E.ligandBindingSiteClosed
    (And.intro E.doseResponseCurveClosed
      (And.intro E.openProbabilityDependenceClosed E.desensitizationMechanismClosed))

end BiophysicsIonChannelsCanonicalLaneLean
end HautevilleHouse