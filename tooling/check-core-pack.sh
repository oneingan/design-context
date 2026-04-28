#!/usr/bin/env bash
set -euo pipefail

if ! command -v yq >/dev/null 2>&1; then
  echo "error: yq is required on PATH for core pack validation" >&2
  echo "hint: nix shell nixpkgs#yq -c ./tooling/check-core-pack.sh" >&2
  exit 1
fi

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo_root"

fail=0

require_path() {
  local path="$1"
  if [ ! -e "$path" ]; then
    echo "FAIL missing core path: $path" >&2
    fail=1
  else
    echo "OK   core path exists: $path"
  fi
}

require_text() {
  local file="$1"
  local text="$2"
  if ! grep -Fq -- "$text" "$file"; then
    echo "FAIL $file does not mention: $text" >&2
    fail=1
  else
    echo "OK   $file mentions: $text"
  fi
}

for path in LICENSE README.md AGENTS.md VENDORING.md context docs/adr; do
  require_path "$path"
done

for file in README.md VENDORING.md docs/adr/0005-core-context-pack-and-vendoring-boundary.md context/manifests/project-manifest.yaml; do
  require_text "$file" "docs/vendor/design-context"
done

# The default core pack should not rely on source-only maintenance material.
# These references are allowed only where the vendoring boundary itself explains exclusions.
source_only_pattern='(^|[^[:alnum:]_./-])((tooling/|CONTRIBUTING\.md|vision\.md|docs/research/|docs/repository-plan\.md|docs/publication-and-maintenance\.md))'
while IFS=: read -r file line rest; do
  case "$file" in
    VENDORING.md|docs/adr/0005-core-context-pack-and-vendoring-boundary.md|context/manifests/project-manifest.yaml)
      ;;
    *)
      echo "FAIL source-only reference in core doc: $file:$line:$rest" >&2
      fail=1
      ;;
  esac
done < <(rg -n "$source_only_pattern" README.md AGENTS.md VENDORING.md context docs/adr -g '*.md' -g '*.yaml' || true)

# Build the preferred consumer layout in a temp directory and verify that the copied
# pack remains internally navigable.
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
pack="$tmp/consumer-repo/docs/vendor/design-context"
mkdir -p "$pack/docs"
cp LICENSE README.md AGENTS.md VENDORING.md "$pack/"
cp -a context "$pack/context"
cp -a docs/adr "$pack/docs/adr"

(
  cd "$pack"
  for manifest in context/manifests/*-manifest.yaml; do
    yq . "$manifest" >/dev/null
  done

  missing=0
  for manifest in context/manifests/*-manifest.yaml; do
    while IFS= read -r path; do
      [ -z "$path" ] && continue
      if [ ! -e "$path" ]; then
        echo "FAIL copied pack manifest references missing path: $manifest -> $path" >&2
        missing=1
      fi
    done < <(yq -r '.. | select(has("path")?) | .path' "$manifest")
  done
  exit "$missing"
) || fail=1

if [ "$fail" -ne 0 ]; then
  exit "$fail"
fi

echo "OK   core pack validates in docs/vendor/design-context/ layout"
