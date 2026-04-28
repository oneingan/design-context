#!/usr/bin/env bash
set -euo pipefail

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo_root"

./tooling/check-doc-budgets.sh
./tooling/validate-manifests.sh
./tooling/check-core-pack.sh
./tooling/check-source-ingestion.sh
