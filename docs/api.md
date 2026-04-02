# API Reference

All public routines are exported directly via the `polpack` Python module.

---

## Overview

`polpack` provides routines to evaluate recursively-defined polynomial families,
combinatorial sequences, number-theoretic functions, and special functions.
Most array-valued routines write their output into a **pre-allocated NumPy array**
passed by the caller.

### Common argument conventions

| Argument | Type | Direction | Description |
|---|---|---|---|
| `n` | `int` | input | Highest degree or largest index to compute |
| `x` | `float` | input | Evaluation point |
| `v` | `ndarray` | output | Pre-allocated output array, size `n+1` |

!!! warning "Array allocation"
    Output arrays **must** be pre-allocated before calling any routine.
    Passing an undersized array will raise a runtime error.

!!! note "Array order"
    Use `order="F"` when allocating output arrays. Integer-valued sequences
    use `dtype=np.int32`; floating-point routines use `dtype=np.float64`.

---

## Orthogonal Polynomial Families

### `cheby_t_poly(m, n, x, cx)`
**Chebyshev polynomials of the first kind** $T_0(x), \ldots, T_n(x)$.

- `m` (int): Number of evaluation points (typically 1 for scalar evaluation).
- `n` (int): Highest degree.
- `x` (float or ndarray[m]): Evaluation point(s).
- `cx` (ndarray[m, n+1]): Output array. For scalar evaluation (`m=1`), use shape `(n+1,)`.

For $x \in [-1, 1]$: $T_k(x) = \cos(k \arccos x)$.

```python
import numpy as np, polpack

cx = np.zeros(6, dtype=np.float64, order="F")
polpack.cheby_t_poly(1, 5, 0.5, cx)
```

### `cheby_u_poly(m, n, x, cx)`
**Chebyshev polynomials of the second kind** $U_0(x), \ldots, U_n(x)$.

- `m` (int): Number of evaluation points.
- `n` (int): Highest degree.
- `x` (float or ndarray[m]): Evaluation point(s).
- `cx` (ndarray[m, n+1]): Output array.

For $x \in [-1, 1]$: $U_k(x) = \sin((k+1)\arccos x) / \sqrt{1-x^2}$.

### `gegenbauer_poly(n, alpha, x, cx)`
**Gegenbauer (ultraspherical) polynomials** $C_0^{(\alpha)}(x), \ldots, C_n^{(\alpha)}(x)$.

- `n` (int): Highest degree.
- `alpha` (float): Shape parameter; must satisfy $\alpha > -1/2$.
- `x` (float): Evaluation point.
- `cx` (ndarray[n+1]): Output array.

Special case: `alpha=1` gives Chebyshev $U_n$; `alpha=0.5` gives Legendre $P_n$.

### `hermite_poly_phys(n, x, cx)`
**Physicist's Hermite polynomials** $H_0(x), \ldots, H_n(x)$.

- `n` (int): Highest degree.
- `x` (float): Evaluation point.
- `cx` (ndarray[n+1]): Output array.

Recurrence: $H_{n+1}(x) = 2x H_n(x) - 2n H_{n-1}(x)$.

### `gen_hermite_poly(n, x, mu, p)`
**Generalized Hermite polynomials** orthogonal under $|x|^{2\mu} e^{-x^2}$.

- `n` (int): Highest degree.
- `x` (float): Evaluation point.
- `mu` (float): Shape parameter; `mu=0` gives the standard Hermite polynomial.
- `p` (ndarray[n+1]): Output array.

### `jacobi_poly(n, alpha, beta, x, cx)`
**Jacobi polynomials** $P_0^{(\alpha,\beta)}(x), \ldots, P_n^{(\alpha,\beta)}(x)$.

- `n` (int): Highest degree.
- `alpha` (float): First shape parameter; must satisfy $\alpha > -1$.
- `beta` (float): Second shape parameter; must satisfy $\beta > -1$.
- `x` (float): Evaluation point.
- `cx` (ndarray[n+1]): Output array.

### `laguerre_poly(n, x, cx)`
**Laguerre polynomials** $L_0(x), \ldots, L_n(x)$.

