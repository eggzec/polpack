# Quickstart

This quickstart demonstrates how to use `polpack` to evaluate polynomial families,
combinatorial sequences, and special functions. For mathematical background, see the
[Theory](theory.md) section.

---

## Common Interface

Most `polpack` routines follow a consistent pattern: you pre-allocate a NumPy array,
pass it to the routine along with parameters, and the routine fills it in place.

```python
import numpy as np
import polpack

# Pattern: pre-allocate output array, then call routine
n = 5  # highest degree
x = 0.5  # evaluation point
cx = np.zeros(n + 1, dtype=np.float64, order="F")  # (1)

polpack.cheby_t_poly(1, n, x, cx)
# cx[k] now contains T_k(x) for k = 0, 1, ..., n
```

!!! note "Array order"
    All output arrays must be pre-allocated. Use `order="F"` (Fortran-contiguous)
    for consistency with the underlying Fortran core. Integer routines typically
    use `dtype=np.int32`; floating-point routines use `dtype=np.float64`.

---

## Orthogonal Polynomials

### Chebyshev Polynomials (First Kind)

Chebyshev polynomials $T_n(x)$ are optimal for function approximation — they minimize
the maximum absolute error among all degree-$n$ polynomials with leading coefficient 1.

```python
import numpy as np
import polpack

m = 1  # number of evaluation points
n = 6  # highest degree
x = 0.5  # evaluation point

cx = np.zeros(n + 1, dtype=np.float64, order="F")
polpack.cheby_t_poly(m, n, x, cx)

print(f"Chebyshev T_k({x}) for k = 0 ... {n}:")
for k, val in enumerate(cx):
    print(f"  T_{k}({x}) = {val:.6f}")
```

To get the polynomial coefficients or zeros of $T_n$:

```python
import numpy as np
import polpack

n = 4
c = np.zeros((n + 1, n + 1), dtype=np.float64, order="F")
polpack.cheby_t_poly_coef(n, c)
print(f"Coefficients of T_{n}(x) (lowest to highest power):\n{c[n, :]}")

z = np.zeros(n, dtype=np.float64, order="F")
polpack.cheby_t_poly_zero(n, z)
print(f"Zeros of T_{n}(x): {z}")
```

### Legendre Polynomials

Legendre polynomials $P_n(x)$ are orthogonal on $[-1, 1]$ with unit weight. They arise
in potential theory, Gauss-Legendre quadrature, and spherical harmonics.

```python
import numpy as np
import polpack

n = 10
x = 0.5
p = np.zeros(n + 1, dtype=np.float64, order="F")
dp = np.zeros(n + 1, dtype=np.float64, order="F")  # first derivatives

polpack.legendre_poly(n, x, p, dp)

print(f"P_n({x}) for n = 0 ... {n}:")
for k in range(n + 1):
    print(f"  P_{k}({x}) = {p[k]:.6f},  P'_{k}({x}) = {dp[k]:.6f}")
```

### Hermite Polynomials (Physicist's)

Hermite polynomials $H_n(x)$ arise in quantum mechanics (harmonic oscillator) and
probability (Gaussian integration).

```python
import numpy as np
import polpack

n = 5
x = 1.0
cx = np.zeros(n + 1, dtype=np.float64, order="F")

polpack.hermite_poly_phys(n, x, cx)

print(f"H_n({x}) for n = 0 ... {n}:")
for k, val in enumerate(cx):
    print(f"  H_{k}({x}) = {val:.4f}")
```

### Jacobi Polynomials

Jacobi polynomials $P_n^{(\alpha,\beta)}(x)$ generalize both Legendre ($\alpha=\beta=0$)
and Chebyshev polynomials. They are orthogonal on $[-1, 1]$ with weight
$(1-x)^\alpha (1+x)^\beta$.

```python
import numpy as np
import polpack

n = 5
alpha, beta = 0.5, 0.5  # reduces to Gegenbauer with parameter 1.0
x = 0.3
cx = np.zeros(n + 1, dtype=np.float64, order="F")

polpack.jacobi_poly(n, alpha, beta, x, cx)

print(f"P_k^({alpha},{beta})({x}) for k = 0 ... {n}:")
for k, val in enumerate(cx):
    print(f"  P_{k}({x}) = {val:.6f}")
```

### Laguerre Polynomials

Laguerre polynomials $L_n(x)$ are orthogonal on $[0, \infty)$ with weight $e^{-x}$.
They appear in the radial wavefunctions of the hydrogen atom.

```python
import numpy as np
import polpack

n = 6
x = 1.5
cx = np.zeros(n + 1, dtype=np.float64, order="F")

polpack.laguerre_poly(n, x, cx)

print(f"L_n({x}) for n = 0 ... {n}:")
for k, val in enumerate(cx):
    print(f"  L_{k}({x}) = {val:.6f}")
```

