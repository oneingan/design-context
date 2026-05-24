# Contributing

Thanks for contributing.

This repository is a **documentation-first, agent-readable framework**. Contributions should improve retrieval, clarity, and design quality, not just add more files.

## Before you change anything

Start with:
1. `README.md`
2. `context/00-map.md`
3. the nearest area map and manifest
4. any related ADRs in `docs/adr/`

## Core contribution rules

- keep one abstraction level per file
- prefer updating existing canonical docs over adding near-duplicates
- update maps and manifests whenever canonical docs move or new canonical docs are added
- update `VENDORING.md` when consumption or distribution boundaries change
- preserve language-agnostic wording unless a language-specific lesson is the point

## What kind of contribution is this?

### 1. Canonical rule or concept change
You are changing principles, patterns, glossary entries, playbooks, or review docs.

Required checks:
- update the nearest `00-map.md`
- update the nearest `*-manifest.yaml`
- review vocabulary drift if naming changed
- add or update an ADR if the change is structural

### 2. Tooling change
You are changing validation or automation.

Required checks:
- keep tooling lightweight unless there is strong evidence for more automation
- avoid adding maintenance-heavy export logic too early
- update `tooling/tooling-evaluation.md` if the tooling strategy changes

### 3. Research or planning change
You are changing background analysis or roadmap material.

Required checks:
- keep it clearly secondary to canonical docs
- link to canonical docs instead of repeating rules
- update maps only if the document is meant to be discoverable for normal use

## Agent execution and sandbox

When an agent or contributor runs commands:

- prefer the repo scripts and temporary Nix environments for one-off tools
- keep filesystem mutations inside the repository unless explicitly requested
- do not change persistent OS, shell, credential, or package-manager configuration for validation
- do not copy secrets into prompts, logs, research notes, or PR evidence

## Run checks locally

Recommended on NixOS or with Nix installed:

```bash
nix shell nixpkgs#yq nixpkgs#ripgrep nixpkgs#python3 -c ./tooling/run-checks.sh
```

Or run the pieces separately:

```bash
nix shell nixpkgs#yq -c ./tooling/validate-manifests.sh
./tooling/check-doc-budgets.sh
nix shell nixpkgs#yq nixpkgs#ripgrep -c ./tooling/check-map-manifest-coverage.sh
nix shell nixpkgs#python3 -c ./tooling/check-internal-links.sh
```

## Proof-of-work packet

Keep PR evidence compact and tied to the change. Include:

- what changed and why
- validation commands run and result
- map, manifest, glossary, source-review, and ADR impact when relevant
- deferred follow-up or known limits

Do not paste long logs unless the failure or evidence would be hard to reproduce.

## Pull request checklist

- [ ] I updated maps and manifests where needed
- [ ] I kept one abstraction level per file
- [ ] I included validation evidence
- [ ] I added or updated an ADR if the change altered structure or policy

## Style guidance

- summary first
- use short sections and scannable lists
- prefer tables or checklists when they reduce ambiguity
- use glossary-aligned terms consistently
- avoid repetition across principles, patterns, playbooks, and review docs

## When to write an ADR

Write or update an ADR when you change:
- repository structure
- naming or boundary meaning
- tooling strategy
- export, vendoring, or publication strategy
- review policy

## If you are unsure

Prefer a smaller change plus a short ADR or todo note over a large speculative expansion.