- `n` (int): Highest degree.
- `x` (float): Evaluation point; typically $x \geq 0$.
- `cx` (ndarray[n+1]): Output array.

### `laguerre_associated(n, m, x, cx)`
**Associated Laguerre polynomials** $L_0^m(x), \ldots, L_n^m(x)$.

- `n` (int): Highest degree.
- `m` (int): Association order; $m \geq 0$.
- `x` (float): Evaluation point.
- `cx` (ndarray[n+1]): Output array.

### `gen_laguerre_poly(n, alpha, x, cx)`
**Generalized (associated) Laguerre polynomials** $L_n^{(\alpha)}(x)$.

- `n` (int): Highest degree.
- `alpha` (float): Shape parameter; must satisfy $\alpha > -1$.
- `x` (float): Evaluation point.
- `cx` (ndarray[n+1]): Output array.

### `legendre_poly(n, x, cx, cpx)`
**Legendre polynomials** $P_0(x), \ldots, P_n(x)$ and their first derivatives.

- `n` (int): Highest degree.
- `x` (float): Evaluation point.
- `cx` (ndarray[n+1]): Output array $P_k(x)$.
- `cpx` (ndarray[n+1]): Output array of first derivatives $P_k'(x)$.

### `legendre_associated(n, m, x, cx)`
**Associated Legendre functions** $P_n^m(x)$.

- `n` (int): Maximum degree.
- `m` (int): Order; $0 \leq m \leq n$.
- `x` (float): Evaluation point; $-1 \leq x \leq 1$.
- `cx` (ndarray[n+1]): Output array.

### `legendre_associated_normalized(n, m, x, cx)`
**Normalized associated Legendre functions** with the normalization factor
$\sqrt{(2n+1)(n-m)! / (2(n+m)!)}$ applied.

- `n` (int): Maximum degree.
- `m` (int): Order; $0 \leq m \leq n$.
- `x` (float): Evaluation point.
- `cx` (ndarray[n+1]): Output array.

### `legendre_function_q(n, x, cx)`
**Legendre functions of the second kind** $Q_0(x), \ldots, Q_n(x)$.

- `n` (int): Highest degree.
- `x` (float): Evaluation point; $-1 < x < 1$ required.
- `cx` (ndarray[n+1]): Output array.

$Q_0(x) = \frac{1}{2}\ln\frac{1+x}{1-x}$, with recurrence
$(n+1)Q_{n+1}(x) = (2n+1)x Q_n(x) - n Q_{n-1}(x)$.

### `spherical_harmonic(l, m, theta, phi, c, s)`
**Real and imaginary parts of the spherical harmonic** $Y_l^m(\theta, \phi)$.

- `l` (int): Degree; $l \geq 0$.
- `m` (int): Order; $0 \leq m \leq l$.
- `theta` (float): Polar angle in radians.
- `phi` (float): Azimuthal angle in radians.
- `c` (ndarray[1]): Output real part.
- `s` (ndarray[1]): Output imaginary part.

---

## Discrete Orthogonal Polynomials

### `charlier(n, a, x, value)`
**Charlier polynomials** $C_0(x;a), \ldots, C_n(x;a)$, orthogonal w.r.t. the
Poisson distribution with parameter $a > 0$.

- `n` (int): Highest degree.
- `a` (float): Parameter; $a > 0$.
- `x` (float): Evaluation point.
- `value` (ndarray[n+1]): Output array.

### `chebyshev_discrete(n, m, x, v)`
**Discrete Chebyshev polynomials** $t_0(x;N), \ldots, t_n(x;N)$, orthogonal
on the uniform grid $\{0, 1, \ldots, N-1\}$.

- `n` (int): Highest degree.
- `m` (int): Grid size $N$.
- `x` (float): Evaluation point.
- `v` (ndarray[n+1]): Output array.

### `krawtchouk(n, p, x, m, v)`
**Krawtchouk polynomials** $K_0, \ldots, K_n$, orthogonal w.r.t. the binomial
distribution $\text{Bin}(M, p)$.

- `n` (int): Highest degree.
- `p` (float): Success probability; $0 < p < 1$.
- `x` (float): Evaluation point.
- `m` (int): Number of trials $M$.
- `v` (ndarray[n+1]): Output array.

