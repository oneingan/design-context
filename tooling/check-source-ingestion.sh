#!/usr/bin/env bash
set -euo pipefail

missing=0
for cmd in yq rg; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "error: $cmd is required on PATH for source-ingestion validation" >&2
    missing=1
  fi
done
if [ "$missing" -ne 0 ]; then
  echo "hint: nix shell nixpkgs#yq nixpkgs#ripgrep -c ./tooling/check-source-ingestion.sh" >&2
  exit 1
fi

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo_root"

fail=0

# Source EPUBs are ignored local inputs. Their exact filenames should not leak
# into consumer-facing core docs.
while IFS= read -r -d '' epub; do
  name=$(basename "$epub")
  while IFS=: read -r file line rest; do
    case "$file" in
      docs/research/*|.gitignore)
        ;;
      *)
        echo "FAIL source EPUB filename leaked into core doc: $file:$line:$rest" >&2
        fail=1
        ;;
    esac
  done < <(rg -n --fixed-strings "$name" README.md AGENTS.md VENDORING.md context docs tooling .github .gitignore 2>/dev/null || true)
done < <(find . -maxdepth 1 -type f -name '*.epub' -print0)

# Research/source-ingestion docs must remain outside the vendored core pack include list.
if ! rg -n 'docs/research/\*\*' context/manifests/project-manifest.yaml >/dev/null; then
  echo "FAIL project manifest should explicitly exclude docs/research/** from the default core pack" >&2
  fail=1
else
  echo "OK   docs/research/** is excluded from the default core pack"
fi

if yq -r '.consumption.default_pack.include[]' context/manifests/project-manifest.yaml | rg '^docs/research' >/dev/null; then
  echo "FAIL docs/research appears in the default core pack include list" >&2
  fail=1
else
  echo "OK   docs/research is not included in the default core pack"
fi

# Source-ingestion research should point at the workflow rather than inventing
# untracked local conventions.
while IFS= read -r -d '' file; do
  case "$file" in
    docs/research/source-ingestion-workflow.md)
      continue
      ;;
  esac
  if ! rg -n 'source-ingestion-workflow\.md' "$file" >/dev/null; then
    echo "FAIL source research file does not link to source-ingestion workflow: $file" >&2
    fail=1
  else
    echo "OK   $file links to source-ingestion workflow"
  fi
done < <(find docs/research -maxdepth 1 -type f -name 'source-*.md' -print0 | sort -z)

exit "$fail"
