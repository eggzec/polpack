# Theory

This page covers the mathematical foundations of `polpack`: the definition and
properties of orthogonal polynomial families, the three-term recurrence relations
used to evaluate them, the combinatorial sequences supported by the library, and
numerical stability considerations.

---

## 1. Background: Special Functions and Polynomials

A **polynomial family** is a sequence of polynomials $\{P_n(x)\}_{n=0}^\infty$
where $n$ is the degree. Many of the most important families are
**orthogonal polynomials**, meaning they satisfy a specific inner product
condition over an interval $[a, b]$ with respect to a weight function $w(x) \geq 0$:

$$
\int_a^b P_m(x)\, P_n(x)\, w(x)\, dx = 0, \qquad m \neq n.
$$

When $m = n$, this integral equals some positive constant $C_n$, called the
norm squared of $P_n$.

Special functions and orthogonal polynomials arise naturally across science and engineering:

- **Physics** — quantum mechanics (Hermite, Laguerre), electrostatics (Legendre), optics (Zernike)
- **Numerical Analysis** — function approximation (Chebyshev), Gaussian quadrature, spectral methods
- **Combinatorics** — counting set partitions (Bell numbers), lattice paths (Catalan, Delannoy)
- **Number Theory** — arithmetic functions, prime distributions, divisor sums

### Orthogonality structure

Each orthogonal polynomial family is characterized by:

1. **Interval of support** $[a, b]$ — the domain over which orthogonality holds
2. **Weight function** $w(x)$ — defines the inner product
3. **Orthogonality** — $\langle P_m, P_n \rangle = \int_a^b P_m P_n w \, dx = 0$ for $m \neq n$
4. **Normalization constant** $C_n = \int_a^b P_n^2 w \, dx$

`polpack` focuses on the **stable numerical evaluation** of these polynomial families.

### Explicit formulas vs. recurrence relations

There are two principal ways to evaluate polynomial families:

| | **Explicit Formulas** | **Three-Term Recurrence** |
|---|---|---|
| Evaluation | Direct from definition | Computed step-by-step from $P_0, P_1, \ldots$ |
| Numerical stability | Often poor at high $n$ (cancellation errors) | Typically excellent and stable |
| Implementation | Combinatorial sums, binomial coefficients | Simple loop |
| Typical use | Symbolic manipulation | Numerical computing |

`polpack` uses **three-term recurrence relations** exclusively for its numerical core.

!!! info "Christoffel–Darboux formula"
    For orthogonal polynomials, the sum of products satisfies a closed form:

    $$
    \sum_{k=0}^n \frac{P_k(x)P_k(y)}{h_k} = \frac{k_n}{k_{n+1} h_n}
    \frac{P_{n+1}(x)P_n(y) - P_n(x)P_{n+1}(y)}{x - y}
    $$

    This identity is fundamental to understanding the convergence of spectral
    expansions and the completeness of orthogonal bases.

---

## 2. Three-Term Recurrence

All orthogonal polynomial families satisfy a **three-term recurrence** of the form:

$$
P_{n+1}(x) = (A_n x + B_n)\, P_n(x) - C_n\, P_{n-1}(x),
$$

starting from $P_0(x)$ and $P_1(x)$, where $A_n, B_n, C_n$ are
family-specific recurrence coefficients. This structure is the basis for all
evaluations in `polpack`.

For **degree-invariant** recurrences, the coefficients $A$, $B$, $C$ are constants
independent of $n$.

---

## 3. Orthogonal Polynomial Families

### Chebyshev Polynomials

**First Kind $T_n(x)$** — orthogonal on $[-1, 1]$ with weight $w(x) = (1-x^2)^{-1/2}$.

$$
T_{n+1}(x) = 2x\, T_n(x) - T_{n-1}(x), \qquad T_0 = 1,\; T_1 = x.
$$

For $x \in [-1, 1]$, there is the explicit representation $T_n(x) = \cos(n \arccos x)$,
which immediately gives $|T_n(x)| \leq 1$.

