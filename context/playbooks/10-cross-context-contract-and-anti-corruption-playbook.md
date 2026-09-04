# Cross-Context Contract and Anti-Corruption Playbook

## Summary

- Treat context-to-context communication as part of the model, not as plumbing.
- Choose deliberately among narrow shared vocabulary, a Published Language, supplier or consumer ownership, and translation.
- Use anti-corruption and probabilistic boundaries when foreign or variable output should not leak inward.
- Keep contracts compact, owned, and explicit about stable outcomes, validation, rejection, and change impact.

## Use this when

- defining how two bounded contexts interact
- integrating with a vendor or legacy system
- reviewing whether a seam is leaking foreign concepts
- documenting a stable event or request/response contract
- integrating a probabilistic component whose output must not enter the trusted model directly

## Inputs

- bounded-context definitions
- workflow or event catalog
- glossary terms for both sides of the seam
- persistence or ownership notes if data moves across the boundary
- accepted outcomes, invariants, and validation policy when output can vary

## Steps

### 1. Identify the interaction and its purpose

State:
- who is talking to whom
- in which direction the interaction flows
- what business purpose the interaction serves

Examples:
- request payment authorization
- publish a shipment outcome
- consume a shipping confirmation

### 2. Choose the relationship model

Ask which relationship and seam shapes apply:
- narrow shared vocabulary by agreement
- documented **Published Language** when a generic capability benefits from an interoperable exchange contract
- supplier-owned contract that the consumer conforms to
- consumer-driven contract
- anti-corruption layer translating a foreign model

A Published Language standardizes the exchange surface, not either side's internal model. Adopt it only with accountable agreement on semantics and compatibility; translate when local meanings differ. Do not flatten these shapes into one generic “integration” label.

### 3. Record the stable contract surface

Document:
- message or request name
- required meaning and fields
- success outcomes
- failure envelope
- versioning or compatibility notes if relevant

### 4. Separate shared terms from translated terms

Create a small table showing:
- terms that truly mean the same thing on both sides
- terms that need translation
- terms that stay private to one side

### 5. Place the anti-corruption boundary deliberately

If the foreign side uses a mismatched model, decide where translation happens.
That boundary should:
- accept the foreign shape
- classify or translate it
- emit a smaller inward-facing concept set

The point is semantic protection, not just validation.

### 6. Add a probabilistic boundary when output can vary

When a component can return variable, malformed, unsupported, or invented output, keep it behind a **probabilistic boundary**. This validation seam is not a bounded context.

Make the path explicit:
1. **Contract** — constrain the request and allowed output concepts using the accepted domain model.
2. **Parse** — turn the raw response into an untrusted representation; parsing failure is not a domain outcome.
3. **Translate** — map foreign labels and shapes into local vocabulary at the edge.
4. **Validate** — check structure, allowed values, invariants, and any independent evidence required by risk.
5. **Accept or reject** — admit only validated outcomes; otherwise reject, quarantine for review, or escalate through stable categories.

Keep provider prompts, confidence formats, and protocols inside the edge adapter. Component output may inform a choice, but it must not settle an open model, vocabulary question, or trade-off; name the decision and accountable human instead.

### 7. Record ownership expectations

Note which side owns:
- the business meaning of the interaction
- durable state changes
- identifiers introduced by the seam
- backward-compatibility expectations
- acceptance, rejection, and human-review policy for probabilistic output

### 8. Include failure and recovery expectations

A useful contract should answer:
- what failures are domain-significant here?
- what failures are merely operational?
- who retries or compensates?
- what should the receiver rely on when the interaction is incomplete or delayed?

### 9. Link the contract back to workflows and data ownership

A contract artifact should point to:
- the emitting or calling workflow
- the consuming workflow
- the bounded contexts involved
- the persistence or read-model note if data is projected elsewhere

## Output shape

Use a compact contract note with:
- purpose, participants, ownership, and relationship shape
- shared terms, any Published Language surface, and local translations
- stable outcomes and failures
- anti-corruption notes or the probabilistic parse/translate/validate/reject path
- change and compatibility notes

## Review questions

- Who owns the contract shape, and is that obvious?
- Which terms are truly shared versus merely similar?
- Where does translation happen, and what stays private behind it?
- Does the contract expose only what the receiver needs?
- If a Published Language is used, does it support a stable generic capability without colonizing local models?
- Can variable output enter the trusted model without parsing, translation, validation, and explicit acceptance or rejection?
- Would a vendor, probabilistic component, protocol, or storage change force unnecessary changes in the core model?

## Related docs

- `context/principles/03-bounded-contexts-and-boundaries.md`
- `context/principles/10-serialization-persistence-and-data-ownership.md`
- `context/patterns/01-boundary-and-decomposition-patterns.md`
- `context/patterns/03-error-and-edge-translation-patterns.md`
- `context/playbooks/08-business-event-discovery-and-event-catalog-playbook.md`
- `context/review/05-event-and-contract-artifact-checklist.md`
