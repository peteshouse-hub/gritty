# The Gospel According to Tony Day

This repository contains the LuaLaTeX source for *The Gospel According to Tony Day*.

Two editions are produced from the same body of work:
- the **Naked Edition**, which presents the works without interpretive scaffolding
- the **Decoded Edition**, which presents the same works with verso notes intended to prompt reflection.

Both editions present the same work. The decoded edition is a companion reading, not a separate text.

The intended reading order is:
1. **Naked Edition**
2. **Decoded Edition**

Read the naked edition first.

## Build

This project is built with **LuaLaTeX**.

### Prerequisites

You need a TeX distribution that provides either:

- `latexmk` with LuaLaTeX support, or
- `lualatex`

On macOS, installing **MacTeX** or **BasicTeX** is sufficient.

The build script also prepends the standard MacTeX path:

```bash
export PATH="/Library/TeX/texbin:$PATH"
```

### Build both editions

From the repository root:

```bash
chmod +x scripts/build_all.sh
./scripts/build_all.sh
```

This builds both editions and copies the final shareable PDFs to `dist/`.

### Output files

Intermediate and compiler output is written to:

```text
build/
```

Final shareable PDFs are written to:

```text
dist/
```

The output filenames are:

- `The Gospel According to Tony Day - Naked Edition.pdf`
- `The Gospel According to Tony Day - Decoded Edition.pdf`

### Direct PDF links

- [Naked Edition](dist/The%20Gospel%20According%20to%20Tony%20Day%20-%20Naked%20Edition.pdf)
- [Decoded Edition](dist/The%20Gospel%20According%20to%20Tony%20Day%20-%20Decoded%20Edition.pdf)

### Notes

- Both editions present the same work.
- The **Decoded Edition** is a companion reading, not a separate text.
- The intended reading order is:
  1. **Naked Edition**
  2. **Decoded Edition**

### Troubleshooting

If TeX tools are installed but not found on macOS, restart the terminal or run:

```bash
eval "$(/usr/libexec/path_helper)"
```
