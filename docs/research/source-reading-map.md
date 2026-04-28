# Source Reading Map by Framework Capability

## Summary

- Use this map to read sources by framework capability, not by book order.
- A mapped section is a candidate input for paraphrased claims and gap analysis.
- Source sections do not imply new canonical docs.
- Existing `context/**` docs remain the preferred homes for canonical changes.

## How to use this map

1. Pick the framework capability relevant to the task.
2. Read only the mapped source sections needed for that capability.
3. Convert observations into source claims.
4. Compare claims with the listed canonical homes.
5. Propose the smallest canonical change only if a real gap remains.

## Capability map

| Framework capability | Source sections to inspect | Why relevant | Likely canonical homes |
|---|---|---|---|
| information architecture and retrieval | `aposd ch.4`, `aposd ch.5`, `aposd ch.7`, `aposd ch.8`, `aposd ch.13` | Deep modules, information hiding, layered abstraction, and rationale docs map directly to agent-readable knowledge bases. | `context/principles/01-information-architecture-and-manifests.md`, `context/principles/06-deep-modules-and-information-hiding.md`, `context/review/03-documentation-quality-checklist.md` |
| naming and vocabulary | `aposd ch.14`, `dmmf ch.1`, `dmmf ch.2` | Precise names and ubiquitous language are shared prerequisites for humans and agents. | `context/principles/02-ubiquitous-language-and-naming.md`, `context/glossary/02-naming-and-term-introduction.md`, `context/review/04-vocabulary-drift-checklist.md` |
| domain modeling and shared model | `dmmf ch.1`, `dmmf ch.2`, `dmmf ch.5` | These sections explain how business language, concepts, and model shape emerge before implementation. | `context/playbooks/01-domain-modeling-playbook.md`, `context/principles/02-ubiquitous-language-and-naming.md`, `context/principles/08-entities-value-objects-and-aggregates.md` |
| business events and event catalogs | `dmmf ch.1`, `dmmf ch.2`, `dmmf ch.7` | Business events reveal what the domain notices, where workflows hand off, and where contracts may be missing. | `context/playbooks/08-business-event-discovery-and-event-catalog-playbook.md`, `context/review/05-event-and-contract-artifact-checklist.md` |
| bounded contexts and contracts | `dmmf ch.1`, `dmmf ch.3`, `dmmf ch.12` | Subdomains, bounded contexts, contracts, and data ownership define semantic and integration seams. | `context/principles/03-bounded-contexts-and-boundaries.md`, `context/playbooks/02-bounded-context-definition-playbook.md`, `context/playbooks/10-cross-context-contract-and-anti-corruption-playbook.md` |
| workflow, state, effects, and dependencies | `dmmf ch.7`, `dmmf ch.9`, `dmmf ch.10` | Workflow pipelines make inputs, outputs, effects, errors, async behavior, and dependencies visible. | `context/principles/04-workflows-invariants-and-state.md`, `context/principles/09-workflow-pipelines-effects-and-dependencies.md`, `context/playbooks/03-workflow-and-state-modeling-playbook.md` |
| trusted data and invalid-state prevention | `dmmf ch.4`, `dmmf ch.5`, `dmmf ch.6`, `aposd ch.10` | Types, invariants, and error prevention support trusted representations and narrow domain shapes. | `context/principles/07-type-shaped-models-and-illegal-states.md`, `context/playbooks/05-trusted-and-untrusted-representations-playbook.md`, `context/principles/05-errors-and-edge-responsibilities.md` |
| errors and edge responsibilities | `dmmf ch.10`, `aposd ch.10`, `dmmf ch.11` | Explicit errors and edge translation keep domain meaning separate from operational detail. | `context/principles/05-errors-and-edge-responsibilities.md`, `context/patterns/03-error-and-edge-translation-patterns.md`, `context/playbooks/09-domain-error-and-failure-taxonomy-playbook.md` |
| serialization, persistence, and data ownership | `dmmf ch.11`, `dmmf ch.12` | Serialization, persistence, command-query separation, and owned storage shape boundary guidance. | `context/principles/10-serialization-persistence-and-data-ownership.md`, `context/playbooks/07-persistence-and-mapping-boundaries-playbook.md` |
| model evolution and maintenance | `aposd ch.16`, `aposd ch.17`, `dmmf ch.12`, `aposd ch.3` | Strategic change, consistency, and data ownership inform how models evolve without patchwork. | `context/principles/11-evolving-models-through-change.md`, `context/playbooks/04-adr-writing-playbook.md`, `context/review/01-quality-gates.md` |
| source-ingestion discipline itself | `aposd ch.13`, `aposd ch.15`, `aposd ch.17` | Rationale, comments-as-design, and consistency support treating source claims as reviewable artifacts. | `docs/research/source-ingestion-workflow.md`, `docs/research/source-inventory.md` |

## Reading rules

- Prefer source sections with the strongest link to the current task.
- Stop reading once a claim can be mapped to existing canonical docs.
- Mark source material as no-op if it is interesting but not useful for this framework.
- Do not use book order as implementation order.

## Related docs

- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-inventory.md`
- `docs/research/source-synthesis.md`
- `context/manifests/project-manifest.yaml`
