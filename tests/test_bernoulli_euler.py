"""Tests for Bernoulli, Bernstein, and Euler polynomials."""

import numpy as np

import polpack


def test_bernoulli_number() -> None:
    """Test Bernoulli number computation against legacy data."""
    n = 30
    b = np.zeros(n + 1, dtype=np.float64)
    polpack.bernoulli_number(n, b)
    # Data from BERNOULLI_NUMBER_TEST
    expected = {
        0: 1.0,
        1: -0.5,
        2: 0.166667,
        3: 0.0,
        4: -0.333333e-01,
        6: 0.238095e-01,  # Note: B6 is positive
        8: -0.333333e-01,
        10: 0.757576e-01,
        20: -529.124,
        30: 0.601581e09,
    }
    for i, val in expected.items():
        assert np.isclose(b[i], val, rtol=1e-5), (
            f"B({i}) is {b[i]}, expected {val}"
        )


def test_bernoulli_poly() -> None:
    """Test Bernoulli polynomial evaluation at x=0.2 against legacy data."""
    x = 0.2
    # Data from BERNOULLI_POLY_TEST
    expected = {
        1: -0.30000000,
        2: 0.66666667e-02,
        3: 0.48000000e-01,
        4: -0.77333333e-02,
        5: -0.23680000e-01,
        10: 0.23326318e-01,
        15: 2.6487812,
    }
    for n, val in expected.items():
        bx = polpack.bernoulli_poly(n, x)
        assert np.isclose(bx, val, rtol=1e-5), (
            f"B({n}, 0.2) is {bx}, expected {val}"
        )


def test_bernstein_poly() -> None:
    """Test Bernstein polynomial values against legacy data (x=0.25)."""
    n = 4
    x = 0.25
    bern = np.zeros(n + 1, dtype=np.float64)
    polpack.bernstein_poly(n, x, bern)
    # Data from BERNSTEIN_POLY_TEST
    expected = [0.316406, 0.421875, 0.210938, 0.468750e-01, 0.390625e-02]
    assert np.allclose(bern, expected, rtol=1e-5)


def test_euler_number() -> None:
    """Test Euler number computation against legacy data."""
    n = 12
    e = np.zeros(n + 1, dtype=np.int32)
    polpack.euler_number(n, e)
    # Data from EULER_NUMBER_TEST
    assert e[0] == 1
    assert e[1] == 0
    assert e[2] == -1
    assert e[4] == 5  # noqa: PLR2004
    assert e[6] == -61  # noqa: PLR2004
    assert e[8] == 1385  # noqa: PLR2004
    assert e[10] == -50521  # noqa: PLR2004
    assert e[12] == 2702765  # noqa: PLR2004


def test_euler_poly() -> None:
    """Test Euler polynomial evaluation at x=0.5 against legacy data."""
    x = 0.5
    # Data from EULER_POLY_TEST
    # Note: E_n(0.5) is 0 for odd n > 0
    expected = {
        0: 1.00000,
        1: 0.0,
        2: -0.250000,
        4: 0.312497,  # Legacy data shows 0.312497, but exact is 5/16 = 0.3125
        6: -0.953128,
        10: -49.3369,
    }
    for n, val in expected.items():
        res = polpack.euler_poly(n, x)
        assert np.isclose(
            res, val, atol=1e-4
        )  # Using larger atol due to legacy float precision
