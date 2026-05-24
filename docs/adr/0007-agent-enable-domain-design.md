# ADR 0007: Agent Enablement Serves Domain Design

- Status: Accepted
- Date: 2026-05-24

## Context

The repository has a stable design core shaped by _Domain Modeling Made Functional_, _A Philosophy of Software Design_, and the upstream `tenets` inspiration.

Recent source reviews added useful agent-operability refinements: guides, sensors, harnessability, sandboxing, resumable work, orientation artifacts, design checkpoints, and verification passes.

Those refinements are valuable, but they create a risk: `design-context` could look like two unrelated frameworks, one for domain design and one for generic AI-agent operations.

## Decision

Treat agent-operability as an **agent enablement layer** for the domain-design core, not as a second independent core.

Agent guidance is in scope when it improves an agent's or team's ability to discover, express, validate, or evolve:

- domain models and ubiquitous language
- bounded contexts and seams
- workflows, invariants, and state transitions
- business events and cross-context contracts
- trusted representations and persistence-at-the-edge responsibilities
- review, validation, and evolution of those design artifacts

Agent guidance may refine how the framework is consumed and applied. It must not redefine the framework's design ontology unless a later ADR deliberately changes the foundation.

Use this source hierarchy:

1. **Foundational sources** define core concepts and design priorities.
2. **Calibration sources** may sharpen existing guidance or reveal small gaps.
3. **Tool-specific edge sources** remain source-only, deferred, or adapter-specific unless promoted by ADR.

## Rationale

This keeps the repository coherent:

- _Domain Modeling Made Functional_ and _A Philosophy of Software Design_ guidance remains the center of gravity.
- Agent-operability explains how agents can apply that guidance reliably in real repositories.
- Tooling trends, skills, prompts, protocols, and plugins stay subordinate to durable design outcomes.
- Future source ingestion has an explicit alignment test before adding more AI-workflow material.

## Alternatives considered

### Keep agent-operability as a generic second core

Rejected. It would make the repository broader but less distinctive, and it would weaken the domain-modeling and software-design focus.

### Move all agent-operability guidance out of the core pack

Rejected. Consumer repos need enough agent-operability guidance to apply the framework safely.

### Split into two repositories now

Deferred. The current material can remain in one repo if the dependency direction is explicit: agent enablement serves domain design.

## Consequences

### Positive

- clearer hierarchy between design principles and agent workflow mechanics
- safer future source ingestion from AI-agent frameworks and tooling sources
- less risk that skills, prompts, sensors, or protocols become hidden design concepts
- easier review of whether new agent guidance belongs in `context/**`

### Negative

- contributors must state the design capability enabled by agent-operability changes
- some generally useful AI-workflow advice will remain out of scope
- future tool or template work may require another ADR before entering the core pack

## Rules implied by this ADR

- agent-operability docs should stay tied to domain modeling, boundaries, workflows, contracts, persistence, review, or evolution
- source reviews of agentic or tooling sources must name the domain-design capability they improve
- if a calibration source conflicts with foundational design guidance, prefer the foundation or write an ADR
- do not add tool-specific skills, prompts, protocols, commands, or marketplace packaging to the core by default
- keep guides, sensors, and harnesses as mechanisms for applying design guidance, not as standalone design goals

## Related docs

- `docs/adr/0006-agent-operability-boundary.md`
- `context/glossary/01-framework-glossary.md`
- `context/playbooks/11-agent-ready-repository-playbook.md`
- `context/patterns/04-agent-work-orchestration-patterns.md`
- `context/review/06-agent-operability-checklist.md`
