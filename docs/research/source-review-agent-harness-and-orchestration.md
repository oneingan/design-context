# Source Review: Agent Harness and Orchestration

## Summary

- This review evaluates OpenAI's Harness Engineering and Symphony material as source-only input.
- The durable contribution is not Codex, Linear, or a specific orchestrator, but the operational shape of agent-friendly repositories.
- Current canonical docs already cover progressive disclosure, authority boundaries, maps, manifests, and compact context.
- The main gap is guidance for making consumer repositories agent-operable: isolated work, explicit work contracts, cheap checks, observability, and proof of work.
- Accepted canonical response: add a small playbook, pattern document, review checklist, ADR, and minimal wording updates.

## Trigger

The repository should stay calibrated against field evidence from agent-first software teams without letting vendor-specific tools become hidden specifications for `design-context`.

## Sources reviewed

| Source id | Source | Role in this review |
|---|---|---|
| `openai-harness-engineering` | OpenAI Harness Engineering blog | Evidence for agent-legible repos, feedback loops, knowledge stores, and enforced invariants. |
| `openai-symphony` | OpenAI Symphony blog, repo, and `SPEC.md` | Evidence for issue-driven orchestration, per-task workspaces, workflow contracts, retries, observability, and safety boundaries. |
| `openai-codex-app-server` | Codex App Server docs | Edge example for runner protocols, streamed events, approvals, and dynamic tools. |
| `openai-codex-exec-plans` | Codex ExecPlans / `PLANS.md` article | Evidence for living execution plans and restartable long-running work. |
| `agents-md` | AGENTS.md format repository | Evidence that short agent entrypoints should act like project maps. |
| `community-symphony-ports` | Contrabass and Symphony-Claude community ports | Evidence that the orchestration pattern is portable across languages, issue trackers, and agent runtimes. |

## Review claims

| Claim id | Claim | Current home | Classification | Response |
|---|---|---|---|---|
| `aho-1` | Agent entrypoints should be short maps that point to deeper versioned knowledge, not encyclopedic prompts. | `README.md`, `AGENTS.md`, `context/principles/01-information-architecture-and-manifests.md` | covered | No major change; reinforce source-of-truth wording. |
| `aho-2` | Knowledge that agents must rely on should live in repo-local, versioned artifacts rather than chat, memory, or oral history. | `context/principles/01-information-architecture-and-manifests.md`, `VENDORING.md` | partial gap | Add a small canonical note and make it central in the new playbook. |
| `aho-3` | Agent work is more reliable when validation, lints, and architecture constraints are mechanically enforced with actionable errors. | `context/review/01-quality-gates.md`, `tooling/README.md` | partial gap | Add review/checklist guidance; keep tooling implementation deferred. |
| `aho-4` | Long-running or concurrent agent work needs isolated workspaces and explicit resource boundaries. | `context/principles/04-workflows-invariants-and-state.md`, `context/principles/05-errors-and-edge-responsibilities.md` | new gap | Add an orchestration pattern and agent-ready playbook step. |
| `aho-5` | Work items can serve as a control plane when state transitions, eligibility, blockers, and handoff states are explicit. | `context/principles/04-workflows-invariants-and-state.md`, `context/patterns/02-workflow-and-state-transition-patterns.md` | partial gap | Add a pattern for work-item-driven orchestration. |
| `aho-6` | Agent runners, issue trackers, app servers, and dynamic tools are edge adapters and should not own core workflow meaning. | `context/principles/05-errors-and-edge-responsibilities.md` | covered / partial gap | Add a small edge-responsibility wording update. |
| `aho-7` | Proof of work should be observable: tests, logs, screenshots, videos, PR comments, metrics, or other evidence depending on the task. | `context/playbooks/03-workflow-and-state-modeling-playbook.md`, `context/review/02-architecture-review-checklist.md` | partial gap | Add to agent-ready playbook and review checklist. |
| `aho-8` | Living execution plans help multi-hour work remain restartable, but they are task artifacts, not canonical framework docs. | `context/playbooks/04-adr-writing-playbook.md`, `docs/research/context-window-strategy.md` | partial gap | Add playbook guidance; keep plan templates out of core. |
| `aho-9` | Recurring agent failures should feed back into docs, schemas, checks, or tools rather than one-off prompt admonitions. | `context/principles/11-evolving-models-through-change.md`, `context/review/01-quality-gates.md` | partial gap | Add checklist guidance and small quality-gate wording. |
| `aho-10` | Symphony's concrete implementation details are useful examples but too vendor-specific and large for the vendored core pack. | `docs/adr/0005-core-context-pack-and-vendoring-boundary.md` | covered | Keep as research/source evidence only. |

