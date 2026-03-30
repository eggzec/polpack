"""
Polpack: Special Functions and Recursively-Defined Polynomial Families.

This package provides high-performance routines for evaluating a variety
of mathematical functions, polynomials, and combinatorial sequences.
"""

from . import _polpack
import numpy as np

def agm_values(n_data, a, b, fx):
    """returns some values of the arithmetic geometric mean.

    Args:
        n_data (int): Description for n_data.
        a (float): Description for a.
        b (float): Description for b.
        fx (float): Description for fx.
    """
    return _polpack.agm_values(n_data, a, b, fx)

def bell(n, b):
    """returns the Bell numbers from 0 to N.

    Args:
        n (int): Description for n.
        b (int): Description for b.
    """
    return _polpack.bell(n, b)

def bell_values(n_data, n, c):
    """returns some values of the Bell numbers for testing.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        c (int): Description for c.
    """
    return _polpack.bell_values(n_data, n, c)

def bernoulli_number(n, b):
    """computes the value of the Bernoulli numbers B(0) through B(N).

    Args:
        n (int): Description for n.
        b (float): Description for b.
    """
    return _polpack.bernoulli_number(n, b)

def bernoulli_number2(n, b):
    """evaluates the Bernoulli numbers.

    Args:
        n (int): Description for n.
        b (float): Description for b.
    """
    return _polpack.bernoulli_number2(n, b)

def bernoulli_number3(n, b):
    """computes the value of the Bernoulli number B(N).

    Args:
        n (int): Description for n.
        b (float): Description for b.
    """
    return _polpack.bernoulli_number3(n, b)

def bernoulli_number_values(n_data, n, c):
    """returns some values of the Bernoulli numbers.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        c (float): Description for c.
    """
    return _polpack.bernoulli_number_values(n_data, n, c)

def bernoulli_poly(n, x, bx):
    """evaluates the Bernoulli polynomial of order N at X.

    Args:
        n (int): Description for n.
        x (float): Description for x.
        bx (float): Description for bx.
    """
    return _polpack.bernoulli_poly(n, x, bx)

def bernoulli_poly2(n, x, bx):
    """evaluates the N-th Bernoulli polynomial at X.

    Args:
        n (int): Description for n.
        x (float): Description for x.
        bx (float): Description for bx.
    """
    return _polpack.bernoulli_poly2(n, x, bx)

def bernstein_poly(n, x, bern):
    """evaluates the Bernstein polynomials at a point X.

    Args:
        n (int): Description for n.
        x (float): Description for x.
        bern (float): Description for bern.
    """
    return _polpack.bernstein_poly(n, x, bern)

def bernstein_poly_values(n_data, n, k, x, b):
    """returns some values of the Bernstein polynomials.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        k (int): Description for k.
        x (float): Description for x.
        b (float): Description for b.
    """
    return _polpack.bernstein_poly_values(n_data, n, k, x, b)

def beta_values(n_data, x, y, fxy):
    """returns some values of the Beta function.

    Args:
        n_data (int): Description for n_data.
        x (float): Description for x.
        y (float): Description for y.
        fxy (float): Description for fxy.
    """
    return _polpack.beta_values(n_data, x, y, fxy)

def bpab(n, x, a, b, bern):
    """evaluates at X the Bernstein polynomials based in [A,B].

    Args:
        n (int): Description for n.
        x (float): Description for x.
        a (float): Description for a.
        b (float): Description for b.
        bern (float): Description for bern.
    """
    return _polpack.bpab(n, x, a, b, bern)

def cardan_poly(n, x, s, cx):
    """evaluates the Cardan polynomials.

    Args:
        n (int): Description for n.
        x (float): Description for x.
        s (float): Description for s.
        cx (float): Description for cx.
    """
    return _polpack.cardan_poly(n, x, s, cx)

def cardan_poly_coef(n, s, c):
    """computes the coefficients of the N-th Cardan polynomial.

    Args:
        n (int): Description for n.
        s (float): Description for s.
        c (float): Description for c.
    """
    return _polpack.cardan_poly_coef(n, s, c)

def cardinal_cos(j, m, n, t, c):
    """evaluates the J-th cardinal cosine basis function.

    Args:
        j (int): Description for j.
        m (int): Description for m.
        n (int): Description for n.
        t (float): Description for t.
        c (float): Description for c.
    """
    return _polpack.cardinal_cos(j, m, n, t, c)

def cardinal_sin(j, m, n, t, s):
    """evaluates the J-th cardinal sine basis function.

    Args:
        j (int): Description for j.
        m (int): Description for m.
        n (int): Description for n.
        t (float): Description for t.
        s (float): Description for s.
    """
    return _polpack.cardinal_sin(j, m, n, t, s)

def catalan(n, c):
    """computes the Catalan numbers, from C(0) to C(N).

    Args:
        n (int): Description for n.
        c (int): Description for c.
    """
    return _polpack.catalan(n, c)

