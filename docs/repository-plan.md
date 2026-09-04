# Repository Plan

## 1. Objective

Create a reusable, language-agnostic agent context framework inspired by `tenets`, but expanded into a documentation-first system for architecture, domain modeling, workflows, review, and knowledge retrieval.

## 2. Design constraints

- agents have limited context windows
- the repo must support progressive loading
- canonical guidance should remain language neutral
- the repo should scale to many topics without becoming a giant unreadable handbook
- reusable content should stay separated from repo maintenance machinery

## 3. Recommended content model

The repository should separate content into clear layers:

1. **Maps**
   - tell agents what exists and what to read next
2. **Principles**
   - stable, canonical rules and design tenets
3. **Patterns**
   - reusable structures such as boundaries, workflows, error models, state transitions, integration seams
4. **Playbooks**
   - task-oriented instructions such as modeling a domain, defining a boundary, reviewing a design, or adding an integration
5. **Glossary**
   - ubiquitous language for the framework itself and project-specific domain glossaries
6. **Manifests**
   - machine-readable summaries for retrieval and automation
7. **Review**
   - quality gates and checklists
8. **ADRs**
   - explicit, durable trade-offs

## 4. Proposed repository shape

```text
design-context/
  README.md
  AGENTS.md
  vision.md
  docs/
    repository-plan.md
    research/
      source-synthesis.md
      context-window-strategy.md
    adr/
      0001-information-architecture-and-manifests.md
  context/
    00-map.md
    manifests/
      project-manifest.yaml
    principles/
    patterns/
    playbooks/
    glossary/
    review/
  tooling/
  .pi/todos/
```

## 5. Content strategy

Keep the canonical layer mostly free of language-specific code. Prefer:

- short principle docs
- checklists
- tables
- state descriptions in text form
- schemas/manifests
- short pseudocode only when it clarifies behavior better than prose

Avoid standalone illustration corpora or reusable boilerplate until real usage shows they reduce retrieval cost more than they increase maintenance cost.

## 6. Roadmap

### Phase 0 — Bootstrap
- initialize repo
- define vision
- define initial plan
- create backlog
- create navigation skeleton

### Phase 1 — Source synthesis
- distill upstream `tenets`
- extract language-neutral patterns from _Domain Modeling Made Functional_
- extract repository and complexity management patterns from _A Philosophy of Software Design_
- convert all of that into framework principles

### Phase 2 — Information architecture
- define top-level taxonomy
- define document size budgets
- define manifest format
- define load order for agents
- define naming/glossary rules

### Phase 3 — Canonical principles
- author principles for domain language
- author principles for boundaries and modules
- author principles for workflows and state transitions
- author principles for errors, invariants, and integration seams
- author review checklists

### Phase 4 — Playbooks and review artifacts
- domain modeling playbook
- bounded context definition playbook
- workflow modeling playbook
- integration and contract review checklist
- ADR writing playbook

### Phase 5 — Lightweight tooling
- manifest validator
- doc size checker
- local/CI command that runs both

### Phase 6 — Optional exports
- evaluate installer/export flows for Claude, Cursor, Copilot, and AGENTS
- keep generated outputs derived from canonical docs, not a parallel source of truth

## 7. Acceptance criteria for v0

v0 is successful if:

- a new agent can understand the repo by loading fewer than 5 files to start
- each major directory has a clear map or manifest
- core principles are independent of a single programming language
- canonical docs are compact enough for selective loading
- backlog and ADR history make future evolution easy

## 8. Open decisions

### Decision made
- **Default content strategy:** language-neutral canonical docs, compact maps/manifests, and lightweight validation first
- **Default vendoring strategy:** copy the core context pack defined in `VENDORING.md`

### Still open
- whether to add installation tooling early or late
- which export formats should be supported first if manual reuse becomes painful

## 9. Backlog link

The actionable implementation backlog for this repo lives in `.pi/todos/`.

## 10. Current refinement status

Recent repository refinements aligned the public repository name, vendoring path, validation checks, and canonical packaging around **`design-context`**.

The latest publication milestone is **v0.6.1 — Explicit Policy Acceptance**.