## Accepted canonical changes

| Proposal id | Target | Change | Rationale |
|---|---|---|---|
| `aho-prop-001` | `docs/adr/0006-agent-operability-boundary.md` | Record the boundary for adding agent-operability guidance without adopting vendor-specific tooling. | Prevent Codex/Symphony details from becoming hidden core policy. |
| `aho-prop-002` | `context/playbooks/11-agent-ready-repository-playbook.md` | Add a task-oriented playbook for making consumer repos agent-operable. | This is the main user-facing gap. |
| `aho-prop-003` | `context/patterns/04-agent-work-orchestration-patterns.md` | Add reusable orchestration shapes distilled from Symphony. | Patterns let users compare shapes without prescribing an implementation. |
| `aho-prop-004` | `context/review/06-agent-operability-checklist.md` | Add an audit checklist for consumer repos. | Review layer is the right home for readiness evaluation. |
| `aho-prop-005` | Existing principles/review docs | Add small wording on repo-local source of truth, actionable checks, work evidence, and edge adapters. | Avoid duplicating a new principle. |
| `aho-prop-006` | Maps/manifests/README/glossary | Add discoverability and a compact glossary term. | Required by quality gates when adding canonical docs. |

## Rejected or deferred changes

| Candidate | Decision | Reason |
|---|---|---|
| Add Symphony `SPEC.md` or a shortened clone to `context/**` | Rejected | Too large and tool-specific; useful as source evidence only. |
| Add a Codex App Server integration playbook | Rejected | Runtime protocol details belong at project edges, not the reusable core. |
| Add a full `WORKFLOW.md` template | Rejected for now | Prompt templates tend to become handbooks; start with shape guidance. |
| Add a new top-level `context/agents/` area | Deferred | Existing playbooks, patterns, and review layers can hold the guidance with less surface area. |
| Add orchestration tooling to this repo | Deferred | ADR 0002 still favors lightweight validation over heavy automation. |

## Design constraints for implementation

- Keep `agent-operable repository` tool-agnostic and define it in the glossary.
- Say `work contract` or `workflow contract` descriptively without making `WORKFLOW.md` a required file name.
- Keep execution plans as local task artifacts; do not treat them as ADRs or canonical context.
- Keep secrets, permissions, issue tracker APIs, app-server protocols, and dynamic tools at edges.
- Prefer small canonical additions over a new area or broad rewrites.

## Validation

Canonical changes were validated with:

```bash
nix shell nixpkgs#yq nixpkgs#ripgrep -c ./tooling/run-checks.sh
```

Result: passed.

Review applied:
- `context/review/01-quality-gates.md`: maps, manifests, ADR, and source-only boundaries were updated.
- `context/review/03-documentation-quality-checklist.md`: new docs stay scoped, summary-first, and within line budgets.
- `context/review/04-vocabulary-drift-checklist.md`: the new framework term `agent-operable repository` is defined in the glossary.

## Related docs

- `docs/research/source-review-workflow.md`
- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-inventory.md`
- `context/principles/01-information-architecture-and-manifests.md`
- `context/principles/05-errors-and-edge-responsibilities.md`
- `context/review/01-quality-gates.md`
