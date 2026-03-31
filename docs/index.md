# polpack

**Special Functions and Recursively-Defined Polynomial Families for Python.**

---

## What is polpack?

`polpack` is a Python library for evaluating special functions and recursively-defined polynomial families. The numerical core is based on the original `POLPAK` library, providing efficient routines to evaluate a wide variety of mathematical functions.

A **polynomial family** is a sequence of polynomials where each member is typically defined by its degree. Many such families are defined recursively, where higher-degree polynomials are computed from lower-degree ones. These functions are fundamental in numerical analysis, approximation theory, and physics.

`polpack` provides near-native performance by compiling its Fortran core via `f2py`, offering a clean and intuitive NumPy-based Python API.

## Available polynomial families



| Family | Category | Type | Domain |
|---|---|---|---|
| `bernoulli_poly` | Polynomial | Sequence | \( \mathbb{R} \) |
| `bernstein_poly` | Polynomial | Basis | \( [0, 1] \) |
| `cardan_poly` | Polynomial | Cubic | \( \mathbb{R} \) |
| `charlier` | Polynomial | Discrete | \( \mathbb{N} \) |
| `cheby_t_poly` | Polynomial | Orthogonal | \( [-1, 1] \) |
| `gegenbauer_poly` | Polynomial | Orthogonal | \( [-1, 1] \) |
| `jacobi_poly` | Polynomial | Orthogonal | \( [-1, 1] \) |
| `laguerre_poly` | Polynomial | Orthogonal | \( [0, \infty) \) |
| `legendre_poly` | Polynomial | Orthogonal | \( [-1, 1] \) |

*(See [API Reference](api.md) for the full list of supported families and routines.)*

## Quick example

```python
import numpy as np
import polpack

# Example: Compute the first 11 Bell numbers
# b[n] will contain the n-th Bell number
b = np.zeros(11, dtype=np.int32, order="F")
polpack.bell(10, b)

print(f"Bell numbers B_0 to B_10: {b}")
```
