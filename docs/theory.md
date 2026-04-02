# Theory

This page covers the mathematical foundations behind `polpack`: the definition
of polynomial families, the stable recurrence relations used to evaluate them,
and the combinatorial sequences supported by the library.

---

## 1) Background: Special Functions and Polynomials

A **polynomial family** is a sequence of polynomials $\{P_n(x)\}_{n=0}^\infty$
where $n$ is the degree of the polynomial. Many of these families are
**orthogonal polynomials**, meaning they satisfy a specific inner product
relationship over an interval $[a, b]$ with respect to a weight function $w(x)$.

Special functions and polynomials arise naturally across science and engineering:

- **Physics** — quantum mechanics (Hermite, Laguerre), optics (Zernike), Laplace's equation (Legendre)
- **Numerical Analysis** — function approximation (Chebyshev), Gaussian quadrature, spectral methods
- **Combinatorics** — counting set partitions (Bell numbers), mountain ranges (Catalan numbers)
- **Probability** — orthogonal basis expansion, stochastic processes

### Orthogonality condition

The structure in polynomial families is often characterized by:

1. **Interval of support** — the range $[a, b]$ where the polynomials are defined
2. **Weight function** $w(x)$ — a non-negative function defining the inner product
3. **Orthogonality** — $\int_a^b P_m(x) P_n(x) w(x) \, dx = 0$ for $m \neq n$
4. **Normalization** — the value of the integral for $m = n$ (often $C_n$)

`polpack` focuses on the stable numerical evaluation of these deterministic bases.

### Explicit vs. Recursive interpretation

There are two principal ways to define and evaluate polynomial families:

| | **Explicit Formulas** | **Recurrence Relations** |
|---|---|---|
| Evaluation point | Direct calculation from $x$ | Computed step-wise from $P_0, P_1, \dots$ |
| Numerical Stability | Often poor for large $n$ (cancellation errors) | Typically excellent and stable |
| Implementation | Combinatorial sums, binomial coefficients | Three-term recurrence loops |
| Typical use | Symbolic manipulation | Numerical computing, library implementations |

`polpack` uses **recurrence relations** exclusively for its numerical core.

!!! info "Christoffel–Darboux formula"
    For orthogonal polynomials, the sum of products follows a specific
    closed form:

    $$ \sum_{k=0}^n \frac{P_k(x)P_k(y)}{h_k} = \frac{k_n}{k_{n+1}h_n} \frac{P_{n+1}(x)P_n(y) - P_n(x)P_{n+1}(y)}{x - y} $$

    This identity is fundamental to understanding the convergence of spectral
    expansions and the completeness of orthogonal bases.

## 2) Orthogonal Polynomial Families

All routines in `polpack` target specific polynomial forms:

$$
\int_a^b P_m(x) P_n(x) w(x) \, dx = \delta_{mn} C_n.
$$

Within the library, this is implemented as:

$$
P_{n+1}(x) = (A_n x + B_n) P_n(x) - C_n P_{n-1}(x),
$$

where:

- $x$ is the evaluation point
- $A_n, B_n, C_n$ are method-specific recurrence coefficients
- $k$ denotes the degree or index of the recurrence

For **degree-invariant** routines, the coefficients $A, B, C$ are pre-defined
constants for a given degree $n$.

## Polynomial families

`polpack` evaluates a variety of recursively defined polynomial families,
including those orthogonal with respect to specific weights and intervals.

### Bernoulli Polynomials
The Bernoulli polynomials $B_n(x)$ are defined by the generating function:
$\frac{t e^{xt}}{e^t - 1} = \sum_{n=0}^{\infty} B_n(x) \frac{t^n}{n!}$
They satisfy the recurrence:

$$
B_n(x) = \sum_{k=0}^n \binom{n}{k} B_k x^{n-k}
$$

### Bernstein Polynomials
The Bernstein basis polynomials $b_{\nu, n}(x)$ are defined on $[0,1]$ as:
$b_{\nu, n}(x) = \binom{n}{\nu} x^{\nu} (1-x)^{n-\nu}$
They form a basis for the space of polynomials of degree at most $n$.

### Cardan Polynomials
Cardan polynomials $C_n(x, s)$ are associated with the solution of cubic
equations. They satisfy the three-term recurrence:

