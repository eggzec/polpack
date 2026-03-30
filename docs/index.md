# polpack

**Special Functions and Recursively-Defined Polynomial Families for Python.**

---

## What is polpack?

`polpack` is a Python library for evaluating a wide range of
[special functions](https://en.wikipedia.org/wiki/Special_functions) and
recursively-defined polynomial families. The numerical core is written in
Fortran and exposed through a high-performance Python extension, providing
near-native execution speeds for intense mathematical computations.

Whether you need to compute Bell numbers, evaluate Bernoulli polynomials, or
work with orthogonal polynomial families (Chebyshev, Jacobi, Laguerre, etc.),
`polpack` offers a robust and tested suite of routines.

## Why polpack?

| Feature | Detail |
|---|---|
| **High Performance** | Compiled Fortran core — efficient handling of recursive relations |
| **Comprehensive** | Over 170 routines for sequences, polynomials, and special functions |
| **Pythonic API** | Google-style docstrings and seamless NumPy integration |
| **Memory Efficient** | Supports in-place array modification for large-scale computations |
| **Portability** | Cross-platform support for Linux, macOS, and Windows |

## Key Categories

- **Combinatorial Sequences:** Bell, Bernoulli, Catalan, Eulerian, Fibonacci, Stirling, etc.
- **Polynomial Families:** Bernoulli, Bernstein, Chebyshev, Gegenbauer, Hermite, Jacobi, Laguerre, Legendre, etc.
- **Special Functions:** AGM, Beta, Error function, Gamma, Lambert W, Zeta, etc.
- **Number Theory:** Collatz counts, Moebius, Omega, Phi, Primes, Sigma, Tau, etc.

## Quick example

```python
import numpy as np
import polpack

# Example: Evaluate the first 11 Bell numbers
b = np.zeros(11, dtype=np.int32, order='F')
polpack.bell(10, b)
print(f"Bell numbers B(0..10): {b}")

# Example: Evaluate Legendre polynomials at a point
cx = np.zeros(6, dtype=np.float64, order='F')
cpx = np.zeros(6, dtype=np.float64, order='F')
polpack.legendre_poly(5, 0.5, cx, cpx)
print(f"Legendre P_5(0.5): {cx[5]}")
```

## Licensing

The computer code and data files are distributed under the [GNU LGPL license](LICENSE).

## References

1. Milton Abramowitz, Irene Stegun, **Handbook of Mathematical Functions**, National Bureau of Standards, 1964.
2. Frank Benford, **The Law of Anomalous Numbers**, Proceedings of the American Philosophical Society, Vol. 78, 1938.
3. Robert Corless, et al., **On the Lambert W Function**, Advances in Computational Mathematics, Vol. 5, 1996.
