# Source Inventory

## Summary

- This inventory tracks external sources that inform `design-context`.
- Sources are source-only inputs unless a reviewed change promotes a portable claim into `context/**`.
- Source material should be paraphrased into claims before canonical changes.
- Local EPUB files and source-review notes stay outside the default core pack.

## Source status meanings

| Status | Meaning |
|---|---|
| source-only | May inform research and gap analysis; not part of the core context pack. |
| canonicalized | One or more reviewed ideas have been incorporated into canonical docs. |
| deferred | Useful background, but not currently driving framework changes. |

## Sources

| Source id | Title / origin | Type | Framework role | Status |
|---|---|---|---|---|
| `tenets-upstream` | `bardiakhosravi/tenets` upstream repository / GitHub | Repository | Initial inspiration for modular, path-aware agent guidance and architecture review mindset. | source-only; partially canonicalized through progressive disclosure, context maps, manifests, and review artifacts |
| `mattpocock-skills` | `mattpocock/skills` / GitHub | Repository | Calibrates task-focused agent workflows, architecture-deepening review, durable briefs, and setup-boundary discipline. | source-only; reviewed in `docs/research/source-review-mattpocock-skills.md` |
| `aposd` | _A Philosophy of Software Design, 2nd Edition_ / John K. Ousterhout | Book; local EPUB input | Repository and document design discipline. | source-only; partially canonicalized through existing principles and review docs |
| `dmmf` | _Domain Modeling Made Functional_ / Scott Wlaschin | Book; local EPUB input | Domain modeling and workflow design discipline. | source-only; partially canonicalized through existing principles and playbooks |
| `dmmf-external-ecosystem` | DMMF publisher, author, reviews, talks, related blogs, and supporting references | Source bundle | Triangulates the portable DMMF core without rereading the local EPUB. | source-only; reviewed in `docs/research/source-review-dmmf-external-sources.md` |
| `agent-harness-and-orchestration` | OpenAI blogs/docs/repos plus community ports and AGENTS.md format material | Source bundle | Calibrates agent-operability guidance for consumer repositories. | source-only; reviewed in `docs/research/source-review-agent-harness-and-orchestration.md` |
| `martinfowler-agentic-patterns-2026` | Martin Fowler / Thoughtworks agentic programming pattern sources, 2026 | Source bundle | Calibrates agent harness, sensor, intent, elicitation, vocabulary, and ADR-lifecycle guidance. | source-only; reviewed in `docs/research/source-review-martinfowler-agentic-patterns-2026.md` |
| `thoughtworks-tech-radar-vol34` | Thoughtworks Technology Radar, Volume 34, April 2026 / Thoughtworks Technology Advisory Board | Radar / source bundle | Calibrates context engineering, agent-operability, feedback sensors, sandboxing, durability, tooling-edge discipline, and AI cognitive-debt guidance. | source-only; reviewed in `docs/research/source-review-thoughtworks-tech-radar-vol34.md` |

## High-level relevance by source

| Source id | Relevance |
|---|---|
| `tenets-upstream` | Context-aware loading, focused rule files, architecture review as agent activity, and distribution concerns. |
| `mattpocock-skills` | Small composable agent skills, glossary/ADR-aware planning, deep-module review, fast feedback loops, and durable work-item briefs. |
| `aposd` | Complexity management, strategic design, deep modules, information hiding, naming precision, comments, ADRs, and maintenance quality. |
| `dmmf` | Ubiquitous language, bounded contexts, event discovery, type-shaped models, workflows, effects, errors, and persistence boundaries. |
| `dmmf-external-ecosystem` | Collaborative event discovery, type-first trusted representations, workflow pipelines, explicit errors, and single-example overfitting risks. |
| `agent-harness-and-orchestration` | Repo-local knowledge, work contracts, isolated workspaces, proof of work, mechanical guardrails, and runner/tracker/tool edge protocols. |
| `martinfowler-agentic-patterns-2026` | Guides and sensors, harnessability, interrogatory LLMs, semantic diffusion, and ADR lifecycle practices. |
| `thoughtworks-tech-radar-vol34` | Progressive context disclosure, curated shared instructions, feedback loops, sandboxed execution, durable agent workflows, MCP caution, and collaboration-quality metrics. |

## Do not import

- Do not import full templates, installer behavior, CLI flags, package manifests, plugin marketplaces, or vendor-specific protocol details as core policy.
- Do not import long source excerpts, prompts, review prose, transcripts, examples, or F# mechanics as canonical text.
- Do not treat Radar ring placement, aggregate reviews, vendor claims, or maintainer activity as proof without source-to-context gap analysis.
- Do not make Spec-Kit, SPDD, MCP, Claude, Cursor, Codex, Linear, GitHub, or any other tool-specific workflow a required framework interface.
- Do not let source-only notes outrank `context/**` canonical guidance.

## Use rules

- Use source ids in research notes and gap analyses.
- Prefer locators such as `aposd ch.14`, `dmmf ch.7`, or `radar-vol34/<blip>` over copied excerpts.
- Convert source material into paraphrased claims before proposing canonical changes.
- Treat existing `context/**` docs as the current source of truth until a reviewed change updates them.

## Related docs

- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-synthesis.md`
- `context/review/01-quality-gates.md`
