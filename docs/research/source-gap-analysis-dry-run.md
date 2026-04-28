# Source-to-Context Gap Analysis Dry Run

## Summary

- This dry run tests the source-ingestion workflow before changing canonical docs.
- Source slice: APOSD naming and deep-module guidance.
- All claims are paraphrased; no source prose is imported.
- Most claims are already covered, which proves the workflow can produce no-op outcomes.
- A few partial gaps are candidates for small future updates, not automatic changes.

## Source slice

| Source id | Locator | Capability |
|---|---|---|
| `aposd` | ch.4-5 | deep modules and information hiding |
| `aposd` | ch.7-8 | layer separation and pulling complexity downward |
| `aposd` | ch.13-15 | rationale and comments as design tools |
| `aposd` | ch.14 | naming precision and consistency |

## Claims analyzed

| Claim id | Paraphrased source claim | Current home | Gap classification | Proposed action | Review needed |
|---|---|---|---|---|---|
| `aposd-naming-1` | Names should create a precise mental model and avoid vague placeholders. | `context/principles/02-ubiquitous-language-and-naming.md`, `context/glossary/02-naming-and-term-introduction.md` | covered | No canonical change. | none |
| `aposd-naming-2` | Consistent names matter because readers build retrieval habits from them. | `context/glossary/02-naming-and-term-introduction.md`, `context/review/04-vocabulary-drift-checklist.md` | covered | No canonical change. | none |
| `aposd-naming-3` | Extra words can weaken names when they do not add meaning. | `context/glossary/02-naming-and-term-introduction.md` | partial gap | Consider adding a small anti-pattern about filler words only if drift appears. | vocabulary drift if implemented |
| `aposd-modules-1` | A good module exposes a small stable surface while hiding meaningful complexity. | `context/principles/06-deep-modules-and-information-hiding.md` | covered | No canonical change. | none |
| `aposd-modules-2` | A shallow entrypoint that mostly forwards to other details creates navigation cost. | `context/principles/06-deep-modules-and-information-hiding.md`, `context/review/03-documentation-quality-checklist.md` | covered | No canonical change. | none |
| `aposd-layers-1` | Each layer should add a distinct abstraction rather than repeat the layer below it. | `context/principles/01-information-architecture-and-manifests.md`, `context/principles/06-deep-modules-and-information-hiding.md` | covered | No canonical change. | none |
| `aposd-rationale-1` | Durable rationale should live near the artifact or decision it explains, not only in conversation history. | `context/playbooks/04-adr-writing-playbook.md`, `context/principles/06-deep-modules-and-information-hiding.md` | covered | No canonical change. | none |
| `aposd-rationale-2` | Early rationale can shape design before implementation detail hardens. | `context/playbooks/04-adr-writing-playbook.md`, `docs/research/source-ingestion-workflow.md` | partial gap | Consider adding a source-ingestion proposal rule: write intended canonical impact before editing. | documentation quality if implemented |
| `aposd-source-1` | Source notes can become misleading if they outlive the canonical docs they informed. | `docs/research/source-ingestion-workflow.md` | partial gap | Consider source-only review guidance for stale research notes if this becomes recurring. | quality gates if implemented |
| `aposd-noop-1` | Code-comment placement advice is useful for implementation code but not directly relevant to this framework's core docs. | none | no-op | Do not import. | none |

## Findings

### Covered

The existing naming, vocabulary, information architecture, deep-module, and ADR guidance already covers the most important APOSD claims for this slice.

### Partial gaps

The partial gaps are small and do not justify immediate canonical expansion:

1. Filler-word naming anti-patterns could be added later if naming drift appears.
2. Source-ingestion proposals could emphasize intended canonical impact before editing.
3. Stale source-only research could need a review check if research notes grow.

### No-op

Implementation-code comment placement does not currently need canonical treatment in `design-context`.

## Proposed next step

Do not change `context/**` yet. Use this dry run to prove the workflow, then decide whether the partial gaps recur after applying the workflow to a DMMF slice.

## Related docs

- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-reading-map.md`
- `context/principles/02-ubiquitous-language-and-naming.md`
- `context/principles/06-deep-modules-and-information-hiding.md`
- `context/review/03-documentation-quality-checklist.md`
