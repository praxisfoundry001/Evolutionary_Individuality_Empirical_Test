/-
EVOLUTIONARY INDIVIDUALITY DOMAIN ADAPTER / CONTRACT v0.2
Target: Structural Flow Universal Kernel v1.0
Lean 4

USE
---
Append this file AFTER `Structural_Flow_Universal_Kernel_v1.0.lean`
in the same Lean source/session, or otherwise load the compatible public kernel
as a module before this file.

This file is the machine-readable evolutionary-individuality domain
adapter / contract. It does NOT validate biological evidence. It accepts
externally adjudicated DISCHARGED / VIOLATED / OPEN states and machine-checks
the declared routing into account-native and cross-account verdicts.

Scientific source:
  Evolutionary Individuality as an Empirical Question:
  A Proposed Experimental Test in Pseudomonas.

Human-readable machine guide:
  Evolutionary Individuality: Human-Readable Companion to the
  Domain Adapter / Contract.

A clean Lean elaboration means only that the encoded contract is internally
accepted at its declared formal scope.
-/

namespace StructuralFlow
namespace EvolutionaryIndividuality

open UniversalTranslationContract

/-! --------------------------------------------------------------------------
Contract vocabulary
---------------------------------------------------------------------------- -/

inductive ObjectBurden where
  | collectiveLineageEntity
  | sharedSurfaceAcrossSeats
deriving DecidableEq, Repr

inductive DomainBurden where
  /- Domain-entry burdens. -/
  | accountVersionPinned
  | ancestryAdequacy
  | assayAdequacy
  | interventionIntegrity
  | treatmentUnitIntegrity
  | referenceProvenance
  | commonEnvironmentAdequacy
  | fullTrajectoryAdequacy
  | lifeCycleStageAdequacy
  | lifeCycleTrajectoryAdequacy

  /- Clarke downstream burdens. -/
  | c1FocalSelectionCapacity
  | c2QualifyingIndividuatingMechanism
  | c3MechanismGrounding
  | c4NonArbitraryGrouping

  /- Bourrat downstream burdens. -/
  | b1CollectivePhenotypicVariation
  | b2CollectiveFitnessDifferences
  | b3CollectiveHeredity
  | b4ObjectiveIndividuation
  | b5InternalEndogenizedGeneration

  /- Life-cycle downstream burdens. -/
  | l1Multiplication
  | l2Closure
  | l3FocalStageReestablishment
deriving DecidableEq, Repr

def objectRequired : ObjectBurden -> Prop
  | .collectiveLineageEntity => True
  | .sharedSurfaceAcrossSeats => True

def domainEntryRequired : DomainBurden -> Prop
  | .accountVersionPinned => True
  | .ancestryAdequacy => True
  | .assayAdequacy => True
  | .interventionIntegrity => True
  | .treatmentUnitIntegrity => True
  | .referenceProvenance => True
  | .commonEnvironmentAdequacy => True
  | .fullTrajectoryAdequacy => True
  | .lifeCycleStageAdequacy => True
  | .lifeCycleTrajectoryAdequacy => True
  | .c1FocalSelectionCapacity => False
  | .c2QualifyingIndividuatingMechanism => False
  | .c3MechanismGrounding => False
  | .c4NonArbitraryGrouping => False
  | .b1CollectivePhenotypicVariation => False
  | .b2CollectiveFitnessDifferences => False
  | .b3CollectiveHeredity => False
  | .b4ObjectiveIndividuation => False
  | .b5InternalEndogenizedGeneration => False
  | .l1Multiplication => False
  | .l2Closure => False
  | .l3FocalStageReestablishment => False

