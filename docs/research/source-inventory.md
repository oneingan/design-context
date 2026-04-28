# Source Inventory

## Summary

- This inventory tracks external sources that inform `design-context`.
- Sources are source-only inputs; they do not define canonical framework behavior by themselves.
- Source material should be paraphrased into claims and reviewed before changing `context/**`.
- Local EPUB files are ignored inputs and should not be copied into the vendored core pack.

## Source status meanings

| Status | Meaning |
|---|---|
| source-only | May inform research and gap analysis; not part of the core context pack. |
| canonicalized | One or more reviewed ideas have been incorporated into canonical docs. |
| deferred | Useful background, but not currently driving framework changes. |

## Sources

### `aposd`

| Field | Value |
|---|---|
| Title | _A Philosophy of Software Design, 2nd Edition_ |
| Author/origin | John K. Ousterhout |
| Type | Book |
| Local input | `dokumen.pub_a-philosophy-of-software-design-2nd-edition-2nbsped-173210221x-9781732102217.epub` |
| Status | source-only; partially canonicalized through existing principles and review docs |
| Primary framework role | Repository and document design discipline. |

High-level relevance:
- complexity management
- strategic design
- deep modules and information hiding
- layering and abstraction discipline
- naming precision
- comments, ADRs, and rationale as design tools
- change discipline and maintenance quality

Do not import:
- chapter prose
- book examples as framework examples
- code-specific advice unless translated into language-neutral guidance

### `dmmf`

| Field | Value |
|---|---|
| Title | _Domain Modeling Made Functional: Tackle Software Complexity With Domain-Driven Design and F#_ |
| Author/origin | Scott Wlaschin |
| Type | Book |
| Local input | `dokumen.pub_domain-modeling-made-functional-tackle-software-complexity-with-domain-driven-design-and-f-9781680502541.epub` |
| Status | source-only; partially canonicalized through existing principles and playbooks |
| Primary framework role | Domain modeling and workflow design discipline. |

High-level relevance:
- shared model and ubiquitous language
- business event discovery
- subdomains and bounded contexts
- context contracts
- type-shaped modeling and invalid-state prevention
- entities, value objects, and aggregates
- workflow pipelines, effects, and dependencies
- explicit error modeling
- serialization, persistence, and data ownership

Do not import:
- F#-specific implementation detail unless it teaches a language-neutral modeling distinction
- order-taking domain examples as hidden specifications
- chapter structure as repository structure

### `dmmf-external-ecosystem`

| Field | Value |
|---|---|
| Title | DMMF external source ecosystem |
| Author/origin | Publisher pages, Scott Wlaschin public material, reviews, talks, related blogs, and supporting references |
| Type | Source bundle |
| Local input | Public web pages fetched to temporary files only |
| Status | source-only; reviewed in `docs/research/source-review-dmmf-external-sources.md` |
| Primary framework role | Triangulate the portable DMMF core without rereading the local EPUB. |

High-level relevance:
- DMMF's language-neutral value beyond F# syntax
- collaborative event discovery and cross-silo modeling
- type-first and trusted-representation design
- workflow pipelines, explicit errors, and edge effects
- persistence as mapping rather than domain truth
- reviewer-noted limits such as single-example overfitting

Do not import:
- review prose as canonical evidence
- aggregate ratings as proof of correctness
- author examples or F# mechanics as framework examples
- second-order summaries without mapping them to claims and current canonical homes

## Use rules

- Use source ids in research notes and gap analyses.
- Prefer source locators such as `aposd ch.14` or `dmmf ch.7` over copied excerpts.
- Convert source material into paraphrased claims before proposing canonical changes.
- Treat existing `context/**` docs as the current source of truth until a reviewed change updates them.

## Related docs

- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-synthesis.md`
- `context/review/01-quality-gates.md`