### Gegenbauer (Ultraspherical) Polynomials

Gegenbauer polynomials $C_n^{(\alpha)}(x)$ generalize both Legendre ($\alpha=1/2$) and
Chebyshev ($\alpha=1$) polynomials.

```python
import numpy as np
import polpack

n = 4
alpha = 1.0  # reduces to Chebyshev U when alpha = 1
x = 0.5
cx = np.zeros(n + 1, dtype=np.float64, order="F")

polpack.gegenbauer_poly(n, alpha, x, cx)
print(f"C_k^({alpha})({x}) for k = 0 ... {n}: {cx}")
```

---

## Bernstein Polynomials

Bernstein basis polynomials form the foundation of Bézier curves. All $n+1$ basis
functions of degree $n$ are evaluated in a single call.

```python
import numpy as np
import polpack

n = 3  # degree
x = 0.4  # point in [0, 1]
bern = np.zeros(n + 1, dtype=np.float64, order="F")

polpack.bernstein_poly(n, x, bern)

print(f"Bernstein basis B_{{k,{n}}}({x}) for k = 0 ... {n}:")
for k, val in enumerate(bern):
    print(f"  B_{k},{n}({x}) = {val:.6f}")

# Verify partition of unity: sum should be 1.0
print(f"Sum = {bern.sum():.6f}")
```

For evaluation on a general interval $[a, b]$:

```python
import numpy as np
import polpack

n = 3
x, a, b = 2.0, 1.0, 4.0
bern = np.zeros(n + 1, dtype=np.float64, order="F")

polpack.bpab(n, x, a, b, bern)
print(f"Bernstein basis on [{a}, {b}] at x={x}: {bern}")
```

---

## Combinatorial Sequences

### Bell Numbers

The Bell number $B_n$ counts the number of ways to partition a set of $n$ elements.

```python
import numpy as np
import polpack

n = 14
b = np.zeros(n + 1, dtype=np.int32, order="F")
polpack.bell(n, b)

print(f"Bell numbers B_0 ... B_{n}:")
for k, val in enumerate(b):
    print(f"  B_{k} = {val}")
```

### Catalan Numbers

The Catalan number $C_n$ counts binary trees, valid parenthesizations, and many other
combinatorial structures.

```python
import numpy as np
import polpack

n = 10
c = np.zeros(n + 1, dtype=np.int32, order="F")
polpack.catalan(n, c)
print(f"Catalan numbers C_0 ... C_{n}: {c}")
```

### Stirling Numbers

Stirling numbers of the **first kind** $s(n, k)$ count permutations of $n$ objects with
exactly $k$ cycles. Stirling numbers of the **second kind** $S(n, k)$ count the number
of ways to partition $n$ objects into $k$ non-empty subsets.

```python
import numpy as np
import polpack

n, m = 6, 6
s1 = np.zeros((n, m), dtype=np.int32, order="F")
s2 = np.zeros((n, m), dtype=np.int32, order="F")

polpack.stirling1(n, m, s1)
polpack.stirling2(n, m, s2)

print("Stirling numbers of the first kind s(n,k):")
print(s1)
print("\nStirling numbers of the second kind S(n,k):")
print(s2)
```

### Fibonacci Numbers

```python
import numpy as np
import polpack

# Recursive: compute F_1 ... F_n
n = 15
f = np.zeros(n, dtype=np.int32, order="F")
polpack.fibonacci_recursive(n, f)
print(f"Fibonacci F_1 ... F_{n}: {f}")

# Zeckendorf decomposition: represent N as sum of non-consecutive Fibonacci numbers
n_val = 100
m_max = 20
m = np.zeros(1, dtype=np.int32, order="F")
il = np.zeros(m_max, dtype=np.int32, order="F")
fl = np.zeros(m_max, dtype=np.int32, order="F")
polpack.zeckendorf(n_val, m_max, m, il, fl)
terms = fl[: m[0]]
print(f"{n_val} = {' + '.join(str(v) for v in terms)}")
```

### Delannoy and Motzkin Numbers

```python
import numpy as np
import polpack

# Delannoy numbers: paths from (0,0) to (m,n) using steps (1,0), (0,1), (1,1)
m, n = 5, 5
a = np.zeros((m + 1, n + 1), dtype=np.int32, order="F")
polpack.delannoy(m, n, a)
print(f"Delannoy A(m,n):\n{a}")

# Motzkin numbers
n = 10
mo = np.zeros(n + 1, dtype=np.int32, order="F")
polpack.motzkin(n, mo)
print(f"Motzkin numbers M_0 ... M_{n}: {mo}")
```