def domainDownstreamRequired : DomainBurden -> Prop
  | .accountVersionPinned => False
  | .ancestryAdequacy => False
  | .assayAdequacy => False
  | .interventionIntegrity => False
  | .treatmentUnitIntegrity => False
  | .referenceProvenance => False
  | .commonEnvironmentAdequacy => False
  | .fullTrajectoryAdequacy => False
  | .lifeCycleStageAdequacy => False
  | .lifeCycleTrajectoryAdequacy => False
  | .c1FocalSelectionCapacity => True
  | .c2QualifyingIndividuatingMechanism => True
  | .c3MechanismGrounding => True
  | .c4NonArbitraryGrouping => True
  | .b1CollectivePhenotypicVariation => True
  | .b2CollectiveFitnessDifferences => True
  | .b3CollectiveHeredity => True
  | .b4ObjectiveIndividuation => True
  | .b5InternalEndogenizedGeneration => True
  | .l1Multiplication => True
  | .l2Closure => True
  | .l3FocalStageReestablishment => True

theorem domainRolesDisjoint :
    ∀ b : DomainBurden,
      ¬ (domainEntryRequired b ∧ domainDownstreamRequired b) := by
  intro b
  cases b <;>
    simp [domainEntryRequired, domainDownstreamRequired]

/-!
The adapter does not ask Lean to validate external scientific evidence.
The `World` evidence predicates below certify only that the submitted adjudicated
state is the state being routed by this adapter.
-/

def submittedEvidence
    {B : Type}
    (state : B -> Disposition) :
    B -> Disposition -> Prop :=
  fun b d => state b = d

structure ContractInput where
  coreState : CoreBurden -> Disposition
  objectState : ObjectBurden -> Disposition
  domainState : DomainBurden -> Disposition

def worldOf
    (i : ContractInput) :
    World ObjectBurden DomainBurden where
  coreState := i.coreState
  coreEvidence := submittedEvidence i.coreState
  coreWarrant := by
    intro b
    rfl

  objectRequired := objectRequired
  objectState := i.objectState
  objectEvidence := submittedEvidence i.objectState
  objectWarrant := by
    intro b _hRequired
    rfl

  domainEntryRequired := domainEntryRequired
  domainDownstreamRequired := domainDownstreamRequired
  domainRoleDisjoint := domainRolesDisjoint
  domainState := i.domainState
  domainEvidence := submittedEvidence i.domainState
  domainWarrant := by
    intro b _hRequired
    rfl

def cleanCoreState : CoreBurden -> Disposition :=
  fun _ => .discharged

def cleanObjectState : ObjectBurden -> Disposition :=
  fun _ => .discharged

def worldFromDomainState
    (state : DomainBurden -> Disposition) :
    World ObjectBurden DomainBurden :=
  worldOf
    { coreState := cleanCoreState
      objectState := cleanObjectState
      domainState := state }

/-! --------------------------------------------------------------------------
Experimenter-facing adjudication input
----------------------------------------------------------------------------

A specialist who has run the experiment described in the scientific paper
first adjudicates each requirement as DISCHARGED, VIOLATED, or OPEN.

This structure is the intended input surface for those adjudications.
It does not accept raw laboratory measurements and does not perform the
scientific adjudication for the experimenter.

The universal core burdens are held discharged here because this input surface
is for execution of this published adapter against the experiment it encodes.
A materially changed object, level, scope, or translation requires a new or
re-audited adapter rather than silent reuse of this input block.
-/

structure ExperimentAdjudication where
  /- Object commitments. -/
  collectiveLineageEntity : Disposition
  sharedSurfaceAcrossSeats : Disposition

  /- Domain-entry requirements. -/
  accountVersionPinned : Disposition
  ancestryAdequacy : Disposition
  assayAdequacy : Disposition
  interventionIntegrity : Disposition
  treatmentUnitIntegrity : Disposition
  referenceProvenance : Disposition
  commonEnvironmentAdequacy : Disposition
  fullTrajectoryAdequacy : Disposition
  lifeCycleStageAdequacy : Disposition
  lifeCycleTrajectoryAdequacy : Disposition

  /- Clarke downstream requirements. -/
  c1FocalSelectionCapacity : Disposition
  c2QualifyingIndividuatingMechanism : Disposition
  c3MechanismGrounding : Disposition
  c4NonArbitraryGrouping : Disposition

  /- Bourrat downstream requirements. -/
  b1CollectivePhenotypicVariation : Disposition
  b2CollectiveFitnessDifferences : Disposition
  b3CollectiveHeredity : Disposition
  b4ObjectiveIndividuation : Disposition
  b5InternalEndogenizedGeneration : Disposition

  /- Life-cycle downstream requirements. -/
  l1Multiplication : Disposition
  l2Closure : Disposition
  l3FocalStageReestablishment : Disposition
