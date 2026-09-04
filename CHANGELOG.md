# Changelog

All notable changes to `design-context` are summarized here.

## Unreleased

## v0.6.0 — Living, Bounded and Verifiable Domain Context — 2026-09-04

### Added

- Canonical definitions for `domain model` and `model expression`, with operational authority bounded by situated knowledge and accountable human validation.
- Knowledge-provenance statuses, missing-perspective prompts, linguistic clues, contrasting scenarios, and evidence-sized learning cycles for collaborative discovery.
- Explicit `as-is`, `to-be`, and transition views for context maps.
- Published Language guidance, provider-neutral probabilistic boundaries, interaction charters, mode pivots, and carry-only-conclusions handoffs.
- Unknown outcomes, stable business intention across retries, fact authority, reconciliation, and claim-shaped evidence for distributed workflows.
- A DDD Europe 2026 source review and reproducible v0.5.0/v0.6.0 behavioral evaluation.

### Changed

- Clarified that DDD remains the core while agent interaction and verification guidance enable discovery, application, and protection of accepted domain models.
- Tightened workflow and failure guidance so timeout, retry exhaustion, and idempotency mechanisms do not invent business outcomes.
- Derived test scope from responsibility, boundary, risk, and needed confidence rather than a universal test taxonomy.

### Evaluation

- Repeated B1-B6 with the exact v0.5.0 protocol: 12/12 runs completed without error or stderr.
- Specific behavior improved from `20/24` to `24/24`; the applicable transversal rubric improved from `160/172` to `168/172`, with no observed score regression.
- Outputs above 450 words decreased from 2/12 to 0/12; B1's residual model/expression ambiguity, ceiling effects, and single-model limits remain documented.

### Validation

- Passed `nix shell nixpkgs#yq nixpkgs#ripgrep nixpkgs#python3 -c ./tooling/run-checks.sh`.
- Passed `git diff --check`.

## v0.5.0 — 2026-05-25

### Added

- ADR 0007: agent enablement serves domain design.
- Source reviews for Martin Fowler agentic patterns, Thoughtworks Technology Radar Vol. 34, and Lattice as calibration inputs.
- Self-dogfooding agent-operability audit for the repository.
- Lightweight map/manifest coverage and internal markdown link checks.

### Changed

- Reframed agent-operability as an enablement layer for domain modeling, boundaries, workflows, events, contracts, persistence edges, review, and evolution.
- Tightened agent-ready guidance around harnessability, guides and sensors, sandbox boundaries, resumable recovery, simple edge adapters, orientation artifacts, design checkpoints, verification passes, collaboration-quality metrics, and feedback routing.
- Expanded domain-modeling, ADR, and vocabulary-review guidance with expert elicitation, ADR lifecycle/revisit prompts, and semantic-diffusion checks.
- PR template now asks for a compact proof-of-work evidence packet.
- Local and CI validation commands include the new lightweight sensors.

### Validation

- Passed `nix shell nixpkgs#yq nixpkgs#ripgrep nixpkgs#python3 -c ./tooling/run-checks.sh`.
- Passed `git diff --check`.

## v0.4.0 — 2026-05-13

### Added

- Agent-operability guidance for consumer repositories:
  - agent-ready repository playbook
  - agent work orchestration patterns
  - agent-operability review checklist
  - ADR 0006 for the agent-operability boundary
- `design deviation` vocabulary and review guidance for justified, scoped departures from canonical rules.
- Source reviews for agent harness/orchestration, `tenets` v0.6, and `mattpocock/skills`.
- Pi runtime smoke benchmark report for the release candidate.

### Changed

- Expanded quality gates, architecture review, ADR writing, and deep-module guidance.
- Added feature/spec pre-implementation prompts to domain modeling.
- Updated maps and manifests for the new agent-operability canonical docs.
- Kept Spec-Kit, slash-command skills, runner protocols, issue trackers, and provider-specific tooling outside the core pack.

### Validation

- Passed repository checks with `nix shell nixpkgs#yq nixpkgs#ripgrep -c ./tooling/run-checks.sh`.
- Passed `git diff --check`.
- Pi smoke benchmark completed 24/24 runs without runtime errors or timeouts.

## v0.3.0 — 2026-05-02

- Renamed and packaged the public repository as `design-context`.
- Established the default vendored core pack and preferred `docs/vendor/design-context/` location.
- Added ADR 0005 for the core-pack and vendoring boundary.

## v0.2.0 — 2026-04

- Deepened DMMF-derived principles, playbooks, and review artifacts.
- Added event discovery, failure taxonomy, cross-context contracts, and persistence-boundary guidance.

## v0.1.0 — 2026-04

- Established the initial context framework structure with maps, manifests, principles, playbooks, review docs, and ADRs.