def catalan_row_next(ido, n, irow):
    """computes row N of Catalan's triangle.

    Args:
        ido (int): Description for ido.
        n (int): Description for n.
        irow (int): Description for irow.
    """
    return _polpack.catalan_row_next(ido, n, irow)

def catalan_values(n_data, n, c):
    """returns some values of the Catalan numbers for testing.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        c (int): Description for c.
    """
    return _polpack.catalan_values(n_data, n, c)

def charlier(n, a, x, value):
    """evaluates Charlier polynomials at a point.

    Args:
        n (int): Description for n.
        a (float): Description for a.
        x (float): Description for x.
        value (float): Description for value.
    """
    return _polpack.charlier(n, a, x, value)

def cheby_t_poly(m, n, x, cx):
    """evaluates Chebyshev polynomials T(n,x).

    Args:
        m (int): Description for m.
        n (int): Description for n.
        x (float): Description for x.
        cx (float): Description for cx.
    """
    return _polpack.cheby_t_poly(m, n, x, cx)

def cheby_t_poly_coef(n, c):
    """evaluates coefficients of Chebyshev polynomials T(n,x).

    Args:
        n (int): Description for n.
        c (float): Description for c.
    """
    return _polpack.cheby_t_poly_coef(n, c)

def cheby_t_poly_values(n_data, n, x, fx):
    """returns values of Chebyshev polynomials T(n,x).

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.cheby_t_poly_values(n_data, n, x, fx)

def cheby_t_poly_zero(n, z):
    """returns zeroes of Chebyshev polynomials T(n,x).

    Args:
        n (int): Description for n.
        z (float): Description for z.
    """
    return _polpack.cheby_t_poly_zero(n, z)

def cheby_u_poly(m, n, x, cx):
    """evaluates Chebyshev polynomials U(n,x).

    Args:
        m (int): Description for m.
        n (int): Description for n.
        x (float): Description for x.
        cx (float): Description for cx.
    """
    return _polpack.cheby_u_poly(m, n, x, cx)

def cheby_u_poly_coef(n, c):
    """evaluates coefficients of Chebyshev polynomials U(n,x).

    Args:
        n (int): Description for n.
        c (float): Description for c.
    """
    return _polpack.cheby_u_poly_coef(n, c)

def cheby_u_poly_values(n_data, n, x, fx):
    """returns values of Chebyshev polynomials U(n,x).

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.cheby_u_poly_values(n_data, n, x, fx)

def cheby_u_poly_zero(n, z):
    """returns zeroes of Chebyshev polynomials U(n,x).

    Args:
        n (int): Description for n.
        z (float): Description for z.
    """
    return _polpack.cheby_u_poly_zero(n, z)

def chebyshev_discrete(n, m, x, v):
    """evaluates discrete Chebyshev polynomials at a point.

    Args:
        n (int): Description for n.
        m (int): Description for m.
        x (float): Description for x.
        v (float): Description for v.
    """
    return _polpack.chebyshev_discrete(n, m, x, v)

def collatz_count_max(n, i_max, j_max):
    """seeks the maximum Collatz count for 1 through N.

    Args:
        n (int): Description for n.
        i_max (int): Description for i_max.
        j_max (int): Description for j_max.
    """
    return _polpack.collatz_count_max(n, i_max, j_max)

def collatz_count_values(n_data, n, count):
    """returns some values of the Collatz count function.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        count (int): Description for count.
    """
    return _polpack.collatz_count_values(n_data, n, count)

def comb_row_next(n, row):
    """computes the next row of Pascal's triangle.

    Args:
        n (int): Description for n.
        row (int): Description for row.
    """
    return _polpack.comb_row_next(n, row)

def commul(n, nfactor, factor, ncomb):
    """computes a multinomial combinatorial coefficient.

    Args:
        n (int): Description for n.
        nfactor (int): Description for nfactor.
        factor (int): Description for factor.
        ncomb (int): Description for ncomb.
    """
    return _polpack.commul(n, nfactor, factor, ncomb)

def complete_symmetric_poly(n, r, x, value):
    """evaluates a complete symmetric polynomial.

    Args:
        n (int): Description for n.
        r (int): Description for r.
        x (float): Description for x.
        value (float): Description for value.
    """
    return _polpack.complete_symmetric_poly(n, r, x, value)

def cos_power_int_values(n_data, a, b, n, fx):
    """returns some values of the cosine power integral.

    Args:
        n_data (int): Description for n_data.
        a (float): Description for a.
        b (float): Description for b.
        n (int): Description for n.
        fx (float): Description for fx.
    """
    return _polpack.cos_power_int_values(n_data, a, b, n, fx)

def delannoy(m, n, a):
    """returns the Delannoy numbers up to orders (M,N).

    Args:
        m (int): Description for m.
        n (int): Description for n.
        a (int): Description for a.
    """
    return _polpack.delannoy(m, n, a)

