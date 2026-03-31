# Installation

`polpack` is distributed as a compiled wheel on PyPI and can also be installed
from source via GitHub.

---

## Prerequisites

- **Python 3.10+**
- **NumPy** (installed automatically as a dependency)

For source builds you additionally need:

- A Fortran compiler (`gfortran` recommended)
- `meson` and `meson-python` build system
- `numpy` (for `f2py` compilation)

## PyPI (recommended)

### pip

```bash
pip install --upgrade polpack
```

### pyproject.toml dependency

```toml
[project]
dependencies = [
    "polpack"
]
```

### requirements.txt

```text
polpack
```

## Package managers

### uv

```bash
# Add to a uv project
uv add polpack

# Or install into the current environment
uv pip install polpack
```

### pipenv

```bash
pipenv install polpack
```

### poetry

```bash
poetry add polpack
```

### pdm

```bash
pdm add polpack
```

### hatch

```bash
hatch add polpack
```

## Installing from source (GitHub)

Install the latest development version directly from the repository:

```bash
pip install --upgrade "git+https://github.com/eggzec/polpack.git#egg=polpack"
```

### Building locally

Clone and build from source if you want to modify the Fortran code or test
local changes:

```bash
git clone https://github.com/eggzec/polpack.git
cd polpack
pip install -e .
```

This invokes the `meson` build system to compile the Fortran sources via
`f2py` and install the resulting extension module in development mode.

!!! warning "Fortran compiler required"
    Source builds require a working Fortran compiler. On most Linux
    distributions install `gfortran`:

```bash
# Debian/Ubuntu
sudo apt install gfortran

# Fedora
sudo dnf install gcc-gfortran

# macOS (Homebrew)
brew install gcc
```

On Windows, install MinGW-w64 with gfortran or use MSYS2.

## Verifying the installation

After installation, verify that the package loads correctly:

```python
import polpack
import numpy as np

n = 10
b = np.zeros(n + 1, dtype=np.int32, order="F")
polpack.bell(n, b)
print("polpack is working! Bell numbers:", b)
```

## Dependencies

| Package | Purpose |
|---|---|
| `numpy` | Array handling, `f2py` integration |

No other runtime dependencies are required.
