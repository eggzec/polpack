# Quickstart

This guide will help you get started with polpack in Python.

## Working with Sequences

Beyond polynomial families, `polpack` provides routines for various integer 
sequences. These typically follow a similar pattern but return integers 
(or floats for very large values).

### Bell Numbers
The Bell numbers $B_n$ count the number of partitions of a set.

```python
import numpy as np
import polpack

# Compute Bell numbers up to n=10
n = 10
b = np.zeros(n + 1)
polpack.bell(n, b)

print(f"Bell numbers B_0 to B_{n}:")
print(b)
```

---

## Basic Usage

Evaluate the first 10 Bernoulli numbers:

```python
import numpy as np
import polpack

n = 10
# Initialize an array of size n+1 in Fortran order
b = np.zeros(n + 1, dtype=np.float64, order="F")
polpack.bernoulli_number(n, b)
```

This guide provides walk-through examples of how to use `polpack` to evaluate
common polynomial families and combinatorial sequences in Python.

---

## Recursive Polynomials: Chebyshev First Kind

Chebyshev polynomials are fundamental in approximation theory and spectral
methods. In `polpack`, you can evaluate the entire sequence $T_0(x), \dots, T_n(x)$
efficiently in a single call.

```python
import numpy as np
import polpack

# 1. Configuration
m = 1  # Number of points
n = 5  # Highest degree
x = 0.5  # Evaluation point
v = np.zeros(n + 1, dtype=np.float64, order="F")

# 2. Evaluation
polpack.cheby_t_poly(m, n, x, v)

# 3. Results
print(f"Chebyshev T_0({x}) to T_{n}({x}):")
for i, val in enumerate(v):
    print(f"  T_{i}({x}) = {val:.4f}")
```

## Orthogonal Polynomials: Legendre Polynomials

Legendre polynomials are orthogonal on $[-1, 1]$ and arise naturally in
potential theory and spherical harmonics.

```python
import numpy as np
import polpack

# 1. Evaluate Legendre polynomials P_0 to P_10 at x=0.0
n = 10
x = 0.0
p = np.zeros(n + 1, dtype=np.float64, order="F")
# Output array for first derivatives (not used here)
dp = np.zeros(n + 1, dtype=np.float64, order="F")

polpack.legendre_poly(n, x, p, dp)

# 2. Inspect results
# P_n(0.0) = 0 for odd n
print(f"Legendre P_n(0.0) for n=0..10:\n{p}")
```

## Combinatorial Sequences: Bell Numbers

Bell numbers $B_n$ count the number of partitions of a set of size $n$. These 
increase rapidly, so `polpack` typically uses `int32` or `float64` depending
on the routine variant.

```python
import numpy as np
import polpack

# 1. Compute the first 15 Bell numbers
n = 14
b = np.zeros(n + 1, dtype=np.int32, order="F")

polpack.bell(n, b)

# Evaluate the 5th Legendre polynomial at x = 0.5
n = 5
x = 0.5
cx = np.zeros(n + 1, dtype=np.float64, order="F")
cpx = np.zeros(n + 1, dtype=np.float64, order="F")  # for derivatives

polpack.legendre_poly(n, x, cx, cpx)

print(f"P_5({x}) = {cx[n]}")
print(f"P_5'({x}) = {cpx[n]}")
```

### Coefficient calculation

```python
import numpy as np
import polpack

# Get coefficients of the 4th-order Chebyshev polynomial T_4(x)
n = 4
# Space for (n+1) x (n+1) coefficient matrix
c = np.zeros((n + 1, n + 1), dtype=np.float64, order="F")
polpack.cheby_t_poly_coef(n, c)

print("Chebyshev T_4 coefficients (highest power first):")
print(c[n, :])
```

## Special functions

Evaluate functions like the Gamma function or Riemann Zeta function.

```python
import polpack

# Evaluate Riemann Zeta function at p = 2.0 (pi^2 / 6)
p = 2.0
z = polpack.zeta(p)
print(f"Zeta({p}) = {z:.6f}")
```