def erf_values(n_data, x, fx):
    """returns some values of the ERF or "error" function for testing.

    Args:
        n_data (int): Description for n_data.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.erf_values(n_data, x, fx)

def euler_number(n, e):
    """computes the Euler numbers.

    Args:
        n (int): Description for n.
        e (int): Description for e.
    """
    return _polpack.euler_number(n, e)

def euler_number_values(n_data, n, c):
    """returns some values of the Euler numbers.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        c (int): Description for c.
    """
    return _polpack.euler_number_values(n_data, n, c)

def eulerian(n, e):
    """computes the Eulerian number E(N,K).

    Args:
        n (int): Description for n.
        e (int): Description for e.
    """
    return _polpack.eulerian(n, e)

def fibonacci_direct(n, f):
    """computes the N-th Fibonacci number directly.

    Args:
        n (int): Description for n.
        f (int): Description for f.
    """
    return _polpack.fibonacci_direct(n, f)

def fibonacci_floor(n, f, i):
    """returns the largest Fibonacci number less than or equal to N.

    Args:
        n (int): Description for n.
        f (int): Description for f.
        i (int): Description for i.
    """
    return _polpack.fibonacci_floor(n, f, i)

def fibonacci_recursive(n, f):
    """computes the first N Fibonacci numbers.

    Args:
        n (int): Description for n.
        f (int): Description for f.
    """
    return _polpack.fibonacci_recursive(n, f)

def gamma_log_values(n_data, x, fx):
    """returns some values of the Log Gamma function.

    Args:
        n_data (int): Description for n_data.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.gamma_log_values(n_data, x, fx)

def gamma_values(n_data, x, fx):
    """returns some values of the Gamma function.

    Args:
        n_data (int): Description for n_data.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.gamma_values(n_data, x, fx)

def gegenbauer_poly(n, alpha, x, cx):
    """computes the Gegenbauer polynomials C(I,ALPHA,X).

    Args:
        n (int): Description for n.
        alpha (float): Description for alpha.
        x (float): Description for x.
        cx (float): Description for cx.
    """
    return _polpack.gegenbauer_poly(n, alpha, x, cx)

def gegenbauer_poly_values(n_data, n, a, x, fx):
    """returns some values of the Gegenbauer polynomials.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        a (float): Description for a.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.gegenbauer_poly_values(n_data, n, a, x, fx)

def gen_hermite_poly(n, x, mu, p):
    """evaluates the generalized Hermite polynomials at X.

    Args:
        n (int): Description for n.
        x (float): Description for x.
        mu (float): Description for mu.
        p (float): Description for p.
    """
    return _polpack.gen_hermite_poly(n, x, mu, p)

def gen_laguerre_poly(n, alpha, x, cx):
    """evaluates generalized Laguerre polynomials.

    Args:
        n (int): Description for n.
        alpha (float): Description for alpha.
        x (float): Description for x.
        cx (float): Description for cx.
    """
    return _polpack.gen_laguerre_poly(n, alpha, x, cx)

def gud_values(n_data, x, fx):
    """returns some values of the Gudermannian function.

    Args:
        n_data (int): Description for n_data.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.gud_values(n_data, x, fx)

def hermite_poly_phys(n, x, cx):
    """evaluates the physicisist's Hermite polynomials at X.

    Args:
        n (int): Description for n.
        x (float): Description for x.
        cx (float): Description for cx.
    """
    return _polpack.hermite_poly_phys(n, x, cx)

def hermite_poly_phys_coef(n, c):
    """evaluates the physicist's Hermite polynomial coefficients.

    Args:
        n (int): Description for n.
        c (float): Description for c.
    """
    return _polpack.hermite_poly_phys_coef(n, c)

def hermite_poly_phys_values(n_data, n, x, fx):
    """returns some values of the physicist's Hermite polynomial.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.hermite_poly_phys_values(n_data, n, x, fx)

