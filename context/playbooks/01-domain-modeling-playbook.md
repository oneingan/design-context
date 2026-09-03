# Domain Modeling Playbook

## Summary

- Start with business outcomes, language, and change pressure, not with tables, endpoints, or classes.
- Capture nouns, verbs, events, invariants, and boundaries before implementation detail grows.
- Preserve where important claims came from, how accepted they are, and who can validate them.
- Challenge candidate abstractions with contrasting scenarios before stabilizing them.
- Produce a compact artifact set that other playbooks can refine.
- Use small learning cycles to discover structure, not to lock every detail too early.

## Use this when

- starting a new domain model
- modeling a new capability
- refactoring a vague or overloaded domain description

## Inputs

- problem statement or product goal
- business outcome, customer outcome, or decision pressure
- sample scenarios or use cases
- represented participants, source material, and relevant missing perspectives
- domain expert language, if available
- known constraints or policies

## Frame collaboration and knowledge provenance

Domain knowledge is distributed. Before treating notes as settled:

- name the participants and sources represented and the perspective each contributes
- record materially relevant perspectives that are absent
- name the person accountable for validating strategic model choices and consequential open claims
- keep contribution, evidence, and decision authority distinct
- let agents organize evidence and expose gaps, but not impersonate a missing perspective or accept a strategic decision

For each decision-relevant claim, record a working knowledge status, source or perspective, scope, and validation owner when follow-up is needed. The status is not a confidence score and can change as evidence arrives.

| Status | Use when | Required action |
|---|---|---|
| `observed` | a named conversation, artifact, behavior, or dataset contains the claim | cite the source and scope; observation alone is not acceptance |
| `confirmed` | an accountable domain participant accepts the claim for the stated purpose and scope | record who validated it and the supporting decision or evidence |
| `inferred` | available evidence supports a conclusion that has not been accepted | record the reasoning and how it will be checked |
| `speculative` | the claim is an exploratory possibility with insufficient evidence | keep it reversible and out of settled design |
| `disputed` | relevant sources or perspectives conflict | preserve the competing views and name who must resolve them |
| `unknown` | decision-relevant knowledge is absent | state the question and any validation-ownership gap; do not invent an answer |

When important knowledge lives with domain experts, use focused elicitation before modeling further:

- ask one question at a time
- draft a compact context note from the answers
- ask the relevant expert to correct vocabulary, invariants, examples, and boundary assumptions
- update the note as evidence changes; use `confirmed` only after the accountable validator accepts the claim

## When starting from a feature or spec

Before implementation planning, make sure the feature description exposes:

- expected outcome and success criteria
- new or affected domain terms
- affected bounded context
- context relationships or flows if boundaries are crossed
- candidate domain concepts
- acceptance scenarios or independently checkable behavior

If these are missing, model them before turning the work into tasks.

## Steps

### 1. Set the modeling scope

Write a short scope statement.

Answer:
- what part of reality are we modeling?
- what is intentionally out of scope?
- what business outcome, customer outcome, or decision improves if this model is clearer?
- what decision or workflow pressure makes this worth modeling now?

### 2. Harvest the language

Collect the important nouns, verbs, and events used by domain experts or source materials.

Look for:
- core nouns
- business verbs
- state words
- overloaded or disputed terms

Treat phrasing as a clue to candidate data shapes, not as an automatic schema:

| Language clue | Shape to investigate |
|---|---|
| `and`, `has`, or named parts | a composite and which parts are required |
| `either`, `or`, or mutually exclusive cases | explicit alternatives |
| `may`, `if present`, or `not yet` | optional information or a lifecycle distinction |
| singular, plural, count, or `at least` language | cardinality and collection constraints |
| `must`, `only when`, units, or ranges | a constrained value or invariant |

Confirm each candidate with examples, exceptions, and the people who use the language.

### 3. Capture business events and outcomes

List the events that matter to the business.

Examples:
- order placed
- claim approved
- payment authorized

These help reveal workflows and state transitions.

### 4. Identify candidate concepts

Group what you found into:
- core concepts
- supporting concepts
- external actors or systems
- obvious edge concerns

### 5. Challenge candidate abstractions

Before treating a concept, data shape, rule, or boundary as stable, test it with contrasting scenarios or counterexamples proportionate to the decision risk.

Look for a valid case the candidate cannot express, an invalid case it permits, the same words producing a different outcome, or a relevant perspective that changes the meaning. Record whether the evidence confirms, refines, splits, or rejects the candidate; failure to find a counterexample is not proof.

### 6. Note invariants and forbidden situations

Write what must always be true and what must never happen.

Examples:
- confirmed bookings cannot be confirmed twice
- rejected applications do not become approved without re-entry

### 7. Sketch workflows

For each important verb or event, note:
- trigger
- inputs
- outputs
- major decisions
- state changes
- edge interactions

### 8. Propose bounded contexts

Ask where language meaning changes, where rules diverge, and where change pressure differs.

Start small. Split only when the seam protects meaning.

### 9. Produce the minimum artifact set

Create or update:
- glossary entries
- a context overview
- workflow notes
- invariant list
- boundary assumptions

## Minimum outputs

Scale the record to uncertainty and decision risk; one compact table or note may cover several items.

- scope statement and intended outcome
- participants, missing perspectives, and knowledge provenance where they affect decisions
- term list or glossary seed
- event list
- workflow inventory
- invariant list
- candidate bounded contexts and the contrast used to challenge them

## Lightweight artifact shape

```text
Domain: Order Fulfillment
Key terms: order, fulfillment window, payment authorization, shipment
Key events: order placed, payment authorized, shipment dispatched, order cancelled
Invariants: confirmed orders contain at least one line; cancelled orders are not shipped
Candidate contexts: Ordering, Payment, Shipping
```

## Review questions

- Did we start from business meaning and outcomes instead of technical structure?
- Can a reviewer distinguish observed, confirmed, inferred, speculative, disputed, and unknown claims?
- Are represented and missing perspectives visible, with accountable validation where needed?
- Were language clues and candidate abstractions checked against contrasting evidence?
- Are the important verbs and events visible without duplicating the event-discovery playbook?
- Are invariants explicit enough to guide later playbooks?
- Are candidate contexts based on meaning and change pressure?

## Related docs

- `context/playbooks/08-business-event-discovery-and-event-catalog-playbook.md`
- `context/principles/02-ubiquitous-language-and-naming.md`
- `context/principles/03-bounded-contexts-and-boundaries.md`
- `context/principles/04-workflows-invariants-and-state.md`
- `context/principles/11-evolving-models-through-change.md`
