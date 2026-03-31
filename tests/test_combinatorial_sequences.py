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
    """Test Catalan row computation against legacy data."""
    # Row 7 of Catalan's triangle
    n = 7
    irow = np.zeros(n + 1, dtype=np.int32)
    polpack.catalan_row_next(0, n, irow)
    expected_7 = [1, 7, 27, 75, 165, 297, 429, 429]
    np.testing.assert_array_equal(irow, expected_7)


def test_delannoy():
    """Test Delannoy numbers A(M,N) against legacy data."""
    # Test row 4 (M=4)
    m = 4
    n = 8
    a = np.zeros((m + 1, n + 1), dtype=np.int32, order="F")
    polpack.delannoy(m, n, a)
    # Row 4 (0:8): 1, 9, 41, 129, 321, 681, 1289, 2241, 3649
    expected_row4 = [1, 9, 41, 129, 321, 681, 1289, 2241, 3649]
    np.testing.assert_array_equal(a[4, :], expected_row4)


def test_fibonacci_direct():
    """Test direct Fibonacci computation against legacy data."""
    # F(10) = 55, F(20) = 6765
    assert polpack.fibonacci_direct(10) == 55
    assert polpack.fibonacci_direct(20) == 6765
    assert polpack.fibonacci_direct(20) == 6765


def test_stirling1():
    """Test Stirling numbers of the first kind against legacy data."""
    n = 8
    m = 8
    s1 = np.zeros((n, m), dtype=np.int32, order="F")
    polpack.stirling1(n, m, s1)
    # Row 8: -5040, 13068, -13132, 6769, -1960, 322, -28, 1
    expected = [-5040, 13068, -13132, 6769, -1960, 322, -28, 1]
    for j in range(m):
        assert s1[n - 1, j] == expected[j]


def test_stirling2():
    """Test Stirling numbers of the second kind against legacy data."""
    n = 8
    m = 8
    s2 = np.zeros((n, m), dtype=np.int32, order="F")
    polpack.stirling2(n, m, s2)
    # Row 8: 1, 127, 966, 1701, 1050, 266, 28, 1
    expected = [1, 127, 966, 1701, 1050, 266, 28, 1]
    for j in range(m):
        assert s2[n - 1, j] == expected[j]