def hyper_2f1_values(n_data, a, b, c, x, fx):
    """returns some values of the hypergeometric function 2F1.

    Args:
        n_data (int): Description for n_data.
        a (float): Description for a.
        b (float): Description for b.
        c (float): Description for c.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.hyper_2f1_values(n_data, a, b, c, x, fx)

def i4_factor(n, factor_max, factor_num, factor, power, nleft):
    """factors an I4 into prime factors.

    Args:
        n (int): Description for n.
        factor_max (int): Description for factor_max.
        factor_num (int): Description for factor_num.
        factor (int): Description for factor.
        power (int): Description for power.
        nleft (int): Description for nleft.
    """
    return _polpack.i4_factor(n, factor_max, factor_num, factor, power, nleft)

def i4_factorial2_values(n_data, n, fn):
    """returns values of the double factorial function.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        fn (int): Description for fn.
    """
    return _polpack.i4_factorial2_values(n_data, n, fn)

def i4_factorial_values(n_data, n, fn):
    """returns values of the factorial function.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        fn (int): Description for fn.
    """
    return _polpack.i4_factorial_values(n_data, n, fn)

def i4_partition_distinct_count(n, q):
    """returns any value of Q(N).

    Args:
        n (int): Description for n.
        q (int): Description for q.
    """
    return _polpack.i4_partition_distinct_count(n, q)

def i4_swap(i, j):
    """switches two I4's.

    Args:
        i (int): Description for i.
        j (int): Description for j.
    """
    return _polpack.i4_swap(i, j)

def i4_to_triangle_lower(k, i, j):
    """Evaluates the i4_to_triangle_lower function.

    Args:
        k (int): Description for k.
        i (int): Description for i.
        j (int): Description for j.
    """
    return _polpack.i4_to_triangle_lower(k, i, j)

def i4_to_triangle_upper(k, i, j):
    """Evaluates the i4_to_triangle_upper function.

    Args:
        k (int): Description for k.
        i (int): Description for i.
        j (int): Description for j.
    """
    return _polpack.i4_to_triangle_upper(k, i, j)

def i4mat_print(m, n, a, title):
    """prints an I4MAT.

    Args:
        m (int): Description for m.
        n (int): Description for n.
        a (int): Description for a.
        title (character): Description for title.
    """
    return _polpack.i4mat_print(m, n, a, title)

def i4mat_print_some(m, n, a, ilo, jlo, ihi, jhi, title):
    """prints some of an I4MAT.

    Args:
        m (int): Description for m.
        n (int): Description for n.
        a (int): Description for a.
        ilo (int): Description for ilo.
        jlo (int): Description for jlo.
        ihi (int): Description for ihi.
        jhi (int): Description for jhi.
        title (character): Description for title.
    """
    return _polpack.i4mat_print_some(m, n, a, ilo, jlo, ihi, jhi, title)

def jacobi_poly(n, alpha, beta, x, cx):
    """evaluates the Jacobi polynomials at X.

    Args:
        n (int): Description for n.
        alpha (float): Description for alpha.
        beta (float): Description for beta.
        x (float): Description for x.
        cx (float): Description for cx.
    """
    return _polpack.jacobi_poly(n, alpha, beta, x, cx)

def jacobi_poly_values(n_data, n, a, b, x, fx):
    """returns some values of the Jacobi polynomial.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        a (float): Description for a.
        b (float): Description for b.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.jacobi_poly_values(n_data, n, a, b, x, fx)

def jacobi_symbol(q, p, j):
    """evaluates the Jacobi symbol (Q/P).

    Args:
        q (int): Description for q.
        p (int): Description for p.
        j (int): Description for j.
    """
    return _polpack.jacobi_symbol(q, p, j)

def krawtchouk(n, p, x, m, v):
    """evaluates the Krawtchouk polynomials at X.

    Args:
        n (int): Description for n.
        p (float): Description for p.
        x (float): Description for x.
        m (int): Description for m.
        v (float): Description for v.
    """
    return _polpack.krawtchouk(n, p, x, m, v)

def laguerre_associated(n, m, x, cx):
    """evaluates associated Laguerre polynomials L(N,M,X).

    Args:
        n (int): Description for n.
        m (int): Description for m.
        x (float): Description for x.
        cx (float): Description for cx.
    """
    return _polpack.laguerre_associated(n, m, x, cx)

def laguerre_poly(n, x, cx):
    """evaluates the Laguerre polynomials at X.

    Args:
        n (int): Description for n.
        x (float): Description for x.
        cx (float): Description for cx.
    """
    return _polpack.laguerre_poly(n, x, cx)

def laguerre_poly_coef(n, c):
    """evaluates the Laguerre polynomial coefficients.

    Args:
        n (int): Description for n.
        c (float): Description for c.
    """
    return _polpack.laguerre_poly_coef(n, c)

def laguerre_polynomial_values(n_data, n, x, fx):
    """returns some values of the Laguerre polynomial.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.laguerre_polynomial_values(n_data, n, x, fx)

def lambert_w_values(n_data, x, fx):
    """returns some values of the Lambert W function.

    Args:
        n_data (int): Description for n_data.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.lambert_w_values(n_data, x, fx)

def legendre_associated(n, m, x, cx):
    """evaluates the associated Legendre functions.

    Args:
        n (int): Description for n.
        m (int): Description for m.
        x (float): Description for x.
        cx (float): Description for cx.
    """
    return _polpack.legendre_associated(n, m, x, cx)

def legendre_associated_normalized(n, m, x, cx):
    """Evaluates the legendre_associated_normalized function.

    Args:
        n (int): Description for n.
        m (int): Description for m.
        x (float): Description for x.
        cx (float): Description for cx.
    """
    return _polpack.legendre_associated_normalized(n, m, x, cx)

def legendre_associated_normalized_sphere_values(n_data, n, m, x, fx):
    """Evaluates the legendre_associated_normalized_sphere_values function.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        m (int): Description for m.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.legendre_associated_normalized_sphere_values(n_data, n, m, x, fx)

def legendre_associated_values(n_data, n, m, x, fx):
    """returns values of associated Legendre functions.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        m (int): Description for m.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.legendre_associated_values(n_data, n, m, x, fx)

