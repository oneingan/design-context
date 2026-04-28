# Source Synthesis

This document distills the design inputs for the repository.

## 1. Upstream `tenets` repository

### Observed strengths

- It treats agent guidance as a **first-class repository artifact**.
- It separates guidance into focused files by topic.
- It uses **context-aware loading** instead of one giant instruction file.
- It includes an **architecture review** mindset, not just generation guidance.
- It clearly connects structure, domain modeling, and application rules.

### Implications for this repo

- keep guidance modular
- optimize for selective loading
- make review artifacts as important as authoring artifacts
- avoid a single monolithic prompt file
- provide task-specific entrypoints

## 2. `Domain Modeling Made Functional` → language-neutral takeaways

The book is written with F#, but several patterns translate well beyond any one language.

### High-value patterns

1. **Ubiquitous language first**
   Shared terms are a design artifact, not a documentation afterthought.

2. **Bounded contexts partition complexity**
   The repo should support isolated context packs by domain or capability.

3. **Make invariants explicit**
   When a language cannot encode them in types, the repo should encode them in schemas, checklists, state tables, and compact workflow descriptions.

4. **Model workflows as stateful transformations**
   Playbooks should describe inputs, outputs, transitions, decisions, and side effects.

5. **Separate pure domain thinking from edge concerns**
   Persistence, transport, and integration should sit at the edges of playbooks and review guidance.

6. **Errors should be explicit**
   Error taxonomies, invalid states, and recovery paths should be part of the canonical docs.

7. **Design must evolve cleanly**
   Change stories and ADRs matter because models are refined over time.

### Repo design implications

- include glossaries and domain vocabularies
- keep boundary definitions explicit
- represent states, invariants, and transitions in text-friendly structures
- create workflow playbooks that emphasize transformation over framework details
- keep infra guidance separate from domain guidance

## 3. `A Philosophy of Software Design` → repo and authoring takeaways

### High-value patterns

1. **Strategic programming**
   Invest early in structure so future changes cost less.

2. **Modules should be deep**
   Each directory or document cluster should expose a simple surface and hide detail underneath.

3. **Information hiding**
   Agents should only need the minimum stable interface of a module, not its full internal history.

4. **Different layer, different abstraction**
   Map docs, principle docs, patterns, playbooks, and review docs should not all say the same thing.

5. **Pull complexity downward**
   High-level entry docs stay small; specialized docs absorb detail.

6. **Define errors out of existence**
   Use schemas, naming rules, state tables, and checklists to prevent invalid contributions.

7. **Design it twice**
   Thin planning before expansion should be normal.

8. **Comments are a design tool**
   In this repo, ADRs, summaries, and rationale docs play that role.

9. **Consistency and obviousness**
   Stable naming, directory conventions, and document shapes reduce load on both humans and agents.

### Repo design implications

- require a map/manifest per major area
- keep one abstraction level per file
- enforce document size budgets
- add ADRs for meaningful structural choices
- make naming and glossary consistency part of review

## 4. Combined design stance

Bringing the three sources together suggests this repository should be:

- **modular** like upstream `tenets`
- **domain-centered** like `Domain Modeling Made Functional`
- **complexity-conscious** like _A Philosophy of Software Design_

In practice that means:

- progressive disclosure
- language-neutral core artifacts
- explicit boundaries and vocabularies
- clear separation between canonical rules and generated/exported artifacts
- durable change history via ADRs and todos

## Related docs

- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-inventory.md`
- `docs/research/source-reading-map.md`
