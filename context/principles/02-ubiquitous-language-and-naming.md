# Ubiquitous Language and Naming

## Summary

- Shared language is part of the design, not just documentation.
- Prefer one primary term per concept inside a scope.
- Name boundaries, workflows, and artifacts in domain language before technical language.
- Treat glossary maintenance as modeling work.
- Keep the domain model distinct from any one expression of it.
- Treat unexplained drift between model expressions as a modeling signal.
- Make natural-language translation choices explicit when they affect meaning.
- Use naming rules to reduce ambiguity for both humans and agents.

## Load this when

- starting a new domain model
- defining or renaming concepts
- reviewing vocabulary drift
- deciding what belongs in the glossary

## Principle

A model becomes easier to build, review, and evolve when the same important concept has the same name across discussions, documents, diagrams, tests, and code-facing artifacts.

Language is not decoration around the model. It is one of the main ways the model exists.

## Model and expressions

Use `domain model` and `model expression` as defined in the framework glossary. No conversation, document, UI, contract, schema, test, codebase, or dataset is the whole model; each expression selects detail for an audience and purpose.

When expressions disagree, do not mechanically force names to match or assume one artifact is correct. Investigate whether the difference is stale wording, deliberate translation across a boundary, an unrecorded model change, or unresolved disagreement. Have domain experts and accountable decision makers settle the intended meaning, then update or explicitly translate the affected expressions.

## Rules

### 1. Prefer one primary term per concept

Inside a bounded context, choose one preferred term for each important concept.

Avoid uncontrolled synonym pairs such as:
- customer / client
- shipment / delivery
- plan / pricing tier
- request / application

If aliases matter, record them explicitly and say which one is canonical.

### 2. Distinguish domain terms from technical terms

Domain terms describe the business reality.
Technical terms describe implementation choices.

Examples:
- domain: order, quote, settlement window, claim approval
- technical: DTO, queue topic, HTTP handler, database row

Do not let technical labels replace domain language in canonical modeling docs.

### 3. Name artifacts after the language you want reinforced

Choose document names, section titles, and artifact labels that reinforce the domain vocabulary.

Prefer:
- `cancel-order-workflow.md`
- `settlement-window.md`

Over:
- `order-processing-logic.md`
- `time-rules.md`

### 4. Keep glossary entries brief and operational

A useful glossary entry should normally include:
- term
- short definition
- scope or bounded context
- related terms
- common confusions or anti-terms

### 5. Record meaning changes explicitly

When a term changes meaning, do not silently overwrite history in many places.

Instead:
- update the glossary
- update the affected principle, playbook, review, or manifest references
- note the change in an ADR when it alters design structure or boundaries

### 6. Prefer domain verbs for workflows and domain nouns for core concepts

Use nouns for stable business concepts and verbs for behavior.

Examples:
- nouns: order, account, booking, entitlement
- verbs: place order, confirm booking, grant entitlement

### 7. Avoid names that smuggle in premature design decisions

A name should not freeze a transport, storage, or UI choice unless that choice is the point.

Prefer:
- `payment-request`

Over:
- `kafka-payment-request-event`

in canonical docs.

### 8. Make natural-language translation deliberate

When domain work spans natural languages:

- record the working language and the language of important terms
- preserve a native term when translation would erase a domain distinction
- document approved translations as scoped aliases rather than silent replacements
- treat translation disagreements as modeling questions for the people who use and govern the domain language

Do not require every artifact or code identifier to use one language mechanically. Require readers to be able to recover the intended meaning and scope.

## Naming guidance by artifact type

| Artifact | Naming preference |
|---|---|
| glossary entry | canonical domain term |
| principle doc | stable concept or rule |
| pattern doc | reusable structure or trade-off |
| playbook | imperative task phrasing |
| ADR | decision or trade-off in plain language |

## Signals of vocabulary drift

Watch for these red flags:
- the same thing has multiple names in nearby docs
- a technical placeholder becomes the dominant term
- one bounded context uses another context's term without translation
- different workflows use the same word with different meanings
- reviewers need to ask "what does this term mean here?"
- model expressions disagree without an explicit translation or rationale
- a natural-language translation collapses distinct domain concepts

## Minimum outputs for new concepts

When introducing an important concept, add at least:

1. a canonical term
2. a one-sentence definition
3. its scope or context
4. any closely related or easily confused terms

## Review questions

- Would two readers pick the same term for the same concept?
- Are technical names crowding out domain names?
- Are aliases documented instead of floating informally?
- Do document titles reinforce the intended vocabulary?
- Would an agent know which term is canonical?
- Do model expressions disagree about meaning, not just representation?
- Is the natural-language translation policy explicit where needed?

## Related docs

- `context/glossary/README.md`
- `context/principles/03-bounded-contexts-and-boundaries.md`
- `context/principles/04-workflows-invariants-and-state.md`
