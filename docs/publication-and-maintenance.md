# Publication and Maintenance Notes

## Summary

- v0 is published as `design-context`.
- **v0.4.0** is the current release after agent-operability and source-calibration updates.
- CI should run the same lightweight checks used locally.
- Export automation to other agent formats remains intentionally deferred.
- The core framework should stay compact and canonical before adding distribution conveniences.
- Third-party vendoring should use the core context pack defined in `VENDORING.md`.

## Publication checklist

- [x] stable v0 repository name chosen
- [x] contribution guidance added
- [x] local validation scripts added
- [x] CI workflow added
- [x] publication baseline recorded in an ADR
- [x] choose and add a license
- [x] rename the public GitHub repository to `design-context`
- [x] push the renamed repository and validate the remote
- [x] publish release `v0.3.0`
- [x] publish release `v0.4.0`

## Changelog

Release notes are maintained in `CHANGELOG.md`.

## Local validation

```bash
nix shell nixpkgs#yq nixpkgs#ripgrep nixpkgs#python3 -c ./tooling/run-checks.sh
```

## Suggested GitHub push flow

If you create the remote manually, the push sequence will usually be:

```bash
git remote add origin <your-github-repo-url>
git push -u origin main
```

## What is intentionally deferred

- automatic export generation for Claude, Cursor, Copilot, or AGENTS subsets
- heavy markdown linting and advanced retrieval automation
- additional distribution formats until the canonical core stabilizes further

## Related docs

- `LICENSE`
- `CONTRIBUTING.md`
- `tooling/tooling-evaluation.md`
- `docs/adr/0002-lightweight-validation-before-agent-exports.md`
- `docs/adr/0003-v0-name-and-publication-baseline.md`
- `docs/adr/0004-license-choice.md`
- `docs/adr/0005-core-context-pack-and-vendoring-boundary.md`
