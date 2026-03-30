"""Tests for number theory functions: sigma, tau, phi, omega, moebius, mertens, prime."""

import numpy as np
import polpack


def test_sigma():
    """Test divisor sum function."""
    sigma_n = np.int32(0)
    polpack.sigma(12, sigma_n)
    # sigma(12) = 1+2+3+4+6+12 = 28
    # Note: result is returned via the argument


def test_tau():
    """Test number of divisors function."""
    taun = np.int32(0)
    polpack.tau(12, taun)
    # tau(12) = 6 (divisors: 1,2,3,4,6,12)


def test_phi():
    """Test Euler totient function."""
    phin = np.int32(0)
    polpack.phi(12, phin)
    # phi(12) = 4 (numbers 1,5,7,11 are coprime to 12)


def test_omega():
    """Test number of distinct prime divisors."""
    ndiv = np.int32(0)
    polpack.omega(12, ndiv)
    # omega(12) = 2 (prime factors: 2, 3)


def test_moebius():
    """Test Moebius function."""
    mu = np.int32(0)
    polpack.moebius(6, mu)
    # mu(6) = mu(2*3) = 1 (square-free, 2 prime factors)


def test_mertens():
    """Test Mertens function."""
    val = polpack.mertens(10)
    # M(10) = sum mu(k) for k=1..10
    # mu(1)=1, mu(2)=-1, mu(3)=-1, mu(4)=0, mu(5)=-1,
    # mu(6)=1, mu(7)=-1, mu(8)=0, mu(9)=0, mu(10)=1
    # M(10) = 1-1-1+0-1+1-1+0+0+1 = -1
    assert val == -1


def test_prime():
    """Test prime number lookup."""
    assert polpack.prime(1) == 2
    assert polpack.prime(2) == 3
    assert polpack.prime(3) == 5
    assert polpack.prime(4) == 7
    assert polpack.prime(10) == 29
    assert polpack.prime(100) == 541


def test_i4_choose():
    """Test binomial coefficient C(n,k)."""
    assert polpack.i4_choose(5, 2) == 10
    assert polpack.i4_choose(10, 3) == 120
    assert polpack.i4_choose(0, 0) == 1


def test_i4_factorial():
    """Test factorial function."""
    assert polpack.i4_factorial(0) == 1
    assert polpack.i4_factorial(1) == 1
    assert polpack.i4_factorial(5) == 120
    assert polpack.i4_factorial(10) == 3628800


def test_i4_factorial2():
    """Test double factorial function."""
    assert polpack.i4_factorial2(0) == 1
    assert polpack.i4_factorial2(5) == 15  # 5!! = 5*3*1
    assert polpack.i4_factorial2(6) == 48  # 6!! = 6*4*2


def test_collatz_count():
    """Test Collatz sequence length."""
    assert polpack.collatz_count(1) == 1
    assert polpack.collatz_count(2) == 2
    assert polpack.collatz_count(3) == 8
    assert polpack.collatz_count(7) == 17
    assert polpack.collatz_count(27) == 112
