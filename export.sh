#!/usr/bin/env bash
# Export org files in the blog directory to Hugo markdown.
#
# Usage:
#   bash export.sh                  # export only modified files (since .last-export)
#   bash export.sh --all            # export all files unconditionally
#   bash export.sh mypost.org       # export a single file

set -e

STRAIGHT="$HOME/.config/emacs/.local/straight/build-30.2"
BLOG_DIR="$(cd "$(dirname "$0")" && pwd)"
SENTINEL="$BLOG_DIR/.last-export"

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

export_batch() {
  local files=("$@")
  local elisp_list
  elisp_list=$(printf '"%s" ' "${files[@]}")
  echo "Exporting ${#files[@]} file(s)..."
  emacs --batch "${EMACS_LOAD[@]}" \
    --eval "(dolist (f (list $elisp_list))
              (message \"Exporting %s...\" (file-name-nondirectory f))
              (with-current-buffer (find-file-noselect f)
                (org-hugo-export-wim-to-md t)
                (kill-buffer (current-buffer))))" 2>/dev/null
  touch "$SENTINEL"
}

if [ -n "$1" ] && [ "$1" != "--all" ]; then
  # Single file — one session, no sentinel update
  export_file "$BLOG_DIR/$1"
else
  # Collect files to export
  CHANGED=()
  for f in "$BLOG_DIR"/*.org; do
    [[ "$(basename "$f")" == setup-blog.org ]] && continue
    if [[ "$1" == "--all" ]] || [[ ! -f "$SENTINEL" ]] || [[ "$f" -nt "$SENTINEL" ]]; then
      CHANGED+=("$f")
    fi
  done

  if [ ${#CHANGED[@]} -eq 0 ]; then
    echo "Nothing to export (all files up to date)."
  else
    export_batch "${CHANGED[@]}"
  fi
fi

echo "Done."
