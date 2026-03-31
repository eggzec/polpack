"""
Polpack: Special Functions and Recursively-Defined Polynomial Families.

This package provides high-performance routines for evaluating a variety
of mathematical functions, polynomials, and combinatorial sequences.
"""

import numpy as np

from . import _polpack


def agm_values(n_data: int, a: float, b: float, fx: float) -> None:
    """Returns some values of the arithmetic geometric mean.

    Args:
        n_data (int): Number of data points.
        a (float): First value.
        b (float): Second value.
        fx (float): Function value.
    Returns:
        None
    """
    return _polpack.agm_values(n_data, a, b, fx)


def bell(n: int, b: np.ndarray) -> None:
    """Returns the Bell numbers from 0 to N.

    Args:
        n (int): order of recursion.
        b (np.ndarray): array to store Bell numbers.
    Returns:
        None
    """
    return _polpack.bell(n, b)


def bell_values(n_data: int, n: int, c: np.ndarray) -> None:
    """Returns some values of the Bell numbers for testing.

    Args:
        n_data (int): Description for n_data.
        n (int): Description for n.
        c (int): Description for c.
    """
    return _polpack.bell_values(n_data, n, c)


def bernoulli_number(n: int, b: np.ndarray) -> None:
    """Computes the value of the Bernoulli numbers B(0) through B(N).

    Args:
        n (int): Description for n.
        b (float): Description for b.
    """
    return _polpack.bernoulli_number(n, b)


def bernoulli_number2(n: int, b: np.ndarray) -> None:
    """Evaluates the Bernoulli numbers.

    Args:
        n (int): Description for n.
        b (float): Description for b.
    """
    return _polpack.bernoulli_number2(n, b)


def bernoulli_number3(n: int, b: np.ndarray) -> None:
    """Computes the value of the Bernoulli number B(N).

    Args:
        n (int): Description for n.
        b (float): Description for b.
    """
    return _polpack.bernoulli_number3(n, b)


def bernoulli_number_values(n_data: int, n: int, c: float) -> None:
    """Returns some values of the Bernoulli numbers.

    Args:
        n_data (int): Number of data points.
        n (int): value of n.
        c (float): value of Bernoulli number.
    Returns:
        None
    """
    return _polpack.bernoulli_number_values(n_data, n, c)


def bernoulli_poly(n: int, x: float) -> float:
    """Evaluates the Bernoulli polynomial of order N at X.

    Args:
        n (int): order of the polynomial.
        x (float): evaluation point.
    Returns:
        float: value of the Bernoulli polynomial.
    """
    return _polpack.bernoulli_poly(n, x)


def bernoulli_poly2(n: int, x: float, bx: float) -> None:
    """Evaluates the N-th Bernoulli polynomial at X.

    Args:
        n (int): order of polynomial.
        x (float): evaluation point.
        bx (float): value of Bernoulli polynomial.
    Returns:
        None
    """
    return _polpack.bernoulli_poly2(n, x, bx)


def bernstein_poly(n: int, x: float, bern: np.ndarray) -> None:
    """Evaluates the Bernstein polynomials at a point X.

    Args:
        n (int): degree of polynomial.
        x (float): evaluation point.
        bern (np.ndarray): values of Bernstein polynomials.
    Returns:
        None
    """
    return _polpack.bernstein_poly(n, x, bern)


def bernstein_poly_values(
    n_data: int, n: int, k: int, x: float, b: float
) -> None:
    """Returns some values of the Bernstein polynomials.

    Args:
        n_data (int): Number of data points.
        n (int): degree of polynomial.
        k (int): index of polynomial.
        x (float): evaluation point.
        b (float): value of Bernstein polynomial.
    Returns:
        None
    """
    return _polpack.bernstein_poly_values(n_data, n, k, x, b)


def beta_values(n_data: int, x: float, y: float, fxy: float) -> None:
    """Returns some values of the Beta function.

    Args:
        n_data (int): Number of data points.
        x (float): First argument.
        y (float): Second argument.
        fxy (float): Function value.
    Returns:
        None
    """
    return _polpack.beta_values(n_data, x, y, fxy)


def bpab(n: int, x: float, a: float, b: float, bern: np.ndarray) -> None:
    """Evaluates at X the Bernstein polynomials based in [A,B].

    Args:
        n (int): degree of polynomial.
        x (float): evaluation point.
        a (float): left endpoint.
        b (float): right endpoint.
        bern (np.ndarray): values of Bernstein polynomials.
    Returns:
        None
    """
    return _polpack.bpab(n, x, a, b, bern)


def cardan_poly(n: int, x: float, s: float, cx: np.ndarray) -> None:
    """Evaluates the Cardan polynomials.

    Args:
        n (int): degree of polynomial.
        x (float): evaluation point.
        s (float): parameter s.
        cx (np.ndarray): value of Cardan polynomial.
    Returns:
        None
    """
    return _polpack.cardan_poly(n, x, s, cx)


def cardan_poly_coef(n: int, s: float, c: np.ndarray) -> None:
    """Computes the coefficients of the N-th Cardan polynomial.

    Args:
        n (int): degree of polynomial.
        s (float): parameter s.
        c (np.ndarray): coefficients of Cardan polynomial.
    Returns:
        None
    """
    return _polpack.cardan_poly_coef(n, s, c)


def cardinal_cos(j: int, m: int, n: int, t: float, c: np.ndarray) -> None:
    """Evaluates the J-th cardinal cosine basis function.

    Args:
        j (int): index of basis function.
        m (int): parameter m.
        n (int): parameter n.
        t (float): evaluation point.
        c (np.ndarray): value of basis function.
    Returns:
        None
    """
    return _polpack.cardinal_cos(j, m, n, t, c)


