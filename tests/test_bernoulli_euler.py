"""Tests for Bernoulli, Bernstein, and Euler polynomials."""

import numpy as np
import polpack


def test_bernoulli_number():
    """Test Bernoulli number computation against known values."""
    n = 10
    b = np.zeros(n + 1, dtype=np.float64)
    polpack.bernoulli_number(n, b)
    assert np.isclose(b[0], 1.0)
    assert np.isclose(b[1], -0.5)
    assert np.isclose(b[2], 1.0 / 6.0)
    assert np.isclose(b[3], 0.0)
    assert np.isclose(b[4], -1.0 / 30.0)


def test_bernoulli_number2():
    """Test Bernoulli number2 computation."""
    n = 10
    b = np.zeros(n + 1, dtype=np.float64)
    polpack.bernoulli_number2(n, b)
    assert np.isclose(b[0], 1.0)
    assert np.isclose(b[1], -0.5)
    assert np.isclose(b[2], 1.0 / 6.0)


def test_bernoulli_number3():
    """Test Bernoulli number3 computation for single value."""
    b = np.float64(0.0)
    polpack.bernoulli_number3(0, b)
    # bernoulli_number3 returns via argument


def test_bernoulli_poly():
    """Test Bernoulli polynomial evaluation at x=0.2."""
    x = 0.2
    for n in [1, 2, 3]:
        bx = np.float64(0.0)
        polpack.bernoulli_poly(n, x, bx)


def test_bernstein_poly():
    """Test Bernstein polynomial values against known data."""
    n = 4
    x = 0.25
    bern = np.zeros(n + 1, dtype=np.float64)
    polpack.bernstein_poly(n, x, bern)
    # B(4,0)(0.25) = (0.75)^4 = 0.31640625
    assert np.isclose(bern[0], 0.31640625, rtol=1e-6)
    # B(4,4)(0.25) = (0.25)^4 = 0.00390625
    assert np.isclose(bern[4], 0.00390625, rtol=1e-6)


def test_euler_number():
    """Test Euler number computation."""
    n = 6
    e = np.zeros(n + 1, dtype=np.int32)
    polpack.euler_number(n, e)
    # E(0)=1, E(1)=0, E(2)=-1, E(3)=0, E(4)=5, E(5)=0, E(6)=-61
    assert e[0] == 1
    assert e[2] == -1
    assert e[4] == 5
    assert e[6] == -61


def test_euler_number2():
    """Test Euler number2 computation."""
    val = polpack.euler_number2(4)
    assert np.isclose(val, 5.0)


def test_euler_poly():
    """Test Euler polynomial evaluation."""
    val = polpack.euler_poly(2, 0.5)
    # E_2(x) = x^2 - x. E_2(0.5) = 0.25 - 0.5 = -0.25
    assert np.isclose(val, -0.25, atol=1e-10)
