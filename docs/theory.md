# Theory

`polpack` implements numerical algorithms for a broad set of mathematical objects, primarily focused on recursive relations and orthogonal properties.

## Orthogonal Polynomials

Many of the polynomial families in `polpack` share the property of **orthogonality** with respect to a weight function $w(x)$ over an interval $[a, b]$:

$$
\int_a^b w(x) P_n(x) P_m(x) \, dx = \delta_{nm} h_n,
$$

where $\delta_{nm}$ is the Kronecker delta and $h_n$ is a normalization constant.

### Three-term recurrence

Most orthogonal polynomials are computed using a stable three-term recurrence relation of the form:

$$
P_{n+1}(x) = (A_n x + B_n) P_n(x) - C_n P_{n-1}(x).
$$

`polpack` evaluates these recurrences efficiently in Fortran, ensuring high precision and performance.

## Combinatorial Sequences

### Bell Numbers
The Bell number $B_n$ counts the number of partitions of a set of $n$ elements.

### Catalan Numbers
Catalan numbers $C_n$ count various objects in combinatorial geometry and computer science, such as the number of ways to triangulate a convex polygon with $n+2$ vertices.

### Fibonacci Numbers
The Fibonacci sequence is defined by $F_0=0, F_1=1$, and $F_{n} = F_{n-1} + F_{n-2}$.

---

*Refer to [References](references.md) for detailed literature on these mathematical objects.*
