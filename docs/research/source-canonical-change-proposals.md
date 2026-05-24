# Source-Derived Canonical Change Proposals

## Summary

- This note records minimal canonical updates derived from source-ingestion passes.
- The first dry run used APOSD naming, deep-module, and rationale guidance.
- The deep-dive pass resolved APOSD and DMMF partial gaps with small canonical edits.
- The DMMF external-source pass added small business-outcome and collaborative-event refinements.
- The Martin Fowler 2026 agentic-pattern pass added small harness, elicitation, ADR-lifecycle, and semantic-diffusion refinements.
- The Thoughtworks Radar Vol. 34 pass added small distribution, sandboxing, durability, edge-adapter, and collaboration-metric refinements.
- Changes were intentionally small and applied to existing canonical docs.
- No new canonical files, maps, or manifests were needed.

## Inputs

- `docs/research/source-gap-analysis-dry-run.md`
- `docs/research/source-gap-analysis-deep-dive.md`
- `docs/research/source-review-dmmf-external-sources.md`
- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-reading-map.md`
- `docs/research/source-review-thoughtworks-tech-radar-vol34.md`

## Accepted changes

| Proposal id | Source claim | Target | Change | Risk | Review |
|---|---|---|---|---|---|
| `src-prop-001` | Names lose precision when they carry words that add no meaning. | `context/glossary/02-naming-and-term-introduction.md` | Added an anti-pattern for extra words that do not clarify concept or scope. | Low | Vocabulary drift checklist applies; no new term introduced. |
| `src-prop-002` | Rationale should shape detail before the document accretes implementation or prose. | `context/review/03-documentation-quality-checklist.md` | Added a purpose/scope check that intended impact is clear before detail is added. | Low | Documentation quality checklist owns this concern. |
| `src-prop-003` | Source-only notes can become misleading if they silently outrank canonical docs. | `context/review/01-quality-gates.md` | Added a canonical-clarity gate that source-only notes must not become hidden specifications. | Low | Quality gates own canonical-vs-supporting precedence. |
| `src-prop-004` | Context boundaries should also account for business importance and investment depth. | `context/glossary/01-framework-glossary.md`; `context/principles/03-bounded-contexts-and-boundaries.md`; `context/playbooks/02-bounded-context-definition-playbook.md`; `context/review/02-architecture-review-checklist.md` | Defined strategic role and added guidance for core, supporting, or generic capability classification when relevant. | Low | Vocabulary drift risk is controlled by the glossary entry and optional scope. |
| `src-prop-005` | Quantities can carry units, ranges, precision, or currency meaning that raw numbers erase. | `context/principles/07-type-shaped-models-and-illegal-states.md`; `context/playbooks/05-trusted-and-untrusted-representations-playbook.md`; `context/review/02-architecture-review-checklist.md` | Added unit and measurement prompts to trusted representation guidance. | Low | Architecture review now checks the concern when relevant. |
| `src-prop-006` | Split/join heuristics apply to documents and modules, not only bounded contexts. | `context/patterns/01-boundary-and-decomposition-patterns.md`; `context/review/02-architecture-review-checklist.md` | Added a language-neutral split/join decomposition pattern and review prompt. | Low | Deep module guidance remains the conceptual home; the pattern gives an actionable heuristic. |
| `src-prop-007` | Domain modeling should stay anchored to business/customer outcomes, not just model shape. | `context/playbooks/01-domain-modeling-playbook.md` | Added outcome and decision-pressure prompts to the modeling scope and inputs. | Low | Tightens an existing playbook; no new canonical concept. |
| `src-prop-008` | Event discovery is strongest when it is collaborative across upstream and downstream roles. | `context/playbooks/08-business-event-discovery-and-event-catalog-playbook.md` | Added cross-role/silo discovery guidance and made disagreement a first-class finding. | Low | Event catalog checklist already owns downstream artifact review. |
| `src-prop-009` | Agent harness guidance is clearer when guides, sensors, and harnessability are explicit. | `context/glossary/01-framework-glossary.md`; `context/playbooks/11-agent-ready-repository-playbook.md`; `context/review/06-agent-operability-checklist.md` | Added compact guide/sensor and harnessability wording. | Low | Agent-operability boundary keeps tool-specific harnesses out of core. |
| `src-prop-010` | Expert-held domain knowledge can be elicited by an interrogatory LLM before modeling. | `context/playbooks/01-domain-modeling-playbook.md` | Added one-question-at-a-time expert elicitation guidance. | Low | Domain modeling playbook owns early context capture. |
| `src-prop-011` | ADRs for broad-impact decisions should record advice, confidence, revisit triggers, and supersede rather than rewrite accepted records. | `context/playbooks/04-adr-writing-playbook.md` | Added compact advice and lifecycle guidance. | Low | ADR playbook remains the canonical home. |
| `src-prop-012` | Fashionable AI terms are vulnerable to semantic diffusion. | `context/review/04-vocabulary-drift-checklist.md` | Added semantic-diffusion checks and prompts. | Low | Vocabulary drift checklist owns term ambiguity review. |
| `src-prop-013` | Shared agent instructions can be distributed through templates or reference applications without making local overrides canonical. | `VENDORING.md` | Added compact distribution guidance for templates and reference apps. | Low | Distribution boundary remains unchanged. |
| `src-prop-014` | Agents that execute code need explicit filesystem, network, resource, and credential boundaries. | `context/playbooks/11-agent-ready-repository-playbook.md`; `context/review/06-agent-operability-checklist.md` | Added sandbox and permission-boundary wording. | Low | Agent-operability checklist owns review. |
| `src-prop-015` | Long-running agent workflows need durable restart, cancellation, and recovery state. | `context/patterns/04-agent-work-orchestration-patterns.md`; `context/review/06-agent-operability-checklist.md` | Tightened continuation and recovery guidance. | Low | No new workflow pattern required. |
| `src-prop-016` | Protocol-heavy adapters should not be default when direct CLIs or scripts provide enough structure and fidelity. | `context/playbooks/11-agent-ready-repository-playbook.md`; `context/patterns/04-agent-work-orchestration-patterns.md`; `context/review/06-agent-operability-checklist.md` | Added an edge-adapter heuristic. | Low | Tool-specific protocols remain edge concerns. |
| `src-prop-017` | Coding-agent success should be evaluated by collaboration quality, not throughput alone. | `context/review/06-agent-operability-checklist.md` | Added checks for acceptance, failed checks, rework, and review burden. | Low | Avoids adding a metrics framework to core. |

## Rejected or deferred changes

| Candidate | Decision | Reason |
|---|---|---|
| Add a new canonical source-ingestion playbook | Rejected | Source ingestion is source-repo maintenance, not part of the vendored core pack. |
| Add a full research freshness linter | Deferred | Wait for repeated drift before adding tooling. |
| Add APOSD-specific references to canonical docs | Rejected | Canonical docs should stand without source-only background. |
| Add DMMF-specific implementation mechanics to canonical docs | Rejected | Canonical docs should keep the modeling move while remaining language-neutral. |
| Add external DMMF review excerpts to canonical docs | Rejected | Reviews are second-order evidence; canonical docs should contain only the portable reviewed claims. |
| Add Thoughtworks Radar as a main design input | Rejected | The Radar is valuable calibration evidence but too time-sensitive to become a stable foundation. |
| Add skills, MCP, SPDD, or context-graph templates to core | Rejected/deferred | These remain tool- or method-specific edge concerns until repeated field evidence justifies an ADR. |

## Manifest impact

None. Existing canonical docs were updated in place and no canonical files were added, removed, or renamed.

## ADR impact

No ADR needed. The changes do not alter repository structure, naming policy, vendoring policy, or review policy meaning; they tighten existing modeling, review, and naming guidance.

## Related docs

- `context/glossary/02-naming-and-term-introduction.md`
- `context/review/01-quality-gates.md`
- `context/review/03-documentation-quality-checklist.md`