!!! info "Minimax property"
    Among all polynomials of degree $n$ with leading coefficient 1, the scaled
    Chebyshev polynomial $T_n(x) / 2^{n-1}$ has the smallest possible maximum absolute
    value on $[-1,1]$. This makes Chebyshev nodes optimal for polynomial interpolation
    and function approximation, minimizing the Runge phenomenon.

**Second Kind $U_n(x)$** — orthogonal on $[-1, 1]$ with weight $w(x) = (1-x^2)^{1/2}$.

$$
U_{n+1}(x) = 2x\, U_n(x) - U_{n-1}(x), \qquad U_0 = 1,\; U_1 = 2x.
$$

For $x \in [-1, 1]$: $U_n(x) = \sin((n+1)\arccos x) / \sqrt{1-x^2}$.

**Norm:**

$$
\int_{-1}^{1} T_m(x)\, T_n(x)\, (1-x^2)^{-1/2}\, dx =
\begin{cases}
\pi & m = n = 0 \\
\pi/2 & m = n \neq 0 \\
0 & m \neq n
\end{cases}
$$

### Legendre Polynomials

Orthogonal on $[-1, 1]$ with unit weight $w(x) = 1$.

$$
(n+1)\, P_{n+1}(x) = (2n+1)\, x\, P_n(x) - n\, P_{n-1}(x), \qquad P_0 = 1,\; P_1 = x.
$$

**Norm:**

$$
\int_{-1}^1 P_m(x)\, P_n(x)\, dx = \frac{2}{2n+1}\, \delta_{mn}.
$$

**Properties:**
- $P_n(1) = 1$, $P_n(-1) = (-1)^n$, $|P_n(x)| \leq 1$ on $[-1,1]$.
- The zeros of $P_n(x)$ are the Gauss-Legendre quadrature nodes.
- $P_{n+1}'(x) - P_{n-1}'(x) = (2n+1)\, P_n(x)$.

The **associated Legendre functions** $P_n^m(x)$ generalize $P_n$ for $0 \leq m \leq n$:

$$
P_n^m(x) = (-1)^m (1-x^2)^{m/2} \frac{d^m}{dx^m} P_n(x).
$$

They satisfy a modified recurrence and arise in spherical harmonic expansions.

### Hermite Polynomials

**Physicist's form $H_n(x)$** — orthogonal on $(-\infty, \infty)$ with weight $e^{-x^2}$.

$$
H_{n+1}(x) = 2x\, H_n(x) - 2n\, H_{n-1}(x), \qquad H_0 = 1,\; H_1 = 2x.
$$

**Norm:**

$$
\int_{-\infty}^{\infty} H_m(x)\, H_n(x)\, e^{-x^2}\, dx = \sqrt{\pi}\, 2^n\, n!\; \delta_{mn}.
$$

**Probabilist's form** $He_n(x)$ uses the weight $e^{-x^2/2}$ instead:

$$
He_{n+1}(x) = x\, He_n(x) - n\, He_{n-1}(x).
$$

The **generalized Hermite polynomial** $H_n^{(\mu)}(x)$ is orthogonal under the weight
$|x|^{2\mu} e^{-x^2}$ and reduces to $H_n$ when $\mu = 0$.

### Jacobi Polynomials

The most general family considered here. Orthogonal on $[-1, 1]$ with weight
$w(x) = (1-x)^\alpha (1+x)^\beta$, where $\alpha, \beta > -1$.

$$
P_0^{(\alpha,\beta)} = 1, \qquad P_1^{(\alpha,\beta)} = \tfrac{1}{2}(2 + \alpha + \beta)\, x + \tfrac{1}{2}(\alpha - \beta),
$$

