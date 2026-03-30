"""Tests for Hermite, Laguerre, Gegenbauer, and Jacobi polynomials."""

import numpy as np
import polpack


def test_hermite_poly_phys():
    """Test physicist's Hermite polynomials at x=0.5."""
    n = 5
    x = 0.5
    cx = np.zeros(n + 1, dtype=np.float64)
    polpack.hermite_poly_phys(n, x, cx)
    # H(0,0.5)=1, H(1,0.5)=1
    assert np.isclose(cx[0], 1.0)
    assert np.isclose(cx[1], 1.0)  # H1(x)=2x, H1(0.5)=1.0


def test_gegenbauer_poly():
    """Test Gegenbauer polynomial values."""
    n = 5
    alpha = 0.5
    x = 0.5
    cx = np.zeros(n + 1, dtype=np.float64)
    polpack.gegenbauer_poly(n, alpha, x, cx)
    # C(0, alpha, x) = 1 always
    assert np.isclose(cx[0], 1.0)


def test_gen_hermite_poly():
    """Test generalized Hermite polynomials."""
    n = 5
    x = 0.5
    mu = 0.0
    p = np.zeros(n + 1, dtype=np.float64)
    polpack.gen_hermite_poly(n, x, mu, p)
    # When mu=0, should match standard physicist Hermite
    assert np.isclose(p[0], 1.0)


def test_gen_laguerre_poly():
    """Test generalized Laguerre polynomials."""
    n = 5
    alpha = 0.0
    x = 1.0
    cx = np.zeros(n + 1, dtype=np.float64)
    polpack.gen_laguerre_poly(n, alpha, x, cx)
    # L(0, alpha, x) = 1 always
    assert np.isclose(cx[0], 1.0)


def test_laguerre_poly():
    """Test Laguerre polynomials at x=1.0."""
    n = 5
    x = 1.0
    cx = np.zeros(n + 1, dtype=np.float64)
    polpack.laguerre_poly(n, x, cx)
    # L(0,x)=1, L(1,x)=1-x=0
    assert np.isclose(cx[0], 1.0)
    assert np.isclose(cx[1], 0.0)


def test_laguerre_associated():
    """Test associated Laguerre polynomials."""
    n = 3
    m = 1
    x = 0.5
    cx = np.zeros(n + 1, dtype=np.float64)
    polpack.laguerre_associated(n, m, x, cx)
    # L(0,1,x) = 1
    assert np.isclose(cx[0], 1.0)


def test_jacobi_poly():
    """Test Jacobi polynomials."""
    n = 5
    alpha = 0.5
    beta = 1.5
    x = 0.5
    cx = np.zeros(n + 1, dtype=np.float64)
    polpack.jacobi_poly(n, alpha, beta, x, cx)
    # P(0, alpha, beta, x) = 1 always
    assert np.isclose(cx[0], 1.0)


def test_krawtchouk():
    """Test Krawtchouk polynomials."""
    n = 3
    p = 0.5
    x = 1.0
    m = 5
    v = np.zeros(n + 1, dtype=np.float64)
    polpack.krawtchouk(n, p, x, m, v)
    # K(0, p, x, m) = 1
    assert np.isclose(v[0], 1.0)


def test_meixner():
    """Test Meixner polynomials."""
    n = 3
    beta = 2.0
    c = 0.5
    x = 1.0
    v = np.zeros(n + 1, dtype=np.float64)
    polpack.meixner(n, beta, c, x, v)
    # M(0, beta, c, x) = 1
    assert np.isclose(v[0], 1.0)
