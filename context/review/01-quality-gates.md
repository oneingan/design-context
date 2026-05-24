# Quality Gates

## Summary

- Canonical changes should pass a small set of repo-wide gates.
- The gates are designed to prevent ambiguity, duplication, and retrieval cost.
- Failing one gate is often enough reason to revise a change before accepting it.

## Use this when

- reviewing a pull request or batch of docs
- deciding whether a new canonical artifact is ready
- checking if maps, manifests, and review docs stayed aligned

## Gates

### QG-1 Discoverability

- [ ] the change is reachable from the nearest map
- [ ] the nearest manifest is updated
- [ ] related docs link to the new or changed artifact where appropriate

### QG-2 Abstraction discipline

- [ ] each file stays at one abstraction level
- [ ] maps do not become handbooks
- [ ] review docs evaluate rather than explain theory

### QG-3 Canonical clarity

- [ ] the canonical source of truth is obvious
- [ ] duplicate rules were avoided or removed
- [ ] downstream summaries do not redefine canonical guidance
- [ ] source-only notes do not become hidden specifications

### QG-4 Size and retrieval cost

- [ ] file sizes stay within the intended budget or have a good reason not to
- [ ] an agent can identify the next two files to read quickly
- [ ] the change does not force broad loading for narrow tasks

### QG-5 Vocabulary stability

- [ ] glossary implications were checked
- [ ] canonical terms remain consistent across affected artifacts
- [ ] vocabulary drift review was run when naming changed

### QG-6 Structural rationale

- [ ] a meaningful structural trade-off has an ADR if needed
- [ ] consequences are explicit for future contributors
- [ ] deviations from canonical guidance are explicit, scoped, and justified
- [ ] each design deviation records the simpler or canonical alternative rejected
- [ ] temporary deviations include a revisit trigger or expiry condition

### QG-7 Edge discipline

- [ ] core guidance remains distinct from edge or tool-specific details
- [ ] operational concerns did not silently become core concepts
- [ ] agent runtimes, approvals, sandboxes, secrets, and vendor APIs remain edge concerns unless they are the explicit topic

### QG-8 Distribution boundary

- [ ] the canonical core remains compact and reusable
- [ ] generated/exported artifacts do not become a parallel source of truth

### QG-9 Feedback loop discipline

- [ ] repeated agent or reviewer failures are captured as docs, checks, schemas, or tooling rather than only as prompt admonitions
- [ ] validation failures are actionable enough for the next agent or maintainer to recover

### QG-10 Agent enablement alignment

- [ ] agent-operability changes name the domain-design capability they enable
- [ ] guides, sensors, prompts, tools, or workflows do not become a second design core
- [ ] generic AI-workflow advice remains source-only or edge-specific unless it helps apply the framework

## Pass condition

A canonical change should pass all relevant gates. If a gate is not relevant, say why.

## Related docs

- `context/review/02-architecture-review-checklist.md`
- `context/review/03-documentation-quality-checklist.md`
- `context/review/04-vocabulary-drift-checklist.md`
- `docs/adr/0001-information-architecture-and-manifests.md`
- `docs/adr/0007-agent-enable-domain-design.md`