### `meixner(n, beta, c, x, v)`
**Meixner polynomials** $M_0, \ldots, M_n$, orthogonal w.r.t. the negative
binomial distribution.

- `n` (int): Highest degree.
- `beta` (float): First parameter; $\beta > 0$.
- `c` (float): Second parameter; $0 < c < 1$.
- `x` (float): Evaluation point.
- `v` (ndarray[n+1]): Output array.

---

## Non-Orthogonal Polynomial Families

### `bernoulli_poly(n, x, bx)`
**Bernoulli polynomial** $B_n(x)$.

- `n` (int): Degree.
- `x` (float): Evaluation point.
- `bx` (float, in/out): Output value $B_n(x)$.

### `bernstein_poly(n, x, bern)`
**Bernstein basis polynomials** $b_{0,n}(x), \ldots, b_{n,n}(x)$ on $[0, 1]$.

- `n` (int): Degree.
- `x` (float): Evaluation point; $0 \leq x \leq 1$.
- `bern` (ndarray[n+1]): Output array. Satisfies $\sum_k b_{k,n}(x) = 1$.

### `bpab(n, x, a, b, bern)`
**Bernstein basis polynomials** on the interval $[a, b]$.

- `n` (int): Degree.
- `x` (float): Evaluation point; $a \leq x \leq b$.
- `a`, `b` (float): Interval boundaries.
- `bern` (ndarray[n+1]): Output array.

### `cardan_poly(n, x, s, cx)`
**Cardan polynomials** $C_0(x,s), \ldots, C_n(x,s)$.

- `n` (int): Highest degree.
- `x` (float): Evaluation point.
- `s` (float): Scale parameter.
- `cx` (ndarray[n+1]): Output array.

### `euler_poly(n, x)`
**Euler polynomial** $E_n(x)$.

- `n` (int): Degree.
- `x` (float): Evaluation point.
- Returns `float`: value of $E_n(x)$.

### `complete_symmetric_poly(n, r, x, value)`
**Complete symmetric polynomial** $h_r(x_1, \ldots, x_n)$.

- `n` (int): Number of variables.
- `r` (int): Degree.
- `x` (ndarray[n]): Variable values.
- `value` (float, out): Output value.

### `zernike_poly(m, n, rho, z)`
**Zernike radial polynomial** $R_n^m(\rho)$.

- `m` (int): Azimuthal order; $0 \leq m \leq n$.
- `n` (int): Radial degree; $\text{mod}(n-m, 2) = 0$ required.
- `rho` (float): Radial coordinate; $0 \leq \rho \leq 1$.
- `z` (ndarray): Output array.

---

## Polynomial Coefficients and Zeros

These routines compute the exact polynomial coefficient arrays and Chebyshev nodes.

| Routine | Parameters | Description |
|---|---|---|
| `cheby_t_poly_coef(n, c)` | `c` (ndarray[n+1, n+1]) | Coefficient matrix of $T_0, \ldots, T_n$ |
| `cheby_t_poly_zero(n, z)` | `z` (ndarray[n]) | Zeros of $T_n$: $\cos\bigl(\frac{(2k-1)\pi}{2n}\bigr)$ |
| `cheby_u_poly_coef(n, c)` | `c` (ndarray[n+1, n+1]) | Coefficient matrix of $U_0, \ldots, U_n$ |
| `cheby_u_poly_zero(n, z)` | `z` (ndarray[n]) | Zeros of $U_n$: $\cos\bigl(\frac{k\pi}{n+1}\bigr)$ |
| `hermite_poly_phys_coef(n, c)` | `c` (ndarray[n+1, n+1]) | Coefficient matrix of $H_0, \ldots, H_n$ |
| `laguerre_poly_coef(n, c)` | `c` (ndarray[n+1, n+1]) | Coefficient matrix of $L_0, \ldots, L_n$ |
| `legendre_poly_coef(n, c)` | `c` (ndarray[n+1, n+1]) | Coefficient matrix of $P_0, \ldots, P_n$ |
| `cardan_poly_coef(n, s, c)` | `s` (float), `c` (ndarray[n+1, n+1]) | Cardan coefficients for parameter $s$ |
| `zernike_poly_coef(m, n, c)` | `c` (ndarray[n+1]) | Coefficients of $R_n^m(\rho)$ |

