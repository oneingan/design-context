# Source Ingestion Workflow

## Summary

- Treat external source material as raw input, not as canonical framework text.
- Use this as the source-material subworkflow inside broader source reviews.
- Convert source material into small paraphrased claims before proposing changes.
- Promote only reviewed, framework-relevant insights into `context/**`.
- Prefer updating existing canonical docs over adding new canonical files.
- Keep source-only research outside the vendored core pack.

## Status

This is a source-only research workflow. It informs repository maintenance but is not part of the default vendored core pack.

## When to use this

Use this workflow when incorporating ideas from books, articles, talks, transcripts, or other external material into `design-context`.

## Source hierarchy and alignment

Classify each external source before proposing canonical changes:

| Source role | Meaning | Promotion rule |
|---|---|---|
| Foundational | Defines core design concepts or priorities. | May shape canonical concepts; structural changes need ADR review. |
| Calibration | Provides field evidence or sharper wording for existing guidance. | Prefer small edits to existing docs. |
| Tool-specific edge | Describes a vendor, protocol, plugin, prompt pack, command surface, or runtime. | Keep source-only, deferred, or adapter-specific unless an ADR promotes it. |

For agentic or tooling sources, state which domain-design capability the source improves: domain modeling, ubiquitous language, bounded contexts, workflows, invariants, events, contracts, persistence edges, review, or evolution.

If it improves none of those, do not promote it into `context/**` by default.

## Workflow

### 1. Register the source

Record the source identity and role without importing source text.

Minimum fields:
- source id
- title
- author or origin
- source type
- framework role
- source-only status

### 2. Create a reading map

Map source sections to framework capabilities, not to new documents.

Good capability buckets include:
- information architecture and retrieval
- naming and vocabulary
- deep modules and information hiding
- domain modeling and ubiquitous language
- business events and event catalogs
- bounded contexts and contracts
- workflow, state, and effects
- errors and edge responsibilities
- persistence and data ownership
- model evolution

### 3. Extract source claims

Create small paraphrased claims.

A source claim should include:
- source id and locator
- claim in repository language
- why it matters for `design-context`
- likely impacted canonical docs
- confidence and portability
- explicit non-import note if examples or source-specific language should not be copied

### 4. Run source-to-context gap analysis

Compare each claim against existing canonical docs.

Classify each claim as:
- **covered**: current docs already express it well
- **partial gap**: current docs cover the idea but miss an important distinction
- **new gap**: current docs do not cover it
- **no-op**: interesting source material, but not useful for this framework

### 5. Propose the smallest canonical change

For each real gap, propose a concrete change before editing.

A proposal should state:
- target canonical doc
- intended change
- rationale
- risk
- whether vocabulary drift review is needed
- whether an ADR is needed

### 6. Apply normal review gates

Before changing `context/**`, run the relevant checks:
- quality gates
- documentation quality checklist
- vocabulary drift checklist when terms change
- event/contract checklist when event or seam artifacts change

## Invariants

- Do not commit raw book chapters, long excerpts, or direct conversions as canonical docs.
- Do not map one source chapter to one framework document by default.
- Do not let a source become the hidden specification for the framework.
- Do not add new canonical docs when a small update to an existing doc would work.
- Do not update maps or manifests unless canonical docs change.
- Do not include source-only research in the core context pack.
- Do not promote generic AI-workflow advice unless it serves the domain-design core or an ADR changes the boundary.

## Artifact shapes

### Source inventory entry

```text
Source id:
Title:
Author/origin:
Type:
Framework role:
Status: source-only
Do not import:
```

### Source claim

```text
Source:
Locator:
Claim:
Framework consequence:
Potential canonical home:
Gap classification:
Do not import:
```

### Gap analysis row

```text
Claim id | Current home | Gap classification | Proposed action | Review needed
```

### Canonical change proposal

```text
Target:
Change:
Rationale:
Risk:
Vocabulary impact:
ADR needed:
```

## Related docs

- `docs/research/source-review-workflow.md`
- `context/review/01-quality-gates.md`
- `context/review/03-documentation-quality-checklist.md`
- `context/review/04-vocabulary-drift-checklist.md`
- `context/principles/01-information-architecture-and-manifests.md`
- `context/principles/06-deep-modules-and-information-hiding.md`
- `docs/adr/0007-agent-enable-domain-design.md`
