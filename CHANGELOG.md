# Changelog

All notable changes to `design-context` are summarized here.

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
