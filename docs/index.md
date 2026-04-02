# polpack

**Special Functions and Recursively-Defined Polynomial Families for Python.**

---

## Overview

`polpack` is a Python library for evaluating special functions and recursively-defined polynomial families. The numerical core is based on the original `POLPAK` library, providing efficient routines to evaluate a wide variety of mathematical functions.

A **polynomial family** is a sequence of polynomials where each member is typically defined by its degree. Many such families are defined recursively, where higher-degree polynomials are computed from lower-degree ones. These functions are fundamental in numerical analysis, approximation theory, and physics.

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

## Requirements

- [NumPy](http://www.numpy.org/)

## Example Usage

```python
import numpy as np
import polpack

# Example: Compute the first 11 Bell numbers
# b[n] will contain the n-th Bell number
b = np.zeros(11, dtype=np.int32, order="F")
polpack.bell(10, b)

print(f"Bell numbers B_0 to B_10: {b}")
```

## Main Features

1. **Orthogonal polynomial families**: Chebyshev, Gegenbauer, Hermite, Jacobi, Laguerre, Legendre, and more.
2. **Non-orthogonal polynomial families**: Bernoulli, Bernstein, Cardan, Charlier, Krawtchouk, Meixner, and Zernike polynomials.
3. **Combinatorial sequences**: Bell, Catalan, Delannoy, Motzkin, Stirling, and Fibonacci numbers.
4. **Number-theoretic functions**: Euler totient, Moebius, Mertens, primes, divisors, and Jacobi/Legendre symbols.
5. **Special functions**: Gamma, Beta, error function, Lambert W, Riemann Zeta, and more.
6. **NumPy-based interface**: All routines operate on pre-allocated NumPy arrays for zero-copy performance.

## References

- J. Burkardt, *POLPAK — A Library of Special Polynomial Functions*, [jburkardt.github.io](https://jburkardt.github.io/f_src/polpak/polpak.html)
