# Installation

`polpack` can be installed via `pip`, `conda`, or built from source using `meson-python`.

## Prerequisites

- **Python:** 3.10 or later.
- **NumPy:** 2.0 or later recommended.
- **Fortran Compiler:** `gfortran` (required for source builds).

## Using pip

The simplest way to install the latest release is from PyPI:

```bash
pip install polpack
```

## Building from source

To build `polpack` from the source repository, you will need `uv` and a Fortran compiler.

1. **Clone the repository:**
   ```bash
   git clone https://github.com/eggzec/polpack
   cd polpack
   ```

2. **Install using the build script:**
   ```bash
   uv run bin/build.py install
   ```

This will automatically configure Meson, compile the Fortran source, and install the package into your active environment.
