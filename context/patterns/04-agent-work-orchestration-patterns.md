# Agent Work Orchestration Patterns

## Summary

- Agent work becomes safer when work state, isolation, runner protocols, and proof surfaces are explicit.
- These patterns describe reusable orchestration shapes without prescribing a tracker, model, or runtime.
- Use them to compare how a repo should coordinate autonomous or semi-autonomous design and implementation work.
- Keep orchestration policy in repo-owned artifacts and tool integrations at the edges.

## Load this when

- designing issue-driven or task-driven agent workflows
- comparing orchestrator, runner, and workspace responsibilities
- deciding how much autonomy a repo can safely support
- reviewing whether an agent workflow has clear states, evidence, and recovery paths

## Pattern 1: Work Item as Control Plane

### Use when

A team wants to manage deliverables instead of supervising individual agent sessions.

### Shape

- represent work as an issue, ticket, task, or local board item
- define eligible, active, blocked, review, and terminal states
- let state and blockers decide dispatch or handoff
- attach an agent-ready brief when a work item becomes delegable
- keep PRs, branches, comments, and evidence attached to the work item

### Benefits

- humans manage work at the level of outcomes
- agents can resume or hand off without hidden chat context
- durable briefs reduce dependency on stale chat history

### Risks

- vague states create accidental autonomy
- briefs that prescribe steps instead of behavior can become stale quickly
- tracker-specific labels can become hidden domain language

## Pattern 2: Isolated Workspace per Work Item

### Use when

Multiple agents or long-running tasks may execute concurrently.

### Shape

- allocate one filesystem workspace per work item
- keep commands, logs, caches, and temporary files scoped to that workspace
- make shared resources configurable or uniquely assigned
- clean up terminal workspaces deliberately

### Benefits

- reduces cross-talk between agents
- makes reproduction and evidence easier to inspect

### Risks

- setup latency can discourage use if workspace bootstrap is slow
- secrets and shared services still need explicit boundaries

## Pattern 3: Runner Adapter

### Use when

The workflow should survive changing agent runtimes, CLIs, or app servers.

### Shape

- define the smallest runner contract needed, such as start, send work, stream events, stop
- prefer direct CLIs or scripts before protocol adapters when they provide enough structure
- normalize runtime events before they affect orchestration state
- keep approvals, sandboxing, tokens, and protocol details inside the adapter

### Benefits

- keeps core workflow independent of a specific agent provider
- makes testing and fallback runners possible

### Risks

- leaky abstractions if runtime-specific states become workflow states
- under-specified adapters can stall on approvals or user-input requests

## Pattern 4: Repository-Owned Work Contract

### Use when

Agents must follow a team workflow that was previously implicit.

### Shape

- write the work policy in a versioned repo artifact
- include state meanings, required checks, handoff rules, and escalation rules
- keep the artifact short enough to load with task context
- split detailed skills or commands into focused docs

### Benefits

- turns tribal workflow into reviewable context
- lets process changes version with code

### Risks

- a giant workflow prompt becomes another monolithic manual
- stale policy can be worse than no policy

## Pattern 5: Proof-of-Work Packet

### Use when

Reviewers need confidence without replaying the entire agent session.

### Shape

- require evidence appropriate to the change
- attach or link tests, logs, screenshots, metrics, traces, or PR review notes
- include reproduction-before and validation-after evidence when fixing bugs
- keep evidence tied to the work item or PR

### Benefits

- reduces human review cost
- makes success observable rather than asserted

### Risks

- evidence can become performative if acceptance criteria are vague
- large artifacts need retention and privacy rules

## Pattern 6: Continuation and Recovery Loop

### Use when

Agent work may take many turns, stall, fail, or need retries.

### Shape

- distinguish normal continuation from failure retry
- define stall, timeout, blocked, cancelled, and terminal outcomes
- use bounded retries or explicit human handoff
- preserve resumable state, decisions, validation evidence, and recovery notes

### Benefits

- avoids silent partial work
- makes operational failures visible without polluting the domain model

### Risks

- unbounded retries can waste resources
- retrying without better context repeats the same failure

## Pattern 7: Human Judgment Handoff

### Use when

Most implementation work can run autonomously but some decisions require humans.

### Shape

- define which blockers require human judgment, credentials, or product intent
- require a concise blocker brief and evidence
- stop or pause rather than guessing across irreversible boundaries

### Benefits

- preserves human attention for high-leverage decisions
- prevents agents from overstepping ambiguous authority

### Risks

- too many handoffs recreate micromanagement
- too few handoffs can create unsafe autonomy

## Pattern 8: Independently Testable Slice

### Use when

A work item is large enough that one agent run or one PR may hide unfinished behavior.

### Shape

- split work by observable user, workflow, or integration outcome
- keep each slice independently testable where possible
- separate foundation work only when it unlocks multiple slices
- mark parallel slices only when they do not share files, state, or ordering dependencies
- validate at checkpoints before expanding scope

### Benefits

- makes progress reviewable
- reduces half-finished agent work
- supports safe parallelization

### Risks

- artificial slices can add coordination overhead
- premature foundation work can become speculative architecture

## Related docs

- `context/playbooks/11-agent-ready-repository-playbook.md`
- `context/patterns/02-workflow-and-state-transition-patterns.md`
- `context/principles/04-workflows-invariants-and-state.md`
- `context/principles/05-errors-and-edge-responsibilities.md`
- `context/review/06-agent-operability-checklist.md`
- `docs/adr/0007-agent-enable-domain-design.md`
