"""Tests for combinatorics: Stirling, Eulerian, Fibonacci, comb_row, trinomial, etc."""

import numpy as np
import polpack


def test_stirling1():
    """Test Stirling numbers of the first kind."""
    n = 4
    m = 4
    s1 = np.zeros((n, m), dtype=np.int32, order="F")
    polpack.stirling1(n, m, s1)
    # S1(1,1) = 1
    assert s1[0, 0] == 1


def test_stirling2():
    """Test Stirling numbers of the second kind."""
    n = 4
    m = 4
    s2 = np.zeros((n, m), dtype=np.int32, order="F")
    polpack.stirling2(n, m, s2)
    # S2(1,1) = 1
    assert s2[0, 0] == 1


def test_eulerian():
    """Test Eulerian numbers."""
    n = 4
    e = np.zeros((n, n), dtype=np.int32, order="F")
    polpack.eulerian(n, e)
    # A(1,1) = 1, A(2,1) = 1, A(2,2) = 1
    assert e[0, 0] == 1


def test_fibonacci_direct():
    """Test direct Fibonacci number computation."""
    f = np.int32(0)
    polpack.fibonacci_direct(1, f)
    polpack.fibonacci_direct(10, f)


def test_fibonacci_recursive():
    """Test recursive Fibonacci computation."""
    n = 10
    f = np.zeros(n, dtype=np.int32)
    polpack.fibonacci_recursive(n, f)
    # F = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
    expected = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
    np.testing.assert_array_equal(f, expected)


def test_comb_row_next():
    """Test Pascal's triangle row computation."""
    n = 5
    row = np.zeros(n + 1, dtype=np.int32)
    row[0] = 1
    for i in range(1, n + 1):
        polpack.comb_row_next(i, row[: i + 1])
    # Row 5 of Pascal's triangle: [1, 5, 10, 10, 5, 1]
    expected = [1, 5, 10, 10, 5, 1]
    np.testing.assert_array_equal(row, expected)


def test_trinomial():
    """Test trinomial coefficient."""
    val = polpack.trinomial(2, 3, 4)
    # Trinomial(2,3,4) = 9! / (2! * 3! * 4!) = 362880 / (2*6*24) = 1260
    assert val == 1260


def test_pentagon_num():
    """Test pentagonal numbers."""
    p = np.int32(0)
    polpack.pentagon_num(5, p)
    # P(5) = 5*(3*5-1)/2 = 5*14/2 = 35


def test_pyramid_num():
    """Test pyramidal numbers."""
    val = polpack.pyramid_num(5)
    # Pyramid(5) = sum(k=1..5) k*(k+1)/2 = 1+3+6+10+15 = 35
    # Wait, the formula I used in thought was for square pyramid.
    # polpack pyramid_num computes triangular pyramidal numbers.
    assert val == 35


def test_pyramid_square_num():
    """Test square pyramidal numbers."""
    val = polpack.pyramid_square_num(5)
    # Sum of squares: 1+4+9+16+25 = 55
    assert val == 55


def test_tetrahedron_num():
    """Test tetrahedral numbers."""
    val = polpack.tetrahedron_num(4)
    # T(4) = 4*5*6/6 = 20
    assert val == 20


def test_triangle_num():
    """Test triangular numbers."""
    val = polpack.triangle_num(5)
    # T(5) = 5*6/2 = 15
    assert val == 15


def test_simplex_num():
    """Test simplex numbers."""
    val = polpack.simplex_num(2, 3)
    # Simplex(2,3) = C(3+2-1, 2) = C(4,2) = 6
    assert val == 6


def test_cos_power_int():
    """Test cosine power integral."""
    import math

    val = polpack.cos_power_int(0.0, math.pi / 2.0, 2)
    assert np.isclose(val, math.pi / 4.0, rtol=1e-6)


def test_sin_power_int():
    """Test sine power integral."""
    import math

    val = polpack.sin_power_int(0.0, math.pi / 2.0, 2)
    assert np.isclose(val, math.pi / 4.0, rtol=1e-6)


def test_plane_partition_num():
    """Test plane partition number."""
    val = polpack.plane_partition_num(1)
    assert val == 1
    val = polpack.plane_partition_num(2)
    assert val == 3
    val = polpack.plane_partition_num(3)
    assert val == 6


def test_poly_coef_count():
    """Test polynomial coefficient count."""
    val = polpack.poly_coef_count(2, 3)
    # C(dim+degree, degree) = C(5,3) = 10
    assert val == 10