deriving Repr

def experimentObjectState
    (a : ExperimentAdjudication) :
    ObjectBurden -> Disposition
  | .collectiveLineageEntity => a.collectiveLineageEntity
  | .sharedSurfaceAcrossSeats => a.sharedSurfaceAcrossSeats

def experimentDomainState
    (a : ExperimentAdjudication) :
    DomainBurden -> Disposition
  | .accountVersionPinned => a.accountVersionPinned
  | .ancestryAdequacy => a.ancestryAdequacy
  | .assayAdequacy => a.assayAdequacy
  | .interventionIntegrity => a.interventionIntegrity
  | .treatmentUnitIntegrity => a.treatmentUnitIntegrity
  | .referenceProvenance => a.referenceProvenance
  | .commonEnvironmentAdequacy => a.commonEnvironmentAdequacy
  | .fullTrajectoryAdequacy => a.fullTrajectoryAdequacy
  | .lifeCycleStageAdequacy => a.lifeCycleStageAdequacy
  | .lifeCycleTrajectoryAdequacy => a.lifeCycleTrajectoryAdequacy
  | .c1FocalSelectionCapacity => a.c1FocalSelectionCapacity
  | .c2QualifyingIndividuatingMechanism => a.c2QualifyingIndividuatingMechanism
  | .c3MechanismGrounding => a.c3MechanismGrounding
  | .c4NonArbitraryGrouping => a.c4NonArbitraryGrouping
  | .b1CollectivePhenotypicVariation => a.b1CollectivePhenotypicVariation
  | .b2CollectiveFitnessDifferences => a.b2CollectiveFitnessDifferences
  | .b3CollectiveHeredity => a.b3CollectiveHeredity
  | .b4ObjectiveIndividuation => a.b4ObjectiveIndividuation
  | .b5InternalEndogenizedGeneration => a.b5InternalEndogenizedGeneration
  | .l1Multiplication => a.l1Multiplication
  | .l2Closure => a.l2Closure
  | .l3FocalStageReestablishment => a.l3FocalStageReestablishment

def experimentWorld
    (a : ExperimentAdjudication) :
    World ObjectBurden DomainBurden :=
  worldOf
    { coreState := cleanCoreState
      objectState := experimentObjectState a
      domainState := experimentDomainState a }

/-! --------------------------------------------------------------------------
Account-native verdicts
---------------------------------------------------------------------------- -/

inductive ClarkeVerdict where
  | capacityPresent
  | capacityNotWarranted
  | indeterminate
deriving DecidableEq, Repr

inductive BourratVerdict where
  | antecedentNotEstablished
  | pseudoDarwinian
  | darwinianLike
  | darwinian
  | indeterminate
deriving DecidableEq, Repr

inductive LifeCycleVerdict where
  | lifeCycleClosed
  | lifeCycleNotClosed
  | indeterminate
deriving DecidableEq, Repr

inductive NormalizedVerdict where
  | positive
  | negative
  | indeterminate
deriving DecidableEq, Repr

inductive CrossSeatVerdict where
  | concordantPositive
  | concordantNegative
  | discordant
  | indeterminate
deriving DecidableEq, Repr

def isDischarged : Disposition -> Bool
  | .discharged => true
  | .violated => false
  | .open => false

def isViolated : Disposition -> Bool
  | .discharged => false
  | .violated => true
  | .open => false

def allDischarged (xs : List Disposition) : Bool :=
  xs.all isDischarged

def anyViolated (xs : List Disposition) : Bool :=
  xs.any isViolated

