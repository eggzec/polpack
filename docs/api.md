# API Reference

All public routines are exported via the `polpack` Python module in lowercase.

---

## Overview

`polpack` includes routines to evaluate a variety of recursively defined 
polynomial families and special functions. Most generators follow a three-term 
recurrence and write the output into a pre-allocated NumPy array.

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

---

## Common interface

### Arguments

| Argument | Type | Direction | Description |
|---|---|---|---|
| `n` | `int` | input | Highest degree or number of terms to compute |
| `x` | `float` | input | Evaluation point |
| `v` | `ndarray` | in/out | Pre-allocated output array of size `n+1` |

!!! warning "Array allocation"
    The output array `v` must be pre-allocated with the correct size before
    calling the routine. Passing an undersized array will raise a runtime error.

---

## Orthogonal Polynomials

### `cheby_t_poly(m, n, x, cx)`
**Chebyshev polynomials of the first kind.**

- `m` (int): Number of evaluation points.
- `n` (int): Highest degree.
- `x` (ndarray[m]): Evaluation points.
- `cx` (ndarray[m, n+1]): Output matrix.

### `gegenbauer_poly(n, alpha, x, cx)`
**Gegenbauer polynomials.**

- `n` (int): Highest degree.
- `alpha` (float): Parameter \( \alpha > -1/2 \).
- `x` (float): Evaluation point.
- `cx` (ndarray[n+1]): Output array.