$$
P_{n+1}^{(\alpha,\beta)}(x) = \frac{(2n+\alpha+\beta-1)\bigl[(\alpha^2-\beta^2) + (2n+\alpha+\beta)(2n+\alpha+\beta-2)x\bigr]}{2n(n+\alpha+\beta)(2n+\alpha+\beta-2)}\, P_n^{(\alpha,\beta)}
$$
$$
\quad - \frac{2(n-1+\alpha)(n-1+\beta)(2n+\alpha+\beta)}{2n(n+\alpha+\beta)(2n+\alpha+\beta-2)}\, P_{n-1}^{(\alpha,\beta)}.
$$

**Special cases:**
- $\alpha = \beta = 0$: Legendre polynomials $P_n(x)$
- $\alpha = \beta = -1/2$: Chebyshev $T_n$
- $\alpha = \beta = 1/2$: Chebyshev $U_n$
- $\alpha = \beta$: Gegenbauer polynomials

### Gegenbauer (Ultraspherical) Polynomials

Orthogonal on $[-1, 1]$ with weight $w(x) = (1-x^2)^{\alpha - 1/2}$, $\alpha > -1/2$.

$$
(n+1)\, C_{n+1}^{(\alpha)}(x) = 2(n+\alpha)\, x\, C_n^{(\alpha)}(x) - (n+2\alpha-1)\, C_{n-1}^{(\alpha)}(x),
$$

$$
C_0^{(\alpha)} = 1, \qquad C_1^{(\alpha)} = 2\alpha\, x.
$$

**Special cases:** $\alpha = 1$ gives Chebyshev $U_n$; $\alpha = 1/2$ gives Legendre $P_n$.

### Laguerre Polynomials

**Standard** $L_n(x)$ — orthogonal on $[0, \infty)$ with weight $e^{-x}$.

$$
(n+1)\, L_{n+1}(x) = (2n+1-x)\, L_n(x) - n\, L_{n-1}(x), \qquad L_0 = 1,\; L_1 = 1-x.
$$

**Associated** $L_n^m(x)$ — orthogonal on $[0, \infty)$ for fixed $m \geq 0$:

$$
(n+1)\, L_{n+1}^m(x) = (2n+m+1-x)\, L_n^m(x) - (n+m)\, L_{n-1}^m(x).
$$

**Generalized** $L_n^{(\alpha)}(x)$ — for real $\alpha > -1$:

$$
(n+1)\, L_{n+1}^{(\alpha)}(x) = (2n+\alpha+1-x)\, L_n^{(\alpha)}(x) - (n+\alpha)\, L_{n-1}^{(\alpha)}(x).
$$

### Spherical Harmonics

The spherical harmonic $Y_l^m(\theta, \phi)$ is the angular part of solutions to
Laplace's equation in spherical coordinates:

$$
Y_l^m(\theta, \phi) = \sqrt{\frac{(2l+1)(l-m)!}{4\pi(l+m)!}}\, P_l^m(\cos\theta)\, e^{im\phi},
$$

where $P_l^m$ is the associated Legendre function. `polpack` returns the real and
imaginary parts separately.

---

## 4. Discrete Orthogonal Polynomials

These families are orthogonal with respect to a **discrete** measure (a weight function
defined on a finite or countable set of points).

### Charlier Polynomials $C_n(x; a)$

Orthogonal with respect to the Poisson distribution with parameter $a > 0$:

$$
a\, C_{n+1}(x; a) = (n + a - x)\, C_n(x; a) - n\, C_{n-1}(x; a).
$$

### Krawtchouk Polynomials $K_n(x; p, M)$

Orthogonal with respect to the binomial distribution $\text{Bin}(M, p)$, for $0 < p < 1$:

$$
(n+1)\, K_{n+1} = (x - n - p(M - 2n))\, K_n - (M-n+1)\, p(1-p)\, K_{n-1}.
$$

### Meixner Polynomials $M_n(x; \beta, c)$

Orthogonal with respect to the negative binomial distribution, for $\beta > 0$ and $0 < c < 1$:

$$
(n+1)\, M_{n+1} = ((n + \beta)c + n - (n + \beta)c x/(1-c))\, M_n
                  - n\, M_{n-1} \cdot \text{(recurrence coefficients)}.
