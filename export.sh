#!/usr/bin/env bash
# Export one or all org files in the blog directory to Hugo markdown.
#
# Usage:
#   bash export.sh                  # export all *.org files
#   bash export.sh mypost.org       # export a single file

set -e

STRAIGHT="$HOME/.config/emacs/.local/straight/build-30.2"
BLOG_DIR="$(cd "$(dirname "$0")" && pwd)"

EMACS_LOAD=(
  --eval "(let ((default-directory \"$STRAIGHT\")) (normal-top-level-add-subdirs-to-load-path))"
  --eval "(require 'ox-hugo)"
  --eval "(require 'oc-csl)"
  --load "$BLOG_DIR/blog-export-setup.el"
)

export_file() {
  local file="$1"
  echo "Exporting $(basename "$file")..."
  emacs --batch "${EMACS_LOAD[@]}" "$file" \
    --eval "(org-hugo-export-wim-to-md t)" 2>/dev/null
}

if [ -n "$1" ]; then
  export_file "$BLOG_DIR/$1"
else
  for f in "$BLOG_DIR"/*.org; do
    [[ "$(basename "$f")" == setup-blog.org ]] && continue
    export_file "$f"
  done
fi

echo "Done."
