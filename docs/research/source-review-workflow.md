# Source Review Workflow

## Summary

- Use source review to keep `design-context` calibrated against new sources, model behavior, tooling, and field evidence.
- Use `docs/research/source-ingestion-workflow.md` when a review includes external source material.
- Review does not automatically promote ideas into `context/**`; it creates evidence, classifications, and proposals.
- Include frontier model behavior as review input, not just books or articles.
- Prefer small canonical adjustments after repeated evidence over large rewrites from one review.

## Status

This is a source-only research workflow. It informs maintenance of `design-context` but is not part of the default vendored core pack.

## When to use this

Use this workflow when any of these triggers occur:

- a new source is important enough to test against the framework
- a frontier LLM changes context-window, tool-use, or instruction-following assumptions
- a project or user session reveals repeated agent failure modes
- a check, manifest, or vendoring rule appears too weak or too strict
- canonical docs feel redundant, obsolete, overfit, or under-specified

## Review inputs

A review input may be:

| Input type | Examples | Required handling |
|---|---|---|
| external source | book, paper, article, talk, vendor docs | Use `docs/research/source-ingestion-workflow.md`; paraphrase claims. |
| model behavior | new frontier model, agent harness behavior, tool-use pattern | Record observed behavior and assumptions; avoid vendor hype. |
| field observation | repeated project failure, reviewer friction, handoff issue | Capture the smallest reproducible pattern. |
| tooling evidence | validation failure, manifest weakness, export friction | Link to command, check, or affected path. |
| internal drift | redundant docs, stale research, unclear authority | Compare against canonical docs and ADRs. |

## Workflow

### 1. State the review trigger

Record:
- why the review exists now
- whether the trigger is source, model, tooling, field evidence, or drift
- what decision the review should inform

### 2. Register evidence without over-importing it

For external sources, follow `docs/research/source-ingestion-workflow.md`.

When reviewing a bundle of second-order sources such as reviews, citations, talks, or summaries, separate:
- primary metadata from publisher or author material
- opinion evidence from reviewer material
- aggregate reception from correctness claims
- supporting references from book-specific claims

For model or field evidence, record:
- observed behavior or risk
- affected task type
- likely repository surface
- confidence level
- what not to generalize

### 3. Convert evidence into review claims

A review claim should be small and portable:

```text
Claim id:
Evidence type:
Claim:
Framework consequence:
Potential home:
Confidence:
Do not import:
```

Claims should not contain long source excerpts, transcripts, review prose, or vendor marketing text.

When many second-order sources agree, record the convergence as evidence, but still map it to the current canonical docs before proposing changes.

### 4. Run context fitness review

Classify each claim with one of:

| Classification | Meaning |
|---|---|
| covered | Canonical docs already address the claim. |
| partial gap | Current docs cover the idea but miss an important distinction. |
| new gap | The framework lacks needed guidance. |
| no-op | Interesting but not useful for this framework. |
| obsolete guidance | Existing guidance is likely outdated or harmful. |
| model compatibility issue | Guidance is sound, but a model class may misread, ignore, or over-apply it. |
| tooling gap | The rule exists but checks or export tooling do not support it. |
| needs benchmark | The claim is plausible but needs a concrete evaluation before canonical change. |

### 5. Review frontier model fitness when relevant

For model reviews, ask:

- Does the model follow progressive disclosure, or does it over-read?
- Does it distinguish canonical docs from research notes?
- Does it use maps and manifests before leaf docs?
- Does it preserve vocabulary discipline across long sessions?
- Does it propose minimal edits or broad rewrites?
- Does larger context make it safer, or just more likely to blend sources?
- Does it respect vendoring boundaries and ignored local inputs?
- Does it recover when checks fail?

### 6. Decide the response level

Use the smallest response that addresses the evidence:

1. no change
2. research note only
3. canonical wording tweak
4. review checklist addition
5. tooling/check update
6. ADR for structural policy change
7. benchmark or dry run before deciding

### 7. Propose canonical changes separately

Before editing `context/**`, state:
- target canonical doc
- intended change
- rationale
- risk
- vocabulary impact
- ADR impact
- validation needed

Prefer existing docs. Add files, maps, or manifests only when the concept cannot fit an existing home.

### 8. Close the review loop

Record:
- accepted changes
- rejected/deferred changes
- validation result
- remaining unknowns
- whether another review is needed

## Artifact shapes

### Source review note

```text
Trigger:
Input type:
Decision sought:
Evidence summary:
Claims reviewed:
Findings:
Accepted actions:
Deferred actions:
Validation:
```

### Model behavior claim

```text
Claim id:
Model class or behavior:
Observed/risk pattern:
Affected tasks:
Framework consequence:
Classification:
Needed evidence:
```

### Context fitness row

```text
Claim id | Current home | Classification | Proposed response | Review needed
```

## Invariants

- Source review is not a shortcut around source ingestion.
- Do not let research notes become hidden canonical rules.
- Do not import model-vendor claims without observed behavior or clear assumptions.
- Do not optimize only for current model quirks if the rule weakens long-term semantics.
- Do not add canonical detail when a review checklist or tooling check would address the failure better.
- Keep source-review docs outside the vendored core pack.

## Related docs

- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-gap-analysis-deep-dive.md`
- `docs/research/context-window-strategy.md`
- `context/review/01-quality-gates.md`
- `context/review/02-architecture-review-checklist.md`
- `context/review/03-documentation-quality-checklist.md`
