# Source Inventory

## Summary

- This inventory tracks external sources that inform `design-context`.
- Sources are source-only inputs; they do not define canonical framework behavior by themselves.
- Source material should be paraphrased into claims and reviewed before changing `context/**`.
- Local EPUB files are ignored inputs and should not be copied into the vendored core pack.

## Source status meanings

| Status | Meaning |
|---|---|
| source-only | May inform research and gap analysis; not part of the core context pack. |
| canonicalized | One or more reviewed ideas have been incorporated into canonical docs. |
| deferred | Useful background, but not currently driving framework changes. |

## Sources

### `tenets-upstream`

| Field | Value |
|---|---|
| Title | `bardiakhosravi/tenets` upstream repository |
| Author/origin | bardiakhosravi / GitHub |
| Type | Repository |
| Local input | Public GitHub repository inspected over the network only |
| Status | source-only; partially canonicalized through progressive disclosure, context maps, manifests, and review artifacts |
| Primary framework role | Initial inspiration for modular, path-aware agent guidance and architecture review mindset. |

High-level relevance:
- context-aware loading for agent tools
- focused rule files instead of monolithic prompts
- architecture review as a first-class agent activity
- multi-tool distribution concerns
- recent spec-driven development additions reviewed in `docs/research/source-review-tenets-upstream-v0.6.md`

Do not import:
- full templates, installer behavior, CLI flags, or npm packaging details
- Spec-Kit as a required interface
- Python- or hexagonal-architecture-specific rules as universal core policy
- upstream examples as hidden specifications

### `mattpocock-skills`

| Field | Value |
|---|---|
| Title | `mattpocock/skills` |
| Author/origin | Matt Pocock / GitHub |
| Type | Repository |
| Local input | Public GitHub repository inspected over the network only |
| Status | source-only; partially canonicalized in `docs/research/source-review-mattpocock-skills.md` |
| Primary framework role | Calibrate task-focused agent workflows, architecture-deepening review, durable agent briefs, and setup-boundary discipline. |

High-level relevance:
- small composable agent skills instead of monolithic process ownership
- glossary- and ADR-aware planning conversations
- deep-module review using deletion tests, interface-as-test-surface, and locality/leverage language
- debugging and TDD guidance built around fast feedback loops and behavior-facing tests
- issue/work-item briefs that are durable, behavioral, scoped, and independently verifiable
- explicit split between portable guidance and tool-specific setup dependencies

Do not import:
- slash-command packaging, `.claude-plugin`, Claude Code hooks, or plugin manifests
- `skills/**` directories as vendored pack content
- GitHub/GitLab/Linear/local-issue-tracker mechanics as core workflow policy
- npm, Husky, pre-commit, or setup scripts as framework requirements
- personal, deprecated, or in-progress skills as canonical guidance

### `aposd`

| Field | Value |
|---|---|
| Title | _A Philosophy of Software Design, 2nd Edition_ |
| Author/origin | John K. Ousterhout |
| Type | Book |
| Local input | `dokumen.pub_a-philosophy-of-software-design-2nd-edition-2nbsped-173210221x-9781732102217.epub` |
| Status | source-only; partially canonicalized through existing principles and review docs |
| Primary framework role | Repository and document design discipline. |

High-level relevance:
- complexity management
- strategic design
- deep modules and information hiding
- layering and abstraction discipline
- naming precision
- comments, ADRs, and rationale as design tools
- change discipline and maintenance quality

Do not import:
- chapter prose
- book examples as framework examples
- code-specific advice unless translated into language-neutral guidance

### `dmmf`

| Field | Value |
|---|---|
| Title | _Domain Modeling Made Functional: Tackle Software Complexity With Domain-Driven Design and F#_ |
| Author/origin | Scott Wlaschin |
| Type | Book |
| Local input | `dokumen.pub_domain-modeling-made-functional-tackle-software-complexity-with-domain-driven-design-and-f-9781680502541.epub` |
| Status | source-only; partially canonicalized through existing principles and playbooks |
| Primary framework role | Domain modeling and workflow design discipline. |

High-level relevance:
- shared model and ubiquitous language
- business event discovery
- subdomains and bounded contexts
- context contracts
- type-shaped modeling and invalid-state prevention
- entities, value objects, and aggregates
- workflow pipelines, effects, and dependencies
- explicit error modeling
- serialization, persistence, and data ownership

Do not import:
- F#-specific implementation detail unless it teaches a language-neutral modeling distinction
- order-taking domain examples as hidden specifications
- chapter structure as repository structure

### `dmmf-external-ecosystem`

| Field | Value |
|---|---|
| Title | DMMF external source ecosystem |
| Author/origin | Publisher pages, Scott Wlaschin public material, reviews, talks, related blogs, and supporting references |
| Type | Source bundle |
| Local input | Public web pages fetched to temporary files only |
| Status | source-only; reviewed in `docs/research/source-review-dmmf-external-sources.md` |
| Primary framework role | Triangulate the portable DMMF core without rereading the local EPUB. |

