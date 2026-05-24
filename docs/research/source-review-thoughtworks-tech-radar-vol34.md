# Source Review: Thoughtworks Technology Radar Vol. 34

## Summary

- This review evaluates Thoughtworks Technology Radar Vol. 34, April 2026, as a source-only calibration input.
- The most relevant blips reinforce the repo's existing stance: context is engineered, disclosed progressively, validated by sensors, and kept separate from tool-specific edge adapters.
- Current canonical docs already cover progressive disclosure, small agent entrypoints, repo-local source of truth, validation ladders, guides/sensors, and edge discipline.
- Accepted response: register the Radar as a source and make small core wording updates for distribution, sandboxing, durability, MCP caution, and collaboration-quality metrics.
- No new canonical area, skills pack, context graph, MCP interface, SPDD workflow, or Radar-driven tool recommendation is accepted.

## Trigger

The latest Thoughtworks Radar includes several agentic software-delivery blips that directly overlap with `design-context`'s core purpose. The review asks whether the Radar should become a new source and whether the core design needs small updates.

This follows `docs/research/source-ingestion-workflow.md`: source material is treated as raw input, paraphrased into claims, and kept out of the default vendored core pack.

## Review window

- Reviewed on: 2026-05-24
- Entry point: `https://www.thoughtworks.com/radar`
- Radar volume: Volume 34, April 2026
- Related links followed when relevant: `AGENTS.md`, `Spec-driven development`, `Model Context Protocol (MCP)`, `Fuzz testing`, `AI-friendly code design`, and `Complacency with AI-generated code`

## Source registration

| Field | Value |
|---|---|
| Source id | `thoughtworks-tech-radar-vol34` |
| Title | Thoughtworks Technology Radar, Volume 34, April 2026 |
| Author/origin | Thoughtworks Technology Advisory Board |
| Type | Radar / source bundle |
| Framework role | Calibrate context engineering, agent-operability, feedback sensors, sandboxing, durability, tooling-edge discipline, and AI cognitive-debt guidance. |
| Status | source-only |
| Do not import | Ring placement as proof, vendor/tool choices as core policy, source prose, screenshots, or fashionable terms without vocabulary review. |

## Blips and themes reviewed

| Source locator | Portable relevance |
|---|---|
| `radar-vol34/themes` | Semantic diffusion, immature AI tooling, codebase cognitive debt, permission-hungry agents, and coding-agent harnesses. |
| `radar-vol34/context-engineering` | Treat context as a managed design surface rather than a static prompt. |
| `radar-vol34/progressive-context-disclosure` | Load detailed guidance only when relevant to avoid instruction bloat and context rot. |
| `radar-vol34/curated-shared-instructions-for-software-teams` | Treat shared agent instructions as team-owned engineering assets and distribute them through templates or reference apps. |
| `radar-vol34/feedback-sensors-for-coding-agents` | Wire deterministic checks into agent loops so failures trigger self-correction before review. |
| `radar-vol34/sandboxed-execution-for-coding-agents` | Treat filesystem, network, resource, and credential boundaries as defaults for agents that execute code. |
| `radar-vol34/ignoring-durability-in-agent-workflows` | Long-running agent workflows need resumable state, progress persistence, and observable recovery. |
| `radar-vol34/mcp-by-default` | Prefer simpler tool interfaces when protocol-level governance or interoperability is not needed. |
| `radar-vol34/codebase-cognitive-debt` | AI speed can widen the gap between implementation and shared system understanding. |
| `radar-vol34/coding-throughput-as-a-measure-of-productivity` | Throughput-only metrics distort behavior; collaboration quality and rework are better signals. |
| `radar-vol34/agent-skills` | Skills are useful context modules but have supply-chain and review risks. |
| `radar-vol34/context-graph` | Queryable decision provenance is promising but not yet a core repository requirement. |

## Review claims

