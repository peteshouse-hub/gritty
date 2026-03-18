#!/usr/bin/env bash
set -euo pipefail

# Standard MacTeX path shim on macOS
export PATH="/Library/TeX/texbin:$PATH"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_DIR="$ROOT_DIR/build"
EDITIONS_DIR="$ROOT_DIR/src/editions"
DIST_DIR="$ROOT_DIR/dist"
mkdir -p "$BUILD_DIR" "$DIST_DIR"

if ! command -v latexmk >/dev/null 2>&1 && ! command -v lualatex >/dev/null 2>&1; then
  echo "No LuaLaTeX-capable TeX engine found on PATH." >&2
  echo "Install MacTeX or BasicTeX, then restart the terminal or run:" >&2
  echo '  eval "$(/usr/libexec/path_helper)"' >&2
  exit 127
fi

build_one() {
  local name="$1"
  if command -v latexmk >/dev/null 2>&1; then
    (cd "$EDITIONS_DIR" && latexmk -lualatex -interaction=nonstopmode -halt-on-error -output-directory="$BUILD_DIR" "$name")
  else
    (cd "$EDITIONS_DIR" && lualatex -interaction=nonstopmode -halt-on-error -output-directory="$BUILD_DIR" "$name")
    (cd "$EDITIONS_DIR" && lualatex -interaction=nonstopmode -halt-on-error -output-directory="$BUILD_DIR" "$name")
  fi
}

build_one main.tex
build_one main_decoded.tex

NAKED_PDF="The Gospel According to Tony Day - Naked Edition.pdf"
DECODED_PDF="The Gospel According to Tony Day - Decoded Edition.pdf"

cp -f "$BUILD_DIR/main.pdf" "$DIST_DIR/$NAKED_PDF"
cp -f "$BUILD_DIR/main_decoded.pdf" "$DIST_DIR/$DECODED_PDF"

echo "Built PDFs into $BUILD_DIR and copied final PDFs to $DIST_DIR."