### `hermite_poly_phys(n, x, cx)`
**Hermite polynomials (Physicist's).**

- `n` (int): Highest degree.
- `x` (float): Evaluation point.
- `cx` (ndarray[n+1]): Output array.

### `jacobi_poly(n, alpha, beta, x, cx)`
**Jacobi polynomials.**

- `n` (int): Highest degree.
- `alpha` (float): Parameter \( \alpha \).
- `beta` (float): Parameter \( \beta \).
- `x` (float): Evaluation point.
- `cx` (ndarray[n+1]): Output array.

### `laguerre_poly(n, x, cx)`
**Laguerre polynomials.**

- `n` (int): Highest degree.
- `x` (float): Evaluation point.
- `cx` (ndarray[n+1]): Output array.

### `legendre_poly(n, x, cx, cpx)`
**Legendre polynomials.**

- `n` (int): Highest degree.
- `x` (float): Evaluation point.
- `cx` (ndarray[n+1]): Output array \( P_n(x) \).
- `cpx` (ndarray[n+1]): Output array of derivatives \( P'_n(x) \).

---

## Combinatorial Sequences

### `bell(n, b)`
**Bell numbers.**

- `n` (int): Highest index.
- `b` (ndarray[n+1]): Output array of Bell numbers \( B_0, \dots, B_n \).

### `catalan(n, c)`
**Catalan numbers.**

- `n` (int): Highest index.
- `c` (ndarray[n+1]): Output array of Catalan numbers \( C_0, \dots, C_n \).

### `stirling1(n, m, s1)` / `stirling2(n, m, s2)`
**Stirling numbers.**

- `n` (int): Number of elements.
- `m` (int): Number of subsets/cycles.
- `s1/s2` (ndarray[n, m]): Output matrix.

---

## Detailed Routine Reference

### Bernoulli and Euler Sequences

#### `bernoulli_number(n, b)`
Computes the sequence of Bernoulli numbers \( B_0, \dots, B_n \).

- `n` (int): Highest index.
- `b` (ndarray[n+1]): Output array.

#### `bernoulli_poly(n, x, bx)`
Evaluates the Bernoulli polynomial \( B_n(x) \) at \( x \).

- `n` (int): Degree.
- `x` (float): Evaluation point.
- `bx` (float): Output value.

#### `euler_number(n, e)`
Computes the sequence of Euler numbers \( E_0, \dots, E_n \).

- `n` (int): Highest index.
- `e` (ndarray[n+1]): Output array.

#### `euler_poly(n, x)`
Evaluates the \( n \)-th Euler polynomial \( E_n(x) \) at \( x \).

- `n` (int): Degree.
- `x` (float): Evaluation point.
- Returns `float`.

### Bernstein Polynomials

#### `bernstein_poly(n, x, bern)`
Evaluates the \( n+1 \) Bernstein basis polynomials of degree \( n \) at \( x \in [0, 1] \).

- `n` (int): Degree.
- `x` (float): Evaluation point.
- `bern` (ndarray[n+1]): Output array of basis values.

#### `bpab(n, x, a, b, bern)`
Evaluates the \( n+1 \) Bernstein basis polynomials of degree \( n \) on \( [a, b] \).

- `n` (int): Degree.
- `x` (float): Evaluation point.
- `a, b` (float): Interval boundaries.
- `bern` (ndarray[n+1]): Output array of basis values.

### Fibonacci and Power Sequences

#### `fibonacci_recursive(n, f)`
Computes the first \( n \) Fibonacci numbers.

- `n` (int): Number of terms.
- `f` (ndarray[n]): Output array.

#### `fibonacci_direct(n, f)`
Computes the \( n \)-th Fibonacci number using the closed-form Binet formula.

- `n` (int): Index.
- `f` (int): Output value.

### Stirling Sequences

#### `stirling1(n, m, s1)`
Computes the Stirling numbers of the first kind \( s(n, k) \).

- `n` (int): Order.
- `m` (int): Term index.
- `s1` (ndarray[n, m]): Output matrix.

#### `stirling2(n, m, s2)`
Computes the Stirling numbers of the second kind \( S(n, k) \).

- `n` (int): Order.
- `m` (int): Term index.
- `s2` (ndarray[n, m]): Output matrix.

---

### Special Math Functions

#### `agm_values(n_data, a, b, fx)`
Returns tabulated values of the Arithmetic-Geometric Mean.

- `n_data` (int): Index of the value to retrieve (0 for first).
- `a, b` (float): Parameters.
- `fx` (float): Output AGM value.

#### `agud(g)`
Evaluates the inverse Gudermannian function.

- `g` (float): Input value.
- Returns `float`.

#### `beta_values(n_data, x, y, fxy)`
Returns tabulated values of the Beta function \( \text{B}(x, y) \).

#### `erf_values(n_data, x, fx)`
Returns tabulated values of the error function \( \text{erf}(x) \).

#### `gamma_values(n_data, x, fx)`
Returns tabulated values of the Gamma function \( \Gamma(x) \).

#### `lambert_w(x)`
Estimates the Lambert W function \( W(x) \), the inverse of \( f(w) = we^w \).

---

### Number Theory and Primality

| Routine | Parameters | Description |
|---|---|---|
| `phi(n, phin)` | `n` (int): input<br>`phin` (int): out | Euler totient function \( \phi(n) \). |
| `moebius(n, mu)` | `n` (int): input<br>`mu` (int): out | Moebius function \( \mu(n) \). |
| `mertens(n)` | `n` (int): input | Mertens function \( M(n) \) (returns int). |
| `prime(n)` | `n` (int): input | Returns the \( n \)-th prime number. |
| `i4_is_prime(n)` | `n` (int): input | Primality test (returns bool). |
| `i4_factor(...)` | `n`, `f_max`, `f_num`, `f`, `p`, `nleft` | Prime factorization into components. |
| `sigma(n, sigma_n)` | `n` (int): input<br>`sigma_n` (int): out | Sum of divisors \( \sigma(n) \). |
| `tau(n, taun)` | `n` (int): input<br>`taun` (int): out | Number of divisors \( \tau(n) \). |
| `jacobi_symbol(q, p, j)` | `q, p` (int), `j` (int): out | Jacobi symbol \( (q/p) \). |
| `legendre_symbol(q, p, l)` | `q, p` (int), `l` (int): out | Legendre symbol \( (q/p) \). |

### Sequences and Series

| Routine | Parameters | Description |
|---|---|---|
| `catalan(n, c)` | `n` (int), `c` (ndarray) | Catalan numbers sequence. |
| `delannoy(m, n, a)` | `m`, `n` (int), `a` (ndarray) | Delannoy numbers matrix. |
| `motzkin(n, a)` | `n` (int), `a` (ndarray) | Motzkin numbers sequence. |
| `vibonacci(n, seed, v)` | `n`, `seed` (int), `v` (ndarray) | Random Vibonacci terms. |
| `collatz_count(n)` | `n` (int): input | Sequence length (returns int). |
| `collatz_count_max(...)` | `n, i_max, j_max` | Maximum count in range \( [1, n] \). |

### Special Utilities

| Routine | Parameters | Description |
|---|---|---|
| `agm_values(...)` | `n_data, a, b, fx` | Arithmetic-Geometric Mean data. |
| `i4_choose(n, k)` | `n, k` (int) | Binomial coefficient (returns int). |
| `i4_swap(i, j)` | `i, j` (int) | Swaps values in-place (in/out). |
| `i4_huge()` | (none) | Returns largest representable i4. |
| `zeckendorf(...)` | `n, m_max, m, i_l, f_l` | Zeckendorf representation decomposition. |
| `complete_symmetric_poly` | `n, r, x, value` | Evaluates \( h_r(x_1, \dots, x_n) \). |
| `zernike_poly` | `m, n, rho, z` | Zernike polynomial at \( \rho \). |
| `zeta(p)` | `p` (float): input | Riemann Zeta function \( \zeta(p) \) (returns float). |