---

## Combinatorial Sequences

### `bell(n, b)`
**Bell numbers** $B_0, \ldots, B_n$.

- `n` (int): Highest index.
- `b` (ndarray[n+1], int32): Output array.

$B_n$ counts the number of set partitions of $\{1, \ldots, n\}$.

### `catalan(n, c)`
**Catalan numbers** $C_0, \ldots, C_n$.

- `n` (int): Highest index.
- `c` (ndarray[n+1], int32): Output array.

$C_n = \frac{1}{n+1}\binom{2n}{n}$.

### `catalan_row_next(n, row)`
**Next row of the Catalan triangle**, given the current row for index $n$.

- `n` (int): Current row index.
- `row` (ndarray, int32): In/out array; updated to row $n+1$ on return.

### `stirling1(n, m, s1)`
**Stirling numbers of the first kind** $s(k, j)$ for $1 \leq k \leq n$, $1 \leq j \leq m$.

- `n` (int): Row count.
- `m` (int): Column count.
- `s1` (ndarray[n, m], int32): Output matrix.

$s(n, k)$ counts permutations of $n$ elements with exactly $k$ cycles.

### `stirling2(n, m, s2)`
**Stirling numbers of the second kind** $S(k, j)$.

- `n` (int): Row count.
- `m` (int): Column count.
- `s2` (ndarray[n, m], int32): Output matrix.

$S(n, k)$ counts partitions of $n$ elements into exactly $k$ non-empty subsets.

### `delannoy(m, n, a)`
**Delannoy numbers** $D(i,j)$ for $0 \leq i \leq m$, $0 \leq j \leq n$.

- `m`, `n` (int): Grid dimensions.
- `a` (ndarray[m+1, n+1], int32): Output matrix.

$D(m,n)$ counts lattice paths from $(0,0)$ to $(m,n)$ using steps east, north, northeast.

### `motzkin(n, a)`
**Motzkin numbers** $M_0, \ldots, M_n$.

- `n` (int): Highest index.
- `a` (ndarray[n+1], int32): Output array.

### `fibonacci_recursive(n, f)`
**Fibonacci sequence** $F_1, \ldots, F_n$ using the recurrence $F_{k+1} = F_k + F_{k-1}$.

- `n` (int): Number of terms.
- `f` (ndarray[n], int32): Output array.

### `fibonacci_direct(n, f)`
**$n$-th Fibonacci number** using the Binet closed-form formula.

- `n` (int): Index.
- `f` (int32, out): Output value $F_n$.

### `fibonacci_floor(n, f, i)`
**Largest Fibonacci number** $\leq n$.

- `n` (int): Upper bound.
- `f` (int32, out): Largest Fibonacci number $\leq n$.
- `i` (int32, out): Index of that Fibonacci number.

### `vibonacci(n, seed, v)`
**Vibonacci numbers**: randomized Fibonacci where each recurrence sign is $\pm 1$ chosen
randomly. The ratio $V_{n+1}/V_n$ converges almost surely to Viswanath's constant $\approx 1.13199$.

- `n` (int): Number of terms.
- `seed` (int32, in/out): Random number seed; updated on return.
- `v` (ndarray[n], int32): Output array.

### `zeckendorf(n, m_max, m, i_list, f_list)`
**Zeckendorf decomposition**: every positive integer is uniquely a sum of
non-consecutive Fibonacci numbers.

- `n` (int): Integer to decompose.
- `m_max` (int): Maximum number of Fibonacci terms expected.
- `m` (int32, out): Number of terms found.
- `i_list` (ndarray[m_max], int32): Fibonacci indices used.
- `f_list` (ndarray[m_max], int32): Fibonacci values used.

### `bernoulli_number(n, b)`
**Bernoulli numbers** $B_0, \ldots, B_n$ (floating-point).

- `n` (int): Highest index.
- `b` (ndarray[n+1], float64): Output array.

