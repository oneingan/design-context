# ADR 0006: Agent Operability Boundary

- Status: Accepted
- Date: 2026-05-13

## Context

The repository already optimizes for agent consumption through progressive disclosure, maps, manifests, small canonical docs, and vendoring boundaries.

Recent field evidence from agent-first engineering workflows shows a related but distinct need: consumer repositories must also be operable by agents. Agents need repo-local knowledge, explicit work contracts, cheap validation, isolated workspaces, observable evidence, and clear handoff rules.

The risk is that adding this guidance could turn `design-context` into a manual for a specific runtime such as Codex, Symphony, Linear, Claude, GitHub Issues, or a particular app-server protocol.

## Decision

Add **agent-operability** guidance to the existing core layers, but do not create a new top-level area or adopt any vendor-specific orchestration stack.

The accepted canonical surface is:

1. one playbook for making a consumer repository agent-operable
2. one pattern document for agent work orchestration shapes
3. one review checklist for agent-operability audits
4. small glossary and principle/checklist wording updates
5. normal map and manifest entries

Keep source reviews, tool-specific implementation notes, long prompts, protocol details, and concrete orchestrator specs outside the vendored core pack unless a later ADR changes this boundary.

## Rationale

This preserves the repository's current strengths:

- language-agnostic guidance
- small, selectively loaded canonical docs
- clear source-only research boundary
- no duplicated export or orchestration implementation
- maps and manifests as the retrieval interface

Agent-operability belongs in the core because it affects whether vendored guidance can be applied successfully in real consumer repos. Specific tools do not belong in the core because they are edge adapters and change faster than the modeling guidance.

## Alternatives considered

### Keep all agent-operability guidance source-only

Rejected. The recurring guidance is portable enough to help consumers directly.

### Add a new `context/agents/` area

Deferred. The current layers can hold the guidance with lower retrieval and maintenance cost.

### Vendor or summarize Symphony's full specification

Rejected. It is valuable source material but too large and tool-specific for the core context pack.

### Add ready-made `WORKFLOW.md` or `PLANS.md` templates

Deferred. The framework should first document artifact shapes and review questions before shipping templates that could become stale hidden specifications.

## Consequences

### Positive

- consumer repos get guidance for applying the framework in agent-first workflows
- orchestration guidance stays portable across trackers, agents, and languages
- source-only research remains clearly separated from canonical guidance
- maps and manifests continue to provide progressive disclosure

### Negative

- the core grows by several docs
- maintainers must prevent tool-specific details from creeping into canonical text
- future template or tooling work will need another decision if it becomes justified

## Rules implied by this ADR

- use `agent-operable repository` as the framework-level term for this capability
- describe concrete tools as examples or edge adapters, not required core mechanisms
- keep long prompts, orchestration specs, and protocol details out of `context/**` by default
- prefer playbooks, patterns, and review checklists over implementation tutorials
- update maps and manifests when agent-operability docs change
- use source review before importing additional agent-workflow sources
- apply ADR 0007's alignment test when agent-operability guidance risks becoming a standalone AI-workflow framework
