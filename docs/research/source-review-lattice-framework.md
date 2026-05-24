# Source Review: Lattice Framework

## Summary

- This source-only review evaluates `techygarg/lattice` as an installable operationalization of the Martin Fowler AI-collaboration pattern series.
- The strongest portable contribution is not the Claude/Cursor plugin surface, but the artifact system behind it: small composable skills, project standards, feature context, requirements, learnings, reviews, and architectural insights.
- Current canonical docs already cover progressive disclosure, repo-local knowledge, work contracts, validation ladders, edge adapters, proof of work, and feedback loops.
- Accepted response: small wording updates to existing agent-operability docs only; no skills pack, slash-command interface, `.lattice/` convention, or plugin/export mechanism is adopted.

## Trigger

A prior Martin Fowler agentic-pattern review treated Lattice as adjacent implementation evidence. This review looks at Lattice directly to decide whether its framework mechanics should change `design-context` guidance.

## Review window

- Reviewed on: 2026-05-24
- Repository: `https://github.com/techygarg/lattice`
- Reviewed commit: `9a0ac3e`
- Version metadata observed: `1.4.0`
- Local input: public repository cloned to `/tmp/design-context-research/lattice`
- Related source articles: `reduce-friction-ai` series pages converted to temporary Markdown for comparison

## Source registration

| Field | Value |
|---|---|
| Source id | `lattice-framework` |
| Title | Lattice |
| Author/origin | Rahul Garg / GitHub |
| Type | Repository / AI skill framework |
| Framework role | Calibrate artifact-backed AI collaboration workflows, standards elicitation, feature context persistence, pre-code design checkpoints, and feedback learning loops. |
| Status | source-only |
| Do not import | Claude/Cursor plugin metadata, slash-command names, `.lattice/` as a required directory, skill files as vendored content, opinionated Clean Architecture/DDD defaults, or long templates as canonical docs. |

## Areas reviewed

| Area | Portable relevance |
|---|---|
| `docs/how-it-works.md` | Atoms, molecules, refiners; static base framework plus living context layer. |
| `docs/origin.md` | Mapping from five collaboration patterns to framework artifacts. |
| `docs/framework-intelligence.md` | Two-pass generation/verification, multi-level review, learning flywheel, compliance phrasing. |
| `docs/collaborative-judgment.md` | Decide-vs-ask protocol for judgment calls and missing/conflicting grounding. |
| `docs/architecture-compass.md` | Brownfield architectural orientation before refactoring or feature execution. |
| `skills/atoms/*/SKILL.md` | Small guardrails, validation checklists, anti-pattern scans, ambiguity signals. |
| `skills/molecules/*/SKILL.md` | Requirement, design, implementation, refactor, bug-fix, review, and architecture-orientation workflows. |
| `skills/refiners/*/SKILL.md` | Guided interviews that produce project-owned standards. |
| plugin and install files | Tool packaging evidence only; not portable core policy. |

## Review claims