### `euler_number(n, e)`
**Euler numbers** $E_0, \ldots, E_n$. Odd-indexed Euler numbers are 0.

- `n` (int): Highest index.
- `e` (ndarray[n+1], float64): Output array.

### `eulerian(n, e)`
**Eulerian numbers** $E(k, j)$ for $1 \leq k \leq n$, $1 \leq j \leq n$.

- `n` (int): Dimension.
- `e` (ndarray[n, n], int32): Output matrix. $E(n, k)$ counts permutations of $n$
  objects with exactly $k$ runs.

### `poly_bernoulli(n, k, b)`
**Poly-Bernoulli numbers** $B_n^{(-k)}$ with negative superscript.

- `n`, `k` (int): Indices.
- `b` (float64, out): Output value.

$B_n^{(-k)}$ counts the number of $n \times k$ binary lonesum matrices.

### `comb_row_next(n, row)`
**Next row of Pascal's triangle** (binomial coefficients $\binom{n}{0}, \ldots, \binom{n}{n}$).

- `n` (int): Current row.
- `row` (ndarray, int32): In/out; row $n$ on input, row $n+1$ on return.

---

## Figurate Numbers

| Routine | Description | Formula |
|---|---|---|
| `triangle_num(n)` | $n$-th triangular number | $T(n) = n(n+1)/2$ |
| `tetrahedron_num(n)` | $n$-th tetrahedral number | $T_3(n) = n(n+1)(n+2)/6$ |
| `pentagon_num(n, p)` | $n$-th pentagonal number | $P(n) = n(3n-1)/2$ (also defined for $n < 0$) |
| `pyramid_num(n)` | $n$-th triangular pyramidal number | $(n+1)^3/6 - (n+1)/6$ |
| `pyramid_square_num(n)` | $n$-th square pyramidal number | $n(n+1)(2n+1)/6$ |
| `simplex_num(m, n)` | $n$-th simplex number in $m$ dimensions | $\binom{n+m-1}{m}$ |
| `plane_partition_num(n)` | Number of plane partitions of $n$ | — |
| `lock(n, a)` | Number of full-button codes for an $n$-button lock | — |
| `align_enum(m, n)` | Number of alignments of sequences of length $m$ and $n$ | — |

---

## Number Theory

### `phi(n, phin)`
**Euler totient function** $\phi(n)$.

- `n` (int): Input.
- `phin` (int32, out): $\phi(n)$ = number of integers in $[1, n]$ coprime to $n$.

### `moebius(n, mu)`
**Moebius function** $\mu(n)$.

- `n` (int): Input.
- `mu` (int32, out): $\mu(n) \in \{-1, 0, 1\}$.

### `mertens(n)`
**Mertens function** $M(n) = \sum_{k=1}^n \mu(k)$.

- `n` (int): Input.
- Returns `int`: $M(n)$.

### `sigma(n, sigma_n)`
**Sum of divisors** $\sigma(n) = \sum_{d | n} d$.

- `n` (int): Input.
- `sigma_n` (int32, out): $\sigma(n)$.

### `tau(n, taun)`
**Number of divisors** $\tau(n) = \sum_{d | n} 1$.

- `n` (int): Input.
- `taun` (int32, out): $\tau(n)$.

### `omega(n, ndiv)`
**Number of distinct prime divisors** $\omega(n)$.

- `n` (int): Input.
- `ndiv` (int32, out): $\omega(n)$.

### `prime(n)`
**The $n$-th prime number** (precomputed table up to $n = 1600$; largest prime is 13499).

- `n` (int): Index.
- Returns `int`: $p_n$.

### `i4_is_prime(n)`
**Primality test** using trial division.

- `n` (int): Input.
- Returns `bool`: `True` if $n$ is prime.

### `i4_factor(n, factor_max, factor_num, factor, power, nleft)`
**Prime factorization**: $n = \left(\prod_i \text{factor}[i]^{\text{power}[i]}\right) \times \text{nleft}$.