def clarkeVerdict
    (state : DomainBurden -> Disposition) :
    ClarkeVerdict :=
  let xs :=
    [ state .c1FocalSelectionCapacity,
      state .c2QualifyingIndividuatingMechanism,
      state .c3MechanismGrounding,
      state .c4NonArbitraryGrouping ]
  if allDischarged xs then
    .capacityPresent
  else if anyViolated xs then
    .capacityNotWarranted
  else
    .indeterminate

def bourratVerdict
    (state : DomainBurden -> Disposition) :
    BourratVerdict :=
  match
    state .b1CollectivePhenotypicVariation,
    state .b2CollectiveFitnessDifferences,
    state .b3CollectiveHeredity,
    state .b4ObjectiveIndividuation,
    state .b5InternalEndogenizedGeneration
  with
  | .violated, _, _, _, _ => .antecedentNotEstablished
  | _, .violated, _, _, _ => .antecedentNotEstablished
  | _, _, .violated, _, _ => .antecedentNotEstablished

  | .open, _, _, _, _ => .indeterminate
  | _, .open, _, _, _ => .indeterminate
  | _, _, .open, _, _ => .indeterminate

  | .discharged, .discharged, .discharged, .open, _ =>
      .indeterminate
  | .discharged, .discharged, .discharged, .violated, _ =>
      .pseudoDarwinian

  | .discharged, .discharged, .discharged, .discharged, .open =>
      .indeterminate
  | .discharged, .discharged, .discharged, .discharged, .violated =>
      .darwinianLike
  | .discharged, .discharged, .discharged, .discharged, .discharged =>
      .darwinian

def lifeCycleVerdict
    (state : DomainBurden -> Disposition) :
    LifeCycleVerdict :=
  match
    state .lifeCycleStageAdequacy,
    state .lifeCycleTrajectoryAdequacy
  with
  | .discharged, .discharged =>
      let xs :=
        [ state .l1Multiplication,
          state .l2Closure,
          state .l3FocalStageReestablishment ]
      if allDischarged xs then
        .lifeCycleClosed
      else if anyViolated xs then
        .lifeCycleNotClosed
      else
        .indeterminate
  | _, _ =>
      .indeterminate

def normalizeClarke : ClarkeVerdict -> NormalizedVerdict
  | .capacityPresent => .positive
  | .capacityNotWarranted => .negative
  | .indeterminate => .indeterminate

def normalizeBourrat : BourratVerdict -> NormalizedVerdict
  | .darwinian => .positive
  | .darwinianLike => .negative
  | .pseudoDarwinian => .negative
  | .antecedentNotEstablished => .negative
  | .indeterminate => .indeterminate

def normalizeLifeCycle : LifeCycleVerdict -> NormalizedVerdict
  | .lifeCycleClosed => .positive
  | .lifeCycleNotClosed => .negative
  | .indeterminate => .indeterminate

def crossSeatVerdict
    (state : DomainBurden -> Disposition) :
    CrossSeatVerdict :=
  match
    normalizeClarke (clarkeVerdict state),
    normalizeBourrat (bourratVerdict state),
    normalizeLifeCycle (lifeCycleVerdict state)
  with
  | .indeterminate, _, _ => .indeterminate
  | _, .indeterminate, _ => .indeterminate
  | _, _, .indeterminate => .indeterminate
  | .positive, .positive, .positive => .concordantPositive
  | .negative, .negative, .negative => .concordantNegative
  | _, _, _ => .discordant

/-! --------------------------------------------------------------------------
Experimenter-facing execution report
----------------------------------------------------------------------------

`TranslationStatus` is a computable report of the same gating partition used
by the universal kernel for this adapter's published execution surface.
Because the universal core state is fixed discharged here, the report is
determined by the two object commitments and the ten domain-entry burdens.

Account and downstream results are returned only when structural admission
passes. If an object or entry requirement is VIOLATED or OPEN, those result
fields are `none` rather than misleading account verdicts.
-/

