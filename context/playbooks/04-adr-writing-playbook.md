# ADR Writing Playbook

## Summary

- Write ADRs for structural decisions that should not be rediscovered later.
- Keep them small, explicit, and consequence-oriented.
- Record alternatives and trade-offs, not just conclusions.
- Use a smaller design deviation record for narrow local exceptions.
- Link ADRs to the maps, manifests, and canonical docs they affect.

## Use this when

- making a meaningful architecture or repository-structure decision
- renaming an important concept with broad impact
- defining a review policy or distribution boundary
- resolving a recurring ambiguity that should stay resolved

## Triggers that justify an ADR

Write an ADR when a decision changes:
- repository structure
- canonical vocabulary or boundaries
- retrieval behavior
- review policy
- distribution or packaging policy
- integration strategy with other agent tools

## ADR decision test

Before writing an ADR, check that the decision is:

- hard to reverse enough that rediscovery would be costly
- surprising without context enough that a future reader may try to undo it
- a real trade-off with meaningful alternatives, not just the obvious path

If these are not true, prefer a smaller note, design deviation, issue comment, or no durable record.

## ADR vs design deviation

Not every exception needs an ADR. Use the smallest durable record that preserves future understanding.

| Situation | Prefer |
|---|---|
| narrow local exception to canonical guidance | design deviation record |
| temporary exception with known revisit trigger | design deviation record |
| decision changes boundaries, vocabulary, retrieval, review, or distribution policy | ADR |
| same deviation repeats across scopes | ADR or canonical guidance update |
| decision affects many future contributors | ADR |

A design deviation should record:
- canonical guidance affected
- scope
- why the deviation is needed
- simpler or canonical alternative rejected
- risk
- revisit trigger or expiry condition

## Steps

### 1. State the context

Describe the problem, pressure, or ambiguity.

### 2. Record the decision

Write the chosen approach plainly.

### 3. Record rationale and alternatives

Note what options were considered and why the chosen one won.

### 4. Record consequences

Capture both benefits and costs.

### 5. Link impacted artifacts

Update or reference:
- maps
- manifests
- principle docs
- playbooks
- review docs

## Minimum ADR outline

```text
# ADR 000X: <Decision>
- Status: Accepted
- Date: YYYY-MM-DD

## Context
## Decision
## Rationale
## Consequences
```

## Good ADR qualities

- easy to scan
- specific about what changed
- explicit about consequences
- linked to affected artifacts
- not used for temporary status updates

## Review questions

- Will future contributors need this decision explained again?
- Is the decision hard to reverse, surprising without context, and a real trade-off?
- Does this change affect multiple artifacts or future direction?
- Are alternatives and consequences explicit?
- Have the impacted maps/manifests been updated?

## Related docs

- `docs/adr/0001-information-architecture-and-manifests.md`
- `docs/adr/0002-lightweight-validation-before-agent-exports.md`
- `docs/adr/0005-core-context-pack-and-vendoring-boundary.md`
- `context/review/01-quality-gates.md`