| Claim id | Claim | Current home | Classification | Response |
|---|---|---|---|---|
| `lat-1` | AI collaboration improves when project identity is a compact artifact naming stack versions, structure, trusted sources, conventions, and known anti-patterns. | `context/playbooks/11-agent-ready-repository-playbook.md` | partial gap | Add a compact orientation-artifact checklist. |
| `lat-2` | Non-trivial implementation work benefits from explicit pre-code checkpoints: scope/capabilities, responsibilities, interactions, contracts, then code. | `context/playbooks/11-agent-ready-repository-playbook.md`, `context/review/06-agent-operability-checklist.md` | partial gap | Add small design-checkpoint wording; do not add a new method template. |
| `lat-3` | Feature-level decision context should be distinct from project-wide standards and should record decisions, rationale, rejected alternatives, constraints, and open questions. | `context/playbooks/11-agent-ready-repository-playbook.md` | partial gap | Tighten execution-plan/context wording without prescribing `.lattice/context`. |
| `lat-4` | Standards can be elicited through guided interviews, but the durable artifact is the standards document, not the refiner command. | `context/playbooks/11-agent-ready-repository-playbook.md` | partial gap | Mention calibration interviews as one way to create standards. |
| `lat-5` | Generation and verification are more reliable as separate passes: produce the change, then check it against relevant standards and anti-patterns. | `context/review/06-agent-operability-checklist.md` | partial gap | Add verification-pass checklist wording. |
| `lat-6` | Repeated AI-session signal should be routed by type: context gaps, instruction gaps, workflow gaps, and failure/root-cause gaps. | `context/playbooks/11-agent-ready-repository-playbook.md`, `context/review/01-quality-gates.md` | partial gap | Add failure-feedback routing guidance. |
| `lat-7` | A decide-vs-ask protocol should distinguish grounded autonomy, genuine judgment calls, missing facts, and conflicting sources. | `context/patterns/04-agent-work-orchestration-patterns.md`, `context/review/06-agent-operability-checklist.md` | partial gap | Existing human handoff covers this; add only a checklist nudge. |
| `lat-8` | Brownfield architecture work needs orientation before action: scan, interview, agree current state, agree direction, then choose first moves. | `context/playbooks/11-agent-ready-repository-playbook.md`, architecture review docs | new gap / deferred | Good candidate for a future architecture-orientation playbook; defer until requested or field-tested. |
| `lat-9` | Skills, plugin manifests, marketplace packaging, and slash commands are useful distribution mechanisms but tool-specific. | `docs/adr/0002-lightweight-validation-before-agent-exports.md`, `docs/adr/0006-agent-operability-boundary.md` | covered | Keep deferred; no core-pack change. |
| `lat-10` | Large standards templates are useful examples but too verbose and opinionated for the reusable core. | `context/principles/06-deep-modules-and-information-hiding.md` | covered | Do not import templates. |

## Accepted canonical changes

| Target | Change |
|---|---|
| `context/playbooks/11-agent-ready-repository-playbook.md` | Add compact wording for project orientation artifacts, standards calibration interviews, feature-level decision context, design checkpoints, and feedback routing. |
| `context/review/06-agent-operability-checklist.md` | Add checklist items for orientation context, pre-code checkpoints, separate verification passes, and missing/conflicting grounding. |
| `docs/research/source-inventory.md` | Register `lattice-framework` as a source-only repository. |
| `docs/research/source-canonical-change-proposals.md` | Record the accepted Lattice-derived proposals. |

## Rejected or deferred

| Candidate | Decision | Reason |
|---|---|---|
| Add Lattice as a main design input in `README.md` | Rejected | It is valuable operational evidence, but less stable and more tool-facing than the current foundational sources. |
| Add a skills pack or copy `skills/**` | Rejected | Would create a parallel command interface and duplicate canonical guidance. |
| Adopt `.lattice/` as a recommended consumer convention | Rejected | Consumer repos should own their knowledge-store layout. |
| Add Claude/Cursor plugin metadata or installer support | Rejected | Tool-specific distribution remains deferred by ADR 0002 and ADR 0006. |
| Add a full design-first or architecture-compass template now | Deferred | Promising, but should be introduced only as compact playbook/pattern guidance after more field evidence. |
| Adopt Lattice's Clean Architecture, DDD, testing, or security defaults | Rejected | `design-context` stays language-agnostic and source-stack-neutral. |

## Review gates

- Quality gates: applies because small canonical wording changes are accepted.
- Documentation quality: applies to the new source note and source-inventory entry.
- Vocabulary drift: checked; no new framework-wide term is introduced.
- ADR impact: no ADR needed; the changes tighten existing agent-operability guidance without changing the tool boundary.

## Validation

Validated after edits with:

```bash
nix shell nixpkgs#yq nixpkgs#ripgrep nixpkgs#python3 -c ./tooling/run-checks.sh
```

Result: passed.

## Related docs

- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-review-workflow.md`
- `docs/research/source-inventory.md`
- `docs/research/source-review-martinfowler-agentic-patterns-2026.md`
- `context/playbooks/11-agent-ready-repository-playbook.md`
- `context/review/06-agent-operability-checklist.md`
- `docs/adr/0002-lightweight-validation-before-agent-exports.md`
- `docs/adr/0006-agent-operability-boundary.md`
