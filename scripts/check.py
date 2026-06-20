#!/usr/bin/env python3
"""Validate the about.ifuri.com presentation: structure, links and the ecobar.

- index.html is well-formed enough (parses, balanced sections),
- it loads the shared ecobar and sets a canonical + OG image,
- every required ecosystem link is present.

Exit 0 when clean, 1 on any problem. Used by CI (make test) and locally.
"""
import html.parser
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[1]
INDEX = ROOT / "index.html"
REQUIRED = [
    "ifuri-ecobar.js",
    'rel="canonical"',
    "og:image",
    "https://get.ifuri.com",
    "https://connect.ifuri.com",
    "https://docs.ifuri.com",
    "https://roadmap.ifuri.com",
]


class Counter(html.parser.HTMLParser):
    def __init__(self):
        super().__init__()
        self.open = {}

    def handle_starttag(self, tag, attrs):
        if tag in ("section", "main", "body", "html"):
            self.open[tag] = self.open.get(tag, 0) + 1

    def handle_endtag(self, tag):
        if tag in ("section", "main", "body", "html"):
            self.open[tag] = self.open.get(tag, 0) - 1


def main() -> int:
    if not INDEX.is_file():
        print("FAIL: index.html missing")
        return 1
    text = INDEX.read_text(encoding="utf-8")
    errors = 0

    parser = Counter()
    parser.feed(text)
    for tag, depth in parser.open.items():
        if depth != 0:
            print(f"FAIL: unbalanced <{tag}> (net {depth})")
            errors += 1

    sections = text.count("<section")
    if sections < 5:
        print(f"FAIL: expected several slides, found {sections} <section>")
        errors += 1

    for needle in REQUIRED:
        if needle not in text:
            print(f"FAIL: missing required content: {needle}")
            errors += 1

    print(f"{sections} slide(s), {errors} error(s)")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