def cardinal_sin(j: int, m: int, n: int, t: float, s: np.ndarray) -> None:
    """Evaluates the J-th cardinal sine basis function.

    Args:
        j (int): index of basis function.
        m (int): parameter m.
        n (int): parameter n.
        t (float): evaluation point.
        s (np.ndarray): value of basis function.
    Returns:
        None
    """
    return _polpack.cardinal_sin(j, m, n, t, s)


def catalan(n: int, c: np.ndarray) -> None:
    """Computes the Catalan numbers, from C(0) to C(N).

    Args:
        n (int): degree.
        c (np.ndarray): Catalan numbers.
    Returns:
        None
    """
    return _polpack.catalan(n, c)


def catalan_row_next(ido: int, n: int, irow: np.ndarray) -> None:
    """Computes row N of Catalan's triangle.

    Args:
        ido (int): initialization flag.
        n (int): row index.
        irow (np.ndarray): row values.
    Returns:
        None
    """
    return _polpack.catalan_row_next(ido, n, irow)


def catalan_values(n_data: int, n: int, c: int) -> None:
    """Returns some values of the Catalan numbers for testing.

    Args:
        n_data (int): Number of points.
        n (int): index.
        c (int): value.
    Returns:
        None
    """
    return _polpack.catalan_values(n_data, n, c)