def legendre_function_q(n, x, cx):
    """evaluates the Legendre Q functions.

    Args:
        n (int): Description for n.
        x (float): Description for x.
        cx (float): Description for cx.
    """
    return _polpack.legendre_function_q(n, x, cx)

def legendre_function_q_values(n_data, n, x, fx):
    """returns values of the Legendre Q function.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.legendre_function_q_values(n_data, n, x, fx)

def legendre_poly(n, x, cx, cpx):
    """evaluates the Legendre polynomials P(N,X) at X.

    Args:
        n (int): Description for n.
        x (float): Description for x.
        cx (float): Description for cx.
        cpx (float): Description for cpx.
    """
    return _polpack.legendre_poly(n, x, cx, cpx)

def legendre_poly_coef(n, c):
    """evaluates the Legendre polynomial coefficients.

    Args:
        n (int): Description for n.
        c (float): Description for c.
    """
    return _polpack.legendre_poly_coef(n, c)

def legendre_poly_values(n_data, n, x, fx):
    """returns values of the Legendre polynomials.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.legendre_poly_values(n_data, n, x, fx)

def legendre_symbol(q, p, l):
    """evaluates the Legendre symbol (Q/P).

    Args:
        q (int): Description for q.
        p (int): Description for p.
        l (int): Description for l.
    """
    return _polpack.legendre_symbol(q, p, l)

def lerch_values(n_data, z, s, a, fx):
    """returns some values of the Lerch transcendent function.

    Args:
        n_data (int): Description for n_data.
        z (float): Description for z.
        s (int): Description for s.
        a (float): Description for a.
        fx (float): Description for fx.
    """
    return _polpack.lerch_values(n_data, z, s, a, fx)

def lock(n, a):
    """returns the number of codes for a lock with N buttons.

    Args:
        n (int): Description for n.
        a (int): Description for a.
    """
    return _polpack.lock(n, a)

def meixner(n, beta, c, x, v):
    """evaluates Meixner polynomials at a point.

    Args:
        n (int): Description for n.
        beta (float): Description for beta.
        c (float): Description for c.
        x (float): Description for x.
        v (float): Description for v.
    """
    return _polpack.meixner(n, beta, c, x, v)

def mertens_values(n_data, n, c):
    """returns some values of the Mertens function.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        c (int): Description for c.
    """
    return _polpack.mertens_values(n_data, n, c)

def moebius(n, mu):
    """returns the value of MU(N), the Moebius function of N.

    Args:
        n (int): Description for n.
        mu (int): Description for mu.
    """
    return _polpack.moebius(n, mu)

def moebius_values(n_data, n, c):
    """returns some values of the Moebius function.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        c (int): Description for c.
    """
    return _polpack.moebius_values(n_data, n, c)

def motzkin(n, a):
    """returns the Motzkin numbers up to order N.

    Args:
        n (int): Description for n.
        a (int): Description for a.
    """
    return _polpack.motzkin(n, a)

