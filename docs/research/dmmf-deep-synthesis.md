# Deep DMMF Synthesis

## Summary

- This iteration revisits _Domain Modeling Made Functional_ at a finer granularity than the first synthesis.
- The strongest reusable ideas are not tied to F#; they are tied to how the book uses types, workflows, boundaries, and explicit errors to preserve domain meaning.
- The main shift for the repo is to treat DMMF not just as "DDD plus functional flavor" but as a source of concrete design moves for making models trustworthy, readable, and evolvable.
- _A Philosophy of Software Design_ remains the supporting lens for keeping the resulting corpus deep, obvious, and low-friction to retrieve.

## Why this deeper pass matters

The first iteration captured broad themes:
- ubiquitous language
- bounded contexts
- workflows
- explicit errors
- persistence at the edges

This second pass goes deeper into the book's internal progression:
- how types become modeling tools
- how identity and invariants reshape the model
- how workflows become pipelines with explicit effects
- how persistence, serialization, and change are kept from distorting the core

## Part 1 — Understanding the Domain

Relevant DMMF chapters:
- chapter 1: shared model, business events, subdomains, bounded contexts, ubiquitous language
- chapter 2: domain interviews, resisting database-driven and class-driven design, documenting the domain
- chapter 3: functional architecture, bounded contexts as autonomous components, contracts between contexts, workflows inside a context

### Main reusable lessons

1. **Business events are a modeling tool**
   Event language is not only for messaging systems; it is a way to understand what matters in the domain.

2. **Resist storage-first decomposition**
   Database structures and CRUD impulses tend to flatten domain meaning too early.

3. **Resist class-first decomposition**
   Starting from classes encourages shape-first modeling rather than meaning-first modeling.

4. **Bounded contexts are operational design units**
   They are not only conceptual partitions; they are autonomous places where language, rules, and workflows can stay coherent.

5. **Contracts between contexts deserve explicit design**
   Cross-context communication is part of the model, not just integration plumbing.

### Repo implications

These lessons strengthen:
- `context/principles/03-bounded-contexts-and-boundaries.md`
- `context/patterns/01-boundary-and-decomposition-patterns.md`
- `context/playbooks/01-domain-modeling-playbook.md`
- `context/playbooks/02-bounded-context-definition-playbook.md`

## Part 2 — Modeling the Domain

Relevant DMMF chapters:
- chapter 4: understanding types, composition, optional values, errors, collections
- chapter 5: domain modeling with types, simple values, complex data, workflows, value objects, entities, aggregates
- chapter 6: integrity and consistency, invariants, business rules in the type system
- chapter 7: workflows as pipelines, states, step types, effects, dependency questions, long-running workflows

### Main reusable lessons

1. **Types are a design language**
   The book treats types as a way to describe domain truth, not merely implementation detail.

2. **Make illegal states hard to represent**
   In languages without rich type systems, this still translates into constructors, schemas, validation gates, and narrowed trusted representations.

3. **Identity is a first-order modeling choice**
   The distinction between value objects and entities is semantic, not stylistic.

4. **Aggregates protect consistency boundaries**
   They define where invariants must hold together.

5. **Workflows are typed transformations**
   Even without F#, the key lesson survives: model each step by explicit input, output, and effect surface.

6. **Effects should be documented, not hidden**
   Validation, persistence, notifications, async waiting, and external calls should all be visible in the workflow surface.

### Repo implications

These lessons suggest adding or deepening docs on:
- type-shaped models
- trusted vs untrusted representations
- entities, value objects, and aggregates
- workflow pipelines and explicit effects
- long-running workflow surfaces

## Part 3 — Implementing the Model

Relevant DMMF chapters:
- chapter 8: total functions and composition
- chapter 9: composing the pipeline and injecting dependencies
- chapter 10: explicit errors via `Result`
- chapter 11: serialization and DTO translation
- chapter 12: persistence, CQS, data-store ownership
- chapter 13: evolving the design through requirement changes

### Main reusable lessons

1. **Composition is a design tool, not just an implementation trick**
   Smaller steps make workflow reasoning easier.