---

## Number Theory

### Euler Totient and Divisor Functions

```python
import numpy as np
import polpack

# Euler totient: phi(n) = number of integers in [1,n] coprime to n
n = 12
phin = np.zeros(1, dtype=np.int32, order="F")
polpack.phi(n, phin)
print(f"phi({n}) = {phin[0]}")

# Sum of divisors sigma(n)
sigma_n = np.zeros(1, dtype=np.int32, order="F")
polpack.sigma(n, sigma_n)
print(f"sigma({n}) = {sigma_n[0]}")

# Number of divisors tau(n)
taun = np.zeros(1, dtype=np.int32, order="F")
polpack.tau(n, taun)
print(f"tau({n}) = {taun[0]}")
```

### Prime Numbers and Factorization

```python
import numpy as np
import polpack

# n-th prime (up to n=1600, largest prime stored is 13499)
p10 = polpack.prime(10)
print(f"The 10th prime is {p10}")

# Primality test
for candidate in [17, 18, 97, 100]:
    result = polpack.i4_is_prime(candidate)
    print(f"i4_is_prime({candidate}) = {result}")

# Prime factorization: n = product(factor[i]^power[i]) * nleft
n = 360
factor_max = 20
factor_num = np.zeros(1, dtype=np.int32, order="F")
factor = np.zeros(factor_max, dtype=np.int32, order="F")
power = np.zeros(factor_max, dtype=np.int32, order="F")
nleft = np.zeros(1, dtype=np.int32, order="F")
polpack.i4_factor(n, factor_max, factor_num, factor, power, nleft)
nf = factor_num[0]
parts = " * ".join(f"{factor[i]}^{power[i]}" for i in range(nf))
print(f"{n} = {parts}")
```

### Moebius and Mertens Functions

```python
import numpy as np
import polpack

for n in [1, 6, 12, 13]:
    mu = np.zeros(1, dtype=np.int32, order="F")
    polpack.moebius(n, mu)
    m = polpack.mertens(n)
    print(f"mu({n}) = {mu[0]},  M({n}) = {m}")
```

---

## Special Functions

### Riemann Zeta Function

```python
import polpack
import math

for p in [2.0, 3.0, 4.0]:
    z = polpack.zeta(p)
    print(f"zeta({p}) = {z:.8f}")

# Verification: zeta(2) = pi^2/6
print(f"pi^2/6     = {math.pi**2 / 6:.8f}")
```

### Lambert W Function

The Lambert W function satisfies $W(x) \cdot e^{W(x)} = x$.

```python
import polpack

for x in [1.0, math.e, 10.0]:
    w = polpack.lambert_w(x)
    print(f"W({x:.4f}) = {w:.8f}  [check: W*exp(W) = {w * math.exp(w):.8f}]")
```

### Error Function

```python
import polpack

for x in [0.0, 0.5, 1.0, 2.0]:
    e = polpack.r8_erf(x)
    print(f"erf({x}) = {e:.8f}")
```

### Bernoulli Numbers

```python
import numpy as np
import polpack

n = 12
b = np.zeros(n + 1, dtype=np.float64, order="F")
polpack.bernoulli_number(n, b)

print(f"Bernoulli numbers B_0 ... B_{n}:")
for k, val in enumerate(b):
    if val != 0.0:
        print(f"  B_{k} = {val:.10f}")
```

### Collatz Sequences

```python
import polpack

for start in [6, 27, 100]:
    steps = polpack.collatz_count(start)
    print(f"Collatz({start}): {steps} steps to reach 1")

# Find the integer in [1, N] with the longest Collatz sequence
n = 1000
i_max = np.zeros(1, dtype=np.int32, order="F")
j_max = np.zeros(1, dtype=np.int32, order="F")
polpack.collatz_count_max(n, i_max, j_max)
print(f"In [1, {n}]: longest sequence starts at {i_max[0]} ({j_max[0]} steps)")
```

---

## Spherical Harmonics

`polpack` can evaluate the real and imaginary parts of the spherical harmonic
function $Y_l^m(\theta, \phi)$:

```python
import numpy as np
import polpack

l, m = 2, 1
theta = 0.5  # polar angle (radians)
phi = 1.0  # azimuthal angle (radians)

c = np.zeros(1, dtype=np.float64, order="F")  # real part
s = np.zeros(1, dtype=np.float64, order="F")  # imaginary part

polpack.spherical_harmonic(l, m, theta, phi, c, s)
print(f"Y_{l}^{m}(theta={theta}, phi={phi})")
print(f"  Real part      = {c[0]:.8f}")
print(f"  Imaginary part = {s[0]:.8f}")
```
