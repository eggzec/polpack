# API Reference

All routines in `polpack` are exposed via the top-level `polpack` package. The underlying numerical routines are implemented in Fortran and accessed through the `_polpack` extension module.

---

## Calling Convention

Most `polpack` routines for sequences and polynomials follow a consistent calling convention where the results are stored in a pre-allocated NumPy array passed as an argument.

### Array Requirements

For routines that modify arrays in-place:
1. **Dtype:** Must match the expected Fortran type (usually `np.int32` for combinatorial counts and `np.float64` for polynomial values).
2. **Order:** Arrays **must** be initialized with Fortran memory layout (`order='F'`) for optimal performance and compatibility with the Fortran core.
3. **Size:** The array must be correctly sized (e.g., `n+1` for polynomials of degree `n`).

```python
import numpy as np
import polpack

# Correct initialization
n = 10
b = np.zeros(n + 1, dtype=np.int32, order='F')
polpack.bell(n, b)
```

---

## Combinatorial Sequences

- **bell(n, b)**: Evaluates the Bell numbers $B_0, \dots, B_n$.
- **catalan(n, c)**: Evaluates the Catalan numbers $C_0, \dots, C_n$.
- **stirling1(n, m, s1)**: Evaluates the Stirling numbers of the first kind.
- **stirling2(n, m, s2)**: Evaluates the Stirling numbers of the second kind.
- **fibonacci_recursive(n, f)**: Evaluates the first $n$ Fibonacci numbers.
- **eulerian(n, k)**: Evaluates the Eulerian number $E(n, k)$.
- **motzkin(n, a)**: Evaluates the Motzkin numbers up to order $n$.

## Special Functions

- **r8_beta(x, y)**: Evaluates the Beta function.
- **r8_gamma_log(x)**: Evaluates log(Gamma(X)).
- **zeta(p)**: Evaluates the Riemann Zeta function.
- **lambert_w(x)**: Estimates the Lambert W function.

## Number Theory

- **i4_is_prime(n)**: Reports whether an integer is prime.
- **phi(n)**: Evaluates the Euler phi function.
- **sigma(n)**: Evaluates the divisor sum function.
- **tau(n)**: Evaluates the number of distinct divisors.
