# Source-Derived Canonical Change Proposals

## Summary

- This note records minimal canonical updates derived from source-ingestion passes.
- The first dry run used APOSD naming, deep-module, and rationale guidance.
- The deep-dive pass resolved APOSD and DMMF partial gaps with small canonical edits.
- The DMMF external-source pass added small business-outcome and collaborative-event refinements.
- The Martin Fowler 2026 agentic-pattern pass added small harness, elicitation, ADR-lifecycle, and semantic-diffusion refinements.
- The Thoughtworks Radar Vol. 34 pass added small distribution, sandboxing, durability, edge-adapter, and collaboration-metric refinements.
- The Lattice framework pass added small orientation, design-checkpoint, verification-pass, and feedback-routing refinements.
- The DDD Europe 2026 pass added explicit domain-model ontology, collaborative discovery, honest map views, probabilistic seams, interaction pivots, distributed uncertainty, and claim-shaped evidence.
- Changes were intentionally small and applied to existing canonical docs.
- No new canonical files, maps, or manifests were needed.

## Inputs

- `docs/research/source-gap-analysis-dry-run.md`
- `docs/research/source-gap-analysis-deep-dive.md`
- `docs/research/source-review-dmmf-external-sources.md`
- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-reading-map.md`
- `docs/research/source-review-thoughtworks-tech-radar-vol34.md`
- `docs/research/source-review-lattice-framework.md`
- `docs/research/source-review-ddd-europe-2026.md`
- `docs/research/v0.6.0-implementation-brief.md`
- `docs/research/v0.6.0-behavioral-baseline.md`

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
| `src-prop-018` | Agent-ready repos need compact project orientation artifacts before tool-specific skills help. | `context/playbooks/11-agent-ready-repository-playbook.md`; `context/review/06-agent-operability-checklist.md` | Added orientation-artifact checks for stack, structure, trusted sources, conventions, and anti-patterns. | Low | Keeps project knowledge repo-owned and tool-neutral. |
| `src-prop-019` | Non-trivial AI implementation should separate design checkpoints from code generation. | `context/playbooks/11-agent-ready-repository-playbook.md`; `context/review/06-agent-operability-checklist.md` | Added pre-code checkpoint wording for capabilities, responsibilities, interactions, and contracts. | Low | Avoids importing Lattice's full methodology as a template. |
| `src-prop-020` | Agent output is safer when generation and verification happen as separate passes. | `context/review/06-agent-operability-checklist.md` | Added a verification-pass check against relevant standards and anti-patterns. | Low | Complements existing validation-ladder guidance. |
| `src-prop-021` | Feedback should be routed by root-cause destination: context, instruction, workflow, or failure guardrail. | `context/playbooks/11-agent-ready-repository-playbook.md` | Added compact feedback-routing wording. | Low | Keeps the flywheel actionable without adding a new taxonomy doc. |
| `src-prop-022` | A domain model is purposeful and distinct from any one expression; versioned artifacts may govern action without containing all situated knowledge. | `README.md`; `vision.md`; `context/glossary/01-framework-glossary.md`; principles 01/02 | Defined `domain model` and `model expression`, bounded operational authority, and retained expert/accountable-human validation. | Low | Vocabulary and ADR 0007 reviews passed; no claim that artifacts or agents replace people. |
| `src-prop-023` | Drift between model expressions and natural-language translations can reveal unresolved modeling choices. | `context/principles/02-ubiquitous-language-and-naming.md`; `context/review/04-vocabulary-drift-checklist.md` | Made expression drift and consequential translation choices explicit, including scoped aliases and native terms. | Low | Existing ubiquitous-language homes absorb the concern; no language mandated. |
| `src-prop-024` | Collaborative discovery should preserve provenance, missing perspectives, acceptance, linguistic clues, and contrasting evidence. | playbook 01; principle 11; `context/review/04-vocabulary-drift-checklist.md` | Added working knowledge statuses, validation ownership, counterexamples, and evidence-sized discover/design/test/learn cycles. | Low | Statuses are actionable, not confidence scores or mandatory ceremony. |
| `src-prop-025` | Context maps should not blend current evidence, desired design, and migration intent. | `context/principles/03-bounded-contexts-and-boundaries.md`; playbook 02 | Separated `as-is`, `to-be`, and transition views and required unknown ownership or sequence to remain visible. | Low | The views describe map state; they do not redefine bounded context. |
| `src-prop-026` | Generic capabilities may use a Published Language, while variable output needs contract, parsing, translation, validation, and rejection. | pattern 01; playbook 10; `context/review/06-agent-operability-checklist.md` | Added a Published Language option and a provider-neutral probabilistic boundary. | Low | Internal models remain private; the seam is explicitly not a bounded context. |
| `src-prop-027` | Exploration, brainstorming, decision, and implementation need distinct behavior and a bounded handoff at pivots. | pattern 04; playbook 11; `context/review/06-agent-operability-checklist.md` | Added interaction charters, explicit modes, clean pivots, carry-only-conclusions handoffs, and accountable-human gates. | Low | Charters remain subordinate to briefs/ADRs and do not form a second design core. |
| `src-prop-028` | A timeout may leave an effect unknown; retries must preserve one business intention and converge through named authority and reconciliation. | principles 04/05; playbooks 03/09; `context/review/02-architecture-review-checklist.md` | Separated rejection, confirmed failure, and unknown outcome; located retry/backoff at edges and intention/consequence in the domain. | Low | Prevents edge symptoms and idempotency keys from defining business meaning. |
| `src-prop-029` | Evidence scope should follow responsibility, boundary, risk, and needed confidence rather than a universal test taxonomy. | `context/playbooks/03-workflow-and-state-modeling-playbook.md`; `context/review/02-architecture-review-checklist.md` | Added claim-shaped test selection and separated mechanical checks from human semantic judgment. | Low | No test pyramid, ratio, framework, or provider entered the core. |

## Rejected or deferred changes

| Candidate | Decision | Reason |
|---|---|---|
| Add a new canonical source-ingestion playbook | Rejected | Source ingestion is source-repo maintenance, not part of the vendored core pack. |
| Add a full research freshness linter | Deferred | Wait for repeated drift before adding tooling. |
| Add APOSD-specific references to canonical docs | Rejected | Canonical docs should stand without source-only background. |
| Add DMMF-specific implementation mechanics to canonical docs | Rejected | Canonical docs should keep the modeling move while remaining language-neutral. |
| Add external DMMF review excerpts to canonical docs | Rejected | Reviews are second-order evidence; canonical docs should contain only the portable reviewed claims. |
| Add Thoughtworks Radar as a main design input | Rejected | The Radar is valuable calibration evidence but too time-sensitive to become a stable foundation. |
| Add Lattice as a main design input | Rejected | Lattice is valuable operational evidence, but its plugin and skill distribution surface is too tool-facing to be a stable foundation. |
| Add skills, MCP, SPDD, Lattice commands, or context-graph templates to core | Rejected/deferred | These remain tool- or method-specific edge concerns until repeated field evidence justifies an ADR. |
| Treat each LLM interaction as a DDD bounded context or add a generic agent-work area | Rejected | Interaction modes enable domain work but do not redefine DDD ontology or justify a second core. |
| Import fixed session thresholds, a universal test pyramid, or unpublished-session claims | Rejected/deferred | The first two overgeneralize mechanisms; unavailable recordings remain pending and are not reconstructed from abstracts. |

## Corte E evaluation

The fixed B1-B6 repetition against the v0.6.0 candidate found no score or output-size regression. Specific behavior improved from `20/24` to `24/24` and the applicable transversal rubric from `160/172` to `168/172`. B1 still did not explicitly distinguish model from expression in either run; this residual and the baseline ceiling are documented rather than converted into another canonical change.

## Manifest impact

None. Existing canonical docs were updated in place and no canonical files were added, removed, or renamed.

## ADR impact

No ADR needed. The changes do not alter repository structure, naming policy, vendoring policy, or review policy meaning; they tighten existing modeling, review, and naming guidance.

## Related docs

- `context/glossary/02-naming-and-term-introduction.md`
- `context/review/01-quality-gates.md`
- `context/review/03-documentation-quality-checklist.md`