def normal_01_cdf_values(n_data, x, fx):
    """returns some values of the Normal 01 CDF.

    Args:
        n_data (int): Description for n_data.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.normal_01_cdf_values(n_data, x, fx)

def omega(n, ndiv):
    """returns OMEGA(N), the number of distinct prime divisors of N.

    Args:
        n (int): Description for n.
        ndiv (int): Description for ndiv.
    """
    return _polpack.omega(n, ndiv)

def omega_values(n_data, n, c):
    """returns some values of the OMEGA function.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        c (int): Description for c.
    """
    return _polpack.omega_values(n_data, n, c)

def partition_distinct_count_values(n_data, n, c):
    """returns some values of Q(N).

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        c (int): Description for c.
    """
    return _polpack.partition_distinct_count_values(n_data, n, c)

def pentagon_num(n, p):
    """computes the N-th pentagonal number.

    Args:
        n (int): Description for n.
        p (int): Description for p.
    """
    return _polpack.pentagon_num(n, p)

def phi(n, phin):
    """computes the number of relatively prime predecessors of an integer.

    Args:
        n (int): Description for n.
        phin (int): Description for phin.
    """
    return _polpack.phi(n, phin)

def phi_values(n_data, n, c):
    """returns some values of the PHI function.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        c (int): Description for c.
    """
    return _polpack.phi_values(n_data, n, c)

def poly_bernoulli(n, k, b):
    """evaluates the poly-Bernolli numbers with negative index.

    Args:
        n (int): Description for n.
        k (int): Description for k.
        b (int): Description for b.
    """
    return _polpack.poly_bernoulli(n, k, b)

def psi_values(n_data, x, fx):
    """returns some values of the Psi or Digamma function for testing.

    Args:
        n_data (int): Description for n_data.
        x (float): Description for x.
        fx (float): Description for fx.
    """
    return _polpack.psi_values(n_data, x, fx)

def r8_factorial_log_values(n_data, n, fn):
    """returns values of log(factorial(n)).

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        fn (float): Description for fn.
    """
    return _polpack.r8_factorial_log_values(n_data, n, fn)

def r8_factorial_values(n_data, n, fn):
    """returns values of the real factorial function.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        fn (float): Description for fn.
    """
    return _polpack.r8_factorial_values(n_data, n, fn)

def r8_hyper_2f1(a_input, b_input, c_input, x_input, hf):
    """evaluates the hypergeometric function F(A,B,C,X).

    Args:
        a_input (float): Description for a_input.
        b_input (float): Description for b_input.
        c_input (float): Description for c_input.
        x_input (float): Description for x_input.
        hf (float): Description for hf.
    """
    return _polpack.r8_hyper_2f1(a_input, b_input, c_input, x_input, hf)

def r8poly_print(n, a, title):
    """prints out a polynomial.

    Args:
        n (int): Description for n.
        a (float): Description for a.
        title (character): Description for title.
    """
    return _polpack.r8poly_print(n, a, title)

def r8vec_linspace(n, a, b, x):
    """creates a vector of linearly spaced values.

    Args:
        n (int): Description for n.
        a (float): Description for a.
        b (float): Description for b.
        x (float): Description for x.
    """
    return _polpack.r8vec_linspace(n, a, b, x)

def r8vec_print(n, a, title):
    """prints an R8VEC.

    Args:
        n (int): Description for n.
        a (float): Description for a.
        title (character): Description for title.
    """
    return _polpack.r8vec_print(n, a, title)

def r8vec_print_some(n, a, max_print, title):
    """prints "some" of an R8VEC.

    Args:
        n (int): Description for n.
        a (float): Description for a.
        max_print (int): Description for max_print.
        title (character): Description for title.
    """
    return _polpack.r8vec_print_some(n, a, max_print, title)

def r8vec_uniform_ab(n, a, b, seed, r):
    """returns a scaled pseudorandom R8VEC.

    Args:
        n (int): Description for n.
        a (float): Description for a.
        b (float): Description for b.
        seed (int): Description for seed.
        r (float): Description for r.
    """
    return _polpack.r8vec_uniform_ab(n, a, b, seed, r)

def sigma(n, sigma_n):
    """returns the value of SIGMA(N), the divisor sum.

    Args:
        n (int): Description for n.
        sigma_n (int): Description for sigma_n.
    """
    return _polpack.sigma(n, sigma_n)

def sigma_values(n_data, n, c):
    """returns some values of the Sigma function.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        c (int): Description for c.
    """
    return _polpack.sigma_values(n_data, n, c)

def sin_power_int_values(n_data, a, b, n, fx):
    """returns some values of the sine power integral.

    Args:
        n_data (int): Description for n_data.
        a (float): Description for a.
        b (float): Description for b.
        n (int): Description for n.
        fx (float): Description for fx.
    """
    return _polpack.sin_power_int_values(n_data, a, b, n, fx)

def slice(dim_num, slice_num, piece_num):
    """Evaluates the slice function.

    Args:
        dim_num (int): Description for dim_num.
        slice_num (int): Description for slice_num.
        piece_num (int): Description for piece_num.
    """
    return _polpack.slice(dim_num, slice_num, piece_num)

def spherical_harmonic(l, m, theta, phi, c, s):
    """evaluates spherical harmonic functions.

    Args:
        l (int): Description for l.
        m (int): Description for m.
        theta (float): Description for theta.
        phi (float): Description for phi.
        c (float): Description for c.
        s (float): Description for s.
    """
    return _polpack.spherical_harmonic(l, m, theta, phi, c, s)

def spherical_harmonic_values(n_data, l, m, theta, phi, yr, yi):
    """returns values of spherical harmonic functions.

    Args:
        n_data (int): Description for n_data.
        l (int): Description for l.
        m (int): Description for m.
        theta (float): Description for theta.
        phi (float): Description for phi.
        yr (float): Description for yr.
        yi (float): Description for yi.
    """
    return _polpack.spherical_harmonic_values(n_data, l, m, theta, phi, yr, yi)

def stirling1(n, m, s1):
    """computes the Stirling numbers of the first kind.

    Args:
        n (int): Description for n.
        m (int): Description for m.
        s1 (int): Description for s1.
    """
    return _polpack.stirling1(n, m, s1)

def stirling2(n, m, s2):
    """computes the Stirling numbers of the second kind.

    Args:
        n (int): Description for n.
        m (int): Description for m.
        s2 (int): Description for s2.
    """
    return _polpack.stirling2(n, m, s2)

def tau(n, taun):
    """returns the value of TAU(N), the number of distinct divisors of N.

    Args:
        n (int): Description for n.
        taun (int): Description for taun.
    """
    return _polpack.tau(n, taun)

def tau_values(n_data, n, c):
    """returns some values of the Tau function.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        c (int): Description for c.
    """
    return _polpack.tau_values(n_data, n, c)

def triangle_lower_to_i4(i, j, k):
    """Evaluates the triangle_lower_to_i4 function.

    Args:
        i (int): Description for i.
        j (int): Description for j.
        k (int): Description for k.
    """
    return _polpack.triangle_lower_to_i4(i, j, k)

def triangle_upper_to_i4(i, j, k):
    """Evaluates the triangle_upper_to_i4 function.

    Args:
        i (int): Description for i.
        j (int): Description for j.
        k (int): Description for k.
    """
    return _polpack.triangle_upper_to_i4(i, j, k)

def vibonacci(n, seed, v):
    """computes the first N Vibonacci numbers.

    Args:
        n (int): Description for n.
        seed (int): Description for seed.
        v (int): Description for v.
    """
    return _polpack.vibonacci(n, seed, v)

def zeckendorf(n, m_max, m, i_list, f_list):
    """produces the Zeckendorf decomposition of a positive integer.

    Args:
        n (int): Description for n.
        m_max (int): Description for m_max.
        m (int): Description for m.
        i_list (int): Description for i_list.
        f_list (int): Description for f_list.
    """
    return _polpack.zeckendorf(n, m_max, m, i_list, f_list)

def zernike_poly(m, n, rho, z):
    """evaluates a Zernike polynomial at RHO.

    Args:
        m (int): Description for m.
        n (int): Description for n.
        rho (float): Description for rho.
        z (float): Description for z.
    """
    return _polpack.zernike_poly(m, n, rho, z)

def zernike_poly_coef(m, n, c):
    """Evaluates the zernike_poly_coef function.

    Args:
        m (int): Description for m.
        n (int): Description for n.
        c (float): Description for c.
    """
    return _polpack.zernike_poly_coef(m, n, c)

def zeta_values(n_data, n, zeta):
    """returns some values of the Riemann Zeta function.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        zeta (float): Description for zeta.
    """
    return _polpack.zeta_values(n_data, n, zeta)

def agud(g):
    """evaluates the inverse Gudermannian function.

    Args:
        g: Description for g.
    """
    return _polpack.agud(g)

def align_enum(m, n):
    """counts the alignments of two sequences of M and N elements.

    Args:
        m: Description for m.
        n: Description for n.
    """
    return _polpack.align_enum(m, n)

def benford(ival):
    """returns the Benford probability of one or more significant digits.

    Args:
        ival: Description for ival.
    """
    return _polpack.benford(ival)

def catalan_constant():
    """returns the value of Catalan's constant.

    """
    return _polpack.catalan_constant()

def collatz_count(n):
    """counts the number of terms in a Collatz sequence.

    Args:
        n: Description for n.
    """
    return _polpack.collatz_count(n)

def cos_power_int(a, b, n):
    """evaluates the cosine power integral.

    Args:
        a: Description for a.
        b: Description for b.
        n: Description for n.
    """
    return _polpack.cos_power_int(a, b, n)

def euler_number2(n):
    """computes the Euler numbers.

    Args:
        n: Description for n.
    """
    return _polpack.euler_number2(n)

def euler_poly(n, x):
    """evaluates the N-th Euler polynomial at X.

    Args:
        n: Description for n.
        x: Description for x.
    """
    return _polpack.euler_poly(n, x)

def gud(x):
    """evaluates the Gudermannian function.

    Args:
        x: Description for x.
    """
    return _polpack.gud(x)

def i4_choose(n, k):
    """computes the binomial coefficient C(N,K).

    Args:
        n: Description for n.
        k: Description for k.
    """
    return _polpack.i4_choose(n, k)

def i4_factorial(n):
    """computes the factorial of N.

    Args:
        n: Description for n.
    """
    return _polpack.i4_factorial(n)

def i4_factorial2(n):
    """computes the double factorial function.

    Args:
        n: Description for n.
    """
    return _polpack.i4_factorial2(n)

def i4_huge():
    """returns a "huge" I4.

    """
    return _polpack.i4_huge()

def i4_is_prime(n):
    """reports whether an I4 is prime.

    Args:
        n: Description for n.
    """
    return _polpack.i4_is_prime(n)

def i4_is_triangular(i):
    """determines whether an integer is triangular.

    Args:
        i: Description for i.
    """
    return _polpack.i4_is_triangular(i)

def i4_uniform_ab(a, b, seed):
    """returns a scaled pseudorandom I4 between A and B.

    Args:
        a: Description for a.
        b: Description for b.
        seed: Description for seed.
    """
    return _polpack.i4_uniform_ab(a, b, seed)

def lambert_w(x):
    """estimates the Lambert W function.

    Args:
        x: Description for x.
    """
    return _polpack.lambert_w(x)

def lambert_w_crude(x):
    """is a crude estimate of the Lambert W function.

    Args:
        x: Description for x.
    """
    return _polpack.lambert_w_crude(x)

def lerch(z, s, a):
    """estimates the Lerch transcendent function.

    Args:
        z: Description for z.
        s: Description for s.
        a: Description for a.
    """
    return _polpack.lerch(z, s, a)

def mertens(n):
    """evaluates the Mertens function.

    Args:
        n: Description for n.
    """
    return _polpack.mertens(n)

def normal_01_cdf_inverse(p):
    """inverts the standard normal CDF.

    Args:
        p: Description for p.
    """
    return _polpack.normal_01_cdf_inverse(p)

def plane_partition_num(n):
    """returns the number of plane partitions of the integer N.

    Args:
        n: Description for n.
    """
    return _polpack.plane_partition_num(n)

def poly_coef_count(dim, degree):
    """Evaluates the poly_coef_count function.

    Args:
        dim: Description for dim.
        degree: Description for degree.
    """
    return _polpack.poly_coef_count(dim, degree)

def prime(n):
    """returns any of the first PRIME_MAX prime numbers.

    Args:
        n: Description for n.
    """
    return _polpack.prime(n)

def pyramid_num(n):
    """returns the N-th pyramidal number.

    Args:
        n: Description for n.
    """
    return _polpack.pyramid_num(n)

def pyramid_square_num(n):
    """returns the N-th pyramidal square number.

    Args:
        n: Description for n.
    """
    return _polpack.pyramid_square_num(n)

def r8_agm(a, b):
    """computes the arithmetic-geometric mean of A and B.

    Args:
        a: Description for a.
        b: Description for b.
    """
    return _polpack.r8_agm(a, b)

def r8_beta(x, y):
    """returns the value of the Beta function.

    Args:
        x: Description for x.
        y: Description for y.
    """
    return _polpack.r8_beta(x, y)

def r8_choose(n, k):
    """computes the binomial coefficient C(N,K) as an R8.

    Args:
        n: Description for n.
        k: Description for k.
    """
    return _polpack.r8_choose(n, k)

def r8_epsilon():
    """returns the R8 roundoff unit.

    """
    return _polpack.r8_epsilon()

def r8_erf(x):
    """evaluates the error function.

    Args:
        x: Description for x.
    """
    return _polpack.r8_erf(x)

def r8_erf_inverse(y):
    """inverts the error function.

    Args:
        y: Description for y.
    """
    return _polpack.r8_erf_inverse(y)

def r8_euler_constant():
    """returns the value of the Euler-Mascheroni constant.

    """
    return _polpack.r8_euler_constant()

def r8_factorial(n):
    """computes the factorial of N.

    Args:
        n: Description for n.
    """
    return _polpack.r8_factorial(n)

def r8_factorial_log(n):
    """computes log(factorial(N)).

    Args:
        n: Description for n.
    """
    return _polpack.r8_factorial_log(n)

def r8_gamma_log(x):
    """evaluates log ( Gamma ( X ) ) for a real argument.

    Args:
        x: Description for x.
    """
    return _polpack.r8_gamma_log(x)

def r8_huge():
    """returns a "huge" R8.

    """
    return _polpack.r8_huge()

def r8_mop(i):
    """returns the I-th power of -1 as an R8.

    Args:
        i: Description for i.
    """
    return _polpack.r8_mop(i)

def r8_nint(x):
    """returns the nearest integer to an R8.

    Args:
        x: Description for x.
    """
    return _polpack.r8_nint(x)

def r8_pi():
    """returns the value of pi as an R8.

    """
    return _polpack.r8_pi()

def r8_psi(xx):
    """evaluates the function Psi(X).

    Args:
        xx: Description for xx.
    """
    return _polpack.r8_psi(xx)

def r8_uniform_01(seed):
    """returns a unit pseudorandom R8.

    Args:
        seed: Description for seed.
    """
    return _polpack.r8_uniform_01(seed)

def r8poly_degree(na, a):
    """returns the degree of a polynomial.

    Args:
        na: Description for na.
        a: Description for a.
    """
    return _polpack.r8poly_degree(na, a)

def r8poly_value_horner(m, c, x):
    """evaluates a polynomial using Horner's method.

    Args:
        m: Description for m.
        c: Description for c.
        x: Description for x.
    """
    return _polpack.r8poly_value_horner(m, c, x)

def s_len_trim(s):
    """returns the length of a string to the last nonblank.

    Args:
        s: Description for s.
    """
    return _polpack.s_len_trim(s)

def simplex_num(m, n):
    """evaluates the N-th Simplex number in M dimensions.

    Args:
        m: Description for m.
        n: Description for n.
    """
    return _polpack.simplex_num(m, n)

def sin_power_int(a, b, n):
    """evaluates the sine power integral.

    Args:
        a: Description for a.
        b: Description for b.
        n: Description for n.
    """
    return _polpack.sin_power_int(a, b, n)

def tetrahedron_num(n):
    """returns the N-th tetrahedral number.

    Args:
        n: Description for n.
    """
    return _polpack.tetrahedron_num(n)

def triangle_num(n):
    """returns the N-th triangular number.

    Args:
        n: Description for n.
    """
    return _polpack.triangle_num(n)

def trinomial(i, j, k):
    """computes a trinomial coefficient.

    Args:
        i: Description for i.
        j: Description for j.
        k: Description for k.
    """
    return _polpack.trinomial(i, j, k)

def zeta(p):
    """estimates the Riemann Zeta function.

    Args:
        p: Description for p.
    """
    return _polpack.zeta(p)

