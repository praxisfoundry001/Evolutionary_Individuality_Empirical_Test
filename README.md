# Evolutionary Individuality as an Empirical Question

## A Proposed Experimental Test in *Pseudomonas*

This repository contains an open experimental and formal-adjudication package for investigating evolutionary individuality in experimentally evolved *Pseudomonas fluorescens* collective lineages.

The scientific proposal asks what an already evolved collective continues to carry when protected propagule-lineage structure is relaxed. Rather than selecting one definition of evolutionary individuality in advance, the experiment holds the biological lineage fixed and evaluates the resulting evidence under three distinct accounts: Ellen Clarke's levels-of-selection approach, Pierrick Bourrat's endogenization account, and the life-cycle-closure account developed by Guilhem Doulcier, Peter Takacs, and Pierrick Bourrat.

The package is designed so that experimental outcomes may support convergence, disagreement, failure of an empirical burden, or an unresolved result. No particular outcome is presupposed.

## Package

The repository contains four non-substitutable components:

1. **Evolutionary Individuality as an Empirical Question: A Proposed Experimental Test in Pseudomonas — v1.0**  
   The field-facing scientific paper. It defines the biological object, proposed post-evolution scaffold challenge, evidence requirements, comparator accounts, interpretation rules, and limits of inference.

2. **Evolutionary Individuality Domain Adapter / Contract — v0.2**  
   A Lean 4 formalization that encodes the domain burdens, experimenter-facing adjudication input, account-specific verdict functions, cross-account comparison, and conditional machine-closure checks.

3. **Evolutionary Individuality: Human-Readable Companion to the Domain Adapter / Contract — v1.1**  
   Explains how scientific judgments from the proposed experiment map into the formal adapter, including the use of DISCHARGED, VIOLATED, and OPEN states.

4. **Structural Flow Universal Kernel — v1.0**  
   The compatible domain-neutral formal kernel used by the adapter. The evolutionary-individuality work required no modification to the kernel.

## Experimental object

The candidate biological individual is the genealogically traceable collective lineage spanning the WS–SM–WS life cycle.

The metapopulation is the experimental treatment and comparison level. It is not substituted for the candidate individual.

The principal intervention compares continued protected Non-Mixed propagule-lineage conditions with relaxation of that relation through a Mixed Propagule ecology after collective-lineage organization has already evolved.

The experiment tests dependence on the protected propagule-lineage relation as a whole. It does not independently isolate physical separation from cross-lineage competition.

## Machine adjudication

The Lean adapter does not ingest raw experimental data or decide whether biological evidence is adequate.

After experimental evidence has been scientifically interpreted, a specialist assigns the relevant object, entry, and account-specific requirements one of three states:

- `discharged`
- `violated`
- `open`

Those adjudications are entered through:

`submittedExperiment : ExperimentAdjudication`

The principal report is evaluated with:

`#eval experimentReport submittedExperiment`

The adapter then reports structural-admission status and, where admissible, the corresponding Clarke, Bourrat, life-cycle, normalized, and cross-account results.

Machine closure is conditional. It establishes that the supplied adjudicated states route consistently through the encoded contract. It does not establish that the experiment has been performed, that the empirical judgments are correct, or that any particular account of evolutionary individuality is true.

## Why this matters

Evolutionary individuality is difficult to discriminate experimentally when the properties emphasized by different accounts occur together.

This proposal instead targets a transitional system in which higher-level selection capacity, life-cycle organization, and endogenization of individuating organization may potentially come apart. The purpose is not to settle individuality by definition, but to make identifiable biological commitments answerable to experiment.

## Citation

https://doi.org/10.5281/zenodo.22907164
