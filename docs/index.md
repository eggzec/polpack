# polpack

**Special Functions and Recursively-Defined Polynomial Families for Python**

---

## Overview

`polpack` is a Python library for evaluating special functions and recursively-defined polynomial families. The numerical core is based on the original `POLPAK` library by John Burkardt, providing efficient routines to evaluate a wide variety of mathematical functions used across numerical analysis, combinatorics, physics, and number theory.

A **polynomial family** is a sequence of polynomials $\{P_n(x)\}_{n=0}^\infty$ where each member is typically defined by its degree. Many such families satisfy an **orthogonality condition** — the polynomials are mutually orthogonal under an inner product defined by a weight function over some interval. These families arise naturally in approximation theory, quadrature, quantum mechanics, and signal processing.

`polpack` evaluates these families using **three-term recurrence relations**, which are numerically stable and avoid the catastrophic cancellation errors that can occur with explicit-formula evaluation at high degree.

## Available polynomial families

| Family | Category | Type | Domain |
|---|---|---|---|
| `bernoulli_poly` | Polynomial | Sequence | $\mathbb{R}$ |
| `bernstein_poly` | Polynomial | Basis | $[0, 1]$ |
| `cardan_poly` | Polynomial | Cubic | $\mathbb{R}$ |
| `charlier` | Polynomial | Discrete orthogonal | $\mathbb{N}$ |
| `cheby_t_poly` | Polynomial | Orthogonal | $[-1, 1]$ |
| `cheby_u_poly` | Polynomial | Orthogonal | $[-1, 1]$ |
| `chebyshev_discrete` | Polynomial | Discrete orthogonal | $\mathbb{N}$ |
| `gegenbauer_poly` | Polynomial | Orthogonal | $[-1, 1]$ |
| `gen_hermite_poly` | Polynomial | Orthogonal | $\mathbb{R}$ |
| `gen_laguerre_poly` | Polynomial | Orthogonal | $[0, \infty)$ |
| `hermite_poly_phys` | Polynomial | Orthogonal | $\mathbb{R}$ |
| `jacobi_poly` | Polynomial | Orthogonal | $[-1, 1]$ |
| `krawtchouk` | Polynomial | Discrete orthogonal | $\{0,\ldots,M\}$ |
| `laguerre_associated` | Polynomial | Orthogonal | $[0, \infty)$ |
| `laguerre_poly` | Polynomial | Orthogonal | $[0, \infty)$ |
| `legendre_associated` | Polynomial | Orthogonal | $[-1, 1]$ |
| `legendre_poly` | Polynomial | Orthogonal | $[-1, 1]$ |
| `meixner` | Polynomial | Discrete orthogonal | $\mathbb{N}$ |
| `zernike_poly` | Polynomial | Orthogonal | unit disk |

*(See [API Reference](api.md) for the full list of supported families and routines.)*

## Requirements

- Python 3.10+
- [NumPy](http://www.numpy.org/)

## Example Usage

```python
import numpy as np
import polpack

# Chebyshev polynomials T_0 to T_5 at x = 0.5
m, n, x = 1, 5, 0.5
cx = np.zeros(n + 1, dtype=np.float64, order="F")
polpack.cheby_t_poly(m, n, x, cx)
print(f"T_0({x}) ... T_{n}({x}): {cx}")

# Legendre polynomials P_0 to P_10 and their derivatives at x = 0.0
n, x = 10, 0.0
p = np.zeros(n + 1, dtype=np.float64, order="F")
dp = np.zeros(n + 1, dtype=np.float64, order="F")
polpack.legendre_poly(n, x, p, dp)
print(f"P_n(0.0) for n=0..{n}: {p}")

# Bell numbers B_0 to B_14
n = 14
b = np.zeros(n + 1, dtype=np.int32, order="F")
polpack.bell(n, b)
print(f"Bell numbers B_0..B_{n}: {b}")

# Riemann Zeta function at p = 2 (equals pi^2/6)
z = polpack.zeta(2.0)
print(f"zeta(2) = {z:.8f}")
```

## Main Features

1. **Orthogonal polynomial families** — Chebyshev (first and second kind), Gegenbauer, Hermite (physicist's and generalized), Jacobi, Laguerre (standard, associated, and generalized), Legendre (standard, associated, normalized), and Zernike polynomials.
2. **Non-orthogonal polynomial families** — Bernoulli, Bernstein, Cardan, and Euler polynomials.
3. **Discrete orthogonal polynomials** — Charlier, Chebyshev (discrete), Krawtchouk, and Meixner polynomials.
4. **Polynomial coefficients and zeros** — exact coefficient arrays and Chebyshev node computation for all major families.
5. **Combinatorial sequences** — Bell, Catalan, Delannoy, Motzkin, Stirling, Fibonacci, Vibonacci, Eulerian, and Zeckendorf.
6. **Number-theoretic functions** — Euler totient, Moebius, Mertens, prime testing, prime factorization, divisor sums, Jacobi and Legendre symbols.
7. **Special functions** — Riemann Zeta, Lambert W, Beta, error function (erf), Gamma, Lerch transcendent, Gudermannian, hypergeometric ${}_{2}F_1$, and more.
8. **NumPy-based interface** — all array routines operate on pre-allocated Fortran-order NumPy arrays for zero-copy performance.

## See Also

- [SciPy special functions](https://docs.scipy.org/doc/scipy/reference/special.html) — complementary collection of special functions in Python
- [mpmath](https://mpmath.org/) — arbitrary-precision special functions

## Acknowledgements

The author thanks [John Burkardt](https://jburkardt.github.io/) for the original [POLPAK](https://jburkardt.github.io/f_src/polpak/polpak.html) Fortran library, which provides the numerical core of `polpack`.

## References

- N. D. Cox, 1979, *Tolerance Analysis by Computer*, Journal of Quality Technology, Vol. 11, No. 2, pp. 80–87
- Abramowitz, M., Stegun, I., *Handbook of Mathematical Functions*, National Bureau of Standards, 1964
- Szego, G., *Orthogonal Polynomials*, American Mathematical Society, 1992
