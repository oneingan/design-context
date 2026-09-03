# Bounded Context Definition Playbook

## Summary

- Define a bounded context by meaning, ownership, and seam clarity.
- Make vocabulary, responsibilities, and contracts explicit.
- Keep the context pack small but sufficient for independent understanding.
- Record strategic importance when it affects modeling investment.
- Separate `as-is`, `to-be`, and transition views, including what remains unaccepted or unknown.
- Translate across boundaries deliberately.

## Use this when

- deciding whether a capability deserves its own context
- documenting a new bounded context
- cleaning up context leakage or ambiguous ownership

## Inputs

- domain model notes
- candidate concepts and workflows
- known upstream or downstream interactions
- business goals, risks, and investment constraints
- current ambiguity or pain points
- evidence for current relationships and accepted or proposed changes
- represented participants, missing perspectives, and accountable validators

## Steps

### 1. Declare the view and knowledge provenance

State whether the artifact describes `as-is`, `to-be`, or a `transition`. Carry the source and working knowledge status of consequential claims from the domain-modeling record, and name a validation owner where acceptance is still needed.

A `to-be` view is not automatically accepted. Keep proposed or unresolved elements distinguishable from confirmed decisions rather than presenting the whole target with equal authority.

### 2. State the context purpose

Write one paragraph on what this context is for and why it exists separately.

If strategic importance affects design effort, also record whether this context is a core differentiator, a supporting capability, or a generic capability. Use that role to choose modeling depth and review attention; do not use it as a substitute for clear ownership.

### 3. Define the canonical vocabulary

List the most important terms that are valid inside this context.

For each term, note whether it is:
- unique to this context
- shared by agreement
- translated from another context

### 4. Define responsibilities and non-responsibilities

A context should make both explicit.

Ask:
- what decisions belong here?
- what decisions do not belong here?
- what rules would be dangerous to let leak in from elsewhere?

### 5. Inventory core workflows and invariants

Name the major workflows and the invariants they rely on.

### 6. Identify external relationships

For each neighboring context or external system, document:
- relationship type
- inputs or requests crossing the seam
- outputs or events crossing the seam
- translation needs
- expected failures at the seam

### 7. Describe the change route

When `to-be` differs from `as-is`, describe only the route supported by decisions and evidence:

- boundary, responsibility, or ownership changes
- intermediate relationships, translations, and contracts
- compatibility or rollback constraints
- decisions and evidence needed before the next change

Mark unknown dependencies or sequence explicitly instead of inventing a migration order. Keep current, target, and transitional views independently readable.

### 8. Write the minimal context pack

Create a compact pack with:
- purpose
- vocabulary
- responsibilities
- workflows
- invariants
- relationships and contracts
- review questions

## Context card shape

| Field | Description |
|---|---|
| Name | Canonical context name |
| View | `as-is`, `to-be`, or `transition` |
| Knowledge provenance | Sources, working knowledge status, and validator for consequential claims |
| Purpose | What this context exists to decide or protect |
| Strategic role | Core, supporting, or generic when this affects design investment |
| Vocabulary | Core terms valid in this scope |
| Responsibilities | Decisions owned here |
| Non-responsibilities | Decisions owned elsewhere |
| Workflows | Important behaviors |
| Invariants | Conditions that must remain true |
| Relationships | Neighboring contexts and seam type |

## Contract checklist

For each boundary, answer:
- what crosses the seam?
- what terms are shared?
- what terms must be translated?
- what failures can the caller expect?
- what internal details stay hidden?

## Review questions

- Is this boundary semantic or merely organizational?
- Are current evidence, target intent, and transition kept distinct?
- Does the change route expose unknowns and validation owners without inventing sequence?
- Is the strategic role explicit when it changes modeling depth?
- Would another team or system understand what this context owns?
- Are translations explicit where meanings differ?
- Is the surface small enough to stay stable while internals evolve?

## Related docs

- `context/playbooks/01-domain-modeling-playbook.md`
- `context/playbooks/10-cross-context-contract-and-anti-corruption-playbook.md`
- `context/principles/03-bounded-contexts-and-boundaries.md`
- `context/glossary/02-naming-and-term-introduction.md`
- `context/review/02-architecture-review-checklist.md`