$$

### Discrete Chebyshev Polynomials $t_n(x; N)$

Orthogonal on the grid $\{0, 1, \ldots, N-1\}$ with uniform weights.

---

## 5. Non-Orthogonal Polynomial Families

### Bernoulli Polynomials

Defined by the generating function $\frac{te^{xt}}{e^t - 1} = \sum_{n=0}^\infty B_n(x) \frac{t^n}{n!}$:

$$
B_n(x) = \sum_{k=0}^n \binom{n}{k} B_k\, x^{n-k},
$$

where $B_k$ are the Bernoulli numbers. Key properties:

$$
B_n'(x) = n\, B_{n-1}(x), \qquad
B_n(x+1) - B_n(x) = n\, x^{n-1}, \qquad
B_n(0) = B_n(1) = B_n \text{ (for } n \neq 1\text{)}.
$$

### Euler Polynomials

Defined by $\frac{2e^{xt}}{e^t + 1} = \sum_{n=0}^\infty E_n(x) \frac{t^n}{n!}$:

$$
E_n'(x) = n\, E_{n-1}(x), \qquad E_n(1/2) = E_n / 2^n,
$$

where $E_n$ are the Euler numbers.

### Bernstein Polynomials

The Bernstein basis polynomials of degree $n$ on $[0, 1]$ are:

$$
b_{k,n}(x) = \binom{n}{k} x^k (1-x)^{n-k}, \qquad 0 \leq k \leq n.
$$

They satisfy the **partition of unity**:

$$
\sum_{k=0}^n b_{k,n}(x) = 1 \quad \text{for all } x.
$$

These polynomials form the basis of Bézier curves and are used extensively in
computer-aided geometric design (CAGD).

### Cardan Polynomials

Cardan polynomials $C_n(x, s)$ are associated with the solution of cubic equations
and satisfy the three-term recurrence:

$$
C_{n+1}(x, s) = x\, C_n(x, s) - s\, C_{n-1}(x, s), \qquad C_0 = 2,\; C_1 = x.
$$

### Zernike Polynomials

Defined on the unit disk, Zernike polynomials $R_n^m(\rho)$ are used to describe
wavefront aberrations in optics. They satisfy:

$$
R_n^m(\rho) = 0 \quad \text{if } m < 0,\; n < 0, \text{ or } n < m,
\qquad R_m^m(\rho) = \rho^m,
$$

and the recurrence:

$$
R_{n+2}^m = A_n \bigl[(B_n \rho^2 - C_n)\, R_n^m - D_n\, R_{n-2}^m\bigr],
$$

where $A_n, B_n, C_n, D_n$ depend on $n$ and $m$.

---

## 6. Combinatorial Sequences

### Bell Numbers

The Bell number $B_n$ counts the number of set partitions of $\{1, \ldots, n\}$:

$$
B_{n+1} = \sum_{k=0}^n \binom{n}{k} B_k, \qquad B_0 = 1.
$$

Bell numbers grow super-exponentially: $B_0 = 1, B_1 = 1, B_2 = 2, B_3 = 5, B_4 = 15, \ldots$

### Catalan Numbers

The Catalan number $C_n$ counts binary trees, valid parenthesizations, triangulations
of a polygon with $n+2$ vertices, and many other structures:

$$
C_n = \frac{1}{n+1}\binom{2n}{n} = \frac{(2n)!}{(n+1)!\, n!}, \qquad
C_{n+1} = \frac{2(2n+1)}{n+2}\, C_n.
$$

### Stirling Numbers

**First kind** $s(n, k)$: the number of permutations of $n$ objects with exactly $k$ cycles.
Signed: $s(n, k) = (-1)^{n-k} |s(n, k)|$.

**Second kind** $S(n, k)$: the number of ways to partition $n$ objects into $k$ non-empty subsets.

They are related to Bell numbers by $B_n = \sum_{k=1}^n S(n, k)$.

