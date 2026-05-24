# Agent Operability Checklist

## Summary

- Use this checklist to evaluate whether a repository is ready for agent work that applies the design core.
- Focus on discoverability, work contracts, validation, isolation, observability, and edge safety.
- A repo does not need full autonomy to be agent-operable.
- Findings should become docs, checks, schemas, or tooling when they recur.

## Use this when

- applying `design-context` to a consumer repository
- auditing a repo before autonomous or semi-autonomous agent work
- reviewing agent workflow failures
- deciding whether orchestration or background agent work is safe enough to try

## Severity guide

- **Critical**: allows unsafe work, hidden authority, secret leakage, or unrecoverable state changes
- **Major**: causes repeated agent confusion, poor evidence, or expensive human supervision
- **Minor**: weakens clarity but does not block safe use

## Checklist

### Entrypoints and retrieval

- [ ] `AGENTS.md` or equivalent is short and map-like
- [ ] project-specific docs and vendored `design-context` are easy to find
- [ ] a reader can identify the next two relevant files without broad loading
- [ ] source-only notes do not override canonical or project-owned guidance

### Repo-local knowledge

- [ ] durable workflow knowledge is versioned in the repo
- [ ] project orientation context names stack versions, structure, trusted sources, conventions, and known anti-patterns
- [ ] architecture or codemap docs explain where major responsibilities live
- [ ] domain vocabulary, boundaries, workflows, contracts, and edge responsibilities are discoverable when relevant
- [ ] ADRs or decision notes capture durable trade-offs
- [ ] stale docs have an owner, status, or cleanup path

### Work contract

- [ ] eligible, active, blocked, review, and terminal work states are defined
- [ ] handoff expectations for issues, branches, PRs, and comments are explicit
- [ ] agent-ready briefs describe behavior and acceptance criteria, not fragile implementation steps
- [ ] briefs include current behavior, desired behavior, scope boundaries, and expected evidence
- [ ] escalation rules distinguish missing permission, missing context, conflicting sources, and judgment calls
- [ ] long-running work has a plan, checkpoint, resumable state, or handoff artifact
- [ ] non-trivial implementation has pre-code checkpoints for capabilities, responsibilities, interactions, or contracts

### Validation and guardrails

- [ ] local validation commands are documented and runnable by agents
- [ ] checks are cheap enough to run during iteration
- [ ] failures produce actionable messages where practical
- [ ] generated code is checked in a separate verification pass against relevant standards and anti-patterns
- [ ] architecture, naming, schema, or lint invariants are enforced mechanically when they matter

### Guides, sensors, and harnessability

- [ ] repo-local guides steer agents before work: maps, specs, ADRs, examples, work contracts
- [ ] feedback sensors let agents self-correct: tests, linters, type checks, schema checks, structural rules, review packets
- [ ] cheap computational sensors are preferred for frequent checks
- [ ] inferential sensors are reserved for semantic review where cost, noise, and trust are acceptable
- [ ] code, docs, schemas, and examples are clear enough that agents do not rely only on prompt instructions

### Isolation and safety

- [ ] concurrent work has isolated workspaces or clear mutation boundaries
- [ ] agents that execute code have explicit filesystem, network, resource, and sandbox boundaries
- [ ] ports, databases, caches, logs, and temp files avoid cross-talk
- [ ] secrets and credentials are scoped and not copied into prompts or workspaces unnecessarily
- [ ] destructive operations have explicit approval, rollback, or recovery rules

### Observability and proof of work

- [ ] expected evidence is defined by task type
- [ ] bug fixes include reproduction-before and validation-after evidence when possible
- [ ] logs, metrics, screenshots, videos, traces, or PR notes are reachable to reviewers
- [ ] evidence is tied to the work item or PR rather than hidden in an agent session
- [ ] agent adoption metrics include acceptance, failed checks, rework, or review burden rather than throughput alone

### Edge adapters and operational failures

- [ ] issue trackers, agent runners, browser automation, and vendor APIs are treated as edge adapters
- [ ] simpler CLIs or scripts were considered before protocol-heavy adapters when governance does not require them
- [ ] retries, timeouts, cancellation, and stalled-run behavior are explicit for long-running work
- [ ] resumable state and idempotent recovery are defined where failed retries could duplicate work
- [ ] user-input or approval requests cannot leave background work stalled indefinitely
- [ ] vendor-specific failures are translated into stable operational categories before they shape core policy

### Continuous cleanup

- [ ] repeated agent mistakes are fed back into docs, checks, or tooling
- [ ] duplicated helpers and uneven patterns have a cleanup path
- [ ] temporary plans or workpads are retired, archived, or linked when complete

## Reporting pattern

For each issue, record:

- severity
- domain-design capability enabled or protected
- artifact or workflow path
- observed risk
- recommended fix
- whether the fix belongs in docs, checks, schemas, tooling, or human process

## Related docs

- `context/playbooks/11-agent-ready-repository-playbook.md`
- `context/patterns/04-agent-work-orchestration-patterns.md`
- `context/review/01-quality-gates.md`
- `context/review/03-documentation-quality-checklist.md`
- `docs/adr/0006-agent-operability-boundary.md`
- `docs/adr/0007-agent-enable-domain-design.md`
