      subroutine bernstein_poly_values ( n_data, n, k, x, b )

c*********************************************************************72
c
cc BERNSTEIN_POLY_VALUES returns some values of the Bernstein polynomials.
c
c  Discussion:
c
c    The Bernstein polynomials are assumed to be based on [0,1].
c
c    The formula for the Bernstein polynomials is
c
c      B(N,I,X) = [N!/(I!*(N-I)!)] * (1-X)^(N-I) * X^I
c
c    In Mathematica, the function can be evaluated by:
c
c      Binomial[n,i] * (1-x)^(n-i) * x^i
c
c    B(N,I,X) has a unique maximum value at X = I/N.
c
c    B(N,I,X) has an I-fold zero at 0 and and N-I fold zero at 1.
c
c    B(N,I,1/2) = C(N,K) / 2^N
c
c    For a fixed X and N, the polynomials add up to 1:
c
c      Sum ( 0 <= I <= N ) B(N,I,X) = 1
c
c  First values:
c
c    B(0,0,X) = 1
c
c    B(1,0,X) =      1-X
c    B(1,1,X) =                X
c
c    B(2,0,X) =     (1-X)^2
c    B(2,1,X) = 2 * (1-X)    * X
c    B(2,2,X) =                X^2
c
c    B(3,0,X) =     (1-X)**3
c    B(3,1,X) = 3 * (1-X)^2 * X
c    B(3,2,X) = 3 * (1-X)    * X^2
c    B(3,3,X) =                X^3
c
c    B(4,0,X) =     (1-X)**4
c    B(4,1,X) = 4 * (1-X)**3 * X
c    B(4,2,X) = 6 * (1-X)^2 * X^2
c    B(4,3,X) = 4 * (1-X)    * X^3
c    B(4,4,X) =                X^4
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    20 March 2007
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Stephen Wolfram,
c    The Mathematica Book,
c    Fourth Edition,
c    Cambridge University Press, 1999,
c    ISBN: 0-521-64314-7,
c    LC: QA76.95.W65.
c
c  Parameters:
c
c    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
c    first call.  On each call, the routine increments N_DATA by 1, and
c    returns the corresponding data; when there is no more data, the
c    output value of N_DATA will be 0 again.
c
c    Output, integer N, the degree of the polynomial.
c
c    Output, integer K, the index of the polynomial.
c
c    Output, double precision X, the argument of the polynomial.
c
c    Output, double precision B, the value of the polynomial B(N,K,X).
c
      implicit none

      integer n_max
      parameter ( n_max = 15 )

      double precision b
      double precision b_vec(n_max)
      integer k
      integer k_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)
      double precision x
      double precision x_vec(n_max)

      save b_vec
      save k_vec
      save n_vec
      save x_vec

      data b_vec /
     &  0.1000000000000000D+01,
     &  0.7500000000000000D+00,
     &  0.2500000000000000D+00,
     &  0.5625000000000000D+00,
     &  0.3750000000000000D+00,
     &  0.6250000000000000D-01,
     &  0.4218750000000000D+00,
     &  0.4218750000000000D+00,
     &  0.1406250000000000D+00,
     &  0.1562500000000000D-01,
     &  0.3164062500000000D+00,
     &  0.4218750000000000D+00,
     &  0.2109375000000000D+00,
     &  0.4687500000000000D-01,
     &  0.3906250000000000D-02 /
      data k_vec /
     &  0,
     &  0, 1,
     &  0, 1, 2,
     &  0, 1, 2, 3,
     &  0, 1, 2, 3, 4 /
      data n_vec /
     &  0,
     &  1, 1,
     &  2, 2, 2,
     &  3, 3, 3, 3,
     &  4, 4, 4, 4, 4 /
      data x_vec /
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        k = 0
        x = 0.0D+00
        b = 0.0D+00
      else
        n = n_vec(n_data)
        k = k_vec(n_data)
        x = x_vec(n_data)
        b = b_vec(n_data)
      end if

      return
      end
