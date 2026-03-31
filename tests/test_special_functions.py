"""Tests for special functions: erf, agm, beta, psi, gamma, zeta, lerch, lambert_w, gud."""

import numpy as np

import polpack


def test_r8_erf():
    """Test error function against legacy data."""
    # Data from R8_ERF_TEST
    expected = {0.0: 0.0, 0.5: 0.520500, 1.0: 0.842701, 1.4: 0.952285}
    for x, val in expected.items():
        assert np.isclose(polpack.r8_erf(x), val, rtol=1e-5)


def test_r8_agm():
    """Test arithmetic-geometric mean against legacy data."""
    # Data from AGM_VALUES_TEST (I'll use the one from test_special_functions.py)
    val = polpack.r8_agm(1.0, 2.0)
    assert np.isclose(val, 1.456791, rtol=1e-5)


def test_r8_beta():
    """Test Beta function against legacy data."""
    # Data from R8_BETA_TEST
    assert np.isclose(polpack.r8_beta(0.2, 1.0), 5.0, rtol=1e-5)
    assert np.isclose(polpack.r8_beta(2.0, 2.0), 0.166667, rtol=1e-5)
    assert np.isclose(polpack.r8_beta(3.0, 3.0), 0.333333e-01, rtol=1e-5)


def test_gud():
    """Test Gudermannian function against legacy data."""
    # Data from AGUD_TEST
    assert np.isclose(polpack.gud(1.0), 0.865769, rtol=1e-5)
    assert np.isclose(polpack.gud(2.0), 1.30176, rtol=1e-5)
    assert np.isclose(polpack.gud(3.0), 1.47130, rtol=1e-5)


def test_lambert_w():
    """Test Lambert W function against legacy data."""
    # Data from LAMBERT_W_TEST
    assert np.isclose(polpack.lambert_w(0.5), 0.351734, rtol=1e-5)
    assert np.isclose(polpack.lambert_w(1.0), 0.567143, rtol=1e-5)
    assert np.isclose(polpack.lambert_w(2.0), 0.852606, rtol=1e-5)


def test_zeta():
    """Test Riemann zeta function against legacy data."""
    # Data from ZETA_TEST
    expected = {
        2: 1.64393456668,
        3: 1.20205640366,
        10: 1.00099457513,
        20: 1.00000095396,
    }
    for n, val in expected.items():
        assert np.isclose(polpack.zeta(float(n)), val, rtol=1e-5)


def test_lerch():
    """Test Lerch transcendent function."""
    val = polpack.lerch(0.5, 2, 1.0)
    # Phi(z, s, a) = sum_{n=0}^inf z^n / (n+a)^s
    assert np.isfinite(val)


def test_normal_01_cdf_inverse():
    """Test inverse normal CDF."""
    val = polpack.normal_01_cdf_inverse(0.5)
    assert np.isclose(val, 0.0, atol=1e-10)


def test_r8_euler_constant():
    """Test Euler-Mascheroni constant."""
    val = polpack.r8_euler_constant()
    assert np.isclose(val, 0.5772156649015329, rtol=1e-10)


def test_r8_pi():
    """Test pi constant."""
    val = polpack.r8_pi()
    assert np.isclose(val, np.pi, rtol=1e-14)


def test_benford():
    """Test Benford probability."""
    val = polpack.benford(1)
    assert np.isclose(val, np.log10(2.0), rtol=1e-10)
    val = polpack.benford(9)
    assert np.isclose(val, np.log10(10.0 / 9.0), rtol=1e-10)