inductive TranslationStatus where
  | structuralConforms
  | noLawfulTranslation
  | notYetAdjudicable
deriving DecidableEq, Repr

def isOpen : Disposition -> Bool
  | .discharged => false
  | .violated => false
  | .open => true

def anyOpen (xs : List Disposition) : Bool :=
  xs.any isOpen

def experimentGateStates
    (a : ExperimentAdjudication) :
    List Disposition :=
  [ a.collectiveLineageEntity,
    a.sharedSurfaceAcrossSeats,
    a.accountVersionPinned,
    a.ancestryAdequacy,
    a.assayAdequacy,
    a.interventionIntegrity,
    a.treatmentUnitIntegrity,
    a.referenceProvenance,
    a.commonEnvironmentAdequacy,
    a.fullTrajectoryAdequacy,
    a.lifeCycleStageAdequacy,
    a.lifeCycleTrajectoryAdequacy ]

def experimentDownstreamStates
    (a : ExperimentAdjudication) :
    List Disposition :=
  [ a.c1FocalSelectionCapacity,
    a.c2QualifyingIndividuatingMechanism,
    a.c3MechanismGrounding,
    a.c4NonArbitraryGrouping,
    a.b1CollectivePhenotypicVariation,
    a.b2CollectiveFitnessDifferences,
    a.b3CollectiveHeredity,
    a.b4ObjectiveIndividuation,
    a.b5InternalEndogenizedGeneration,
    a.l1Multiplication,
    a.l2Closure,
    a.l3FocalStageReestablishment ]

def translationStatusOf
    (a : ExperimentAdjudication) :
    TranslationStatus :=
  let xs := experimentGateStates a
  if allDischarged xs then
    .structuralConforms
  else if anyViolated xs then
    .noLawfulTranslation
  else
    .notYetAdjudicable

structure ExperimentReport where
  translationStatus : TranslationStatus
  downstreamOutcomeNegative : Option Bool
  downstreamBurdenOpen : Option Bool
  downstreamBurdensClosed : Option Bool
  clarkeNative : Option ClarkeVerdict
  bourratNative : Option BourratVerdict
  lifeCycleNative : Option LifeCycleVerdict
  clarkeNormalized : Option NormalizedVerdict
  bourratNormalized : Option NormalizedVerdict
  lifeCycleNormalized : Option NormalizedVerdict
  crossSeat : Option CrossSeatVerdict
deriving Repr

def experimentReport
    (a : ExperimentAdjudication) :
    ExperimentReport :=
  let t := translationStatusOf a
  match t with
  | .structuralConforms =>
      let state := experimentDomainState a
      let c := clarkeVerdict state
      let b := bourratVerdict state
      let l := lifeCycleVerdict state
      let downstream := experimentDownstreamStates a
      { translationStatus := t
        downstreamOutcomeNegative := some (anyViolated downstream)
        downstreamBurdenOpen := some (anyOpen downstream)
        downstreamBurdensClosed := some (allDischarged downstream)
        clarkeNative := some c
        bourratNative := some b
        lifeCycleNative := some l
        clarkeNormalized := some (normalizeClarke c)
        bourratNormalized := some (normalizeBourrat b)
        lifeCycleNormalized := some (normalizeLifeCycle l)
        crossSeat := some (crossSeatVerdict state) }
  | .noLawfulTranslation =>
      { translationStatus := t
        downstreamOutcomeNegative := none
        downstreamBurdenOpen := none
        downstreamBurdensClosed := none
        clarkeNative := none
        bourratNative := none
        lifeCycleNative := none
        clarkeNormalized := none
        bourratNormalized := none
        lifeCycleNormalized := none
        crossSeat := none }
  | .notYetAdjudicable =>
      { translationStatus := t
        downstreamOutcomeNegative := none
        downstreamBurdenOpen := none
        downstreamBurdensClosed := none
        clarkeNative := none
        bourratNative := none
        lifeCycleNative := none
        clarkeNormalized := none
        bourratNormalized := none
        lifeCycleNormalized := none
        crossSeat := none }

