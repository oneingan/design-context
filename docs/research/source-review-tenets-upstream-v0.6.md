# Source Review: Tenets Upstream v0.6

## Summary

- This source-only note reviews recent `bardiakhosravi/tenets` changes around Spec-Kit and spec-driven development.
- The portable insight is that domain and architecture checks should appear before implementation, while work is still being specified and planned.
- The strongest canonical adaptation is explicit tracking for justified deviations from canonical guidance.
- No Spec-Kit interface, CLI behavior, installer logic, or full template should be imported into `context/**`.
- Accepted response: small tweaks to existing domain modeling, ADR, review, and agent-operability docs only.

## Trigger

`tenets` added v0.5/v0.6 changes after it was used as an initial inspiration source. The changes are useful enough to review, but most are distribution or tool-integration details rather than reusable core guidance.

## Source delta reviewed

| Area | Upstream change | Relevance |
|---|---|---|
| README framing | Architecture starts at the spec, not the code. | Portable as feature/spec pre-implementation modeling guidance. |
| Spec-Kit preset | Adds DDD sections to spec/plan/tasks/checklist templates. | Portable shapes only; templates and Spec-Kit interface remain source-only. |
| Plan template | Adds architecture gate and complexity/violation tracking. | Strong fit as `design deviation` guidance. |
| Tasks template | Organizes work by independently testable user stories and checkpoints. | Useful as a heuristic for agent work decomposition. |
| CLI/update changes | Adds install/update robustness, namespacing, cleanup, migration state. | Tooling evidence only; deferred under ADR 0002. |

## Review claims

| Claim id | Claim | Current home | Classification | Response |
|---|---|---|---|---|
| `tenets-v06-1` | Domain and architecture concerns should be raised while a feature is being specified, before implementation hardens. | `context/playbooks/01-domain-modeling-playbook.md` | partial gap | Add a small feature/spec input prompt. |
| `tenets-v06-2` | Useful feature specs expose domain language, affected bounded context, relationships, candidate concepts, outcomes, and acceptance checks. | `context/playbooks/01-domain-modeling-playbook.md` | partial gap | Add bullets; do not add a new interface. |
| `tenets-v06-3` | Violating an architecture or design rule should be an explicit, justified, scoped, revisitable deviation. | `context/review/01-quality-gates.md`, `context/review/02-architecture-review-checklist.md`, `context/playbooks/04-adr-writing-playbook.md` | partial gap | Add `design deviation` glossary/review/ADR guidance. |
| `tenets-v06-4` | Work should be decomposed into independently testable slices when possible, with checkpoints before moving on. | `context/playbooks/11-agent-ready-repository-playbook.md`, `context/patterns/04-agent-work-orchestration-patterns.md` | partial gap | Add a heuristic only. |
| `tenets-v06-5` | Preset layering and installer robustness matter for future export automation. | `docs/adr/0002-lightweight-validation-before-agent-exports.md` | tooling gap / deferred | Record no canonical change now. |
| `tenets-v06-6` | Spec-Kit, CLI flags, npm packaging, and Python/hexagonal specifics should not become core policy. | `context/review/01-quality-gates.md`, `docs/adr/0005-core-context-pack-and-vendoring-boundary.md` | covered | No change. |

## Accepted canonical changes

| Target | Change |
|---|---|
| `docs/research/source-inventory.md` | Add explicit `tenets-upstream` source entry. |
| `context/playbooks/01-domain-modeling-playbook.md` | Add feature/spec pre-implementation prompts. |
| `context/glossary/01-framework-glossary.md` | Define `design deviation`. |
| `context/review/01-quality-gates.md` | Require scoped, justified deviations when canonical guidance is not followed. |
| `context/review/02-architecture-review-checklist.md` | Add deviation checks and reporting field. |
| `context/playbooks/04-adr-writing-playbook.md` | Distinguish local deviations from ADR-worthy decisions. |
| `context/playbooks/11-agent-ready-repository-playbook.md` and `context/patterns/04-agent-work-orchestration-patterns.md` | Add independently testable slice heuristics. |

## Rejected or deferred

| Candidate | Decision | Reason |
|---|---|---|
| Add Spec-Kit as supported interface | Rejected | Outside current core and would introduce a tool dependency. |
| Copy upstream templates | Rejected | Templates would become hidden specifications and exceed the scoped change. |
| Add exporter or installer guidance now | Deferred | ADR 0002 still defers heavy export automation. |
| Add a new feature-spec playbook | Deferred | Existing domain modeling playbook can absorb the needed prompt. |

## Manifest impact

No canonical files were added, removed, or renamed. Maps and manifests do not need updates.

## Validation

Validated after edits with:

```bash
nix shell nixpkgs#yq nixpkgs#ripgrep -c ./tooling/run-checks.sh
```

Result: passed.

No canonical files were added, removed, or renamed, so no map or manifest update was needed.

## Related docs

- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-review-workflow.md`
- `docs/research/source-inventory.md`
- `context/playbooks/01-domain-modeling-playbook.md`
- `context/review/01-quality-gates.md`
- `context/review/02-architecture-review-checklist.md`