def charlier(n: int, a: float, x: float, value: np.ndarray) -> None:
    """Evaluates Charlier polynomials at a point.

    Args:
        n (int): degree.
        a (float): parameter.
        x (float): point.
        value (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.charlier(n, a, x, value)


def cheby_t_poly(m: int, n: int, x: float, cx: np.ndarray) -> None:
    """Evaluates Chebyshev polynomials T(n,x).

    Args:
        m (int): number of points.
        n (int): max degree.
        x (float): point.
        cx (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.cheby_t_poly(m, n, x, cx)


def cheby_t_poly_coef(n: int, c: np.ndarray) -> None:
    """Evaluates coefficients of Chebyshev polynomials T(n,x).

    Args:
        n (int): degree.
        c (np.ndarray): coefficients.
    Returns:
        None
    """
    return _polpack.cheby_t_poly_coef(n, c)


def cheby_t_poly_values(n_data: int, n: int, x: float, fx: float) -> None:
    """Returns values of Chebyshev polynomials T(n,x).

    Args:
        n_data (int): points.
        n (int): degree.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.cheby_t_poly_values(n_data, n, x, fx)


def cheby_t_poly_zero(n: int, z: np.ndarray) -> None:
    """Returns zeroes of Chebyshev polynomials T(n,x).

    Args:
        n (int): degree.
        z (np.ndarray): zeroes.
    Returns:
        None
    """
    return _polpack.cheby_t_poly_zero(n, z)


def cheby_u_poly(m: int, n: int, x: float, cx: np.ndarray) -> None:
    """Evaluates Chebyshev polynomials U(n,x).

    Args:
        m (int): number of points.
        n (int): max degree.
        x (float): point.
        cx (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.cheby_u_poly(m, n, x, cx)


def cheby_u_poly_coef(n: int, c: np.ndarray) -> None:
    """Evaluates coefficients of Chebyshev polynomials U(n,x).

    Args:
        n (int): degree.
        c (np.ndarray): coefficients.
    Returns:
        None
    """
    return _polpack.cheby_u_poly_coef(n, c)


def cheby_u_poly_values(n_data: int, n: int, x: float, fx: float) -> None:
    """Returns values of Chebyshev polynomials U(n,x).

    Args:
        n_data (int): points.
        n (int): degree.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.cheby_u_poly_values(n_data, n, x, fx)


def cheby_u_poly_zero(n: int, z: np.ndarray) -> None:
    """Returns zeroes of Chebyshev polynomials U(n,x).

    Args:
        n (int): degree.
        z (np.ndarray): zeroes.
    Returns:
        None
    """
    return _polpack.cheby_u_poly_zero(n, z)


def chebyshev_discrete(n, m, x, v):
    """Evaluates discrete Chebyshev polynomials at a point.

    Args:
        n (int): Description for n.
        m (int): Description for m.
        x (float): Description for x.
        v (float): Description for v.
    """
    return _polpack.chebyshev_discrete(n, m, x, v)


def collatz_count_max(n: int, i_max: np.ndarray, j_max: np.ndarray) -> None:
    """Seeks the maximum Collatz count for 1 through N.

    Args:
        n (int): maximum value to check.
        i_max (np.ndarray): value achieving the maximum count.
        j_max (np.ndarray): the maximum count.
    Returns:
        None
    """
    return _polpack.collatz_count_max(n, i_max, j_max)


def collatz_count_values(n_data: int, n: int, count: int) -> None:
    """Returns some values of the Collatz count function.

    Args:
        n_data (int): Number of points.
        n (int): value of n.
        count (int): Collatz count.
    Returns:
        None
    """
    return _polpack.collatz_count_values(n_data, n, count)


def comb_row_next(n: int, row: np.ndarray) -> None:
    """Computes the next row of Pascal's triangle.

    Args:
        n (int): current row index.
        row (np.ndarray): current row / next row.
    Returns:
        None
    """
    return _polpack.comb_row_next(n, row)


def commul(n: int, nfactor: int, factor: np.ndarray, ncomb: int) -> None:
    """Computes a multinomial combinatorial coefficient.

    Args:
        n (int): total number of items.
        nfactor (int): number of factors.
        factor (np.ndarray): counts of each factor.
        ncomb (int): result coefficient.
    Returns:
        None
    """
    return _polpack.commul(n, nfactor, factor, ncomb)


def complete_symmetric_poly(
    n: int, r: int, x: np.ndarray, value: float
) -> None:
    """Evaluates a complete symmetric polynomial.

    Args:
        n (int): number of variables.
        r (int): degree of polynomial.
        x (np.ndarray): variables.
        value (float): result value.
    Returns:
        None
    """
    return _polpack.complete_symmetric_poly(n, r, x, value)


def cos_power_int_values(
    n_data: int, a: float, b: float, n: int, fx: float
) -> None:
    """Returns some values of the cosine power integral.

    Args:
        n_data (int): Number of points.
        a (float): left endpoint.
        b (float): right endpoint.
        n (int): power.
        fx (float): value of integral.
    Returns:
        None
    """
    return _polpack.cos_power_int_values(n_data, a, b, n, fx)


def delannoy(m, n, a):
    """Returns the Delannoy numbers up to orders (M,N).

    Args:
        m (int): maximum order m.
        n (int): maximum order n.
        a (ndarray): array to store the Delannoy numbers.
    """
    return _polpack.delannoy(m, n, a)


def erf_values(n_data: int, x: float, fx: float) -> None:
    """Returns some values of the ERF or "error" function for testing.

    Args:
        n_data (int): Number of points.
        x (float): argument.
        fx (float): value of erf(x).
    Returns:
        None
    """
    return _polpack.erf_values(n_data, x, fx)


def euler_number(n: int, e: np.ndarray) -> None:
    """Computes the Euler numbers.

    Args:
        n (int): maximum order.
        e (np.ndarray): Euler numbers.
    Returns:
        None
    """
    return _polpack.euler_number(n, e)


def euler_number_values(n_data: int, n: int, c: int) -> None:
    """Returns some values of the Euler numbers.

    Args:
        n_data (int): Number of points.
        n (int): order.
        c (int): value.
    Returns:
        None
    """
    return _polpack.euler_number_values(n_data, n, c)


def eulerian(n: int, e: np.ndarray) -> None:
    """Computes the Eulerian number E(N,K).

    Args:
        n (int): order.
        e (np.ndarray): Eulerian numbers.
    Returns:
        None
    """
    return _polpack.eulerian(n, e)


def fibonacci_direct(n):
    """Computes the N-th Fibonacci number directly.

    Args:
        n (int): index of the Fibonacci number.
    Returns:
        int: N-th Fibonacci number.
    """
    return _polpack.fibonacci_direct(n)


def fibonacci_floor(n: int, f: int, i: int) -> None:
    """Returns the largest Fibonacci number less than or equal to N.

    Args:
        n (int): value to bound.
        f (int): Fibonacci number.
        i (int): index of Fibonacci number.
    Returns:
        None
    """
    return _polpack.fibonacci_floor(n, f, i)


def fibonacci_recursive(n: int, f: np.ndarray) -> None:
    """Computes the first N Fibonacci numbers.

    Args:
        n (int): number of values to compute.
        f (np.ndarray): Fibonacci numbers.
    Returns:
        None
    """
    return _polpack.fibonacci_recursive(n, f)


def gamma_log_values(n_data: int, x: float, fx: float) -> None:
    """Returns some values of the Log Gamma function.

    Args:
        n_data (int): Number of points.
        x (float): argument.
        fx (float): value of log(gamma(x)).
    Returns:
        None
    """
    return _polpack.gamma_log_values(n_data, x, fx)


def gamma_values(n_data: int, x: float, fx: float) -> None:
    """Returns some values of the Gamma function.

    Args:
        n_data (int): Number of points.
        x (float): argument.
        fx (float): value of gamma(x).
    Returns:
        None
    """
    return _polpack.gamma_values(n_data, x, fx)


def gegenbauer_poly(n: int, alpha: float, x: float, cx: np.ndarray) -> None:
    """Computes the Gegenbauer polynomials C(I,ALPHA,X).

    Args:
        n (int): max degree.
        alpha (float): parameter alpha.
        x (float): point.
        cx (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.gegenbauer_poly(n, alpha, x, cx)


def gegenbauer_poly_values(
    n_data: int, n: int, a: float, x: float, fx: float
) -> None:
    """Returns some values of the Gegenbauer polynomials.

    Args:
        n_data (int): Number of points.
        n (int): degree.
        a (float): parameter alpha.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.gegenbauer_poly_values(n_data, n, a, x, fx)


def gen_hermite_poly(n: int, x: float, mu: float, p: np.ndarray) -> None:
    """Evaluates the generalized Hermite polynomials at X.

    Args:
        n (int): degree.
        x (float): point.
        mu (float): parameter mu.
        p (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.gen_hermite_poly(n, x, mu, p)


def gen_laguerre_poly(n: int, alpha: float, x: float, cx: np.ndarray) -> None:
    """Evaluates generalized Laguerre polynomials.

    Args:
        n (int): degree.
        alpha (float): parameter alpha.
        x (float): point.
        cx (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.gen_laguerre_poly(n, alpha, x, cx)


def gud_values(n_data: int, x: float, fx: float) -> None:
    """Returns some values of the Gudermannian function.

    Args:
        n_data (int): Number of points.
        x (float): point.
        fx (float): value of gud(x).
    Returns:
        None
    """
    return _polpack.gud_values(n_data, x, fx)


def hermite_poly_phys(n: int, x: float, cx: np.ndarray) -> None:
    """Evaluates the physicisist's Hermite polynomials at X.

    Args:
        n (int): degree.
        x (float): point.
        cx (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.hermite_poly_phys(n, x, cx)


def hermite_poly_phys_coef(n: int, c: np.ndarray) -> None:
    """Evaluates the physicist's Hermite polynomial coefficients.

    Args:
        n (int): degree.
        c (np.ndarray): coefficients.
    Returns:
        None
    """
    return _polpack.hermite_poly_phys_coef(n, c)


def hermite_poly_phys_values(n_data: int, n: int, x: float, fx: float) -> None:
    """Returns some values of the physicist's Hermite polynomial.

    Args:
        n_data (int): Number of points.
        n (int): degree.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.hermite_poly_phys_values(n_data, n, x, fx)


def hyper_2f1_values(
    n_data: int, a: float, b: float, c: float, x: float, fx: float
) -> None:
    """Returns some values of the hypergeometric function 2F1.

    Args:
        n_data (int): Number of points.
        a (float): first parameter.
        b (float): second parameter.
        c (float): third parameter.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.hyper_2f1_values(n_data, a, b, c, x, fx)


def i4_factor(
    n: int,
    factor_max: int,
    factor_num: np.ndarray,
    factor: np.ndarray,
    power: np.ndarray,
    nleft: np.ndarray,
) -> None:
    """Factors an I4 into prime factors.

    Args:
        n (int): number to factor.
        factor_max (int): max number of factors.
        factor_num (np.ndarray): number of factors found.
        factor (np.ndarray): prime factors.
        power (np.ndarray): powers of prime factors.
        nleft (np.ndarray): remaining unfactored part.
    Returns:
        None
    """
    return _polpack.i4_factor(n, factor_max, factor_num, factor, power, nleft)


def i4_factorial2_values(n_data: int, n: int, fn: int) -> None:
    """Returns values of the double factorial function.

    Args:
        n_data (int): Number of points.
        n (int): value n.
        fn (int): value of n!!.
    Returns:
        None
    """
    return _polpack.i4_factorial2_values(n_data, n, fn)


def i4_factorial_values(n_data: int, n: int, fn: int) -> None:
    """Returns values of the factorial function.

    Args:
        n_data (int): Number of points.
        n (int): value n.
        fn (int): value of n!.
    Returns:
        None
    """
    return _polpack.i4_factorial_values(n_data, n, fn)


def i4_partition_distinct_count(n: int, q: np.ndarray) -> None:
    """Returns any value of Q(N).

    Args:
        n (int): value n.
        q (np.ndarray): value of Q(N).
    Returns:
        None
    """
    return _polpack.i4_partition_distinct_count(n, q)


def i4_swap(i: np.ndarray, j: np.ndarray) -> None:
    """Switches two I4's.

    Args:
        i (np.ndarray): first value.
        j (np.ndarray): second value.
    Returns:
        None
    """
    return _polpack.i4_swap(i, j)


def i4_to_triangle_lower(k: int, i: np.ndarray, j: np.ndarray) -> None:
    """Evaluates the i4_to_triangle_lower function.

    Args:
        k (int): triangle index.
        i (np.ndarray): row index.
        j (np.ndarray): column index.
    Returns:
        None
    """
    return _polpack.i4_to_triangle_lower(k, i, j)


def i4_to_triangle_upper(k: int, i: np.ndarray, j: np.ndarray) -> None:
    """Evaluates the i4_to_triangle_upper function.

    Args:
        k (int): triangle index.
        i (np.ndarray): row index.
        j (np.ndarray): column index.
    Returns:
        None
    """
    return _polpack.i4_to_triangle_upper(k, i, j)


def i4mat_print(m: int, n: int, a: np.ndarray, title: str) -> None:
    """Prints an I4MAT.

    Args:
        m (int): Number of rows.
        n (int): Number of columns.
        a (np.ndarray): Matrix.
        title (str): Title.
    Returns:
        None
    """
    return _polpack.i4mat_print(m, n, a, title)


def i4mat_print_some(
    m: int,
    n: int,
    a: np.ndarray,
    ilo: int,
    jlo: int,
    ihi: int,
    jhi: int,
    title: str,
) -> None:
    """Prints some of an I4MAT.

    Args:
        m (int): Rows.
        n (int): Columns.
        a (np.ndarray): Matrix.
        ilo (int): first row.
        jlo (int): first column.
        ihi (int): last row.
        jhi (int): last column.
        title (str): Title.
    Returns:
        None
    """
    return _polpack.i4mat_print_some(m, n, a, ilo, jlo, ihi, jhi, title)


def jacobi_poly(
    n: int, alpha: float, beta: float, x: float, cx: np.ndarray
) -> None:
    """Evaluates the Jacobi polynomials at X.

    Args:
        n (int): degree.
        alpha (float): parameter alpha.
        beta (float): parameter beta.
        x (float): point.
        cx (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.jacobi_poly(n, alpha, beta, x, cx)


def jacobi_poly_values(
    n_data: int, n: int, a: float, b: float, x: float, fx: float
) -> None:
    """Returns some values of the Jacobi polynomial.

    Args:
        n_data (int): Number of points.
        n (int): degree.
        a (float): parameter alpha.
        b (float): parameter beta.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.jacobi_poly_values(n_data, n, a, b, x, fx)


def jacobi_symbol(q: int, p: int, j: np.ndarray) -> None:
    """Evaluates the Jacobi symbol (Q/P).

    Args:
        q (int): numerator.
        p (int): denominator.
        j (np.ndarray): result symbol.
    Returns:
        None
    """
    return _polpack.jacobi_symbol(q, p, j)


def krawtchouk(n: int, p: float, x: float, m: int, v: np.ndarray) -> None:
    """Evaluates the Krawtchouk polynomials at X.

    Args:
        n (int): degree.
        p (float): parameter p.
        x (float): point.
        m (int): parameter m.
        v (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.krawtchouk(n, p, x, m, v)


def laguerre_associated(n: int, m: int, x: float, cx: np.ndarray) -> None:
    """Evaluates associated Laguerre polynomials L(N,M,X).

    Args:
        n (int): degree.
        m (int): parameter m.
        x (float): point.
        cx (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.laguerre_associated(n, m, x, cx)


def laguerre_poly(n: int, x: float, cx: np.ndarray) -> None:
    """Evaluates the Laguerre polynomials at X.

    Args:
        n (int): degree.
        x (float): point.
        cx (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.laguerre_poly(n, x, cx)


def laguerre_poly_coef(n: int, c: np.ndarray) -> None:
    """Evaluates the Laguerre polynomial coefficients.

    Args:
        n (int): degree.
        c (np.ndarray): coefficients.
    Returns:
        None
    """
    return _polpack.laguerre_poly_coef(n, c)


def laguerre_polynomial_values(
    n_data: int, n: int, x: float, fx: float
) -> None:
    """Returns some values of the Laguerre polynomial.

    Args:
        n_data (int): Number of points.
        n (int): degree.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.laguerre_polynomial_values(n_data, n, x, fx)


def lambert_w_values(n_data: int, x: float, fx: float) -> None:
    """Returns some values of the Lambert W function.

    Args:
        n_data (int): Number of points.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.lambert_w_values(n_data, x, fx)


def legendre_associated(n: int, m: int, x: float, cx: np.ndarray) -> None:
    """Evaluates the associated Legendre functions.

    Args:
        n (int): degree.
        m (int): parameter m.
        x (float): point.
        cx (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.legendre_associated(n, m, x, cx)


def legendre_associated_normalized(
    n: int, m: int, x: float, cx: np.ndarray
) -> None:
    """Evaluates the legendre_associated_normalized function.

    Args:
        n (int): degree.
        m (int): parameter m.
        x (float): point.
        cx (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.legendre_associated_normalized(n, m, x, cx)


def legendre_associated_normalized_sphere_values(
    n_data: int, n: int, m: int, x: float, fx: float
) -> None:
    """Evaluates the legendre_associated_normalized_sphere_values function.

    Args:
        n_data (int): Number of points.
        n (int): degree.
        m (int): order.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.legendre_associated_normalized_sphere_values(
        n_data, n, m, x, fx
    )


def legendre_associated_values(
    n_data: int, n: int, m: int, x: float, fx: float
) -> None:
    """Returns values of associated Legendre functions.

    Args:
        n_data (int): Number of points.
        n (int): degree.
        m (int): order.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.legendre_associated_values(n_data, n, m, x, fx)


def legendre_function_q(n: int, x: float, cx: np.ndarray) -> None:
    """Evaluates the Legendre Q functions.

    Args:
        n (int): degree.
        x (float): point.
        cx (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.legendre_function_q(n, x, cx)


def legendre_function_q_values(
    n_data: int, n: int, x: float, fx: float
) -> None:
    """Returns values of the Legendre Q function.

    Args:
        n_data (int): Number of points.
        n (int): degree.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.legendre_function_q_values(n_data, n, x, fx)


def legendre_poly(n: int, x: float, cx: np.ndarray, cpx: np.ndarray) -> None:
    """Evaluates the Legendre polynomials P(N,X) at X.

    Args:
        n (int): degree.
        x (float): point.
        cx (np.ndarray): values.
        cpx (np.ndarray): derivatives.
    Returns:
        None
    """
    return _polpack.legendre_poly(n, x, cx, cpx)


def legendre_poly_coef(n: int, c: np.ndarray) -> None:
    """Evaluates the Legendre polynomial coefficients.

    Args:
        n (int): degree.
        c (np.ndarray): coefficients.
    Returns:
        None
    """
    return _polpack.legendre_poly_coef(n, c)


def legendre_poly_values(n_data: int, n: int, x: float, fx: float) -> None:
    """Returns values of the Legendre polynomials.

    Args:
        n_data (int): Number of points.
        n (int): degree.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.legendre_poly_values(n_data, n, x, fx)


def legendre_symbol(q: int, p: int, ell: np.ndarray) -> None:
    """Evaluates the Legendre symbol (Q/P).

    Args:
        q (int): numerator.
        p (int): denominator.
        ell (np.ndarray): result symbol.
    Returns:
        None
    """
    return _polpack.legendre_symbol(q, p, ell)


def lerch_values(n_data: int, z: float, s: float, a: float, fx: float) -> None:
    """Returns some values of the Lerch transcendent function.

    Args:
        n_data (int): Number of points.
        z (float): point.
        s (float): parameter s.
        a (float): parameter a.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.lerch_values(n_data, z, s, a, fx)


def lock(n: int, a: np.ndarray) -> None:
    """Returns the number of codes for a lock with N buttons.

    Args:
        n (int): order.
        a (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.lock(n, a)


def meixner(n: int, beta: float, c: float, x: float, v: np.ndarray) -> None:
    """Evaluates Meixner polynomials at a point.

    Args:
        n (int): degree.
        beta (float): parameter beta.
        c (float): parameter c.
        x (float): point.
        v (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.meixner(n, beta, c, x, v)


def mertens_values(n_data: int, n: int, c: int) -> None:
    """Returns some values of the Mertens function.

    Args:
        n_data (int): Number of points.
        n (int): value n.
        c (int): value of M(n).
    Returns:
        None
    """
    return _polpack.mertens_values(n_data, n, c)


def moebius(n: int, mu: np.ndarray) -> None:
    """Returns the value of MU(N), the Moebius function of N.

    Args:
        n (int): value n.
        mu (np.ndarray): value.
    Returns:
        None
    """
    return _polpack.moebius(n, mu)


def moebius_values(n_data: int, n: int, c: int) -> None:
    """Returns some values of the Moebius function.

    Args:
        n_data (int): Number of points.
        n (int): value n.
        c (int): value of mu(n).
    Returns:
        None
    """
    return _polpack.moebius_values(n_data, n, c)


def motzkin(n: int, a: np.ndarray) -> None:
    """Returns the Motzkin numbers up to order N.

    Args:
        n (int): order.
        a (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.motzkin(n, a)


def normal_01_cdf_values(n_data: int, x: float, fx: float) -> None:
    """Returns some values of the Normal 01 CDF.

    Args:
        n_data (int): Number of points.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.normal_01_cdf_values(n_data, x, fx)


def omega(n: int, ndiv: np.ndarray) -> None:
    """Returns OMEGA(N), the number of distinct prime divisors of N.

    Args:
        n (int): value n.
        ndiv (np.ndarray): value.
    Returns:
        None
    """
    return _polpack.omega(n, ndiv)


def omega_values(n_data: int, n: int, c: int) -> None:
    """Returns some values of the OMEGA function.

    Args:
        n_data (int): Number of points.
        n (int): value n.
        c (int): value.
    Returns:
        None
    """
    return _polpack.omega_values(n_data, n, c)


def partition_distinct_count_values(n_data: int, n: int, c: int) -> None:
    """Returns some values of Q(N).

    Args:
        n_data (int): Number of points.
        n (int): value n.
        c (int): value.
    Returns:
        None
    """
    return _polpack.partition_distinct_count_values(n_data, n, c)


def pentagon_num(n: int, p: np.ndarray) -> None:
    """Computes the N-th pentagonal number.

    Args:
        n (int): index.
        p (np.ndarray): value.
    Returns:
        None
    """
    return _polpack.pentagon_num(n, p)


def phi(n: int, phin: np.ndarray) -> None:
    """Computes the number of relatively prime predecessors of an integer.

    Args:
        n (int): value n.
        phin (np.ndarray): value.
    Returns:
        None
    """
    return _polpack.phi(n, phin)


def phi_values(n_data: int, n: int, c: int) -> None:
    """Returns some values of the PHI function.

    Args:
        n_data (int): Number of points.
        n (int): value n.
        c (int): value.
    Returns:
        None
    """
    return _polpack.phi_values(n_data, n, c)


def poly_bernoulli(n: int, k: int, b: np.ndarray) -> None:
    """Evaluates the poly-Bernolli numbers with negative index.

    Args:
        n (int): degree.
        k (int): parameter.
        b (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.poly_bernoulli(n, k, b)


def psi_values(n_data: int, x: float, fx: float) -> None:
    """Returns some values of the Psi or Digamma function for testing.

    Args:
        n_data (int): Number of points.
        x (float): point.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.psi_values(n_data, x, fx)


def r8_factorial_log_values(n_data: int, n: int, fn: float) -> None:
    """Returns values of log(factorial(n)).

    Args:
        n_data (int): Number of points.
        n (int): value n.
        fn (float): value.
    Returns:
        None
    """
    return _polpack.r8_factorial_log_values(n_data, n, fn)


def r8_factorial_values(n_data: int, n: int, fn: float) -> None:
    """Returns values of the real factorial function.

    Args:
        n_data (int): Number of points.
        n (int): value n.
        fn (float): value.
    Returns:
        None
    """
    return _polpack.r8_factorial_values(n_data, n, fn)


def r8_hyper_2f1(
    a_input: float,
    b_input: float,
    c_input: float,
    x_input: float,
    hf: np.ndarray,
) -> None:
    """Evaluates the hypergeometric function F(A,B,C,X).

    Args:
        a_input (float): a.
        b_input (float): b.
        c_input (float): c.
        x_input (float): x.
        hf (np.ndarray): value.
    Returns:
        None
    """
    return _polpack.r8_hyper_2f1(a_input, b_input, c_input, x_input, hf)


def r8poly_print(n: int, a: np.ndarray, title: str) -> None:
    """Prints out a polynomial.

    Args:
        n (int): degree.
        a (np.ndarray): coefficients.
        title (str): title.
    Returns:
        None
    """
    return _polpack.r8poly_print(n, a, title)


def r8vec_linspace(n: int, a: float, b: float, x: np.ndarray) -> None:
    """Creates a vector of linearly spaced values.

    Args:
        n (int): number of points.
        a (float): left endpoint.
        b (float): right endpoint.
        x (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.r8vec_linspace(n, a, b, x)


def r8vec_print(n: int, a: np.ndarray, title: str) -> None:
    """Prints an R8VEC.

    Args:
        n (int): number of elements.
        a (np.ndarray): vector.
        title (str): title.
    Returns:
        None
    """
    return _polpack.r8vec_print(n, a, title)


def r8vec_print_some(n: int, a: np.ndarray, max_print: int, title: str) -> None:
    """Prints "some" of an R8VEC.

    Args:
        n (int): number of elements.
        a (np.ndarray): vector.
        max_print (int): max number to print.
        title (str): title.
    Returns:
        None
    """
    return _polpack.r8vec_print_some(n, a, max_print, title)


def r8vec_uniform_ab(
    n: int, a: float, b: float, seed: np.ndarray, r: np.ndarray
) -> None:
    """Returns a scaled pseudorandom R8VEC.

    Args:
        n (int): number of elements.
        a (float): left endpoint.
        b (float): right endpoint.
        seed (np.ndarray): seed.
        r (np.ndarray): random values.
    Returns:
        None
    """
    return _polpack.r8vec_uniform_ab(n, a, b, seed, r)


def sigma(n: int, sigma_n: np.ndarray) -> None:
    """Returns the value of SIGMA(N), the divisor sum.

    Args:
        n (int): value n.
        sigma_n (np.ndarray): value.
    Returns:
        None
    """
    return _polpack.sigma(n, sigma_n)


def sigma_values(n_data: int, n: int, c: int) -> None:
    """Returns some values of the Sigma function.

    Args:
        n_data (int): Number of points.
        n (int): value n.
        c (int): value.
    Returns:
        None
    """
    return _polpack.sigma_values(n_data, n, c)


def sin_power_int_values(
    n_data: int, a: float, b: float, n: int, fx: float
) -> None:
    """Returns some values of the sine power integral.

    Args:
        n_data (int): Number of points.
        a (float): left endpoint.
        b (float): right endpoint.
        n (int): power.
        fx (float): value.
    Returns:
        None
    """
    return _polpack.sin_power_int_values(n_data, a, b, n, fx)


def slice_fn(dim_num: int, slice_num: int, piece_num: np.ndarray) -> None:
    """Evaluates the slice function.

    Args:
        dim_num (int): dimension number.
        slice_num (int): slice number.
        piece_num (np.ndarray): result piece.
    Returns:
        None
    """
    return _polpack.slice(dim_num, slice_num, piece_num)


def spherical_harmonic(
    ell: int, m: int, theta: float, phi: float, c: np.ndarray, s: np.ndarray
) -> None:
    """Evaluates spherical harmonic functions.

    Args:
        ell (int): degree.
        m (int): order.
        theta (float): angle theta.
        phi (float): angle phi.
        c (np.ndarray): real part.
        s (np.ndarray): imaginary part.
    Returns:
        None
    """
    return _polpack.spherical_harmonic(ell, m, theta, phi, c, s)


def spherical_harmonic_values(n_data, l, m, theta, phi, yr, yi):
    """Returns values of spherical harmonic functions.

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


def stirling1(n: int, m: int, s1: np.ndarray) -> None:
    """Computes the Stirling numbers of the first kind.

    Args:
        n (int): degree.
        m (int): order.
        s1 (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.stirling1(n, m, s1)


def stirling2(n: int, m: int, s2: np.ndarray) -> None:
    """Computes the Stirling numbers of the second kind.

    Args:
        n (int): degree.
        m (int): order.
        s2 (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.stirling2(n, m, s2)


def tau(n: int, taun: np.ndarray) -> None:
    """Returns the value of TAU(N), the number of distinct divisors of N.

    Args:
        n (int): value n.
        taun (np.ndarray): value.
    Returns:
        None
    """
    return _polpack.tau(n, taun)


def tau_values(n_data: int, n: int, c: int) -> None:
    """Returns some values of the Tau function.

    Args:
        n_data (int): Number of points.
        n (int): value n.
        c (int): value.
    Returns:
        None
    """
    return _polpack.tau_values(n_data, n, c)


def triangle_lower_to_i4(i: int, j: int, k: np.ndarray) -> None:
    """Evaluates the triangle_lower_to_i4 function.

    Args:
        i (int): row.
        j (int): column.
        k (np.ndarray): index.
    Returns:
        None
    """
    return _polpack.triangle_lower_to_i4(i, j, k)


def triangle_upper_to_i4(i: int, j: int, k: np.ndarray) -> None:
    """Evaluates the triangle_upper_to_i4 function.

    Args:
        i (int): row.
        j (int): column.
        k (np.ndarray): index.
    Returns:
        None
    """
    return _polpack.triangle_upper_to_i4(i, j, k)


def vibonacci(n, seed, v):
    """Computes the first N Vibonacci numbers.

    Args:
        n (int): Description for n.
        seed (int): Description for seed.
        v (int): Description for v.
    """
    return _polpack.vibonacci(n, seed, v)


def zeckendorf(
    n: int, m_max: int, m: np.ndarray, i_list: np.ndarray, f_list: np.ndarray
) -> None:
    """produces the Zeckendorf decomposition of a positive integer.

    Args:
        n (int): value to decompose.
        m_max (int): max size.
        m (np.ndarray): number of parts.
        i_list (np.ndarray): indices.
        f_list (np.ndarray): Fibonacci values.
    Returns:
        None
    """
    return _polpack.zeckendorf(n, m_max, m, i_list, f_list)


def zernike_poly(m: int, n: int, rho: float, z: np.ndarray) -> None:
    """Evaluates a Zernike polynomial at RHO.

    Args:
        m (int): index m.
        n (int): index n.
        rho (float): point.
        z (np.ndarray): values.
    Returns:
        None
    """
    return _polpack.zernike_poly(m, n, rho, z)


def zernike_poly_coef(m: int, n: int, c: np.ndarray) -> None:
    """Evaluates the zernike_poly_coef function.

    Args:
        m (int): index m.
        n (int): index n.
        c (np.ndarray): coefficients.
    Returns:
        None
    """
    return _polpack.zernike_poly_coef(m, n, c)


def zeta_values(n_data: int, n: int, zeta: float) -> None:
    """Returns some values of the Riemann Zeta function.

    Args:
        n_data (int): Number of points.
        n (int): s value.
        zeta (float): value.
    Returns:
        None
    """
    return _polpack.zeta_values(n_data, n, zeta)


def agud(g):
    """Evaluates the inverse Gudermannian function.

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
    """Returns the Benford probability of one or more significant digits.

    Args:
        ival: Description for ival.
    """
    return _polpack.benford(ival)


def catalan_constant():
    """Returns the value of Catalan's constant."""
    return _polpack.catalan_constant()


def collatz_count(n):
    """counts the number of terms in a Collatz sequence.

    Args:
        n: Description for n.
    """
    return _polpack.collatz_count(n)


def cos_power_int(a, b, n):
    """Evaluates the cosine power integral.

    Args:
        a: Description for a.
        b: Description for b.
        n: Description for n.
    """
    return _polpack.cos_power_int(a, b, n)


def euler_number2(n):
    """Computes the Euler numbers.

    Args:
        n: Description for n.
    """
    return _polpack.euler_number2(n)


def euler_poly(n, x):
    """Evaluates the N-th Euler polynomial at X.

    Args:
        n: Description for n.
        x: Description for x.
    """
    return _polpack.euler_poly(n, x)


def gud(x):
    """Evaluates the Gudermannian function.

    Args:
        x: Description for x.
    """
    return _polpack.gud(x)


def i4_choose(n, k):
    """Computes the binomial coefficient C(N,K).

    Args:
        n: Description for n.
        k: Description for k.
    """
    return _polpack.i4_choose(n, k)


def i4_factorial(n):
    """Computes the factorial of N.

    Args:
        n: Description for n.
    """
    return _polpack.i4_factorial(n)


def i4_factorial2(n):
    """Computes the double factorial function.

    Args:
        n: Description for n.
    """
    return _polpack.i4_factorial2(n)


def i4_huge():
    """Returns a "huge" I4."""
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
    """Returns a scaled pseudorandom I4 between A and B.

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
    """Evaluates the Mertens function.

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
    """Returns the number of plane partitions of the integer N.

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
    """Returns any of the first PRIME_MAX prime numbers.

    Args:
        n: Description for n.
    """
    return _polpack.prime(n)


def pyramid_num(n):
    """Returns the N-th pyramidal number.

    Args:
        n: Description for n.
    """
    return _polpack.pyramid_num(n)


def pyramid_square_num(n):
    """Returns the N-th pyramidal square number.

    Args:
        n: Description for n.
    """
    return _polpack.pyramid_square_num(n)


def r8_agm(a, b):
    """Computes the arithmetic-geometric mean of A and B.

    Args:
        a: Description for a.
        b: Description for b.
    """
    return _polpack.r8_agm(a, b)


def r8_beta(x, y):
    """Returns the value of the Beta function.

    Args:
        x: Description for x.
        y: Description for y.
    """
    return _polpack.r8_beta(x, y)


def r8_choose(n, k):
    """Computes the binomial coefficient C(N,K) as an R8.

    Args:
        n: Description for n.
        k: Description for k.
    """
    return _polpack.r8_choose(n, k)


def r8_epsilon():
    """Returns the R8 roundoff unit."""
    return _polpack.r8_epsilon()


def r8_erf(x):
    """Evaluates the error function.

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
    """Returns the value of the Euler-Mascheroni constant."""
    return _polpack.r8_euler_constant()


def r8_factorial(n):
    """Computes the factorial of N.

    Args:
        n: Description for n.
    """
    return _polpack.r8_factorial(n)


def r8_factorial_log(n):
    """Computes log(factorial(N)).

    Args:
        n: Description for n.
    """
    return _polpack.r8_factorial_log(n)


def r8_gamma_log(x):
    """Evaluates log ( Gamma ( X ) ) for a real argument.

    Args:
        x: Description for x.
    """
    return _polpack.r8_gamma_log(x)


def r8_huge():
    """Returns a "huge" R8."""
    return _polpack.r8_huge()


def r8_mop(i):
    """Returns the I-th power of -1 as an R8.

    Args:
        i: Description for i.
    """
    return _polpack.r8_mop(i)


def r8_nint(x):
    """Returns the nearest integer to an R8.

    Args:
        x: Description for x.
    """
    return _polpack.r8_nint(x)


def r8_pi():
    """Returns the value of pi as an R8."""
    return _polpack.r8_pi()


def r8_psi(xx):
    """Evaluates the function Psi(X).

    Args:
        xx: Description for xx.
    """
    return _polpack.r8_psi(xx)


def r8_uniform_01(seed):
    """Returns a unit pseudorandom R8.

    Args:
        seed: Description for seed.
    """
    return _polpack.r8_uniform_01(seed)


def r8poly_degree(na, a):
    """Returns the degree of a polynomial.

    Args:
        na: Description for na.
        a: Description for a.
    """
    return _polpack.r8poly_degree(na, a)


def r8poly_value_horner(m, c, x):
    """Evaluates a polynomial using Horner's method.

    Args:
        m: Description for m.
        c: Description for c.
        x: Description for x.
    """
    return _polpack.r8poly_value_horner(m, c, x)


def s_len_trim(s):
    """Returns the length of a string to the last nonblank.

    Args:
        s: Description for s.
    """
    return _polpack.s_len_trim(s)


def simplex_num(m, n):
    """Evaluates the N-th Simplex number in M dimensions.

    Args:
        m: Description for m.
        n: Description for n.
    """
    return _polpack.simplex_num(m, n)


def sin_power_int(a, b, n):
    """Evaluates the sine power integral.

    Args:
        a: Description for a.
        b: Description for b.
        n: Description for n.
    """
    return _polpack.sin_power_int(a, b, n)


def tetrahedron_num(n):
    """Returns the N-th tetrahedral number.

    Args:
        n: Description for n.
    """
    return _polpack.tetrahedron_num(n)


def triangle_num(n):
    """Returns the N-th triangular number.

    Args:
        n: Description for n.
    """
    return _polpack.triangle_num(n)


def trinomial(i, j, k):
    """Computes a trinomial coefficient.

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