- `n` (int): Integer to factor.
- `factor_max` (int): Maximum number of prime factors to find.
- `factor_num` (int32, out): Number of distinct prime factors found.
- `factor` (ndarray[factor_max], int32): Output prime bases.
- `power` (ndarray[factor_max], int32): Output exponents.
- `nleft` (int32, out): Unfactored remainder (1 if fully factored).

### `jacobi_symbol(q, p, j)`
**Jacobi symbol** $(q/p)$.

- `q`, `p` (int): Inputs; $p$ must be odd and positive.
- `j` (int32, out): Jacobi symbol $\in \{-1, 0, 1\}$.

### `legendre_symbol(q, p, l)`
**Legendre symbol** $(q/p)$ for odd prime $p$.

- `q`, `p` (int): Inputs.
- `l` (int32, out): Legendre symbol $\in \{-1, 0, 1\}$.

### `benford(ival)`
**Benford's law probability** for leading digits.

- `ival` (int): Leading digit (1–9) or multi-digit integer.
- Returns `float`: $\log_{10}((\text{ival}+1)/\text{ival})$.

### `collatz_count(n)`
**Number of steps in the Collatz sequence** starting from $n$ until reaching 1.

- `n` (int): Starting value.
- Returns `int`: Number of steps.

### `collatz_count_max(n, i_max, j_max)`
**Maximum Collatz count** for starting values in $[1, n]$.

- `n` (int): Upper bound.
- `i_max` (int32, out): Starting value with the longest sequence.
- `j_max` (int32, out): Length of that longest sequence.

---

## Special Functions

### `zeta(p)`
**Riemann Zeta function** $\zeta(p) = \sum_{n=1}^\infty 1/n^p$.

- `p` (float): Argument; $p > 1$.
- Returns `float`.

Notable values: $\zeta(2) = \pi^2/6$, $\zeta(4) = \pi^4/90$.

### `lambert_w(x)`
**Lambert W function** $W(x)$, the principal branch satisfying $W(x) e^{W(x)} = x$.

- `x` (float): Argument; $x \geq -1/e$.
- Returns `float`.

### `lambert_w_crude(x)`
**Crude initial estimate of the Lambert W function** using a simple approximation.
Useful as a starting point for Newton iterations.

- `x` (float): Argument.
- Returns `float`.

### `r8_erf(x)`
**Error function** $\mathrm{erf}(x) = \frac{2}{\sqrt{\pi}} \int_0^x e^{-t^2}\, dt$.

- `x` (float): Argument.
- Returns `float` in $(-1, 1)$.

### `r8_erf_inverse(y)`
**Inverse error function** $\mathrm{erf}^{-1}(y)$.

- `y` (float): Argument; $-1 < y < 1$.
- Returns `float`.

### `r8_beta(x, y)`
**Beta function** $B(x, y) = \Gamma(x)\Gamma(y)/\Gamma(x+y)$.

- `x`, `y` (float): Arguments; both must be positive.
- Returns `float`.

### `r8_agm(a, b)`
**Arithmetic-Geometric Mean** of $a$ and $b$.

- `a`, `b` (float): Non-negative inputs.
- Returns `float`.

### `r8_gamma_log(x)`
**Log-Gamma function** $\ln\Gamma(x)$.

- `x` (float): Argument; $x > 0$.
- Returns `float`.

### `r8_hyper_2f1(a, b, c, x)`
**Gauss hypergeometric function** ${}_{2}F_1(a, b; c; x)$.

- `a`, `b`, `c` (float): Parameters.
- `x` (float): Argument; $|x| < 1$.
- Returns `float`.

### `r8_psi(x)`
**Digamma (Psi) function** $\psi(x) = \frac{d}{dx}\ln\Gamma(x) = \Gamma'(x)/\Gamma(x)$.

- `x` (float): Argument; $x \neq 0, -1, -2, \ldots$
- Returns `float`.

### `lerch(z, s, a)`
**Lerch transcendent** $\Phi(z, s, a) = \sum_{k=0}^\infty z^k / (a+k)^s$.

- `z` (float): $|z| < 1$ (or $z = 1$, $s > 1$).
- `s` (float): Exponent.
- `a` (float): Offset; $a \neq 0, -1, -2, \ldots$
- Returns `float`.

