#!/usr/bin/env bash
set -euo pipefail

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo_root"

missing=0
for cmd in yq rg python3; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "error: $cmd is required on PATH for repository validation" >&2
    missing=1
  fi
done
if [ "$missing" -ne 0 ]; then
  echo "hint: nix shell nixpkgs#yq nixpkgs#ripgrep nixpkgs#python3 -c ./tooling/run-checks.sh" >&2
  exit 1
fi

./tooling/check-doc-budgets.sh
./tooling/validate-manifests.sh
./tooling/check-map-manifest-coverage.sh
./tooling/check-internal-links.sh
./tooling/check-core-pack.sh
./tooling/check-source-ingestion.sh
