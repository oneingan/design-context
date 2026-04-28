# Managing a Large Agent Context Repo Under Limited Context Windows

## Problem

A repository like this can become self-defeating if agents must read too much before they can act. The framework must therefore be designed as a **retrieval system**, not just a pile of markdown files.

## Main findings

### 1. Progressive disclosure is mandatory

Agents should move through layers:

1. repo overview
2. map/manifests
3. small canonical leaf docs
4. ADRs when rationale or trade-offs matter

### 2. Every major directory needs a map

A directory without a small entry document forces expensive blind exploration.

Each major area should have either:

- a `README.md`, or
- a numbered `00-map.md`, plus
- an optional machine-readable manifest

### 3. Path-scoped loading beats monolithic instructions

The strongest reusable pattern from the upstream `tenets` project is **context-aware loading**. This repo should be organized so agents can load only the relevant domain, pattern, or playbook instead of the entire corpus.

### 4. Canonical content must stay compact

High-volume supporting material can easily dominate retrieval. Keep the reusable core focused on canonical documents.

Suggested order of authority:

1. principles
2. patterns
3. playbooks/checklists
4. ADRs
5. research notes only when background rationale is needed

### 5. Use machine-readable manifests

Manifests make it easier for tools and agents to answer:

- what exists here?
- when should it be loaded?
- what is canonical?
- what files are most relevant for a given task?

### 6. Keep documents independently readable

A good leaf document should have:

- a 3–7 bullet summary
- scope and non-scope
- links to adjacent docs
- minimal duplication

### 7. Enforce size budgets

Recommended soft limits:

- root docs: under 200 lines
- map docs: under 150 lines
- leaf docs: roughly 80–220 lines
- playbooks/checklists: short enough to execute in one pass

### 8. Use stable names and IDs

Glossary terms, ADR numbers, manifest keys, and directory names should remain stable so agents can build reliable retrieval habits.

### 9. Keep session handoff lightweight

For long-running work, add short handoff notes or update todo bodies instead of forcing future agents to reread large diffs and discussions.

### 10. Optimize for "find the next 2 files"

The repo should help an agent answer:

- what is the smallest correct next reading set?
- what can I safely ignore?

That is more valuable than having perfect long-form documentation.

## Recommended operating model for this repo

### Document layers

- `README.md` — repo purpose
- `context/00-map.md` — primary navigation hub
- `context/manifests/project-manifest.yaml` — machine-readable loading map
- `context/principles/` — canonical rules
- `context/patterns/` — reusable solutions
- `context/playbooks/` — task-oriented workflows
- `context/glossary/` — vocabulary and concept definitions
- `context/review/` — audit and review checklists
- `docs/adr/` — durable structural decisions

### Authoring rules

- one file, one abstraction level
- summary first
- link instead of repeating
- add or update a manifest entry when creating a new area
- prefer tables/checklists/state descriptions over long prose

### Review rules

Reject or refactor docs that:

- duplicate content from nearby files
- mix multiple abstraction levels heavily
- exceed size budgets without strong reason
- lack entrypoint guidance
- cannot be understood independently

## Possible future tooling

- manifest validator
- markdown size linter
- link graph generator
- "what should I read next?" helper
- installers that export minimal context packs for specific agent tools

## Bottom line

To manage a large repo under constrained context windows, organize it like a **deep, navigable knowledge base** with small stable entrypoints, not like a single book.