### `gud(x)`
**Gudermannian function** $\mathrm{gd}(x) = 2\arctan(\tanh(x/2))$.

- `x` (float): Argument.
- Returns `float`.

Relates hyperbolic and trigonometric functions: $\sinh(x) = \tan(\mathrm{gd}(x))$.

### `agud(g)`
**Inverse Gudermannian function**.

- `g` (float): Argument.
- Returns `float`.

### `normal_01_cdf_inverse(p)`
**Inverse standard normal CDF** (probit function) $\Phi^{-1}(p)$.

- `p` (float): Probability; $0 < p < 1$.
- Returns `float`.

### `cos_power_int(a, b, n)`
**Cosine power integral** $\int_a^b \cos^n(t)\, dt$.

- `a`, `b` (float): Integration limits.
- `n` (int): Power.
- Returns `float`.

### `sin_power_int(a, b, n)`
**Sine power integral** $\int_a^b \sin^n(t)\, dt$.

- `a`, `b` (float): Integration limits.
- `n` (int): Power.
- Returns `float`.

### `cardinal_cos(j, m, n, t, c)`
**$j$-th cardinal cosine basis function** evaluated at $n$ points.

- `j` (int): Basis index; $0 \leq j \leq m+1$.
- `m` (int): Number of interior nodes.
- `n` (int): Number of evaluation points.
- `t` (ndarray[n]): Evaluation points.
- `c` (ndarray[n]): Output values.

Basis point $j$ has $C_j(T(j)) = 1$ and $C_j(T(i)) = 0$ for $i \neq j$, where
$T(i) = \pi i / (m+1)$.

### `cardinal_sin(j, m, n, t, s)`
**$j$-th cardinal sine basis function** evaluated at $n$ points.

- Same signature as `cardinal_cos`, with output `s` (ndarray[n]).

---

## Integer and Combinatorial Utilities

| Routine | Parameters | Returns | Description |
|---|---|---|---|
| `i4_choose(n, k)` | `n`, `k` (int) | `int` | Binomial coefficient $\binom{n}{k}$ |
| `r8_choose(n, k)` | `n`, `k` (int) | `float` | Real binomial coefficient |
| `i4_factorial(n)` | `n` (int) | `int` | $n!$ |
| `i4_factorial2(n)` | `n` (int) | `int` | Double factorial $n!! = n \cdot (n-2) \cdots$ |
| `r8_factorial(n)` | `n` (int) | `float` | $n!$ as float |
| `r8_factorial_log(n)` | `n` (int) | `float` | $\ln(n!)$ |
| `trinomial(i, j, k)` | `i`, `j`, `k` (int) | `int` | Trinomial coefficient $(i+j+k)! / (i! j! k!)$ |
| `commul(n, nfactor, factor, ncomb)` | `factor` (ndarray) | `ncomb` (int, out) | Multinomial coefficient $n! / \prod \text{factor}[i]!$ |
| `poly_coef_count(dim, degree)` | `dim`, `degree` (int) | `int` | Number of monomials of total degree $\leq$ `degree` in `dim` variables |
| `align_enum(m, n)` | `m`, `n` (int) | `int` | Number of alignments of sequences of length $m$ and $n$ |
| `slice(dim_num, slice_num, piece_num)` | — | `piece_num` (int, out) | Max pieces from `slice_num` hyperplane cuts in `dim_num` dimensions |
| `i4_is_triangular(i)` | `i` (int) | `bool` | Whether $i$ is a triangular number |
| `i4_huge()` | (none) | `int` | Largest representable 32-bit integer |
| `r8_huge()` | (none) | `float` | Largest representable double |
| `i4_swap(i, j)` | `i`, `j` (int32, in/out) | — | Swaps two integers in-place |
| `i4_to_triangle_lower(k, i, j)` | `k` (int) | `i`, `j` (int, out) | Convert linear index to lower-triangular $(i,j)$ coordinates |
| `i4_to_triangle_upper(k, i, j)` | `k` (int) | `i`, `j` (int, out) | Convert linear index to upper-triangular $(i,j)$ coordinates |
| `triangle_lower_to_i4(i, j, k)` | `i`, `j` (int) | `k` (int, out) | Convert lower-triangular $(i,j)$ to linear index |
| `triangle_upper_to_i4(i, j, k)` | `i`, `j` (int) | `k` (int, out) | Convert upper-triangular $(i,j)$ to linear index |
| `i4_partition_distinct_count(n, q)` | `n` (int) | `q` (int, out) | Number of partitions of $n$ into distinct parts |
| `i4_uniform_ab(a, b, seed)` | `a`, `b` (int), `seed` (int32, in/out) | `int` | Uniform random integer in $[a, b]$ |