| Claim id | Claim | Current home | Classification | Response |
|---|---|---|---|---|
| `tw-radar34-1` | Context engineering is strongest when context is a managed pipeline with progressive disclosure. | `context/principles/01-information-architecture-and-manifests.md`, `context/00-map.md` | covered | No canonical change. |
| `tw-radar34-2` | Shared agent instructions can be distributed through service templates or reference applications while keeping local overrides outside the vendored pack. | `VENDORING.md` | partial gap | Add compact vendoring guidance. |
| `tw-radar34-3` | Agents that execute code should default to explicit filesystem, network, resource, and credential boundaries. | `context/playbooks/11-agent-ready-repository-playbook.md`, `context/review/06-agent-operability-checklist.md` | partial gap | Add sandbox and permission wording. |
| `tw-radar34-4` | Long-running agent work needs enough durable state to resume, cancel, or recover safely. | `context/patterns/04-agent-work-orchestration-patterns.md`, `context/review/06-agent-operability-checklist.md` | partial gap | Tighten continuation/recovery wording. |
| `tw-radar34-5` | MCP should not become the default tool boundary when a simple CLI or script has enough structure and fidelity. | `context/playbooks/11-agent-ready-repository-playbook.md`, `context/review/01-quality-gates.md` | partial gap | Add edge-adapter heuristic; no MCP policy area. |
| `tw-radar34-6` | Collaboration quality metrics are safer than coding-throughput metrics for judging agent adoption. | `context/review/06-agent-operability-checklist.md` | partial gap | Add review checks for acceptance, failed checks, rework, and review burden. |
| `tw-radar34-7` | Skills and plugin marketplaces can reduce instruction bloat but are tool-specific and supply-chain sensitive. | `docs/adr/0006-agent-operability-boundary.md`, `VENDORING.md` | covered / deferred | Keep out of core; no skills pack. |
| `tw-radar34-8` | Context graphs and agent trace may help provenance, but they are not yet proven as portable core requirements. | `context/playbooks/04-adr-writing-playbook.md`, `context/playbooks/11-agent-ready-repository-playbook.md` | deferred | Revisit only after repeated field evidence. |

## Accepted canonical changes

| Target | Change |
|---|---|
| `VENDORING.md` | Clarify that templates or reference applications may distribute the vendored pack, while consumer-specific adaptation stays outside the vendored directory. |
| `context/playbooks/11-agent-ready-repository-playbook.md` | Add compact guidance for sandbox boundaries and for preferring simple structured CLI/script adapters before protocol-heavy edge adapters. |
| `context/patterns/04-agent-work-orchestration-patterns.md` | Tighten runner-adapter and continuation/recovery patterns without increasing the file beyond budget. |
| `context/review/06-agent-operability-checklist.md` | Add review items for sandboxing, resumable state, idempotent recovery, and collaboration-quality metrics. |
| `docs/research/source-inventory.md` | Register `thoughtworks-tech-radar-vol34` while preserving the detailed source notes. |
| `docs/research/source-canonical-change-proposals.md` | Record the accepted Radar-derived proposals. |

## Rejected or deferred

| Candidate | Decision | Reason |
|---|---|---|
| Add Thoughtworks Radar as a main design input in `README.md` | Rejected | The Radar is timely calibration evidence, not a stable foundation like APOSD or DMMF. |
| Add a new `context/context-engineering/` area | Rejected | Existing maps, manifests, agent-operability docs, and quality gates already own the portable concerns. |
| Add skills, plugin marketplace, MCP, SPDD, or Spec Kit templates | Rejected | Tool-specific workflows remain edge concerns unless future evidence justifies a separate ADR. |
| Add LLM-based review agents or context graph tooling | Deferred | Current guidance should prefer deterministic checks first and keep inferential sensors project-specific. |
| Add throughput metrics to success criteria | Rejected | Throughput alone can reward low-quality generated work and higher review burden. |

## Review gates

- Quality gates: applies because canonical wording changes are proposed.
- Documentation quality: applies because `source-inventory.md` is compacted and a new source review note is added.
- Vocabulary drift: checked; no new framework-wide term is introduced.
- ADR impact: no ADR needed because the changes tighten existing vendoring and agent-operability boundaries without changing repository structure or distribution policy.

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
- `context/playbooks/11-agent-ready-repository-playbook.md`
- `context/patterns/04-agent-work-orchestration-patterns.md`
- `context/review/06-agent-operability-checklist.md`
