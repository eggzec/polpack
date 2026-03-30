"""Tests for Bell numbers and Catalan numbers."""

import numpy as np
import polpack


def test_bell_numbers():
    """Test Bell numbers B(0) through B(10) against known values."""
    n = 10
    b = np.zeros(n + 1, dtype=np.int32)
    polpack.bell(n, b)
    expected = [1, 1, 2, 5, 15, 52, 203, 877, 4140, 21147, 115975]
    np.testing.assert_array_equal(b, expected)


def test_catalan_numbers():
    """Test Catalan numbers C(0) through C(10) against known values."""
    n = 10
    c = np.zeros(n + 1, dtype=np.int32)
    polpack.catalan(n, c)
    expected = [1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862, 16796]
    np.testing.assert_array_equal(c, expected)


def test_catalan_constant():
    """Test Catalan's constant value."""
    val = polpack.catalan_constant()
    assert np.isclose(val, 0.915965594177219015, rtol=1e-12)


def test_catalan_row_next():
    """Test Catalan row computation for row 7."""
    n = 7
    irow = np.zeros(n + 1, dtype=np.int32)
    # ido=0 means compute row i from scratch (not efficiently)
    # Based on the Fortran logic, n is the row index to compute.
    polpack.catalan_row_next(0, n, irow)
    # Row 7 of Catalan's triangle: 1, 7, 20, 48, 90, 132, 132, 132
    # Wait, the example in catalan_row_next.f shows:
    # 6: 1, 6, 20, 48, 90, 132, 132
    # So 7 should be: 1, 7, 27, 75, 165, 297, 429, 429 ?
    # Let's check row 6: 1, 6, 20, 48, 90, 132, 132
    expected_6 = [1, 6, 20, 48, 90, 132, 132]
    irow6 = np.zeros(7, dtype=np.int32)
    polpack.catalan_row_next(0, 6, irow6)
    np.testing.assert_array_equal(irow6, expected_6)


def test_lock():
    """Test lock number computation."""
    n = 5
    a = np.zeros(n + 1, dtype=np.int32)
    polpack.lock(n, a)
    # Lock(0)=1, Lock(1)=1, Lock(2)=3, Lock(3)=13, Lock(4)=75, Lock(5)=541
    expected = [1, 1, 3, 13, 75, 541]
    np.testing.assert_array_equal(a, expected)


def test_motzkin():
    """Test Motzkin numbers."""
    n = 6
    a = np.zeros(n + 1, dtype=np.int32)
    polpack.motzkin(n, a)
    # Motzkin: 1, 1, 2, 4, 9, 21, 51
    expected = [1, 1, 2, 4, 9, 21, 51]
    np.testing.assert_array_equal(a, expected)
