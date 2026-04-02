# Installation

`polpack` can be installed from PyPI or directly from source via GitHub.

---

## [PyPI](https://pypi.org/project/polpack)

For using the PyPI package in your project, add it to your configuration file:

=== "pyproject.toml"

    ```toml
    [project.dependencies]
    polpack = "*" # (1)!
    ```

    1. Specifying a version is recommended

=== "requirements.txt"

    ```
    polpack>=0.1.0
    ```

### pip

=== "Installation for user"

    ```bash
    pip install --upgrade --user polpack # (1)!
    ```

    1. You may need to use `pip3` instead of `pip` depending on your Python installation.

=== "Installation in virtual environment"

    ```bash
    python -m venv .venv
    source .venv/bin/activate
    pip install --require-virtualenv --upgrade polpack # (1)!
    ```

    1. You may need to use `pip3` instead of `pip` depending on your Python installation.

    !!! note
        The command to activate the virtual environment depends on your platform and shell.
        [More info](https://docs.python.org/3/library/venv.html#how-venvs-work)

### uv

=== "Adding to uv project"

    ```bash
    uv add polpack
    uv sync
    ```

=== "Installing to uv environment"

    ```bash
    uv venv
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

---

## [GitHub](https://github.com/eggzec/polpack)

Install the latest development version directly from the repository:

```bash
pip install --upgrade "git+https://github.com/eggzec/polpack.git#egg=polpack"
```

### Building locally

Clone and build from source if you want to modify or test local changes:

```bash
git clone https://github.com/eggzec/polpack.git
cd polpack
pip install -e .
```

This invokes the `meson` build system to compile the Fortran sources and install
the resulting extension module in development mode.

!!! warning "Fortran compiler required"
    Source builds require a working Fortran compiler. On most Linux distributions,
    install `gfortran`:

    === "Debian / Ubuntu"
        ```bash
        sudo apt install gfortran
        ```
    === "Fedora"
        ```bash
        sudo dnf install gcc-gfortran
        ```
    === "macOS (Homebrew)"
        ```bash
        brew install gcc
        ```
    === "Windows"
        Install [MinGW-w64](https://www.mingw-w64.org/) with gfortran or use MSYS2.

---

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

---

## Dependencies

| Package | Purpose |
|---|---|
| `numpy` | Array handling and `f2py` integration |

No other runtime dependencies are required.

For source builds, you additionally need:

| Package | Purpose |
|---|---|
| `gfortran` | Compiling Fortran sources |
| `meson` and `meson-python` | Build system |
| `numpy` | Required by `f2py` at build time |
