# Source Review: Matt Pocock Skills

## Summary

- This source-only note reviews `mattpocock/skills` as an external agent-skills repository.
- The portable value is not the slash-command packaging, but the engineering discipline inside several skills.
- The strongest adaptations are small canonical tweaks around ADR selectivity, architecture deepening, and durable agent briefs.
- Do not copy skills, plugin manifests, setup flows, issue-tracker workflows, or Claude-specific hooks into the vendored core pack.
- Accepted response: update existing canonical docs only; no new interface or vendoring boundary change.

## Source snapshot

| Field | Value |
|---|---|
| Repository | `https://github.com/mattpocock/skills` |
| Reviewed commit | `e74f006` |
| License | MIT |
| Reviewed areas | README, `CONTEXT.md`, engineering skills, productivity skills, setup/triage support docs, repo ADR |

## Source areas reviewed

| Area | Portable idea | Relevance |
|---|---|---|
| `grill-with-docs` | Challenge plans against glossary, code, and ADRs; sharpen ambiguous terms; offer ADRs sparingly. | Strong fit, mostly covered by glossary/domain modeling/ADR docs. |
| `improve-codebase-architecture` | Find deepening opportunities; use deletion test; treat interface as test surface; reason in locality/leverage terms. | Strong fit for deep modules and architecture review. |
| `tdd` | Prefer behavior-facing tests through public interfaces and one vertical slice at a time. | Partial fit; existing slice guidance can absorb the portable parts. |
| `diagnose` | Build a fast deterministic feedback loop before hypothesizing. | Useful, but mostly debugging-operational; defer broader adoption. |
| `to-issues` and triage support | Write durable, behavioral, scoped, verifiable agent briefs; avoid stale file paths and line numbers. | Strong fit for agent-operability guidance. |
| `setup-matt-pocock-skills` | Distinguish hard setup dependencies from soft context preferences. | Useful as edge-boundary evidence, not as a core interface. |
| `prototype` | Prototype code should answer one question and be deleted or absorbed. | Useful but secondary; defer unless prototyping guidance becomes a gap. |
| `caveman`, hooks, pre-commit, personal/misc skills | Tooling or personal workflow details. | No-op for canonical core. |

## Review claims

| Claim id | Claim | Current home | Classification | Response |
|---|---|---|---|---|
| `mps-1` | Agent skills should be small, composable, and task-triggered rather than a monolithic process owner. | `context/principles/01-information-architecture-and-manifests.md`, `context/playbooks/11-agent-ready-repository-playbook.md` | covered | No new interface. |
| `mps-2` | ADRs are most useful when the decision is hard to reverse, surprising without context, and a real trade-off. | `context/playbooks/04-adr-writing-playbook.md` | partial gap | Add an ADR decision test. |
| `mps-3` | Architecture review should search for shallow modules and deepening opportunities using deletion tests, locality, leverage, and interface-as-test-surface. | `context/principles/06-deep-modules-and-information-hiding.md`, `context/review/02-architecture-review-checklist.md` | partial gap | Add compact deepening guidance. |
| `mps-4` | Delegable agent work needs a durable brief that states current/desired behavior, key interfaces, acceptance criteria, and out-of-scope boundaries. | `context/playbooks/11-agent-ready-repository-playbook.md`, `context/patterns/04-agent-work-orchestration-patterns.md`, `context/review/06-agent-operability-checklist.md` | partial gap | Add behavioral agent-brief guidance. |
| `mps-5` | Bug fixing should start by constructing a feedback loop before speculating. | `context/playbooks/11-agent-ready-repository-playbook.md` | partial gap / deferred | Keep as evidence for future debugging playbook, not adopted now. |
| `mps-6` | Slash commands, plugin manifests, setup prompts, issue tracker labels, and hooks are edge details. | `docs/adr/0005-core-context-pack-and-vendoring-boundary.md`, `docs/adr/0006-agent-operability-boundary.md` | covered | No core-pack change. |

## Accepted canonical changes

| Target | Change |
|---|---|
| `docs/research/source-inventory.md` | Add explicit `mattpocock-skills` source entry. |
| `context/playbooks/04-adr-writing-playbook.md` | Add ADR selectivity test: hard to reverse, surprising without context, real trade-off. |
| `context/glossary/01-framework-glossary.md` | Define `seam` because architecture-deepening guidance uses it. |
| `context/principles/06-deep-modules-and-information-hiding.md` | Add architecture-deepening heuristics: deletion test, interface-as-test-surface, avoid speculative seams. |
| `context/review/02-architecture-review-checklist.md` | Add modularity/depth review checks. |
| `context/playbooks/11-agent-ready-repository-playbook.md` | Add durable, behavioral agent-brief guidance to work contracts. |
| `context/patterns/04-agent-work-orchestration-patterns.md` | Add agent-ready brief to work-item control plane shape. |
| `context/review/06-agent-operability-checklist.md` | Add checks for durable, scoped, verifiable agent briefs. |

## Rejected or deferred

| Candidate | Decision | Reason |
|---|---|---|
| Copy `skills/**` into the vendored pack | Rejected | Would introduce a parallel command interface and tool-specific packaging. |
| Add `.claude-plugin/plugin.json` or slash-command setup | Rejected | Claude-specific edge behavior, not core framework policy. |
| Add `docs/agents/` setup convention | Rejected | Useful in that repo, but consumer repos should own their work-contract docs. |
| Adopt issue tracker labels or triage state machine | Deferred | Existing agent-operability docs already require repo-owned states; labels are project-specific. |
| Add debugging or TDD playbooks now | Deferred | Valuable, but outside this acutely scoped adaptation. |
| Add prototyping guidance now | Deferred | Not yet a repeated framework gap. |

## Manifest impact

No canonical files were added, removed, or renamed. Maps and manifests do not need updates.

## Validation

Validated after edits with:

```bash
nix shell nixpkgs#yq nixpkgs#ripgrep -c ./tooling/run-checks.sh
```

Result: passed.

## Related docs

- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-review-workflow.md`
- `docs/research/source-inventory.md`
- `context/principles/06-deep-modules-and-information-hiding.md`
- `context/playbooks/04-adr-writing-playbook.md`
- `context/playbooks/11-agent-ready-repository-playbook.md`
- `context/review/06-agent-operability-checklist.md`
