#!/usr/bin/env bash
set -euo pipefail

missing=0
for cmd in yq rg; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "error: $cmd is required on PATH for map/manifest coverage validation" >&2
    missing=1
  fi
done
if [ "$missing" -ne 0 ]; then
  echo "hint: nix shell nixpkgs#yq nixpkgs#ripgrep -c ./tooling/check-map-manifest-coverage.sh" >&2
  exit 1
fi

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo_root"

fail=0
project_manifest="context/manifests/project-manifest.yaml"

fail_msg() {
  echo "FAIL $*" >&2
  fail=1
}

ok_msg() {
  :
}

require_path() {
  local path="$1"
  local label="$2"
  if [ -z "$path" ] || [ "$path" = "null" ]; then
    return 0
  fi
  if [ ! -e "$path" ]; then
    fail_msg "$label references missing path: $path"
  else
    ok_msg "$label path exists: $path"
  fi
}

if [ ! -f "$project_manifest" ]; then
  fail_msg "missing project manifest: $project_manifest"
  exit 1
fi

project_docs=$(mktemp)
trap 'rm -f "$project_docs"' EXIT
yq -r '.canonical_documents[]?.path' "$project_manifest" | sort -u > "$project_docs"

# Project areas should expose existing paths, maps, and manifests.
while IFS=$'\t' read -r area_path map manifest; do
  require_path "$area_path" "project area"
  require_path "$map" "project area map"
  require_path "$manifest" "project area manifest"
  if [ -n "$map" ] && [ "$map" != "null" ]; then
    if ! rg -n --fixed-strings "$map" context/00-map.md >/dev/null; then
      fail_msg "context/00-map.md does not mention area map: $map"
    else
      ok_msg "context/00-map.md mentions area map: $map"
    fi
  fi
done < <(yq -r '.areas[]? | [.path, (.map // ""), (.manifest // "")] | @tsv' "$project_manifest")

# Project-level canonical paths should exist.
while IFS= read -r path; do
  [ -z "$path" ] && continue
  require_path "$path" "project canonical_documents"
done < "$project_docs"

# Area manifests should point at existing maps, entries, and next reads.
while IFS= read -r -d '' manifest; do
  map=$(yq -r '.map // ""' "$manifest")
  require_path "$map" "$manifest map"

  while IFS= read -r path; do
    [ -z "$path" ] && continue
    require_path "$path" "$manifest entry"

    if ! grep -Fqx -- "$path" "$project_docs"; then
      fail_msg "$manifest entry is missing from project canonical_documents: $path"
    else
      ok_msg "$manifest entry appears in project canonical_documents: $path"
    fi

    if [ -n "$map" ] && [ "$map" != "null" ] && [ -f "$map" ]; then
      base=$(basename "$path")
      if ! rg -n --fixed-strings "$path" "$map" >/dev/null && ! rg -n --fixed-strings "$base" "$map" >/dev/null; then
        fail_msg "$map does not mention manifest entry: $path"
      else
        ok_msg "$map mentions manifest entry: $path"
      fi
    fi
  done < <(yq -r '.entries[]?.path' "$manifest")

  while IFS= read -r next; do
    [ -z "$next" ] && continue
    require_path "$next" "$manifest next_reads"
  done < <(yq -r '.entries[]?.next_reads[]?' "$manifest")
done < <(find context/manifests -maxdepth 1 -type f -name '*-manifest.yaml' ! -name 'project-manifest.yaml' -print0 | sort -z)

# Every canonical context leaf should be represented by its area manifest.
for area in principles patterns glossary playbooks review; do
  area_manifest="context/manifests/${area}-manifest.yaml"
  if [ ! -f "$area_manifest" ]; then
    fail_msg "missing area manifest for context/$area: $area_manifest"
    continue
  fi
  area_entries=$(mktemp)
  yq -r '.entries[]?.path' "$area_manifest" | sort -u > "$area_entries"
  while IFS= read -r -d '' file; do
    if ! grep -Fqx -- "$file" "$area_entries"; then
      fail_msg "canonical context leaf is not listed in $area_manifest: $file"
    else
      ok_msg "canonical context leaf is listed in $area_manifest: $file"
    fi
  done < <(find "context/$area" -maxdepth 1 -type f -name '*.md' ! -name '00-map.md' ! -name 'README.md' -print0 | sort -z)
  rm -f "$area_entries"
done

if [ "$fail" -ne 0 ]; then
  exit "$fail"
fi

echo "OK   map/manifest coverage validates"
