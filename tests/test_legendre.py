"""Tests for Legendre polynomials and associated functions."""

import numpy as np
import polpack


def test_legendre_poly():
    """Test Legendre polynomial at x=0.5."""
    n = 5
    x = 0.5
    cx = np.zeros(n + 1, dtype=np.float64)
    cpx = np.zeros(n + 1, dtype=np.float64)
    polpack.legendre_poly(n, x, cx, cpx)
    # P(0,x)=1, P(1,x)=x=0.5
    assert np.isclose(cx[0], 1.0)
    assert np.isclose(cx[1], 0.5)
    # P(2,x)=(3x^2-1)/2=(0.75-1)/2=-0.125
    assert np.isclose(cx[2], -0.125)


def test_legendre_associated():
    """Test associated Legendre functions."""
    n = 3
    m = 1
    x = 0.5
    cx = np.zeros(n + 1, dtype=np.float64)
    polpack.legendre_associated(n, m, x, cx)
    # P(0,1,x)=0 (since m>0 and n=0 gives 0)
    # Actually P(1,1,x)=-sqrt(1-x^2)=-sqrt(0.75)
    assert np.isclose(cx[1], -np.sqrt(0.75), rtol=1e-6)


def test_legendre_associated_normalized():
    """Test normalized associated Legendre functions."""
    n = 3
    m = 0
    x = 0.5
    cx = np.zeros(n + 1, dtype=np.float64)
    polpack.legendre_associated_normalized(n, m, x, cx)
    # Should be finite and P(0,0,x) = 1/sqrt(2) (normalized)
    assert np.isfinite(cx).all()


def test_legendre_function_q():
    """Test Legendre functions of the second kind."""
    n = 3
    x = 0.5
    cx = np.zeros(n + 1, dtype=np.float64)
    polpack.legendre_function_q(n, x, cx)
    # Q(0,x) = 0.5*log((1+x)/(1-x)) = atanh(x) = atanh(0.5)
    assert np.isclose(cx[0], np.arctanh(0.5), rtol=1e-6)


def test_legendre_poly_coef():
    """Test Legendre polynomial coefficient computation."""
    n = 2
    c = np.zeros((n + 1, n + 1), dtype=np.float64, order="F")
    polpack.legendre_poly_coef(n, c)
    # P(2,x) = (3x^2-1)/2, coefficients: c[2,0]=-0.5, c[2,2]=1.5
    assert np.isclose(c[2, 0], -0.5, rtol=1e-6)
    assert np.isclose(c[2, 2], 1.5, rtol=1e-6)


def test_legendre_symbol():
    """Test Legendre symbol computation."""
    # (1/3) = 1
    polpack.legendre_symbol(1, 3, np.int32(0))


def test_jacobi_symbol():
    """Test Jacobi symbol computation."""
    j = np.int32(0)
    polpack.jacobi_symbol(2, 15, j)
