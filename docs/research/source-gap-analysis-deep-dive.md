# Source-to-Context Gap Analysis Deep Dive

## Summary

- This analysis applies the source-ingestion workflow across both tracked sources: `aposd` and `dmmf`.
- Claims are paraphrased and organized by framework capability, not by book order.
- Most high-value claims are already covered by existing canonical docs.
- The main partial gaps are strategic subdomain classification, unit/measure semantics, and decomposition heuristics outside bounded-context language.
- No canonical docs are changed by this analysis; follow-up proposals should be reviewed separately.

## Method

Inputs:
- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-inventory.md`
- `docs/research/source-reading-map.md`
- source locators from APOSD and DMMF

Rules followed:
- no raw source prose imported
- no chapter-to-doc conversion
- existing `context/**` docs treated as current source of truth
- each claim mapped to an existing canonical home where possible

## Source coverage

| Source | Covered locators | Main purpose in this pass |
|---|---|---|
| `aposd` | ch.2-17 | complexity, deep modules, information hiding, layering, naming, rationale, change discipline |
| `dmmf` | ch.1-12 | shared model, events, bounded contexts, types, workflows, errors, serialization, persistence |

## Claims by framework capability

### Information architecture and retrieval

| Claim id | Source | Paraphrased claim | Current home | Gap | Proposed action |
|---|---|---|---|---|---|
| `deep-info-1` | `aposd ch.2-5` | Complexity grows when readers must track too many hidden dependencies; docs should expose stable surfaces and hide detail deliberately. | `context/principles/06-deep-modules-and-information-hiding.md` | covered | No change. |
| `deep-info-2` | `aposd ch.7-8` | Each layer should add a distinct abstraction and should absorb complexity where it lowers reader burden. | `context/principles/01-information-architecture-and-manifests.md`, `context/principles/06-deep-modules-and-information-hiding.md` | covered | No change. |
| `deep-info-3` | `aposd ch.9` | Splitting and joining should be judged by shared information, interface simplification, and duplication pressure. | `context/patterns/01-boundary-and-decomposition-patterns.md`, `context/principles/03-bounded-contexts-and-boundaries.md` | partial gap | Consider adding decomposition heuristics that are not only bounded-context specific. |
| `deep-info-4` | `aposd ch.13-15` | Rationale can be a design tool when written early and placed near the decision it informs. | `context/playbooks/04-adr-writing-playbook.md`, `context/review/03-documentation-quality-checklist.md` | covered | No change. |

### Naming and vocabulary

| Claim id | Source | Paraphrased claim | Current home | Gap | Proposed action |
|---|---|---|---|---|---|
| `deep-name-1` | `aposd ch.14` | Names should create precise mental images and avoid vague placeholders. | `context/principles/02-ubiquitous-language-and-naming.md`, `context/glossary/02-naming-and-term-introduction.md` | covered | No change. |
| `deep-name-2` | `aposd ch.14` | Naming consistency matters because readers and agents build retrieval habits around stable terms. | `context/review/04-vocabulary-drift-checklist.md` | covered | No change. |
| `deep-name-3` | `dmmf ch.1-2` | Ubiquitous language is discovered through domain work, not assigned as a post-hoc glossary. | `context/playbooks/01-domain-modeling-playbook.md`, `context/principles/02-ubiquitous-language-and-naming.md` | covered | No change. |

### Domain modeling and shared model

| Claim id | Source | Paraphrased claim | Current home | Gap | Proposed action |
|---|---|---|---|---|---|
| `deep-domain-1` | `dmmf ch.1-2` | Modeling should begin from business events, stories, and language rather than database or class structure. | `context/playbooks/01-domain-modeling-playbook.md` | covered | No change. |
| `deep-domain-2` | `dmmf ch.1` | Subdomains differ in strategic importance; not every part of a domain deserves equal modeling depth. | `context/principles/03-bounded-contexts-and-boundaries.md`, `context/playbooks/02-bounded-context-definition-playbook.md` | partial gap | Consider adding optional subdomain role/strategic importance to bounded-context definition. |
| `deep-domain-3` | `dmmf ch.5` | Entities, value objects, and aggregates should be selected by identity, meaning, and invariant ownership. | `context/principles/08-entities-value-objects-and-aggregates.md`, `context/playbooks/06-entity-value-object-and-aggregate-design-playbook.md` | covered | No change. |

### Business events and event catalogs

| Claim id | Source | Paraphrased claim | Current home | Gap | Proposed action |
|---|---|---|---|---|---|
| `deep-event-1` | `dmmf ch.1-2` | Business events reveal what the domain notices and expose missing workflow handoffs. | `context/playbooks/08-business-event-discovery-and-event-catalog-playbook.md` | covered | No change. |
| `deep-event-2` | `dmmf ch.7` | Events and outputs should be linked back to workflow steps, state changes, and downstream consumers. | `context/playbooks/08-business-event-discovery-and-event-catalog-playbook.md`, `context/review/05-event-and-contract-artifact-checklist.md` | covered | No change. |
| `deep-event-3` | `dmmf ch.1-3` | Event language often reveals context seams before teams have named the contexts. | `context/playbooks/08-business-event-discovery-and-event-catalog-playbook.md`, `context/playbooks/02-bounded-context-definition-playbook.md` | covered | No change. |

### Bounded contexts and contracts

| Claim id | Source | Paraphrased claim | Current home | Gap | Proposed action |
|---|---|---|---|---|---|
| `deep-boundary-1` | `dmmf ch.1-3` | Bounded contexts are semantic scopes with explicit communication contracts, not just deployment or folder boundaries. | `context/principles/03-bounded-contexts-and-boundaries.md` | covered | No change. |
| `deep-boundary-2` | `dmmf ch.3` | Context relationships need named contract ownership and translation expectations. | `context/playbooks/10-cross-context-contract-and-anti-corruption-playbook.md` | covered | No change. |
| `deep-boundary-3` | `dmmf ch.12` | Data ownership belongs to bounded contexts; shared storage does not imply shared meaning. | `context/principles/10-serialization-persistence-and-data-ownership.md` | covered | No change. |

### Workflow, state, effects, and dependencies

| Claim id | Source | Paraphrased claim | Current home | Gap | Proposed action |
|---|---|---|---|---|---|
| `deep-workflow-1` | `dmmf ch.7` | Workflows should expose inputs, outputs, states, effects, and failure surfaces as part of the design. | `context/principles/04-workflows-invariants-and-state.md`, `context/principles/09-workflow-pipelines-effects-and-dependencies.md` | covered | No change. |
| `deep-workflow-2` | `dmmf ch.7-9` | Dependencies are part of workflow assembly and should not be hidden as ambient globals. | `context/principles/09-workflow-pipelines-effects-and-dependencies.md` | covered | No change. |
| `deep-workflow-3` | `dmmf ch.7` | Long-running workflows require explicit waiting, retry, timeout, and recovery states. | `context/principles/04-workflows-invariants-and-state.md`, `context/patterns/02-workflow-and-state-transition-patterns.md` | covered | No change. |
| `deep-workflow-4` | `dmmf ch.8-10` | A workflow should define complete expected outcomes rather than relying on exceptional control flow. | `context/principles/05-errors-and-edge-responsibilities.md`, `context/playbooks/09-domain-error-and-failure-taxonomy-playbook.md` | covered | No change. |

### Trusted data and invalid-state prevention

| Claim id | Source | Paraphrased claim | Current home | Gap | Proposed action |
|---|---|---|---|---|---|
| `deep-trust-1` | `dmmf ch.4-6` | Narrow, named representations make domain distinctions reviewable and reduce repeated defensive checks. | `context/principles/07-type-shaped-models-and-illegal-states.md` | covered | No change. |
| `deep-trust-2` | `dmmf ch.6` | Numeric values and quantities often need semantic units or constrained wrappers, not raw numbers. | `context/principles/07-type-shaped-models-and-illegal-states.md`, `context/playbooks/05-trusted-and-untrusted-representations-playbook.md` | partial gap | Consider a small note on units, quantities, and measurement semantics. |
| `deep-trust-3` | `aposd ch.10`, `dmmf ch.6` | Preventing invalid states is cheaper than documenting every rescue path. | `context/principles/05-errors-and-edge-responsibilities.md`, `context/principles/07-type-shaped-models-and-illegal-states.md` | covered | No change. |

### Errors and edge responsibilities

| Claim id | Source | Paraphrased claim | Current home | Gap | Proposed action |
|---|---|---|---|---|---|
| `deep-error-1` | `dmmf ch.10` | Domain errors should be explicit and composable through workflow steps. | `context/playbooks/09-domain-error-and-failure-taxonomy-playbook.md` | covered | No change. |
| `deep-error-2` | `dmmf ch.10-11` | Technical edge failures should be translated into stable domain or boundary categories. | `context/patterns/03-error-and-edge-translation-patterns.md`, `context/principles/05-errors-and-edge-responsibilities.md` | covered | No change. |
| `deep-error-3` | `aposd ch.10` | Some errors should be designed out of the interface rather than surfaced to every caller. | `context/principles/05-errors-and-edge-responsibilities.md` | covered | No change. |

### Serialization, persistence, and data ownership

| Claim id | Source | Paraphrased claim | Current home | Gap | Proposed action |
|---|---|---|---|---|---|
| `deep-data-1` | `dmmf ch.11` | Serialization is translation between representations; it should not define the domain model. | `context/principles/10-serialization-persistence-and-data-ownership.md` | covered | No change. |
| `deep-data-2` | `dmmf ch.12` | Persistence should live at the edge and transactions should align with consistency boundaries. | `context/playbooks/07-persistence-and-mapping-boundaries-playbook.md`, `context/principles/10-serialization-persistence-and-data-ownership.md` | covered | No change. |
| `deep-data-3` | `dmmf ch.12` | Read models may diverge from write models when convenience would otherwise distort invariants. | `context/principles/10-serialization-persistence-and-data-ownership.md` | covered | No change. |
| `deep-data-4` | `dmmf ch.12` | Document and relational database tactics are implementation-specific unless they change modeling boundaries. | none | no-op | Do not import storage-specific tactics into core. |

### Model evolution and maintenance

| Claim id | Source | Paraphrased claim | Current home | Gap | Proposed action |
|---|---|---|---|---|---|
| `deep-evolve-1` | `aposd ch.3`, `aposd ch.16-17` | Design quality improves when each change pays down local complexity instead of only patching behavior. | `context/principles/11-evolving-models-through-change.md`, `context/review/01-quality-gates.md` | covered | No change. |
| `deep-evolve-2` | `dmmf ch.12` | Data ownership and persistence boundaries should be revisited when requirements change. | `context/principles/11-evolving-models-through-change.md`, `context/playbooks/07-persistence-and-mapping-boundaries-playbook.md` | covered | No change. |
| `deep-evolve-3` | `aposd ch.17` | Consistency should be maintained through repeatable checks, not reviewer memory. | `context/review/01-quality-gates.md`, `tooling/check-source-ingestion.sh` | covered | No change. |

## Gap summary

### Covered areas

The current framework is strong in:
- progressive retrieval and deep-module documentation
- naming and vocabulary governance
- business event discovery
- bounded contexts, contracts, and anti-corruption seams
- workflow pipelines, effects, and dependencies
- explicit failure taxonomy and edge translation
- serialization, persistence, and data ownership
- model evolution through semantic change

### Resolved partial gaps

| Gap | Why it matters | Canonical resolution | Status |
|---|---|---|---|
| Strategic subdomain classification | DMMF distinguishes strategic importance; context guidance should not treat every capability as needing equal modeling investment. | Defined `strategic role` in `context/glossary/01-framework-glossary.md` and added guidance to `context/principles/03-bounded-contexts-and-boundaries.md`, `context/playbooks/02-bounded-context-definition-playbook.md`, and `context/review/02-architecture-review-checklist.md`. | resolved |
| Units and measurement semantics | Quantities and units can prevent invalid states when the domain depends on them. | Added quantity/unit guidance to `context/principles/07-type-shaped-models-and-illegal-states.md`, `context/playbooks/05-trusted-and-untrusted-representations-playbook.md`, and `context/review/02-architecture-review-checklist.md`. | resolved |
| Decomposition heuristics outside bounded contexts | Split/join heuristics apply to docs and modules beyond domain contexts. | Added a split/join decomposition pattern to `context/patterns/01-boundary-and-decomposition-patterns.md` and a review prompt to `context/review/02-architecture-review-checklist.md`. | resolved |

### No-op areas

Do not import:
- implementation-specific code-comment placement rules
- F# implementation mechanics unless translated into language-neutral modeling moves
- storage-engine tactics unless they affect modeling boundaries
- source chapter structure as repository structure

## Applied follow-up changes

1. Added optional strategic role guidance where bounded contexts are defined and reviewed.
2. Added quantity, unit, range, and precision guidance to trusted representation docs.
3. Added a language-neutral split/join pattern for documents, modules, and contexts.

No ADR was needed because these changes tighten existing guidance without changing repository structure, naming policy, or vendoring boundaries.

## Related docs

- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-reading-map.md`
- `docs/research/source-inventory.md`
- `context/review/01-quality-gates.md`
- `context/review/04-vocabulary-drift-checklist.md`
