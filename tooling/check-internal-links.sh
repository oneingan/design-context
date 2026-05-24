#!/usr/bin/env bash
set -euo pipefail

if ! command -v python3 >/dev/null 2>&1; then
  echo "error: python3 is required on PATH for internal markdown link validation" >&2
  echo "hint: nix shell nixpkgs#python3 -c ./tooling/check-internal-links.sh" >&2
  exit 1
fi

repo_root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo_root"

python3 - <<'PY'
from __future__ import annotations

import re
import sys
from pathlib import Path
from urllib.parse import unquote, urlparse

root = Path.cwd().resolve()
skip_dirs = {".git", ".pi"}
external_schemes = {"http", "https", "mailto", "tel", "ftp"}

inline_link = re.compile(r"!?\[[^\]\n]+\]\(([^)\s]+)(?:\s+['\"][^)]*['\"])?\)")
reference_link = re.compile(r"^[ \t]*\[[^\]]+\]:[ \t]+(\S+)", re.MULTILINE)
heading = re.compile(r"^#{1,6}\s+(.+?)\s*#*\s*$", re.MULTILINE)


def markdown_files() -> list[Path]:
    files: list[Path] = []
    for path in root.rglob("*.md"):
        rel_parts = path.relative_to(root).parts
        if any(part in skip_dirs for part in rel_parts):
            continue
        files.append(path)
    return sorted(files)


def slugify(text: str) -> str:
    text = re.sub(r"<[^>]+>", "", text)
    text = re.sub(r"[`*_~]", "", text)
    text = text.strip().lower()
    text = re.sub(r"[^\w\s-]", "", text, flags=re.UNICODE)
    text = re.sub(r"\s+", "-", text)
    text = re.sub(r"-+", "-", text)
    return text.strip("-")


def anchors_for(path: Path) -> set[str]:
    text = path.read_text(encoding="utf-8", errors="replace")
    anchors: set[str] = set()
    seen: dict[str, int] = {}
    for match in heading.finditer(text):
        base = slugify(match.group(1))
        if not base:
            continue
        count = seen.get(base, 0)
        seen[base] = count + 1
        anchors.add(base if count == 0 else f"{base}-{count}")
    return anchors


def is_external(href: str) -> bool:
    parsed = urlparse(href)
    return parsed.scheme.lower() in external_schemes


def target_for(source: Path, href: str) -> tuple[Path | None, str | None, str | None]:
    href = href.strip().strip("<>")
    if not href or is_external(href):
        return None, None, None

    path_part, sep, fragment = href.partition("#")
    path_part = path_part.split("?", 1)[0]
    fragment = unquote(fragment) if sep else None

    if not path_part:
        return source, fragment, None

    decoded = unquote(path_part)
    raw_target = (root / decoded.lstrip("/")) if decoded.startswith("/") else (source.parent / decoded)
    target = raw_target.resolve()

    try:
        target.relative_to(root)
    except ValueError:
        return target, fragment, "points outside the repository"

    return target, fragment, None


failures: list[str] = []
anchor_cache: dict[Path, set[str]] = {}
checked = 0

for source in markdown_files():
    rel_source = source.relative_to(root)
    text = source.read_text(encoding="utf-8", errors="replace")
    links = [m.group(1) for m in inline_link.finditer(text)]
    links += [m.group(1) for m in reference_link.finditer(text)]

    for href in links:
        href = href.strip()
        if is_external(href):
            continue
        target, fragment, error = target_for(source, href)
        if target is None:
            continue
        checked += 1
        if error:
            failures.append(f"{rel_source}: link {href!r} {error}: {target}")
            continue
        if not target.exists():
            failures.append(f"{rel_source}: link {href!r} references missing path: {target.relative_to(root) if root in target.parents else target}")
            continue
        if fragment and target.suffix.lower() == ".md":
            anchors = anchor_cache.setdefault(target, anchors_for(target))
            wanted = slugify(fragment)
            if wanted and wanted not in anchors:
                failures.append(f"{rel_source}: link {href!r} references missing heading anchor #{fragment} in {target.relative_to(root)}")

if failures:
    for failure in failures:
        print(f"FAIL {failure}", file=sys.stderr)
    sys.exit(1)

print(f"OK   internal markdown links validate ({checked} internal links checked)")
PY
