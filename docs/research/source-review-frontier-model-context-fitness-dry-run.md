# Source Review Dry Run: Frontier Model Context Fitness

## Summary

- This dry run tests the new source review workflow against frontier-model agent assumptions.
- It is not a benchmark and does not evaluate a named vendor model.
- The main risk is not only limited context; larger context can also increase source blending and over-broad rewrites.
- Existing canonical docs cover most context-fitness concerns through progressive disclosure, manifests, budgets, review gates, and vendoring boundaries.
- The main unresolved need is an actual model-behavior benchmark before changing canonical guidance.

## Inputs

- `docs/research/source-review-workflow.md`
- `docs/research/source-ingestion-workflow.md`
- `docs/research/context-window-strategy.md`
- `docs/research/source-gap-analysis-deep-dive.md`
- current repository validation checks

## Trigger

Frontier LLMs continue to change assumptions about context window size, instruction following, tool use, and synthesis quality. The framework should remain useful for both constrained and large-context agents without overfitting to one model generation.

## Scope

In scope:
- long-context agent behavior risks
- canonical vs research authority
- progressive disclosure
- manifest usefulness
- minimal-edit discipline
- validation/tooling fit

Out of scope:
- ranking named model vendors
- importing vendor benchmarks
- changing canonical docs without observed evidence
- replacing source ingestion with direct synthesis

## Review claims

| Claim id | Evidence type | Claim | Current home | Classification | Proposed response |
|---|---|---|---|---|---|
| `fm-fit-1` | model behavior assumption | Larger context windows reduce hard limits but can encourage agents to read and blend too much material. | `context/principles/01-information-architecture-and-manifests.md`, `docs/research/context-window-strategy.md` | covered | Keep progressive disclosure as default. |
| `fm-fit-2` | model behavior assumption | Frontier agents may treat every markdown file as equally authoritative unless authority boundaries are explicit. | `context/review/01-quality-gates.md`, `docs/research/source-ingestion-workflow.md`, `VENDORING.md` | covered | No canonical change. |
| `fm-fit-3` | model behavior assumption | Stronger synthesis makes paraphrased claims more useful, but also makes hidden source-to-canonical conversion easier to miss. | `docs/research/source-ingestion-workflow.md`, `tooling/check-source-ingestion.sh` | covered | Continue requiring claims and proposals before canonical edits. |
| `fm-fit-4` | tooling evidence | Validation checks help agents recover from mistakes and make policy enforceable. | `tooling/run-checks.sh`, `context/review/01-quality-gates.md` | covered | No change. |
| `fm-fit-5` | field-risk pattern | More capable models may propose broad rewrites because they can hold more of the repo in memory. | `docs/research/source-review-workflow.md`, `context/principles/06-deep-modules-and-information-hiding.md` | covered | Use smallest-response ladder in source review. |
| `fm-fit-6` | workflow gap | The previous workflow handled source ingestion but not model behavior, tooling evidence, or field observations as first-class inputs. | `docs/research/source-review-workflow.md` | new gap resolved | New workflow added. |
| `fm-fit-7` | model behavior assumption | Agents should be reviewed on whether they follow maps/manifests before leaf docs, not only on final answer quality. | `docs/research/source-review-workflow.md`, `context/principles/01-information-architecture-and-manifests.md` | partial gap resolved at research level | Keep as review dimension; do not canonize until repeated evidence. |
| `fm-fit-8` | model behavior assumption | Better models may need less procedural hand-holding but still need semantic boundaries and authority rules. | `context/00-map.md`, `context/review/01-quality-gates.md` | covered | No change. |
| `fm-fit-9` | tooling gap | Manifests describe retrieval intent, but current checks mostly validate shape and existence, not whether load hints are effective. | `context/manifests/project-manifest.yaml`, `tooling/validate-manifests.sh` | tooling gap | Defer until a concrete retrieval benchmark exists. |
| `fm-fit-10` | evidence gap | Claims about frontier model compatibility need repeated observations or benchmark tasks before canonical changes. | none | needs benchmark | Create a future benchmark only if model behavior becomes a decision input. |

## Findings

### Covered strengths

The repository already has strong defenses against common frontier-agent risks:

- progressive disclosure keeps large context from becoming the default strategy
- manifests and maps provide explicit retrieval paths
- source ingestion prevents direct source-to-canonical conversion
- vendoring policy keeps research outside the default core pack
- document budgets discourage oversized canonical surfaces
- validation checks give agents a concrete recovery loop

### Resolved by this pass

The main workflow gap was that source ingestion was narrower than the actual maintenance problem.

`docs/research/source-review-workflow.md` now gives a broader path for:
- new external sources
- model behavior reviews
- tooling evidence
- field observations
- internal drift

This does not replace source ingestion; it wraps it when external sources are involved.

### Deferred gaps

| Gap | Reason for deferral | Possible future action |
|---|---|---|
| Retrieval effectiveness benchmark | No named model or task suite has been selected. | Create benchmark tasks only if model compatibility becomes a release criterion. |
| Manifest load-hint quality checks | Hard to validate without observed retrieval failures. | Add linting only after repeated ambiguous `load_when` or `next_reads` failures. |
| Canonical model-compatibility checklist | Current review docs are sufficient until model behavior failures repeat. | Add a checklist only if dry runs show recurring issues. |

## Recommended operating stance

Do not weaken progressive disclosure just because models can hold more context.

A frontier-friendly context repo should optimize for:
- smaller correct reading sets
- explicit authority boundaries
- stable vocabulary
- easy validation
- minimal canonical edits
- clear recovery from failed checks

Large context is useful for audits and synthesis, but normal task execution should still start from maps, manifests, and the smallest relevant leaf docs.

## Decision

No canonical change is proposed from this dry run.

Accepted action:
- add `docs/research/source-review-workflow.md` as source-only workflow guidance

Deferred actions:
- model compatibility benchmark
- manifest load-hint quality linting
- canonical model-review checklist

## Validation

Run repository checks after adding this dry run and the workflow:

```bash
nix shell nixpkgs#yq nixpkgs#ripgrep -c ./tooling/run-checks.sh
```

## Related docs

- `docs/research/source-review-workflow.md`
- `docs/research/source-review-ephemeral-pi-session-evaluation.md`
- `docs/research/source-ingestion-workflow.md`
- `docs/research/context-window-strategy.md`
- `context/principles/01-information-architecture-and-manifests.md`
- `context/principles/06-deep-modules-and-information-hiding.md`
- `context/review/01-quality-gates.md`
