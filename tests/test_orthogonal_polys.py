"""Tests for Hermite, Laguerre, Gegenbauer, and Jacobi polynomials."""

import numpy as np

import polpack


def test_hermite_poly_phys() -> None:
    """Test physicist's Hermite polynomials at x=5.0 against legacy data."""
    n = 10
    x = 5.0
    cx = np.zeros(n + 1, dtype=np.float64)
    polpack.hermite_poly_phys(n, x, cx)
    # Data from HERMITE_POLY_PHYS_TEST
    expected = [
        1.0,
        10.0,
        98.0,
        940.0,
        8812.0,
        80600.0,
        717880.0,
        0.621160e07,
        0.520657e08,
        0.421271e09,
        0.327553e10,
    ]
    np.testing.assert_allclose(cx, expected, rtol=1e-5)


def test_gegenbauer_poly() -> None:
    """Test Gegenbauer polynomial values at x=0.2, alpha=0.5
    against legacy data."""
    n = 10
    alpha = 0.5
    x = 0.2
    cx = np.zeros(n + 1, dtype=np.float64)
    polpack.gegenbauer_poly(n, alpha, x, cx)
    # Data from GEGENBAUER_POLY_TEST
    expected = [
        1.0,
        0.2,
        -0.44,
        -0.28,
        0.232,
        0.30752,
        -0.805760e-01,
        -0.293517,
        -0.395648e-01,
        0.245957,
        0.129072,
    ]
    np.testing.assert_allclose(cx, expected, rtol=1e-5)


def test_laguerre_poly() -> None:
    """Test Laguerre polynomials at x=1.0 against legacy data."""
    n = 10
    x = 1.0
    cx = np.zeros(n + 1, dtype=np.float64)
    polpack.laguerre_poly(n, x, cx)
    # Data from LAGUERRE_POLY_TEST
    expected = [
        1.0,
        0.0,
        -0.5,
        -0.666667,
        -0.625,
        -0.466667,
        -0.256944,
        -0.404762e-01,
        0.153993,
        0.309744,
        0.418946,
    ]
    np.testing.assert_allclose(cx, expected, rtol=1e-5)


def test_jacobi_poly() -> None:
    """Test Jacobi polynomials at x=0.5, alpha=0, beta=1 against legacy data."""
    n = 5
    alpha = 0.0
    beta = 1.0
    x = 0.5
    cx = np.zeros(n + 1, dtype=np.float64)
    polpack.jacobi_poly(n, alpha, beta, x, cx)
    # Data from JACOBI_POLY_TEST
    expected = [1.0, 0.25, -0.375, -0.484375, -0.132812, 0.275391]
    np.testing.assert_allclose(cx, expected, rtol=1e-5)


def test_krawtchouk() -> None:
    """Test Krawtchouk polynomials."""
    n = 3
    p = 0.5
    x = 1.0
    m = 5
    v = np.zeros(n + 1, dtype=np.float64)
    polpack.krawtchouk(n, p, x, m, v)
    # K(0, p, x, m) = 1
    assert np.isclose(v[0], 1.0)


def test_meixner() -> None:
    """Test Meixner polynomials."""
    n = 3
    beta = 2.0
    c = 0.5
    x = 1.0
    v = np.zeros(n + 1, dtype=np.float64)
    polpack.meixner(n, beta, c, x, v)
    # M(0, beta, c, x) = 1
    assert np.isclose(v[0], 1.0)