/-! --------------------------------------------------------------------------
Universal structural routing helper
---------------------------------------------------------------------------- -/

theorem structuralConforms_of_entry_discharged
    (state : DomainBurden -> Disposition)
    (hEntry :
      ∀ d : DomainBurden,
        domainEntryRequired d ->
        state d = Disposition.discharged) :
    StructuralConforms (worldFromDomainState state) := by
  refine ⟨?_, ?_, ?_⟩
  · intro c
    rfl
  · intro o _hRequired
    rfl
  · intro d hRequired
    exact hEntry d hRequired

/-! --------------------------------------------------------------------------
EXPERIMENTER INPUT BLOCK — EDIT THIS RECORD AFTER THE EXPERIMENT
----------------------------------------------------------------------------

Replace each `.open` below only after the corresponding requirement has been
scientifically adjudicated from the experiment described in the scientific
paper. `open` means unresolved; it is not a default negative result.

The adapter is intentionally shipped with every field OPEN so that the public
file cannot appear to contain empirical results before an experiment is run.

After entering adjudicated states, evaluate:

  #eval experimentReport submittedExperiment

For inspection of the exact kernel world generated from the same submission:

  #check experimentWorld submittedExperiment

The regression witnesses below remain fixed and should not be edited when
entering experimental results.
-/

def submittedExperiment : ExperimentAdjudication where
  collectiveLineageEntity := .open
  sharedSurfaceAcrossSeats := .open

  accountVersionPinned := .open
  ancestryAdequacy := .open
  assayAdequacy := .open
  interventionIntegrity := .open
  treatmentUnitIntegrity := .open
  referenceProvenance := .open
  commonEnvironmentAdequacy := .open
  fullTrajectoryAdequacy := .open
  lifeCycleStageAdequacy := .open
  lifeCycleTrajectoryAdequacy := .open

  c1FocalSelectionCapacity := .open
  c2QualifyingIndividuatingMechanism := .open
  c3MechanismGrounding := .open
  c4NonArbitraryGrouping := .open

  b1CollectivePhenotypicVariation := .open
  b2CollectiveFitnessDifferences := .open
  b3CollectiveHeredity := .open
  b4ObjectiveIndividuation := .open
  b5InternalEndogenizedGeneration := .open

  l1Multiplication := .open
  l2Closure := .open
  l3FocalStageReestablishment := .open

/-
Optional experimenter run command after filling the record above:

#eval experimentReport submittedExperiment
-/

/-! --------------------------------------------------------------------------
Target discordance witness
---------------------------------------------------------------------------- -/

def targetDomainState : DomainBurden -> Disposition
  | .b5InternalEndogenizedGeneration => .violated
  | _ => .discharged

def targetWorld :
    World ObjectBurden DomainBurden :=
  worldFromDomainState targetDomainState

theorem target_entry_discharged :
    ∀ d : DomainBurden,
      domainEntryRequired d ->
      targetDomainState d = Disposition.discharged := by
  intro d hRequired
  cases d <;>
    simp
      [domainEntryRequired,
       targetDomainState]
      at hRequired ⊢

theorem target_structuralConforms :
    StructuralConforms targetWorld :=
  structuralConforms_of_entry_discharged
    targetDomainState
    target_entry_discharged

theorem target_domainOutcomeNegative :
    DomainOutcomeNegative targetWorld := by
  refine ⟨
    DomainBurden.b5InternalEndogenizedGeneration,
    ?_,
    ?_⟩
  · simp
      [targetWorld,
       worldFromDomainState,
       worldOf,
       domainDownstreamRequired]
  · rfl

theorem target_clarke :
    clarkeVerdict targetDomainState =
      ClarkeVerdict.capacityPresent := by
  rfl

theorem target_bourrat :
    bourratVerdict targetDomainState =
      BourratVerdict.darwinianLike := by
  rfl

theorem target_lifeCycle :
    lifeCycleVerdict targetDomainState =
      LifeCycleVerdict.lifeCycleClosed := by
  rfl

