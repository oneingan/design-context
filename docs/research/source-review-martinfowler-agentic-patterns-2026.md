# Source Review: Martin Fowler Agentic Patterns 2026

## Summary

- This review evaluates recent Martin Fowler / Thoughtworks posts on agentic programming, harness engineering, structured prompts, and AI collaboration patterns.
- The portable value is the control-system view of agent work: guides, sensors, harnessability, durable intent, elicitation, and vocabulary discipline.
- Current canonical docs already cover progressive disclosure, repo-local source of truth, ADRs, quality gates, and agent-operability.
- Accepted response: small wording updates to existing docs only; no new top-level area, skill pack, SPDD clone, or harness implementation.

## Trigger

Recent posts sharpen the distinction between durable agent guidance and executable feedback loops. The review checks whether `design-context` should evolve after the Technology Radar Vol. 34 and Lattice comparison work.

## Sources reviewed

| Source id | Source | Portable relevance |
|---|---|---|
| `mf-harness-engineering-2026` | _Harness engineering for coding agent users_ | Guides vs sensors, computational vs inferential controls, harnessability. |
| `mf-maintainability-sensors-2026` | _Maintainability sensors for coding agents_ | Actionable linter messages, dependency rules, coupling/modularity sensors. |
| `mf-spdd-2026` | _Structured-Prompt-Driven Development_ | Versioned intent artifacts and prompt/code sync; useful but too prescriptive for core. |
| `mf-reduce-friction-ai-2026` | Knowledge Priming, Design-First, Context Anchoring, Encoding Team Standards, Feedback Flywheel | Context as infrastructure, living decisions, executable team standards, learning loops. |
| `mf-interrogatory-llm-2026` | _Interrogatory LLM_ | Interview-driven context creation or expert validation. |
| `mf-agentic-programming-2026` | _Vibe Coding_, _Agentic Programming_, _Semantic Diffusion_ | Terminology boundaries and risk of fashionable terms losing meaning. |
| `mf-code-conceptual-model-2026` | _What is Code_ | Code as conceptual model, vocabulary, and part of the agent harness. |
| `mf-adr-advice-2026` | _Architecture Decision Record_, _Scaling the Practice of Architecture, Conversationally_ | ADR lifecycle, advice capture, confidence, and superseding decisions. |

## Review claims

| Claim id | Claim | Current home | Classification | Response |
|---|---|---|---|---|
| `mf-ap-1` | Agent harnesses combine feedforward guides and feedback sensors. | `context/playbooks/11-agent-ready-repository-playbook.md`, `context/review/06-agent-operability-checklist.md` | partial gap | Add compact guide/sensor wording. |
| `mf-ap-2` | Computational sensors should be preferred for frequent checks; inferential sensors suit semantic, less frequent review. | `tooling/README.md`, `context/review/06-agent-operability-checklist.md` | partial gap | Add checklist guidance; defer tooling. |
| `mf-ap-3` | Harnessability depends on repo structure, checks, schemas, stable vocabulary, and examples, not prompts alone. | `context/playbooks/11-agent-ready-repository-playbook.md` | partial gap | Add glossary and playbook/checklist wording. |
| `mf-ap-4` | Intent artifacts can keep AI-assisted changes governable, but SPDD is a specific method. | `context/playbooks/11-agent-ready-repository-playbook.md` | deferred | Keep as future evidence; do not add SPDD shape now. |
| `mf-ap-5` | Interrogatory LLMs can elicit or validate context with domain experts. | `context/playbooks/01-domain-modeling-playbook.md` | partial gap | Add an expert-elicitation step. |
| `mf-ap-6` | Popular AI terms undergo semantic diffusion and need explicit review. | `context/review/04-vocabulary-drift-checklist.md` | partial gap | Add vocabulary drift prompts. |
| `mf-ap-7` | Code is itself conceptual model, context, and harness for future agents. | `context/principles/02-ubiquitous-language-and-naming.md`, `context/principles/06-deep-modules-and-information-hiding.md` | covered / partial gap | Reinforce via harnessability wording only. |
| `mf-ap-8` | ADRs are stronger when they capture advice, confidence, revisit triggers, and are superseded rather than rewritten. | `context/playbooks/04-adr-writing-playbook.md` | partial gap | Add compact ADR lifecycle guidance. |
| `mf-ap-9` | Skills should not become a junk drawer for rules better expressed as architecture, examples, checks, or scripts. | `docs/adr/0006-agent-operability-boundary.md`, `VENDORING.md` | covered | No canonical change beyond keeping skills deferred. |
| `mf-ap-10` | Cognitive and intent debt are useful lenses, but the current review docs already cover most of the risk. | `context/review/01-quality-gates.md`, `context/review/03-documentation-quality-checklist.md` | deferred | Revisit only after repeated review failures. |

## Accepted canonical changes

| Target | Change |
|---|---|
| `context/glossary/01-framework-glossary.md` | Define `harnessability` as a framework-level term. |
| `context/playbooks/11-agent-ready-repository-playbook.md` | Add guide/sensor and harnessability guidance to validation. |
| `context/review/06-agent-operability-checklist.md` | Add checklist items for guides, sensors, computational/inferential checks, and harnessability. |
| `context/playbooks/01-domain-modeling-playbook.md` | Add expert elicitation guidance using one-question-at-a-time interviews. |
| `context/playbooks/04-adr-writing-playbook.md` | Add advice capture, confidence, revisit trigger, and superseding guidance. |
| `context/review/04-vocabulary-drift-checklist.md` | Add semantic-diffusion prompts for fashionable AI terms. |

## Rejected or deferred

| Candidate | Decision | Reason |
|---|---|---|
| Add a `context/harness/` area | Rejected | Existing agent-operability docs can absorb the distinction. |
| Add SPDD or REASONS Canvas templates | Rejected | Too prescriptive and method-specific for the reusable core. |
| Add a skills pack now | Deferred | Skills should be optional wrappers after stronger sensors and boundaries exist. |
| Add AI review agents to CI | Deferred | Inferential sensors need project-specific cost, trust, and noise decisions. |
| Add cognitive/intent debt taxonomy to core | Deferred | Useful lens, but not yet a repeated framework gap. |

## Validation

Validated after edits with:

```bash
nix shell nixpkgs#yq nixpkgs#ripgrep -c ./tooling/run-checks.sh
```

Result: passed.

## Related docs

- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-review-workflow.md`
- `docs/research/source-inventory.md`
- `context/playbooks/11-agent-ready-repository-playbook.md`
- `context/review/06-agent-operability-checklist.md`
