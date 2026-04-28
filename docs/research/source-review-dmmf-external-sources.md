# Source Review: DMMF External Source Pass

## Summary

- This review revisits DMMF through external public sources rather than the local EPUB.
- Source material includes publisher metadata, author companion material, reviews, talks, related blogs, and supporting FP/complexity references.
- Claims are paraphrased and treated as second-order evidence unless they come from the author or publisher.
- The strongest external signal is that DMMF's durable value is language-neutral: business language, events, types, workflows, explicit errors, and edge-bound persistence.
- Two small canonical refinements were applied: business-outcome anchoring in domain modeling and more explicit collaborative event discovery.

## Trigger

Run `docs/research/source-review-workflow.md` for DMMF using external sources only, applying `docs/research/source-ingestion-workflow.md` to each source bundle.

Decision sought:
- identify the strongest portable DMMF ideas as seen through the broader ecosystem
- check whether current `context/**` docs already capture them
- propose minimal canonical changes only where external evidence reveals a real gap

## Method

- Public pages were fetched into temporary files and converted to plain text for local reading.
- No raw pages, transcripts, reviews, or long excerpts are committed.
- Review pages are treated as opinionated second-order evidence, not as canonical summaries of the book.
- Author/publisher pages are treated as higher-confidence source metadata and companion framing.
- Supporting references are used only where they strengthen a DMMF-aligned modeling move already visible elsewhere.

## External source bundle

| Source id | Type | Role in this pass | Reliability note |
|---|---|---|---|
| `dmmf-ext-pragprog` | publisher page | Intended audience, scope, outcomes, contents metadata. | Primary metadata, marketing-framed. |
| `dmmf-ext-fffp-ddd` | author talk page | Public companion framing for DDD with F# type system. | Author source, high relevance. |
| `dmmf-ext-fffp-illegal-states` | author blog | Type modeling and invalid-state prevention. | Author source, high relevance. |
| `dmmf-ext-fffp-rop` | author talk page | Explicit error/result pipeline framing. | Author source, high relevance. |
| `dmmf-ext-review-schmitt` | review | Strengths and limitations of the book as practical FP/DDD bridge. | Opinion source. |
| `dmmf-ext-review-aguirre` | review/takeaways | Cross-language translation and practical lessons. | Opinion source. |
| `dmmf-ext-review-bespoyasov` | review/summary | Event-first modeling, subdomains, bounded contexts, language. | Opinion source with detailed synthesis. |
| `dmmf-ext-review-devto` | review | Current relevance, OO-to-FP translation, persistence appreciation. | Opinion source. |
| `dmmf-ext-review-cuhalev` | review | Business-first framing and portability beyond F#. | Opinion source. |
| `dmmf-ext-goodreads` | review aggregate | Broad reader reception and repeated themes. | Aggregate signal only; no review text imported. |
| `dmmf-ext-eventstorming` | method site | Collaborative event discovery across silos. | Supporting method, not book-specific. |
| `dmmf-ext-typefirst` | related blog | Type-first design as discussion/specification method. | Supporting source. |
| `dmmf-ext-parse-dont-validate` | related blog | Trusted construction over repeated validation. | Supporting source. |
| `dmmf-ext-tarpit` | paper | State and complexity pressure behind functional style. | Supporting source. |

## Source locators

- `dmmf-ext-pragprog`: `https://pragprog.com/titles/swdddf/domain-modeling-made-functional/`
- `dmmf-ext-fffp-ddd`: `https://fsharpforfunandprofit.com/ddd/`
- `dmmf-ext-fffp-illegal-states`: `https://fsharpforfunandprofit.com/posts/designing-with-types-making-illegal-states-unrepresentable/`
- `dmmf-ext-fffp-rop`: `https://fsharpforfunandprofit.com/rop/`
- `dmmf-ext-review-schmitt`: `https://www.iainschmitt.com/post/ddmf-review`
- `dmmf-ext-review-aguirre`: `https://canro91.github.io/2021/12/13/DomainModelingMadeFunctional/`
- `dmmf-ext-review-bespoyasov`: `https://www.bespoyasov.me/blog/domain-modelling-made-functional/`
- `dmmf-ext-review-devto`: `https://dev.to/jesterxl/read-the-book-domain-modelling-made-functional-3afb`
- `dmmf-ext-review-cuhalev`: `https://www.jurecuhalev.com/blog/book-review-of-domain-modeling-made-functional-by-scott-wlaschin/`
- `dmmf-ext-goodreads`: `https://www.goodreads.com/book/show/34921689-domain-modeling-made-functional`
- `dmmf-ext-eventstorming`: `https://www.eventstorming.com/`
- `dmmf-ext-typefirst`: `https://tomasp.net/blog/type-first-development.aspx/`
- `dmmf-ext-parse-dont-validate`: `https://lexi-lambda.github.io/blog/2019/11/05/parse-don-t-validate/`
- `dmmf-ext-tarpit`: `https://curtclifton.net/papers/MoseleyMarks06a.pdf`

## Core signal extracted