$$
C_{n+1}(x, s) = x C_n(x, s) - s C_{n-1}(x, s)
$$

### Charlier Polynomials
The Charlier polynomials $C_n(x; a)$ are orthogonal with respect to the 
Poisson distribution. They satisfy:

$$
a C_{n+1}(x; a) = (n + a - x) C_n(x; a) - n C_{n-1}(x; a)
$$

### Chebyshev Polynomials
**First Kind ($T_n$):** Orthogonal on $[-1, 1]$ with weight $(1-x^2)^{-1/2}$.

$$
T_{n+1}(x) = 2x T_n(x) - T_{n-1}(x)
$$

**Second Kind ($U_n$):** Orthogonal on $[-1, 1]$ with weight $(1-x^2)^{1/2}$.

$$
U_{n+1}(x) = 2x U_n(x) - U_{n-1}(x)
$$

### Gegenbauer Polynomials
The Gegenbauer polynomials $C_n^{(\alpha)}(x)$ are orthogonal on $[-1, 1]$ with 
weight $(1-x^2)^{\alpha - 1/2}$.

$$
(n+1)C_{n+1}^{(\alpha)}(x) = 2(n+\alpha)x C_n^{(\alpha)}(x) - (n+2\alpha-1)C_{n-1}^{(\alpha)}(x)
$$

### Hermite Polynomials (Physicist's)
Orthogonal on $(-\infty, \infty)$ with weight $e^{-x^2}$.

$$
H_{n+1}(x) = 2x H_n(x) - 2n H_{n-1}(x)
$$

### Jacobi Polynomials
The Jacobi polynomials $P_n^{(\alpha, \beta)}(x)$ are orthogonal on $[-1, 1]$ 
with weight $(1-x)^{\alpha}(1+x)^{\beta}$. They generalize both Chebyshev and 
Legendre polynomials.

### Krawtchouk Polynomials
Discrete orthogonal polynomials $K_n(x; p, N)$ related to the binomial 
distribution.

### Laguerre Polynomials
**Associated Laguerre ($L_n^{(\alpha)}$):** Orthogonal on $[0, \infty)$ with 
weight $x^{\alpha}e^{-x}$.

$$
(n+1)L_{n+1}^{(\alpha)}(x) = (2n + \alpha + 1 - x) L_n^{(\alpha)}(x) - (n+\alpha)L_{n-1}^{(\alpha)}(x)
$$

### Legendre Polynomials
Orthogonal on $[-1, 1]$ with weight 1.

$$
(n+1)P_{n+1}(x) = (2n+1)x P_n(x) - n P_{n-1}(x)
$$

### Meixner Polynomials
Discrete orthogonal polynomials $M_n(x; \beta, c)$ related to the negative 
binomial distribution.

### Zernike Polynomials
Polynomials defined on the unit disk, widely used in optics to describe 
wavefront aberrations.

---

## Combinatorial Sequences

`polpack` provides routines for several important integer sequences.

### Bell Numbers
The Bell number $B_n$ counts the number of ways a set of $n$ elements can be 
partitioned into non-empty subsets.

$$
B_{n+1} = \sum_{k=0}^n \binom{n}{k} B_k
$$

### Catalan Numbers
The Catalan number $C_n$ occurs in various counting problems (e.g., number 
of binary trees with $n$ nodes).

$$
C_n = \frac{1}{n+1} \binom{2n}{n}
$$

### Stirling Numbers
**First Kind ($s(n,k)$):** Number of permutations of $n$ elements with $k$ cycles.
**Second Kind ($S(n,k)$):** Number of ways to partition a set of $n$ elements 
into $k$ non-empty subsets.

---

## Number Theory and Probability

### Benford's Law
Benford's law, also called the Newcomb–Benford law or the law of anomalous 
numbers, defines the probability distribution of the first digit $d$ in many 
real-life sets of numerical data:

$$
P(d) = \log_{10}(1 + 1/d)
$$

### Collatz Conjecture
The Collatz sequence for a starting integer $n$ is defined by:

- If $n$ is even, $n_{i+1} = n_i / 2$
- If $n$ is odd, $n_{i+1} = 3n_i + 1$
`polpack` provides routines to count the number of steps to reach 1.

