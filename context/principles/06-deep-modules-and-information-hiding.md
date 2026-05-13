# Deep Modules and Information Hiding

## Summary

- Keep entrypoints simple and push detail into focused leaf docs.
- A good directory behaves like a deep module: small surface, meaningful hidden detail.
- Different layers should speak at different abstraction levels.
- Duplication across maps, principles, patterns, playbooks, and review docs increases context cost.
- Strategic structure now reduces future prompt and review cost.

## Load this when

- designing or refactoring the repo structure
- deciding whether a document should be split
- reviewing duplication or abstraction leakage
- evaluating whether a section is too shallow or too noisy

## Principle

A repository used by agents should behave like a well-designed system. The reader should see a small, stable surface first and encounter complexity only when it becomes relevant. That is the documentation equivalent of a deep module.

## Rules

### 1. Keep entrypoints shallow and stable

Root docs, maps, and manifests should stay compact. Their job is to expose intent, not to carry every detail.

### 2. Pull complexity downward

When a topic becomes complicated, push the detail into the smallest leaf doc that can own it.

Do not keep expanding top-level files just because they are already popular.

### 3. Keep one abstraction level per file

A file should not simultaneously be:
- a conceptual overview
- a task checklist
- a design rationale log
- a concrete walkthrough

Split these roles apart.

### 4. Hide internal churn behind stable interfaces

If a directory evolves, its map and manifest should remain as stable as possible. Let leaf docs absorb local reorganization.

### 5. Avoid duplication across layers

Duplication is especially expensive in agent-facing repos because it raises retrieval cost and makes it unclear which copy is authoritative.

Prefer:
- one canonical rule
- many links to that rule

### 6. Use ADRs and summaries as design tools

Rationale should not be rediscovered from diffs or oral history. When a structural choice matters, record it explicitly.

### 7. Optimize for obviousness

A reader should be able to answer:
- where am I?
- what is this file for?
- what should I read next?
- what can I safely ignore?

If not, the structure is leaking complexity.

### 8. Design it twice before expanding broadly

When introducing a new area, sketch the map, manifest, and one or two leaf docs before filling the directory with content. Thin planning is cheaper than large refactors.

### 9. Use the deletion test

When a module, helper, or document seems shallow, imagine deleting it.

- If complexity mostly disappears, it was probably pass-through structure.
- If complexity reappears across many callers or readers, it was hiding useful detail.

### 10. Treat the interface as the test surface

A module's interface is everything callers must know: inputs, outputs, invariants, ordering, errors, configuration, and performance expectations.

Tests and reviews should exercise behavior through that surface instead of reaching into internal structure.

### 11. Avoid speculative seams

Introduce an adapter or seam when variation is real enough to justify it, such as production plus test implementations or multiple consumers with different needs. A single-adapter seam is often indirection, not depth.

## Warning signs

Refactor when you see:
- giant entry docs
- shallow pass-through modules or docs that do not hide complexity
- illustrative walkthroughs acting as the real specification
- many files repeating the same rule with slightly different wording
- tests that must know internal structure to verify behavior
- adapters or seams created before variation is real
- leaf docs with no clear map or manifest path to them
- a directory whose internal organization is required knowledge for basic use

## Review questions

- Is the surface area smaller than the knowledge behind it?
- Can an agent succeed without reading internal details first?
- Would deleting the module or document remove useful complexity or expose it elsewhere?
- Can tests and reviewers exercise behavior through the public surface?
- Does each layer answer a different question?
- Is any file carrying more than one abstraction level?
- Are duplicates increasing maintenance and context costs?

## Related docs

- `context/principles/01-information-architecture-and-manifests.md`
- `context/manifests/project-manifest.yaml`
- `VENDORING.md`
- `docs/adr/0001-information-architecture-and-manifests.md`
