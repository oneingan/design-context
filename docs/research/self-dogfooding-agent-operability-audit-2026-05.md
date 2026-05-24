# Self-Dogfooding Agent-Operability Audit 2026-05

## Summary

- This source-only audit applies the repository's own agent-operability guidance to `design-context` itself.
- The repo already has strong retrieval guides: `AGENTS.md`, maps, manifests, ADRs, contribution docs, and lightweight validation.
- The main gaps are sensor coverage and proof-of-work evidence, not more canonical theory.
- Accepted response: add lightweight checks for map/manifest coverage and internal markdown links, and make PR evidence expectations explicit.

## Scope

Reviewed on: 2026-05-24

Primary guidance used:

- [Agent-Ready Repository Playbook](../../context/playbooks/11-agent-ready-repository-playbook.md)
- [Agent Work Orchestration Patterns](../../context/patterns/04-agent-work-orchestration-patterns.md)
- [Agent Operability Checklist](../../context/review/06-agent-operability-checklist.md)
- [Quality Gates](../../context/review/01-quality-gates.md)
- [Tooling Evaluation](../../tooling/tooling-evaluation.md)

Out of scope:

- changing the vendored core boundary
- adding skills, SPDD templates, or tool-specific workflow protocols
- reorganizing the repository around Diátaxis categories

## Current harness shape

| Surface | Current artifact | Assessment |
|---|---|---|
| Entrypoint guide | [AGENTS.md](../../AGENTS.md) | Strong: short and map-like. |
| Contributor guide | [CONTRIBUTING.md](../../CONTRIBUTING.md) | Good: contribution types and checks are explicit. |
| Retrieval map | [context/00-map.md](../../context/00-map.md) | Strong: task-based progressive disclosure. |
| Retrieval metadata | [project-manifest.yaml](../../context/manifests/project-manifest.yaml) | Strong: central canonical inventory. |
| Validation ladder | [tooling/run-checks.sh](../../tooling/run-checks.sh) | Good, but missing structural coverage checks. |
| PR evidence | [pull_request_template.md](../../.github/pull_request_template.md) | Thin: has checkboxes but little proof-of-work structure. |

## Findings

| Severity | Finding | Risk | Recommended fix | Accepted response |
|---|---|---|---|---|
| Major | Map/manifest consistency is mostly reviewed by convention. | A canonical doc can become hard to retrieve even when YAML remains valid. | Add a computational sensor for area maps, manifests, project inventory, and `next_reads` paths. | Add `tooling/check-map-manifest-coverage.sh`. |
| Major | Internal markdown links are not checked. | Refactors can leave broken links in source-only or process docs. | Add a cheap internal markdown link checker. | Add `tooling/check-internal-links.sh`. |
| Minor | PR evidence expectations are implicit. | Reviewers must infer what validation or source-boundary evidence was produced. | Turn the PR template into a small proof-of-work packet. | Update `.github/pull_request_template.md`. |
| Minor | The live validation command changes when new sensors are added. | Agents may run stale commands from process docs. | Update current process/tooling docs and CI together. | Update tooling docs, contribution docs, maintenance notes, and CI. |

## Dogfooding decisions

- Keep this audit source-only; it records evidence but does not become canonical policy.
- Improve sensors before adding more guidance text.
- Keep new tooling lightweight, local, and aligned with `tooling/run-checks.sh`.
- Treat PR evidence as a review packet, not a long workflow manual.
- No ADR is needed because this tightens existing tooling and process expectations without changing the core boundary.

## Follow-up watchlist

- If link or coverage failures recur, improve failure messages before adding broader linting.
- If PR evidence becomes noisy, move details to `CONTRIBUTING.md` and keep the template compact.
- If retrieval smoke tests become repeatable, consider a separate lightweight sensor rather than a smart retrieval engine.

## Related docs

- [Source Review: Martin Fowler Agentic Patterns 2026](source-review-martinfowler-agentic-patterns-2026.md)
- [Tooling Evaluation](../../tooling/tooling-evaluation.md)