### Arithmetical Functions

- **Euler Totient ($\phi(n)$):** Number of positive integers less than $n$ 
  that are relatively prime to $n$.
- **Moebius ($\mu(n)$):** $\mu(n) = (-1)^k$ if $n$ is square-free with $k$ prime 
  factors, else 0.
- **Mertens ($M(n)$):** The sum of the Moebius function $M(n) = \sum_{k=1}^n \mu(k)$.
- **Divisor Sum ($\sigma(n)$):** Sum of all positive divisors of $n$.

## 3) Three-term recurrence and evaluation scaling

Given an interval $[a, b]$ and degree $N$:
$$
P_0(x) = \alpha, \qquad P_1(x) = \beta x + \gamma.
$$

At each stage $n$, the polynomial value is generated:
$$
P_{n+1}(x) = (A_n x + B_n)P_n(x) - C_n P_{n-1}(x),
$$

where $A_n, B_n, C_n$ are coefficients that ensure the correct scaling at each
stage. When multiplied in the core loops, this produces the high-order
polynomial values required for scientific applications.

## 4) Chebyshev Polynomials

The simplest and most widely used family in numerical analysis, named after
Pafnuty Chebyshev.

For both first and second kind variants:

$$
T_{n+1}(x) = 2x T_n(x) - T_{n-1}(x),
$$

$$
T_0(x) = 1,\quad T_1(x)=x.
$$
This recurrence is notoriously stable for $x \in [-1, 1]$.

!!! info "Minimax property"
    Among all polynomials of degree $n$ with leading coefficient 1, the
    Chebyshev polynomial $T_n(x)/2^{n-1}$ has the smallest maximum absolute
    value on $[-1, 1]$. This makes Chebyshev nodes optimal for polynomial
    interpolation and function approximation.

## 5) Legendre Polynomials — Two-stage recurrence

A classic family providing improved accuracy in spherical harmonic expansions:

$$
\begin{aligned}
A_{n} &= \frac{2n+1}{n+1},\\
B_{n} &= 0,\\
C_{n} &= \frac{n}{n+1},\\
(n+1)P_{n+1}(x) &= (2n+1)x P_n(x) - n P_{n-1}(x).
\end{aligned}
$$

Coefficients:
$$
P_0=1,\quad P_1=x.
$$

---

## 6) Hermite Polynomials — physicist form (time-invariant only)

A three-term recurrence providing higher accuracy for systems involving
Gaussian weights:
$$
H_{n+1}(x) = 2x H_n(x) - 2n H_{n-1}(x),
$$

with coefficients:
$$
\begin{aligned}
H_0&=1,\\
H_1&=2x.
\end{aligned}
$$

!!! note
    The probabilist's form $He_n(x)$ uses different scaling parameters. Both
    are available in `polpack`.

## 7) Jacobi and Gegenbauer Polynomials

The highest-order methods in `polpack`, using four terms or generalized
parameters for maximum flexibility.

The general update formula is:
$$
P_{n+1}(x) = (A_n x + B_n) P_n(x) - C_n P_{n-1}(x).
$$

The Jacobi and Gegenbauer variants use **different** coefficient sets
optimized for their respective weighting intervals. See the [API Reference](api.md)
for the complete recurrence tables.

## 8) Convergence and stability considerations

### Strong vs. weak stability

When assessing the quality of a numerical polynomial evaluation, two notions of
stability are distinguished:

- **Forward stability** — accuracy of individual evaluations.
- **Backward stability** — whether the computed $P_n(x)$ is the exact solution
  to a slightly perturbed recurrence.

Forward stability is often sufficient for function approximation, while
backward stability matters in eigenvalue problems.

### Relationship between degree and order

The three-term recurrence schemes in `polpack` are designed to achieve higher
numerical precision. These recurrences are stable but may accumulate
floating-point error at very high degrees ($n > 1000$). Higher-degree
polynomials generally benefit from the stable recurrence architecture.

!!! tip "Evaluation guidance"
    Unlike simple power series, the recurrence $P_{n+1}(x)$ only reduces the
    error by a factor of 2 per degree. For very large $n$, use specialized
    asymptotic routines if available.
