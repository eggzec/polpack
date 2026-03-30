# polpack

**Special Functions and Recursively-Defined Polynomial Families for Python**

[![Tests](https://github.com/eggzec/polpack/actions/workflows/test.yml/badge.svg)](https://github.com/eggzec/polpack/actions/workflows/test.yml)
[![Documentation](https://github.com/eggzec/polpack/actions/workflows/docs.yml/badge.svg)](https://github.com/eggzec/polpack/actions/workflows/docs.yml)

[![License: LGPL-2.1](https://img.shields.io/badge/License-LGPL%202.1-blue.svg)](LICENSE)
[![PyPI Downloads](https://img.shields.io/pypi/dm/polpack.svg?label=PyPI%20downloads)](https://pypi.org/project/polpack/)
[![Python versions](https://img.shields.io/pypi/pyversions/polpack.svg)](https://pypi.org/project/polpack/)

`polpack` is a high-performance Python library for evaluating special functions and recursively-defined polynomial families. The numerical core is written in Fortran and exposed via a Pythonic interface with comprehensive Google-style docstrings.

## Quick example

```python
import numpy as np
import polpack

# Example: Compute Bell numbers up to order 10
b = np.zeros(11, dtype=np.int32, order='F')
polpack.bell(10, b)
print(f"Bell numbers: {b}")
```

## Installation

```bash
pip install polpack
```

Requires Python 3.10+ and NumPy. See the [full installation guide](https://eggzec.github.io/polpack/installation/) for conda, poetry, and source builds.

## Documentation

- [Theory](https://eggzec.github.io/polpack/theory/) — mathematical background
- [Quickstart](https://eggzec.github.io/polpack/quickstart/) — runnable examples
- [API Reference](https://eggzec.github.io/polpack/api/) — function signatures and parameters
- [References](https://eggzec.github.io/polpack/references/) — literature citations

## License

LGPL-2.1 — see [LICENSE](LICENSE).