2. **Dependencies belong in the assembled workflow surface**
   The act of wiring dependencies is part of the system design.

3. **Errors deserve first-class modeling**
   A domain error is not just an exception path; it can be part of the domain contract.

4. **Serialization is a translation problem**
   Domain types and transport/storage shapes should not be assumed identical.

5. **Persistence must not own the model**
   Push persistence to the edges, separate commands from queries when helpful, and let bounded contexts own their data.

6. **Change should be traced through the model first**
   Requirement changes should reshape language, workflows, and invariants before implementation patches are made.

### Repo implications

These lessons suggest stronger canonical guidance on:
- explicit error/result modeling
- dependency injection as workflow assembly
- serialization and mapping boundaries
- bounded-context data ownership
- change-driven model evolution

## Chapter-to-framework mapping

| DMMF area | Best matching repo layer |
|---|---|
| shared model, UL, bounded contexts | principles + glossary + playbooks |
| types as modeling tools | principles |
| entities / VOs / aggregates | principles + patterns |
| workflow pipelines | principles + patterns + playbooks |
| explicit errors | principles + patterns |
| serialization / persistence | principles + patterns |
| change-driven evolution | principles + playbooks + ADRs |

## Gaps identified before this iteration

Before this pass, the repo had strong coverage of:
- boundaries
- workflows
- error separation
- retrieval structure

But it had thinner coverage of:
- type-shaped modeling as a language-neutral principle
- the VO / entity / aggregate distinction at a dedicated level
- explicit workflow assembly with dependencies and effects
- persistence/serialization ownership rules at DMMF depth
- evolving the model through requirement change

## New canonical docs to add in this iteration

- `context/principles/07-type-shaped-models-and-illegal-states.md`
- `context/principles/08-entities-value-objects-and-aggregates.md`
- `context/principles/09-workflow-pipelines-effects-and-dependencies.md`
- `context/principles/10-serialization-persistence-and-data-ownership.md`
- `context/principles/11-evolving-models-through-change.md`

## Bottom line

The deepest reusable contribution from DMMF is this:

**make domain meaning explicit early, keep trusted representations narrow, model workflows as visible transformations, and let persistence or integration adapt to the model instead of owning it.**

## v0.2.0 targeted reread findings

A more targeted reread of the DMMF sections on business events, contracts, explicit effects, errors, serialization, persistence, and change surfaced a few reusable moves worth codifying directly in the repo.

1. **Business events deserve their own artifact shape.**
   A past-tense event list reveals what the business notices, where workflows hand off, and where missing contracts or gaps exist.

2. **Contracts are relationship-specific.**
   Shared-kernel, consumer-driven, conformist, and anti-corruption seams should not be flattened into generic integration notes.

3. **Workflow effects should stay visible.**
   A useful workflow surface should make visible whether a step can reject, fail operationally, perform I/O, wait asynchronously, or depend on another context.

4. **Internal step dependencies benefit from explicitness.**
   Public workflow APIs may hide wiring detail, but internal workflow steps are easier to reason about when their dependencies are visible.

5. **Error modeling works best as translation into stable envelopes.**
   Validation failures, domain rejections, operational failures, and unexpected outcomes should often be collapsed into a smaller workflow-level surface.

6. **Serialization and persistence remain separate concerns.**
   Serialization is translation between domain and DTO shapes; persistence is about durable state and ownership; commands and queries often want different shapes.

7. **Transactions follow consistency boundaries.**
   Cross-service atomicity should not be implied; explicit boundaries, compensations, and coordination notes are preferable.

8. **Change should first reshape language and artifact boundaries.**
   Requirement changes should first be traced through vocabulary, events, workflows, contracts, and read/write ownership.

## Impact on the v0.2.0 scope

The targeted reread did **not** suggest a radically different scope.
It confirmed that the right next move is to operationalize the DMMF-heavy corpus with:
- business event discovery
- explicit failure taxonomy
- cross-context contracts and anti-corruption guidance
- compact event-catalog guidance
- stronger contract and anti-corruption review guidance

So the reread mainly refined the shape of v0.2.0 rather than expanding it into another large theory pass.
