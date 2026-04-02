"""Tests for Chebyshev polynomials (T and U)."""

import numpy as np

import polpack


def test_cheby_t_poly() -> None:
    """Test Chebyshev T polynomial against known values at x=0.8."""
    m = 1
    n = 12
    x = np.array([0.8], dtype=np.float64)
    cx = np.zeros((m, n + 1), dtype=np.float64, order="F")
    polpack.cheby_t_poly(m, n, x, cx)

    expected = [
        1.0,
        0.8,
        0.28,
        -0.352,
        -0.8432,
        -0.99712,
        -0.752192,
        -0.206387,
        0.421972,
        0.881543,
        0.988497,
        0.700051,
        0.131586,
    ]
    for i, exp in enumerate(expected):
        assert np.isclose(cx[0, i], exp, atol=1e-4), (
            f"T({i}, 0.8) = {cx[0, i]}, expected {exp}"
        )


def test_cheby_u_poly() -> None:
    """Test Chebyshev U polynomial against known values at x=0.8."""
    m = 1
    n = 12
    x = np.array([0.8], dtype=np.float64)
    cx = np.zeros((m, n + 1), dtype=np.float64, order="F")
    polpack.cheby_u_poly(m, n, x, cx)

    expected = [
        1.0,
        1.6,
        1.56,
        0.896,
        -0.1264,
        -1.09824,
        -1.63078,
        -1.51101,
        -0.786839,
        0.252072,
        1.19015,
        1.65217,
        1.45333,
    ]
    for i, exp in enumerate(expected):
        assert np.isclose(cx[0, i], exp, atol=1e-4), (
            f"U({i}, 0.8) = {cx[0, i]}, expected {exp}"
        )


def test_cheby_t_poly_zero() -> None:
    """Test Chebyshev T polynomial zeroes."""
    n = 4
    z = np.zeros(n, dtype=np.float64)
    polpack.cheby_t_poly_zero(n, z)
    # Zeroes of T(4, x) are cos(pi*(2k-1)/8) for k=1..4
    for zi in z:
        # Evaluate T(4, zi) and check it's near zero
        x = np.array([zi], dtype=np.float64)
        cx = np.zeros((1, n + 1), dtype=np.float64, order="F")
        polpack.cheby_t_poly(1, n, x, cx)
        assert np.isclose(cx[0, n], 0.0, atol=1e-12)


def test_cheby_u_poly_zero() -> None:
    """Test Chebyshev U polynomial zeroes."""
    n = 4
    z = np.zeros(n, dtype=np.float64)
    polpack.cheby_u_poly_zero(n, z)
    # Evaluate U(4, zi) for each zero
    for zi in z:
        x = np.array([zi], dtype=np.float64)
        cx = np.zeros((1, n + 1), dtype=np.float64, order="F")
        polpack.cheby_u_poly(1, n, x, cx)
        assert np.isclose(cx[0, n], 0.0, atol=1e-12)


def test_cheby_t_poly_coef() -> None:
    """Test Chebyshev T polynomial coefficient computation."""
    n = 2
    c = np.zeros((n + 1, n + 1), dtype=np.float64, order="F")
    polpack.cheby_t_poly_coef(n, c)
    # T(2,x) = 2x^2 - 1, coefficients (high to low): 2, 0, -1
    assert np.isclose(c[2, 2], 2.0)
    assert np.isclose(c[2, 0], -1.0)


def test_chebyshev_discrete() -> None:
    """Test discrete Chebyshev polynomials."""
    n = 3
    m = 5
    x = 1.0
    v = np.zeros(n + 1, dtype=np.float64)
    polpack.chebyshev_discrete(n, m, x, v)
    # From reference: t(0,5,1)=1, t(1,5,1)=-2, t(2,5,1)=-6, t(3,5,1)=48
    assert np.isclose(v[0], 1.0)
    assert np.isclose(v[1], -2.0)
    assert np.isclose(v[2], -6.0)
    assert np.isclose(v[3], 48.0)
