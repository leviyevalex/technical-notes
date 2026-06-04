#!/usr/bin/env bash
set -e

PDFLATEX=/Library/TeX/texbin/pdflatex
DVISVGM=/Library/TeX/texbin/dvisvgm
TMPDIR=/tmp/blog-figures
SRC="$(dirname "$0")/figures/src"
OUT="$(dirname "$0")/site/static/figures"

mkdir -p "$TMPDIR" "$OUT"

for f in "$SRC"/*.tex; do
  base=$(basename "$f" .tex)
  echo "Rendering $base..."
  $PDFLATEX -interaction=nonstopmode -output-directory "$TMPDIR" "$f" > /dev/null
  mutool draw -o "$OUT/$base.svg" "$TMPDIR/$base.pdf" 2>/dev/null
  echo "  → $OUT/$base.svg"
done

echo "Done."
