#!/usr/bin/env bash
set -euo pipefail

if ! command -v yq >/dev/null 2>&1; then
  echo "error: yq is required on PATH for manifest validation" >&2
  echo "hint: nix shell nixpkgs#yq -c ./tooling/validate-manifests.sh" >&2
  exit 1
fi

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo_root"

while IFS= read -r -d '' file; do
  yq . "$file" >/dev/null
  echo "OK  $file"
done < <(find context -type f -name '*manifest.yaml' -print0 | sort -z)