High-level relevance:
- DMMF's language-neutral value beyond F# syntax
- collaborative event discovery and cross-silo modeling
- type-first and trusted-representation design
- workflow pipelines, explicit errors, and edge effects
- persistence as mapping rather than domain truth
- reviewer-noted limits such as single-example overfitting

Do not import:
- review prose as canonical evidence
- aggregate ratings as proof of correctness
- author examples or F# mechanics as framework examples
- second-order summaries without mapping them to claims and current canonical homes

### `agent-harness-and-orchestration`

| Field | Value |
|---|---|
| Title | Agent harness and orchestration source bundle |
| Author/origin | OpenAI blogs/docs/repos plus community ports and AGENTS.md format material |
| Type | Source bundle |
| Local input | Public web pages and repositories fetched to temporary files only |
| Status | source-only; reviewed in `docs/research/source-review-agent-harness-and-orchestration.md` |
| Primary framework role | Calibrate agent-operability guidance for consumer repositories. |

High-level relevance:
- short agent entrypoints as maps
- repo-local knowledge stores as source of truth
- work contracts for issue, PR, validation, and handoff workflows
- isolated workspaces for concurrent agent work
- observable proof of work and operator-visible logs
- mechanical guardrails, actionable checks, and continuous cleanup
- runner/tracker/tool protocols as edge adapters

Do not import:
- Codex-, Symphony-, Linear-, Claude-, GitHub-, or app-server-specific behavior as core policy
- long prompts, workflow specs, or protocol transcripts as canonical docs
- vendor claims without mapping them to portable review claims
- community implementation choices as required architecture

### `martinfowler-agentic-patterns-2026`

| Field | Value |
|---|---|
| Title | Martin Fowler / Thoughtworks agentic programming pattern sources, 2026 |
| Author/origin | Martin Fowler site posts by Martin Fowler, Thoughtworks authors, and cited practitioners |
| Type | Source bundle |
| Local input | Public web pages fetched to temporary files only from `recent-changes.html` on 2026-05-24 |
| Status | source-only; reviewed in `docs/research/source-review-martinfowler-agentic-patterns-2026.md` |
| Primary framework role | Calibrate agent harness, sensor, intent, elicitation, vocabulary, and ADR-lifecycle guidance. |

High-level relevance:
- guides and sensors as a control-system model for agent work
- computational vs inferential feedback sensors
- harnessability through repo structure, checks, examples, and vocabulary
- interrogatory LLMs for eliciting or validating context
- semantic diffusion risks for fashionable AI terms
- ADR advice, confidence, revisit, and superseding practices

Do not import:
- SPDD or REASONS Canvas as required core workflow
- Lattice skills, command names, or tool-specific packaging as core policy
- long article prose, prompts, or examples as canonical text
- speculative autonomous-harness claims without local validation evidence

### `lattice-framework`

| Field | Value |
|---|---|
| Title | Lattice |
| Author/origin | Rahul Garg / GitHub |
| Type | Repository / AI skill framework |
| Local input | Public GitHub repository cloned temporarily; reviewed at commit `9a0ac3e` |
| Status | source-only; reviewed in `docs/research/source-review-lattice-framework.md` |
| Primary framework role | Calibrate artifact-backed AI collaboration workflows, standards elicitation, feature context persistence, pre-code design checkpoints, and feedback learning loops. |

High-level relevance:
- composable guardrails, workflows, and standards-calibration interviews
- compact project orientation artifacts and feature-level decision context
- pre-code design checkpoints before implementation
- separate generation and verification passes
- learning loops that route repeated failures back into shared artifacts

Do not import:
- Claude/Cursor plugin metadata, slash commands, marketplace packaging, or installer behavior
- `.lattice/` as a required consumer directory convention
- skill files, long templates, or opinionated Clean Architecture/DDD defaults as canonical docs
- Lattice's artifact names as hidden specifications for consumer repositories

### `thoughtworks-tech-radar-vol34`

| Field | Value |
|---|---|
| Title | Thoughtworks Technology Radar, Volume 34, April 2026 |
| Author/origin | Thoughtworks Technology Advisory Board |
| Type | Radar / source bundle |
| Status | source-only; reviewed in `docs/research/source-review-thoughtworks-tech-radar-vol34.md` |
| Primary framework role | Calibrate context engineering, agent-operability, feedback sensors, sandboxing, durability, tooling-edge discipline, and AI cognitive-debt guidance. |
| Do not import | Radar ring placement as proof, vendor/tool choices as core policy, source prose, screenshots, or fashionable terms without vocabulary review. |

## Use rules

- Use source ids in research notes and gap analyses.
- Prefer source locators such as `aposd ch.14`, `dmmf ch.7`, or `radar-vol34/<blip>` over copied excerpts.
- Convert source material into paraphrased claims before proposing canonical changes.
- Treat existing `context/**` docs as the current source of truth until a reviewed change updates them.

## Related docs

- `docs/research/source-ingestion-workflow.md`
- `docs/research/source-synthesis.md`
- `context/review/01-quality-gates.md`