| Claim id | Source support | Paraphrased claim | Current home | Classification | Response |
|---|---|---|---|---|---|
| `dmmf-ext-1` | publisher, author pages, reviews | The book's durable contribution is not F# syntax; it translates DDD into type-shaped, workflow-shaped models. | `context/principles/07-type-shaped-models-and-illegal-states.md`, `context/principles/09-workflow-pipelines-effects-and-dependencies.md` | covered | No change. |
| `dmmf-ext-2` | reviews, EventStorming support | Domain modeling is a cross-role learning process; events help people from different silos expose disagreement and handoffs. | `context/playbooks/08-business-event-discovery-and-event-catalog-playbook.md` | partial gap | Add collaborative discovery guidance. |
| `dmmf-ext-3` | publisher, reviews | Modeling should be anchored in business outcomes and customer/business value, not only technical correctness. | `context/playbooks/01-domain-modeling-playbook.md` | partial gap | Add explicit business-outcome prompt. |
| `dmmf-ext-4` | author type posts, type-first support | Types or schemas can act as compact specifications for discussion, not merely compiler artifacts. | `context/principles/07-type-shaped-models-and-illegal-states.md` | covered | No change. |
| `dmmf-ext-5` | author invalid-state post, parse-don't-validate support, reviews | Build trusted representations at construction boundaries so downstream code does not repeatedly defend itself. | `context/principles/07-type-shaped-models-and-illegal-states.md`, `context/playbooks/05-trusted-and-untrusted-representations-playbook.md` | covered | No change. |
| `dmmf-ext-6` | author ROP page, reviews | Errors that matter to the domain should be represented as expected workflow outcomes, not hidden exception paths. | `context/principles/05-errors-and-edge-responsibilities.md`, `context/playbooks/09-domain-error-and-failure-taxonomy-playbook.md` | covered | No change. |
| `dmmf-ext-7` | reviews, publisher | Workflow design is strongest when expressed as inputs, outputs, transformations, and explicit edge effects. | `context/principles/09-workflow-pipelines-effects-and-dependencies.md`, `context/playbooks/03-workflow-and-state-modeling-playbook.md` | covered | No change. |
| `dmmf-ext-8` | reviews | Persistence is valuable in the book because it shows how to keep domain models from being owned by storage shapes. | `context/principles/10-serialization-persistence-and-data-ownership.md` | covered | No change. |
| `dmmf-ext-9` | reviews | The book is approachable partly because it uses one running example, but that also limits exposure to thornier domains. | `docs/research/source-gap-analysis-deep-dive.md` | no-op | Keep canonical docs example-light and pattern-oriented. |
| `dmmf-ext-10` | reviews, aggregate signal | Practitioners repeatedly read the book as portable to TypeScript, C#, Python, and other languages when translated into modeling moves. | `README.md`, `context/principles/07-type-shaped-models-and-illegal-states.md` | covered | No change. |
| `dmmf-ext-11` | supporting paper, author material | Reducing uncontrolled state and mutation helps reduce complexity, but the framework should express this as explicit state and effect boundaries, not FP ideology. | `context/principles/04-workflows-invariants-and-state.md`, `context/principles/09-workflow-pipelines-effects-and-dependencies.md` | covered | No change. |
| `dmmf-ext-12` | review corpus | Reviewers value practical code, but implementation mechanics vary by language. | source-ingestion policy | no-op | Do not import F# mechanics or review examples into canonical docs. |

## Deep synthesis by capability

### Domain modeling and language

External sources reinforce that DMMF works when developers stop treating the model as an implementation artifact and use it as shared business language. The current playbook already starts from language, events, invariants, and boundaries. The missing nuance is business-outcome anchoring: the scope should state which business decision, customer outcome, or value stream improves if the model improves.

### Events and collaborative discovery

The strongest external correction is collaborative. Current event guidance captures events, timelines, contexts, gaps, and disagreements, but it does not explicitly say to involve upstream and downstream roles when a workflow crosses silos. Event discovery should be treated as a conversation tool, not just an extraction technique.

### Type-shaped modeling

The external ecosystem strongly confirms the existing guidance: narrow named representations, alternatives, optionality, quantities, and trusted construction boundaries are the portable core. The canonical docs already avoid F# dependency and translate the move to schemas, constructors, wrappers, and validation boundaries.

### Workflows, errors, and effects

Author material and reviews converge on the same signal: workflows should be visible pipelines with explicit inputs, outputs, dependencies, and domain-significant failures. Current workflow, errors, and edge-responsibility docs cover this well.

### Persistence and model ownership

External reviews call out persistence as one of the useful practical chapters. Current persistence guidance already captures the portable point: storage and wire representations are translation boundaries and should not own domain meaning.

### Transferability and limits

Reviews repeatedly praise DMMF as accessible and portable beyond F#, while also noting that F# details and the single running example should not be over-imported. This supports the repository's current stance: language-neutral core, no standalone examples/templates, and no source chapter-to-doc mapping.

## Applied canonical changes

| Proposal id | Target | Change | Rationale | Risk |
|---|---|---|---|---|
| `dmmf-ext-prop-001` | `context/playbooks/01-domain-modeling-playbook.md` | Added business outcome/value pressure to inputs, scope questions, and review questions. | External sources emphasize that modeling exists to solve business problems, not just shape code. | Low. |
| `dmmf-ext-prop-002` | `context/playbooks/08-business-event-discovery-and-event-catalog-playbook.md` | Added collaborative event discovery across roles/silos and made disagreement a finding. | Event-oriented modeling is strongest when it exposes disagreements and handoffs among stakeholders. | Low. |

No ADR was needed. These changes tighten existing playbooks without changing repository structure, naming policy, or vendoring boundaries.

## Deferred or rejected

| Candidate | Decision | Reason |
|---|---|---|
| Add DMMF review excerpts to canonical docs | Rejected | Reviews are second-order evidence and should not become hidden specifications. |
| Add F# mechanics or code idioms | Rejected | The framework should keep the language-neutral modeling move only. |
| Add a new DMMF-derived canonical playbook | Rejected | Existing playbooks are the right homes. |
| Add a benchmark of DMMF transferability across languages | Deferred | Useful only if language portability becomes a release criterion. |

## Related docs

- `docs/research/source-review-workflow.md`
- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-inventory.md`
- `docs/research/source-gap-analysis-deep-dive.md`
- `context/playbooks/01-domain-modeling-playbook.md`
- `context/playbooks/08-business-event-discovery-and-event-catalog-playbook.md`
