# Agent-Ready Repository Playbook

## Summary

- Make the repository itself the agent's reliable source of truth for applying domain-design guidance.
- Keep agent entrypoints short and map-like; put detail in discoverable docs.
- Provide explicit work contracts, cheap validation, isolated workspaces, and observable evidence.
- Convert repeated agent failures into docs, schemas, checks, or tooling.
- Keep vendor tools, secrets, permissions, and runtime protocols at the edges.

## Use this when

- preparing a consumer repo to use this framework
- improving a repo where agents miss context, break conventions, or need frequent steering
- designing autonomous or semi-autonomous issue/PR workflows that support design and implementation work
- reviewing whether a repo can support concurrent agent work safely

## Inputs

- consumer repo `AGENTS.md` or equivalent agent entrypoint
- docs or knowledge-store layout
- local validation commands and CI gates
- issue/PR workflow expectations
- known logs, metrics, screenshots, or proof-of-work surfaces
- secrets, permissions, and external integration boundaries

## Steps

### 1. Make the entrypoint a map, not a manual

Keep `AGENTS.md` short. It should tell the agent:

- where project-specific docs live
- where vendored `design-context` lives
- which validation commands matter
- what not to read by default

If it grows into a handbook, split detail into focused docs and link to them.

### 2. Put required knowledge in repo-local artifacts

Move durable guidance out of chat, oral history, and private memory into versioned files.

Prefer:
- `docs/00-map.md` or equivalent knowledge-store map
- project orientation notes with stack versions, structure, trusted sources, conventions, and known anti-patterns
- architecture or codemap docs for physical orientation
- ADRs for durable trade-offs
- small task-specific guides for recurring workflows

If standards live mostly in senior engineers' heads, use a short calibration interview to turn them into repo-owned artifacts.

### 3. Define the work contract

Document how work moves through the repo's normal lifecycle.

A work contract should answer:
- what work items are eligible to start?
- what states or labels mean?
- when should an agent stop, retry, or escalate?
- how are plans, branches, PRs, comments, and handoffs updated?
- what evidence is required before review or merge?

For delegable work, define what an agent-ready brief contains:
- current behavior or starting point
- desired behavior or outcome
- key interfaces, contracts, or invariants to respect
- concrete acceptance criteria
- explicit out-of-scope boundaries
- expected validation evidence

Keep briefs behavioral and durable. Avoid line numbers, fragile file paths, and step-by-step implementation instructions unless they are truly part of the contract.

This may live in `WORKFLOW.md`, project docs, issue templates, or another repo-owned artifact.

### 4. Use execution plans for large or ambiguous work

For multi-hour tasks, migrations, or risky refactors, use a living execution plan.

A good plan records:
- purpose and observable outcome
- progress
- decisions and rationale, including rejected alternatives when they matter
- feature-specific constraints and open questions distinct from project-wide standards
- surprises or discoveries
- validation and acceptance
- recovery or resume notes

Treat execution plans as task artifacts, not canonical framework docs.

### 5. Decompose into independently testable slices

When the work is larger than one small change, split it into slices that can be validated independently.

Before non-trivial implementation, record lightweight design checkpoints: expected capabilities, responsibilities, interactions, and contracts. Do not let first generated code be the first place design decisions appear.

Prefer:
- one user-visible or workflow-visible outcome per slice
- foundational work separated only when it unlocks several slices
- explicit checkpoints before moving to the next slice
- parallel work only when files, state, and dependencies do not overlap

### 6. Provide cheap, repeatable validation

Give agents a small validation ladder:

1. targeted check for the changed area
2. broader local gate before handoff
3. CI or release gate when relevant

Checks should be fast enough to run often and should fail with actionable remediation where practical.

For generated code, prefer a separate verification pass against relevant standards and anti-patterns before handoff.

Treat the repo's agent harness as support for design and implementation work through guides and sensors:
- guides steer agents before work, such as maps, specs, ADRs, examples, and work contracts
- sensors let agents correct after action, such as tests, linters, type checks, schema checks, structural rules, and review packets
- prefer computational sensors for frequent checks; reserve inferential sensors for semantic review where cost, noise, and trust are acceptable
- improve harnessability by making module boundaries, schemas, architectural constraints, examples, and errors clear without relying only on prompt text

### 7. Isolate concurrent work

If multiple agents or long-running tasks may run at once, define isolation for:

- filesystem workspaces or worktrees
- ports
- databases and caches
- logs and temporary files
- credentials and permission scopes

Agents should not need to guess which shared resource is safe to mutate.

### 8. Make evidence legible

Define what proof of work looks like for the repo.

Examples:
- test output
- lint or typecheck output
- screenshots or videos for UI behavior
- logs, metrics, traces, or dashboards
- PR comments or review packets
- reproduction-before and validation-after notes

Choose evidence by task type, not by tool fashion.

### 9. Keep edge adapters explicit

Issue trackers, agent runners, app servers, browser automation, cloud APIs, and secrets are edge concerns.

Document:
- where credentials come from and how they are scoped
- filesystem, network, resource, and sandbox boundaries when agents run code
- which commands, tools, or protocol adapters are allowed
- how operational failures are retried, timed out, or escalated

Prefer direct CLIs or scripts with clear help, structured output, and predictable errors before adding protocol-heavy adapters. Do not let a vendor protocol become the core workflow model.

### 10. Feed failures back into the repo

When an agent repeatedly fails, avoid only adding prompt admonitions.

Route the lesson by root cause: context gaps to orientation docs, instruction gaps to standards or work contracts, workflow gaps to playbooks, and recurring failures to checks or anti-patterns.

Prefer promoting the lesson into:
- clearer docs or maps
- stricter schemas or state tables
- better validation messages
- linters or tests
- smaller modules or clearer names

### 11. Schedule cleanup

Agent-generated work can amplify uneven patterns. Add a lightweight cadence for:

- stale-doc review
- duplicated helper cleanup
- quality grade or checklist review
- retiring obsolete plans and temporary notes

## Output shape

```text
Agent-operability note
Entrypoint: <path>
Knowledge map: <path>
Work contract: <path or missing>
Validation ladder: <commands>
Isolation story: <workspace/resource rules>
Agent-ready brief: <current behavior, desired behavior, acceptance criteria, out of scope>
Evidence required: <proof surfaces>
Escalation rules: <when humans are needed>
Open gaps: <missing docs/checks/tools>
```

## Review questions

- Can an agent find the right starting docs in under two hops?
- Is the work lifecycle documented in repo-local terms?
- Are agent-ready briefs behavioral, scoped, and independently verifiable?
- Are validation and evidence requirements explicit?
- Is larger work split into independently testable slices where possible?
- Can concurrent agent work run without resource cross-talk?
- Are secrets, permissions, and vendor protocols kept at the edge?
- Are repeated failures converted into durable repo improvements?

## Related docs

- `context/principles/01-information-architecture-and-manifests.md`
- `context/principles/05-errors-and-edge-responsibilities.md`
- `context/principles/06-deep-modules-and-information-hiding.md`
- `context/patterns/04-agent-work-orchestration-patterns.md`
- `context/review/06-agent-operability-checklist.md`
- `docs/adr/0006-agent-operability-boundary.md`
- `docs/adr/0007-agent-enable-domain-design.md`
