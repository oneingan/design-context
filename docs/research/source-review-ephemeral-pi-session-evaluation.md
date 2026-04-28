# Source Review: Ephemeral Pi Session Evaluation

## Summary

- This review executes `docs/research/source-review-workflow.md` with real ephemeral Pi sessions and temporary git repositories.
- Three read-only Pi runs tested vendored consumption, research-authority handling, and source-repo maintenance review.
- The vendored core pack worked well from `docs/vendor/design-context/` with progressive disclosure.
- Authority boundaries held: a local source-only research note did not override vendored canonical guidance.
- No canonical changes are recommended from this pass; one local Pi/NixOS tool friction was observed.

## Trigger

The previous frontier-model dry run deferred real model-behavior evidence. This pass adds lightweight empirical evidence by running Pi itself against temporary repositories.

## Method

Ephemeral command shape:

```bash
pi --no-session \
  --session-dir <tmp>/pi-sessions \
  --no-extensions \
  --no-skills \
  --no-prompt-templates \
  --tools read,grep,find,ls \
  --thinking minimal \
  --mode json \
  @.prompt.md
```

Temporary repositories:

| Run id | Temp repo | Purpose |
|---|---|---|
| `pi-eval-1` | consumer repo with `docs/vendor/design-context/` | Test normal vendored use for workflow/event/seam modeling. |
| `pi-eval-2` | consumer repo with a conflicting `docs/research/source-note.md` | Test canonical vs source-only authority handling. |
| `pi-eval-3` | temporary copy of this source repo | Test whether `source-review-workflow.md` should remain research-only. |

Full JSON event logs were not committed. This note records summarized evidence only.

## Evidence summary

| Run id | Files read | Behavior observed | Classification |
|---|---:|---|---|
| `pi-eval-1` | 12 | Followed README → map → manifest → relevant workflow/event/failure/contract docs. Ignored ADRs, review docs, patterns, and unrelated modeling docs. | covered |
| `pi-eval-2` | 6 | Read the research note, consumer `AGENTS.md`, vendored README, VENDORING, and ADR 0005; correctly rejected the source-only note as non-canonical. | covered |
| `pi-eval-3` | 10 | Read default entrypoints, source-review workflow, review docs, manifest, and ADR 0005; recommended keeping source review outside `context/**`. | covered / no-op |

## Review claims

| Claim id | Evidence type | Claim | Current home | Classification | Response |
|---|---|---|---|---|---|
| `pi-review-1` | model behavior | A Pi agent can consume the vendored core pack from `docs/vendor/design-context/` using progressive disclosure. | `README.md`, `VENDORING.md`, `context/00-map.md`, `context/manifests/project-manifest.yaml` | covered | No change. |
| `pi-review-2` | model behavior | For workflow/event/seam modeling, the map points agents to useful leaf docs without requiring whole-repo loading. | `context/00-map.md`, playbook and principle maps | covered | No change. |
| `pi-review-3` | authority test | A conflicting local research note was treated as source-only and did not override canonical vendored guidance. | `VENDORING.md`, `docs/adr/0005-core-context-pack-and-vendoring-boundary.md`, `context/review/01-quality-gates.md` | covered | No change. |
| `pi-review-4` | internal drift | `source-review-workflow.md` is useful but source-repo maintenance guidance, not consumer-facing canonical context. | `docs/research/source-review-workflow.md`, `context/manifests/project-manifest.yaml` | no-op for canonical promotion | Keep research-only. |
| `pi-review-5` | tooling evidence | Pi's `find` tool failed once on NixOS because its bundled `fd` executable was dynamically linked for generic Linux. | none | tooling gap outside core | Record as local harness friction; use direct reads or shell/Nix fallback when needed. |
| `pi-review-6` | evaluation evidence | JSON event logs are large and noisy; source review notes should summarize observations instead of committing raw traces. | `docs/research/source-review-workflow.md` | covered | No change. |

## Findings

### 1. Vendored path works

The preferred consumer path `docs/vendor/design-context/` was discoverable and usable. The agent began from vendored README/map/manifest, then loaded task-relevant workflow, event, failure, contract, and boundary docs.

No evidence suggests changing the vendoring path or including research docs in the core pack.

### 2. Progressive disclosure held, but real tasks may read many leaf docs

The workflow modeling task legitimately touched several areas:

- workflow/state principle
- workflow playbook
- business event playbook
- failure taxonomy playbook
- cross-context contract playbook
- boundary principle
- workflow effects principle

This is acceptable for a broad request that asks for events, states, failures, and seams. Future benchmarks should distinguish broad design tasks from narrow lookup tasks.

### 3. Research authority boundary held

The research-trap run correctly treated `docs/research/source-note.md` as exploratory and non-canonical. It used vendoring docs and ADR 0005 as authority anchors.

No canonical tightening is needed.

### 4. Source review should remain source-only

The source-repo maintenance run concluded that promoting `source-review-workflow.md` into `context/**` would blur the vendored core boundary. This supports the current policy: source review informs maintainers but does not ship in the default core pack.

### 5. Local Pi/NixOS tooling friction exists

One run reported a failed `find` tool due Pi's bundled `fd` executable not running on NixOS. The agent recovered through direct reads, so the review was not blocked.

This is not a `design-context` canonical issue. For future Pi-based evaluations on NixOS, prefer:

- direct `read` calls for known paths
- shell commands with Nix-provided tools when discovery is needed
- explicit capture of tool failures as review evidence

## Decisions

Accepted:
- Keep `source-review-workflow.md` as source-only research.
- Treat ephemeral Pi sessions as valid lightweight evidence for source review.
- Summarize event logs instead of committing raw traces.

Deferred:
- A reusable benchmark harness for multiple models.
- Manifest load-hint quality linting.
- Canonical model-compatibility checklist.
- Any Pi/NixOS-specific workaround in core docs.

Rejected:
- Promoting source review into `context/**` now.
- Adding `docs/research/**` to the default core pack.

## Validation

Repository checks should pass after this note:

```bash
nix shell nixpkgs#yq nixpkgs#ripgrep -c ./tooling/run-checks.sh
```

## Related docs

- `docs/research/source-review-workflow.md`
- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-review-frontier-model-context-fitness-dry-run.md`
- `VENDORING.md`
- `docs/adr/0005-core-context-pack-and-vendoring-boundary.md`
- `context/review/01-quality-gates.md`
