# Quickstart

This guide will help you get started with polpack in Python.

## Basic Usage

Evaluate the first 10 Bernoulli numbers:

```python
import numpy as np
import polpack

n = 10
# Initialize an array of size n+1 in Fortran order
b = np.zeros(n + 1, dtype=np.float64, order="F")
polpack.bernoulli_number(n, b)
This guide shows you how to use `polpack` for common mathematical tasks.

## Combinatorial counts

To compute sequences like Bell numbers or Catalan numbers, pass a pre-allocated NumPy array to the routine.

```python
import numpy as np
import polpack

# Compute first 11 Bell numbers
n = 10
b = np.zeros(n + 1, dtype=np.int32, order='F')
polpack.bell(n, b)
print(f"Bell numbers: {b}")
```

## Polynomial evaluation

`polpack` provides routines for evaluating polynomial families at specific points or computing their coefficients.

### Point evaluation

```python
import numpy as np
import polpack

# Evaluate the 5th Legendre polynomial at x = 0.5
n = 5
x = 0.5
cx = np.zeros(n + 1, dtype=np.float64, order='F')
cpx = np.zeros(n + 1, dtype=np.float64, order='F') # for derivatives

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
c = np.zeros((n + 1, n + 1), dtype=np.float64, order='F')
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
