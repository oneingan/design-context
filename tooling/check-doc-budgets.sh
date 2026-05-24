#!/usr/bin/env bash
set -euo pipefail

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo_root"

root_max=200
map_max=150
leaf_max=220
research_max=350
exit_code=0

check_file() {
  local file="$1"
  local budget="$2"
  local lines
  lines=$(wc -l < "$file" | tr -d ' ')
  if [ "$lines" -gt "$budget" ]; then
    echo "WARN $file ($lines lines > budget $budget)"
    exit_code=1
  else
    echo "OK   $file ($lines/$budget)"
  fi
}

check_file README.md "$root_max"
check_file AGENTS.md "$root_max"
check_file VENDORING.md "$root_max"
check_file vision.md "$root_max"

while IFS= read -r -d '' file; do
  check_file "$file" "$map_max"
done < <(find context -type f \( -name '00-map.md' -o -path '*/README.md' \) -print0)

while IFS= read -r -d '' file; do
  case "$file" in
    */README.md|*/00-map.md) continue ;;
    docs/research/*) check_file "$file" "$research_max" ;;
    *) check_file "$file" "$leaf_max" ;;
  esac
done < <(find context docs -type f -name '*.md' -print0)

exit "$exit_code"
