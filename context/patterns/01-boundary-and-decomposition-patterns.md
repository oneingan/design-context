# Boundary and Decomposition Patterns

## Summary

- Good boundaries protect meaning, ownership, and change cadence.
- These patterns help choose where to split, where to translate, and where to keep a shared vocabulary.
- Use them to compare options, not as mandatory prescriptions.
- Apply split/join heuristics to documents and modules as well as bounded contexts.
- Treat seams, adapters, tools, and interaction sessions as such; none is a bounded context by itself.
- A pattern is useful only if it reduces ambiguity or future change cost.

## Load this when

- comparing decomposition options
- deciding whether a new bounded context is justified
- deciding whether a document or module should split or merge
- choosing a shared contract for a generic capability
- shielding a domain model from probabilistic or foreign output
- reviewing context leakage or ownership confusion

## Pattern 1: Single Decision Owner

### Use when
A concept or workflow has one clear place where business meaning should be decided.

### Shape
- one bounded context owns the decision
- adjacent contexts consume the result, not the internal reasoning
- the owner emits or returns stable outcomes

### Benefits
- clearer ownership
- less accidental coupling
- easier review of invariants

### Risks
- over-centralization if unrelated decisions are forced together

## Pattern 2: Translation Seam

### Use when
Two contexts use related concepts with different meanings or levels of detail.

### Shape
- define a seam between contexts
- translate incoming and outgoing terms explicitly
- do not share internal structures across the seam

### Benefits
- protects local language
- limits leakage of foreign concepts

### Risks
- extra ceremony if the two sides are not actually meaningfully different

## Pattern 3: Shared Vocabulary by Agreement

### Use when
Two contexts genuinely share a small stable set of terms.

### Shape
- agree on a narrow shared vocabulary
- keep the shared surface small and stable
- let deeper internal models remain private

### Benefits
- avoids unnecessary translation
- keeps shared contracts simple

### Risks
- the shared set can grow until it becomes accidental coupling

## Pattern 4: Published Language for a Generic Capability

### Use when
A generic capability has stable semantics and multiple participants benefit from an interoperable exchange contract.

### Shape
- adopt or define a documented language for exchange
- name semantic ownership, compatibility, and versioning expectations
- translate between the Published Language and each private local model
- keep the published surface narrower than the models it connects

### Benefits
- improves interoperability and supplier replaceability
- avoids inventing a private contract for a well-understood capability

### Risks
- a lowest-common-denominator contract can erase meaningful local distinctions
- a standard or provider schema can colonize local models if translation is skipped

## Pattern 5: Split by Change Pressure

### Use when
Different parts of the model change for different business reasons or at different speeds.

### Shape
- separate the areas whose policies or language evolve independently
- connect them through explicit contracts

### Benefits
- lower change blast radius
- clearer ownership boundaries

### Risks
- splitting too early can create ceremony without value

## Pattern 6: Shielding Edge Context

### Use when
A vendor, gateway, or protocol changes frequently and should not contaminate the core domain model.

### Shape
- place translation and protocol detail at the edge-facing boundary
- expose stable domain-relevant outputs inward

### Benefits
- protects the core model from edge churn
- makes replacement easier

### Risks
- if the shield is too thin, leakage still occurs; if too thick, it may become opaque and hard to review

## Pattern 7: Probabilistic Boundary

### Use when
A variable or non-deterministic component can produce malformed, unsupported, or ungrounded output that must not enter a trusted domain model directly.

### Shape
- define a narrow input/output contract from accepted domain concepts
- parse the raw response as untrusted data
- translate foreign labels and shapes into local vocabulary
- validate allowed values, invariants, and risk-relevant evidence
- accept only validated outcomes; otherwise reject, quarantine for review, or escalate
- keep provider, prompt, confidence, and protocol details in the edge adapter
- send unresolved strategic model choices or trade-offs to the accountable human

This is a seam around uncertainty, not a new bounded context.

### Benefits
- makes variable output contestable before it affects domain decisions
- protects local language and permits provider replacement

### Risks
- structural validation alone can create false confidence in semantic correctness
- silently coercing invalid output hides model and contract failures

## Pattern 8: Split or Join by Shared Information

### Use when
A document, module, or context is hard to understand because related decisions are scattered or unrelated decisions are forced together.

### Shape
- split when two parts have different audiences, vocabularies, change reasons, or abstraction levels
- join when readers must constantly load both parts to understand either one
- keep the public surface smaller than the hidden detail it protects
- judge the boundary by reduced reader burden, not by file count

### Benefits
- lower retrieval cost
- fewer fake seams
- clearer ownership of decisions and rationale

### Risks
- splitting too finely can create navigation overhead
- joining too broadly can hide independent change pressure

## Related docs

- `context/principles/03-bounded-contexts-and-boundaries.md`
- `context/playbooks/02-bounded-context-definition-playbook.md`
- `context/playbooks/05-trusted-and-untrusted-representations-playbook.md`
- `context/playbooks/10-cross-context-contract-and-anti-corruption-playbook.md`