theorem target_crossSeat :
    crossSeatVerdict targetDomainState =
      CrossSeatVerdict.discordant := by
  rfl

/-! --------------------------------------------------------------------------
Bounded-resilience witness
---------------------------------------------------------------------------- -/

def boundedResilienceDomainState : DomainBurden -> Disposition
  | .b5InternalEndogenizedGeneration => .open
  | _ => .discharged

def boundedResilienceWorld :
    World ObjectBurden DomainBurden :=
  worldFromDomainState boundedResilienceDomainState

theorem boundedResilience_entry_discharged :
    ∀ d : DomainBurden,
      domainEntryRequired d ->
      boundedResilienceDomainState d =
        Disposition.discharged := by
  intro d hRequired
  cases d <;>
    simp
      [domainEntryRequired,
       boundedResilienceDomainState]
      at hRequired ⊢

theorem boundedResilience_structuralConforms :
    StructuralConforms boundedResilienceWorld :=
  structuralConforms_of_entry_discharged
    boundedResilienceDomainState
    boundedResilience_entry_discharged

theorem boundedResilience_domainOpen :
    DomainBurdenOpen boundedResilienceWorld := by
  refine ⟨
    DomainBurden.b5InternalEndogenizedGeneration,
    ?_,
    ?_⟩
  · simp
      [boundedResilienceWorld,
       worldFromDomainState,
       worldOf,
       domainDownstreamRequired]
  · rfl

theorem boundedResilience_bourrat :
    bourratVerdict boundedResilienceDomainState =
      BourratVerdict.indeterminate := by
  rfl

theorem boundedResilience_crossSeat :
    crossSeatVerdict boundedResilienceDomainState =
      CrossSeatVerdict.indeterminate := by
  rfl

/-! --------------------------------------------------------------------------
Adapter checkpoint
---------------------------------------------------------------------------- -/

theorem evolutionary_individuality_adapter_checkpoint :
    (
      StructuralConforms targetWorld
      ∧ DomainOutcomeNegative targetWorld
      ∧ clarkeVerdict targetDomainState =
          ClarkeVerdict.capacityPresent
      ∧ bourratVerdict targetDomainState =
          BourratVerdict.darwinianLike
      ∧ lifeCycleVerdict targetDomainState =
          LifeCycleVerdict.lifeCycleClosed
      ∧ crossSeatVerdict targetDomainState =
          CrossSeatVerdict.discordant
    )
    ∧
    (
      StructuralConforms boundedResilienceWorld
      ∧ DomainBurdenOpen boundedResilienceWorld
      ∧ bourratVerdict boundedResilienceDomainState =
          BourratVerdict.indeterminate
      ∧ crossSeatVerdict boundedResilienceDomainState =
          CrossSeatVerdict.indeterminate
    ) := by
  exact
    ⟨
      ⟨ target_structuralConforms,
        target_domainOutcomeNegative,
        target_clarke,
        target_bourrat,
        target_lifeCycle,
        target_crossSeat ⟩,
      ⟨ boundedResilience_structuralConforms,
        boundedResilience_domainOpen,
        boundedResilience_bourrat,
        boundedResilience_crossSeat ⟩
    ⟩

/-
Optional browser checks after the kernel + adapter elaborate:

#check experimentWorld submittedExperiment
#eval experimentReport submittedExperiment

#check evolutionary_individuality_adapter_checkpoint
#check target_structuralConforms
#check target_domainOutcomeNegative
#check boundedResilience_domainOpen

#eval clarkeVerdict targetDomainState
#eval bourratVerdict targetDomainState
#eval lifeCycleVerdict targetDomainState
#eval crossSeatVerdict targetDomainState
#eval bourratVerdict boundedResilienceDomainState
#eval crossSeatVerdict boundedResilienceDomainState

Expected #eval outputs:
capacityPresent
darwinianLike
lifeCycleClosed
discordant
indeterminate
indeterminate
-/

end EvolutionaryIndividuality
end StructuralFlow
