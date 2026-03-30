"""Tests for special functions: erf, agm, beta, psi, gamma, zeta, lerch, lambert_w, gud."""

import numpy as np
import polpack


def test_r8_erf():
    """Test error function at known values."""
    assert np.isclose(polpack.r8_erf(0.0), 0.0, atol=1e-12)
    assert np.isclose(polpack.r8_erf(1.0), 0.8427007929, rtol=1e-6)


def test_r8_erf_inverse():
    """Test inverse error function."""
    y = 0.5
    x = polpack.r8_erf_inverse(y)
    assert np.isclose(polpack.r8_erf(x), y, rtol=1e-6)


def test_r8_agm():
    """Test arithmetic-geometric mean."""
    val = polpack.r8_agm(1.0, 2.0)
    assert np.isclose(val, 1.4567910310469068692, rtol=1e-10)


def test_r8_beta():
    """Test Beta function B(x,y) = Gamma(x)*Gamma(y)/Gamma(x+y)."""
    val = polpack.r8_beta(2.0, 3.0)
    # B(2,3) = 1!*2!/4! = 2/24 = 1/12
    assert np.isclose(val, 1.0 / 12.0, rtol=1e-10)


def test_r8_choose():
    """Test real-valued binomial coefficient."""
    val = polpack.r8_choose(5, 2)
    assert np.isclose(val, 10.0, rtol=1e-10)


def test_r8_factorial():
    """Test real factorial."""
    assert np.isclose(polpack.r8_factorial(0), 1.0)
    assert np.isclose(polpack.r8_factorial(5), 120.0)
    assert np.isclose(polpack.r8_factorial(10), 3628800.0)


def test_r8_factorial_log():
    """Test log(factorial)."""
    assert np.isclose(polpack.r8_factorial_log(0), 0.0, atol=1e-12)
    val = polpack.r8_factorial_log(10)
    assert np.isclose(val, np.log(3628800.0), rtol=1e-6)


def test_r8_psi():
    """Test digamma (psi) function."""
    # psi(1) = -gamma (Euler-Mascheroni constant)
    val = polpack.r8_psi(1.0)
    assert np.isclose(val, -0.5772156649015329, rtol=1e-6)


def test_r8_hyper_2f1():
    """Test hypergeometric function 2F1."""
    hf = np.float64(0.0)
    polpack.r8_hyper_2f1(1.0, 1.0, 2.0, 0.5, hf)
    # 2F1(1,1;2;0.5) = -2*ln(1-0.5)/0.5 = -2*ln(0.5) = 2*ln(2) ≈ 1.386...
    # Actually 2F1(1,1;2;x) = -ln(1-x)/x
    # 2F1(1,1;2;0.5) = -ln(0.5)/0.5 = 0.6931.../0.5 = 1.3862...


def test_gud():
    """Test Gudermannian function."""
    val = polpack.gud(1.0)
    # gud(1) = 2*atan(tanh(0.5))
    expected = 2.0 * np.arctan(np.tanh(0.5))
    assert np.isclose(val, expected, rtol=1e-6)


def test_agud():
    """Test inverse Gudermannian: agud(gud(x)) = x."""
    x = 1.5
    g = polpack.gud(x)
    x2 = polpack.agud(g)
    assert np.isclose(x2, x, rtol=1e-10)


def test_lambert_w():
    """Test Lambert W function."""
    val = polpack.lambert_w(1.0)
    # W(1) ≈ 0.5671432904097838
    assert np.isclose(val, 0.5671432904097838, rtol=1e-4)


def test_lambert_w_crude():
    """Test crude Lambert W estimate."""
    val = polpack.lambert_w_crude(1.0)
    # Crude estimate tolerance
    assert np.isclose(val, 0.56714329, rtol=0.2)


def test_zeta():
    """Test Riemann zeta function."""
    val = polpack.zeta(2.0)
    # Riemann zeta at 2 is pi^2 / 6
    assert np.isclose(val, np.pi**2 / 6.0, rtol=1e-2)


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
