# Tooling Evaluation

## Summary

- Lightweight validation is worth doing now.
- Heavy export automation should be deferred until the corpus stabilizes further.
- Retrieval helpers are useful, but should stay simple until real usage patterns emerge.
- Tooling must reduce maintenance cost, not create a parallel system that is harder than the docs themselves.

## Evaluation outcomes

### 1. Manifest validation

**Decision:** implement now.

Reason:
- manifests are central to retrieval
- broken YAML or drift between manifests is easy to introduce
- validation is cheap and high leverage

Implemented now:
- `tooling/validate-manifests.sh`

### 2. Markdown and document-size linting

**Decision:** implement a lightweight version now.

Reason:
- size budgets are part of the repo's context-window strategy
- a simple warning-oriented check is enough for early phases
- heavier markdown linting can wait until style conventions stabilize further

Implemented now:
- `tooling/check-doc-budgets.sh`

Deferred:
- full markdown style linting
- link graph enforcement
- duplicate-content detection

### 3. Core-pack boundary validation

**Decision:** implement a lightweight check now.

Reason:
- manual vendoring is currently the supported consumption path
- the preferred `docs/vendor/design-context/` layout should stay mechanically testable
- the core pack should not accidentally depend on source-only machinery

Implemented now:
- `tooling/check-core-pack.sh`

### 4. Source-ingestion boundary validation

**Decision:** implement a lightweight check now.

Reason:
- source EPUBs are ignored local inputs and should not leak into core docs by filename
- source-only research must remain outside the default core pack
- the new source-ingestion workflow should stay discoverable from related research notes

Implemented now:
- `tooling/check-source-ingestion.sh`

### 5. Retrieval helper scripts

**Decision:** partially defer.

Reason:
- retrieval is important, but the current map + manifest structure already does most of the work
- premature automation could hard-code assumptions before the corpus matures

Current stance:
- rely on maps and manifests first
- consider a future `read-next` helper only after repeated manual patterns appear

### 6. Agent-specific export paths

**Decision:** defer automatic export generation.

Reason:
- the framework is still evolving quickly
- exported packs for Claude, Cursor, Copilot, or AGENTS formats would add maintenance burden
- it is better to stabilize canonical docs first, then export smaller curated subsets later

Recommended future export targets:
- `AGENTS.md` subset export
- Claude-oriented context pack export
- Copilot instruction export
- Cursor rule export

### 7. CI warning and noise management

CI should stay aligned with the local checks and avoid optional steps that create noisy external-service warnings without enough value for a small repository.

Current stance:
- keep checkout current
- pin action versions instead of following floating `@main`
- avoid cache steps that add warning noise or external auth requirements unless the speedup clearly matters

### 8. Complexity management rule

If a tool does not clearly reduce retrieval cost, validation risk, or maintenance burden, defer it.

## Recommended near-term tooling boundary

Good to keep now:
- manifest validation
- doc budget warnings
- core-pack boundary validation
- source-ingestion boundary validation
- one command that runs all lightweight checks

Good to defer:
- full export generators
- smart retrieval recommendation engine
- advanced lint rules that add noise before the corpus stabilizes

## Related docs

- `docs/research/context-window-strategy.md`
- `docs/adr/0002-lightweight-validation-before-agent-exports.md`
- `docs/adr/0005-core-context-pack-and-vendoring-boundary.md`
- `tooling/validate-manifests.sh`
- `tooling/check-doc-budgets.sh`
- `tooling/check-core-pack.sh`
- `tooling/check-source-ingestion.sh`