---

## Tabulated Values (Lookup Functions)

These routines return reference values from pre-computed tables, useful for testing
and verification. Each accepts an `n_data` index (pass 0 to start) and returns the
corresponding input/output pair; `n_data` is incremented on each call. When the
table is exhausted, `n_data` is reset to 0.

| Routine | Table contents |
|---|---|
| `agm_values(n_data, a, b, fx)` | Arithmetic-Geometric Mean values |
| `bell_values(n_data, n, c)` | Bell numbers |
| `bernoulli_number_values(n_data, n, c)` | Bernoulli numbers |
| `bernstein_poly_values(n_data, n, k, x, b)` | Bernstein basis values |
| `beta_values(n_data, x, y, fxy)` | Beta function values |
| `catalan_values(n_data, n, c)` | Catalan numbers |
| `collatz_count_values(n_data, n, count)` | Collatz sequence lengths |
| `cos_power_int_values(n_data, a, b, n, fx)` | Cosine power integrals |
| `erf_values(n_data, x, fx)` | Error function values |
| `gamma_values(n_data, x, fx)` | Gamma function values |
| `gamma_log_values(n_data, x, fx)` | Log-Gamma values |
| `gegenbauer_poly_values(n_data, n, a, x, fx)` | Gegenbauer polynomial values |
| `gud_values(n_data, x, fx)` | Gudermannian values |
| `hermite_poly_phys_values(n_data, n, x, fx)` | Hermite (physicist) polynomial values |
| `hyper_2f1_values(n_data, a, b, c, x, fx)` | Hypergeometric ${}_{2}F_1$ values |
| `i4_factorial_values(n_data, n, fn)` | Factorial values |
| `i4_factorial2_values(n_data, n, fn)` | Double factorial values |
| `jacobi_poly_values(n_data, n, a, b, x, fx)` | Jacobi polynomial values |
| `laguerre_polynomial_values(n_data, n, x, fx)` | Laguerre polynomial values |
| `lambert_w_values(n_data, x, fx)` | Lambert W function values |
| `legendre_associated_values(n_data, n, m, x, fx)` | Associated Legendre values |
| `legendre_associated_normalized_sphere_values(...)` | Normalized associated Legendre (sphere) |
| `legendre_function_q_values(n_data, n, x, fx)` | Legendre Q function values |
| `legendre_poly_values(n_data, n, x, fx)` | Legendre polynomial values |
| `lerch_values(n_data, z, s, a, fx)` | Lerch transcendent values |
| `mertens_values(n_data, n, c)` | Mertens function values |
| `moebius_values(n_data, n, c)` | Moebius function values |
| `normal_01_cdf_values(n_data, x, fx)` | Normal CDF values |
| `omega_values(n_data, n, c)` | Omega function values |
| `partition_distinct_count_values(n_data, n, c)` | Distinct-parts partition count values |
| `phi_values(n_data, n, c)` | Euler totient values |
| `psi_values(n_data, x, fx)` | Digamma function values |
| `r8_factorial_log_values(n_data, n, fx)` | Log-factorial values |
| `r8_factorial_values(n_data, n, fn)` | Real factorial values |
| `sigma_values(n_data, n, c)` | Divisor sum values |
| `sin_power_int_values(n_data, a, b, n, fx)` | Sine power integral values |
| `spherical_harmonic_values(n_data, l, m, t, p, yr, yi)` | Spherical harmonic values |
| `tau_values(n_data, n, c)` | Divisor count values |
| `zeta_values(n_data, n, zeta)` | Riemann Zeta values |
