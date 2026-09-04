# Agent-Ready Repository Playbook

## Summary

- Make the repository itself the agent's reliable source of truth for applying domain-design guidance.
- Keep agent entrypoints short and map-like; put detail in discoverable docs.
- Provide explicit work and interaction contracts, cheap validation, isolated workspaces, and observable evidence.
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

Document how work moves through the repo's normal lifecycle. State:
- eligibility and work-state meanings
- when to stop, retry, or escalate and who has authority
- how plans, branches, PRs, comments, and handoffs are updated
- evidence required before review or merge

For delegable work, give the agent a behavioral, durable brief with:
- current behavior and desired outcome
- key interfaces, contracts, or invariants
- acceptance criteria and explicit out-of-scope boundaries
- expected validation evidence

Avoid fragile line numbers, paths, or prescribed implementation steps unless they are part of the contract. Keep this policy in `WORKFLOW.md`, project docs, issue templates, or another repo-owned artifact.

### 4. Charter focused interactions and mode changes

Before a focused interaction, record an **interaction charter**:
- **Scope** — the question or outcome and what is out of scope
- **Vocabulary** — relevant domain terms and explicit translations
- **Mode** — one current mode from the table below
- **Constraints** — accepted decisions, precedence, budgets, and safety limits
- **Expected handoff** — conclusions, evidence, recipient, or next mode

| Mode | Work allowed |
|---|---|
| `explore` | gather evidence, assumptions, and unknowns; do not select a solution |
| `brainstorm` | generate labeled alternatives and counterexamples; do not imply acceptance |
| `decide` | compare trade-offs and record the accountable human's selection or unresolved choice |
| `implement` | apply accepted decisions and verify them; reopen only on a concrete contradiction |

Modes control an interaction, not decision authority or domain state. At a pivot, end the old mode and begin the next from the handoff. Start a clean interaction whenever prior context contains alternatives or noise irrelevant to the new mode.

Use a **carry-only-conclusions handoff**: transfer accepted decisions and rationale, active constraints, relevant evidence, open questions and decision owners, and the next expected mode or output. Leave behind transcript, discarded alternatives, and speculative notes unless needed to understand an accepted decision.

If the model or a consequential trade-off remains open, do not enter `implement` or guess; ask the accountable human. A charter does not replace an agent-ready brief, execution plan, or ADR, and an interaction or session is never a bounded context merely because it has a scope.

### 5. Use execution plans for large or ambiguous work

For multi-hour tasks, migrations, or risky refactors, use a living execution plan. Record:
- purpose, observable outcome, and progress
- accepted decisions and rationale; rejected alternatives only when they matter
- task-specific constraints, open questions, and discoveries
- validation and acceptance
- recovery or resume notes

Treat plans as task artifacts, not canonical framework docs.

### 6. Decompose into independently testable slices

When the work is larger than one small change, split it into slices that can be validated independently.

Before non-trivial implementation, record lightweight design checkpoints: expected capabilities, responsibilities, interactions, and contracts. Do not let first generated code be the first place design decisions appear.

Prefer:
- one user-visible or workflow-visible outcome per slice
- foundational work separated only when it unlocks several slices
- explicit checkpoints before moving to the next slice
- parallel work only when files, state, and dependencies do not overlap

### 7. Provide cheap, repeatable validation

Give agents a small validation ladder:
1. targeted check for the changed area
2. broader local gate before handoff
3. CI or release gate when relevant

Make checks fast and failures actionable. Use a separate verification pass against relevant standards and anti-patterns before handing off generated code.

Guides such as maps, specs, ADRs, examples, and work contracts steer before action. Sensors such as tests, linters, type or schema checks, structural rules, and review packets enable correction afterward. Prefer cheap computational sensors for frequent checks and reserve inferential sensors for semantic review where their cost, noise, and trust fit.

Improve harnessability through clear module boundaries, schemas, constraints, examples, and errors rather than prompt text alone.

### 8. Isolate concurrent work

For concurrent or long-running work, isolate workspaces, ports, databases, caches, logs, temporary files, credentials, and permission scopes. Agents should not guess which shared resource is safe to mutate.

### 9. Make evidence legible

Define proof by task type, not tool fashion. Use relevant test, lint, or typecheck output; UI captures; logs, metrics, or traces; and review packets. For bugs, include reproduction-before and validation-after evidence when possible.

### 10. Keep edge adapters explicit

Issue trackers, agent runners, app servers, browser automation, cloud APIs, and secrets are edge concerns. Document:
- credential sources and scopes
- filesystem, network, resource, and sandbox boundaries
- allowed commands, tools, or protocol adapters
- retry, timeout, cancellation, and escalation behavior

Prefer direct CLIs or scripts with clear help, structured output, and predictable errors before protocol-heavy adapters. Do not let a provider or protocol become the core workflow model.

### 11. Feed learning back and clean up

When an agent repeatedly fails, do not add only prompt admonitions. Route context gaps to orientation docs, instruction gaps to standards or work contracts, workflow gaps to playbooks, and recurring failures to checks or anti-patterns.

Promote lessons into clearer docs or maps, stricter schemas or state tables, actionable validation, tests, smaller modules, or clearer names. Schedule lightweight review of stale docs, duplicated helpers, uneven quality, and obsolete plans or temporary notes.

## Output shape

```text
Agent-operability note
Design capability enabled: <domain modeling | boundaries | workflows | contracts | persistence edges | review | evolution>
Entrypoint: <path>
Knowledge map: <path>
Work contract: <path or missing>
Interaction charter: <scope, vocabulary, mode, constraints, expected handoff>
Mode handoff: <decisions and rationale, constraints, evidence, open questions, next mode>
Validation ladder: <commands>
Isolation story: <workspace/resource rules>
Agent-ready brief: <current behavior, desired behavior, acceptance criteria, out of scope>
Evidence required: <proof surfaces>
Escalation rules: <when humans are needed>
Open gaps: <missing docs/checks/tools>
```

## Review questions

- Which domain-design capability does this agent-operability work enable?
- Can an agent find the right starting docs in under two hops?
- Is the work lifecycle documented in repo-local terms?
- Are agent-ready briefs behavioral, scoped, and independently verifiable?
- Does each focused interaction declare one mode without treating its scope as a bounded context?
- Do pivots carry decisions, rationale, constraints, evidence, and open questions rather than the transcript?
- Does unresolved model or trade-off authority remain with an accountable human?
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
