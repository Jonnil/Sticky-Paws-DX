#!/usr/bin/env python3
"""
Lightweight GML formatter for Sticky Paws DX.

Applies safe, conservative formatting rules:
- Convert tabs to 4 spaces
- Trim trailing whitespace
- Ensure a single trailing newline at EOF
- Normalize post-increment/decrement spacing (e.g., `x ++;` -> `x++;`)

Notes:
- Avoids heavy tokenization to reduce risk of changing semantics.
- Does NOT modify strings, brace placement, or add/remove semicolons.

Usage:
  python3 tools/format_gml.py [root]

If root is omitted, it runs from current working directory.
"""
from __future__ import annotations

import sys
from pathlib import Path
import re

# Regex to find spaced post-inc/dec before a semicolon, allowing whitespace
POST_INC = re.compile(r"\s\+\+\s*;")
POST_DEC = re.compile(r"\s--\s*;")


def _indent_to_tabs(line: str, tab_width: int = 4) -> str:
    """Convert leading indentation to tabs (tab = tab_width columns).
    Preserves alignment by using spaces for remainder columns.
    """
    if not line:
        return line
    m = re.match(r"^[ \t]+", line)
    if not m:
        return line
    indent = m.group(0)
    rest = line[len(indent):]
    col = 0
    for ch in indent:
        if ch == "\t":
            col += tab_width - (col % tab_width)
        else:  # space
            col += 1
    tabs = col // tab_width
    spaces = col % tab_width
    return ("\t" * tabs) + (" " * spaces) + rest


def format_gml_text(text: str) -> str:
    # Normalize EOLs to LF first
    text = text.replace("\r\n", "\n").replace("\r", "\n")

    out_lines = []
    for line in text.split("\n"):
        # Normalize leading indentation to tabs (width 4)
        line = _indent_to_tabs(line, tab_width=4)
        # Trim trailing whitespace
        line = re.sub(r"[ \t]+$", "", line)
        # Fix spaced post-increment/decrement patterns in a conservative way
        # Only touch patterns immediately preceding a semicolon
        line = POST_INC.sub("++;", line)
        line = POST_DEC.sub("--;", line)
        out_lines.append(line)

    # Re-join and ensure exactly one trailing newline
    result = "\n".join(out_lines)
    if not result.endswith("\n"):
        result += "\n"
    return result


def process_file(path: Path) -> bool:
    original = path.read_text(encoding="utf-8")
    formatted = format_gml_text(original)
    if formatted != original:
        path.write_text(formatted, encoding="utf-8")
        return True
    return False


def main() -> int:
    root = Path(sys.argv[1]) if len(sys.argv) > 1 else Path.cwd()
    changed = 0
    scanned = 0
    for p in root.rglob("*.gml"):
        if not p.is_file():
            continue
        # Only format files within typical GameMaker code folders
        try:
            if any(part in {"scripts", "objects", "rooms", "extensions"} for part in p.parts):
                scanned += 1
                if process_file(p):
                    changed += 1
        except Exception as e:
            print(f"Failed formatting {p}: {e}")
    print(f"Scanned: {scanned} files; Changed: {changed} files")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
