# Evolving Models Through Change

## Summary

- Treat requirement changes as model changes first, not implementation patches first.
- Re-evaluate language, invariants, workflows, and boundaries before modifying code or downstream docs.
- Let trusted representations and explicit workflow steps show you where the change really lands.
- Prefer designs that make ripple effects visible instead of hiding them.
- Evolve through small discovery, design, test, and learning cycles sized to uncertainty and risk.
- Use ADRs, manifests, and review checklists to keep evolution coherent over time.

## Load this when

- adapting the model to new requirements
- reviewing whether a change belongs in the model or just at the edges
- tracing how a change should ripple through the framework
- trying to keep a once-clean model from becoming patchwork

## Principle

One of DMMF's closing lessons is that a good model should evolve without collapsing into a big ball of mud. The key is to revisit the domain model itself whenever requirements change, instead of only patching the implementation around it.

## Rules

### 1. Start with the changed business meaning

Ask first:
- what new distinction now matters?
- what invariant changed?
- what workflow step changed?
- what new state or outcome is now required?

### 2. Trace the semantic ripple before the implementation ripple

Walk through changes in this order:
1. glossary and meaning
2. trusted data shapes
3. entities / value objects / aggregates
4. workflows and effects
5. persistence or integration mappings
6. review artifacts and manifests

### 3. Use evidence-sized learning cycles

Choose a cycle small enough to answer the current modeling question and proportionate to uncertainty and risk, not a fixed cadence or artifact count.

1. **Discover** — gather relevant observations and perspectives; expose disputed and unknown claims.
2. **Design** — express a candidate distinction, rule, workflow, or boundary with its assumptions visible.
3. **Test** — use contrasting scenarios, counterexamples, or independently checkable behavior against the candidate.
4. **Learn** — have the accountable participant confirm, refine, reject, or leave the candidate open; update affected model expressions and working knowledge status.

Keep the conclusion, supporting evidence, and next unknown recoverable. Activity alone is not evidence that the model improved.

### 4. Let explicit models reveal the impact

If the model uses clear step boundaries, named outcomes, and trusted representations, requirement changes should show their impact more honestly. That is a feature, not a problem.

### 5. Resist patching around an outdated model

If the old model no longer reflects the domain, local implementation fixes usually increase hidden complexity.

### 6. Record structural change decisions

When a change alters boundaries, naming, retrieval behavior, or other durable design choices, use ADRs and update maps/manifests accordingly.

## Warning signs

Refactor when you see:
- new rules added only in adapters or edge code
- downstream docs drifting away from the stated model
- repeated special cases that suggest a missing domain distinction
- a requirement change handled without any vocabulary or workflow review

## Review questions

- Did we revisit the domain meaning before editing the implementation?
- Which invariant, state, or boundary changed?
- Does the model now express the new requirement explicitly?
- Did the learning cycle produce decision-relevant evidence rather than ceremony?
- Are conclusions, changed working knowledge status, and remaining unknowns recoverable?
- Were ADRs, maps, and manifests updated where needed?

## Related docs

- `context/principles/02-ubiquitous-language-and-naming.md`
- `context/principles/09-workflow-pipelines-effects-and-dependencies.md`
- `context/playbooks/01-domain-modeling-playbook.md`
- `context/playbooks/04-adr-writing-playbook.md`
- `context/review/01-quality-gates.md`