### Fibonacci and Zeckendorf

The Fibonacci sequence satisfies $F_{n+1} = F_n + F_{n-1}$, with $F_0 = 0$, $F_1 = 1$.
The ratio $F_{n+1}/F_n$ converges to the golden ratio $\phi = (1 + \sqrt{5})/2$.

**Zeckendorf's theorem**: every positive integer has a unique representation as a sum of
non-consecutive Fibonacci numbers.

### Eulerian Numbers

The Eulerian number $E(n, k)$ counts the permutations of $\{1, \ldots, n\}$ with exactly
$k$ **ascents** (positions $i$ where $\sigma(i) < \sigma(i+1)$):

$$
E(n, k) = (k+1)\, E(n-1, k) + (n-k)\, E(n-1, k-1).
$$

### Delannoy and Motzkin Numbers

The **Delannoy number** $D(m, n)$ counts lattice paths from $(0,0)$ to $(m,n)$ using
steps east, north, and northeast:

$$
D(m, n) = D(m-1, n) + D(m, n-1) + D(m-1, n-1).
$$

The **Motzkin number** $M_n$ counts paths from $(0,0)$ to $(0,n)$ that never go below
the $x$-axis, using steps $\pm 1$ and $0$:

$$
(n+2)\, M_n = (2n+2)\, M_{n-1} + 3\, M_{n-2}.
$$

---

## 7. Number-Theoretic Functions

### Euler Totient $\phi(n)$

$\phi(n)$ counts the integers in $[1, n]$ coprime to $n$. For the prime factorization
$n = \prod p_i^{e_i}$:

$$
\phi(n) = n \prod_{p \mid n} \left(1 - \frac{1}{p}\right).
$$

### Moebius Function $\mu(n)$

$$
\mu(n) = \begin{cases}
1 & n = 1 \\
(-1)^k & n \text{ is a product of } k \text{ distinct primes} \\
0 & n \text{ has a squared prime factor}
\end{cases}
$$

### Mertens Function $M(n)$

$$
M(n) = \sum_{k=1}^n \mu(k).
$$

The Riemann hypothesis is equivalent to $|M(n)| = O(n^{1/2+\varepsilon})$ for all $\varepsilon > 0$.

### Divisor Functions

- **$\sigma(n)$**: sum of all positive divisors of $n$; $\sigma(p^k) = (p^{k+1}-1)/(p-1)$
- **$\tau(n)$**: number of positive divisors of $n$; $\tau(p^k) = k+1$
- **$\omega(n)$**: number of distinct prime divisors of $n$

---

## 8. Convergence and Numerical Stability

### Forward and Backward Stability

Two notions of stability apply to recurrence-based polynomial evaluation:

- **Forward stability** — accuracy of individual evaluations: $|\hat{P}_n(x) - P_n(x)|$ is small.
- **Backward stability** — the computed $\hat{P}_n(x)$ is the exact solution to a slightly
  perturbed recurrence.

Forward stability is sufficient for function approximation; backward stability matters
in eigenvalue and quadrature computations.

### Stability of Three-Term Recurrences

The three-term recurrence in `polpack` is **numerically stable** for the standard families
within their natural domains:

- Chebyshev $T_n(x)$: stable for $x \in [-1, 1]$; $|T_n(x)| \leq 1$ bounds growth.
- Legendre $P_n(x)$: stable for $x \in [-1, 1]$.
- Hermite $H_n(x)$: stable but values grow as $\sim 2^n$; use with care for large $n$.
- Laguerre $L_n(x)$: stable for $x \geq 0$.

For very high degrees ($n > 1000$), accumulated floating-point rounding can become
significant. In such cases, specialized asymptotic approximations may be preferable.

!!! tip "Evaluation guidance"
    Unlike direct power series evaluation, the three-term recurrence reduces cancellation
    error by building up the polynomial iteratively from $P_0$ and $P_1$. For most
    practical applications ($n \leq 100$), the recurrence is highly accurate.
