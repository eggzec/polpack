      subroutine legendre_poly_values ( n_data, n, x, fx )

c*********************************************************************72
c
cc LEGENDRE_POLY_VALUES returns values of the Legendre polynomials.
c
c  Discussion:
c
c    In Mathematica, the function can be evaluated by:
c
c      LegendreP [ n, x ]
c
c    The formula is:
c
c      P(N,X) = (1/2**N) * sum ( 0 <= M <= N/2 ) C(N,M) C(2N-2M,N) X^(N-2*M)
c
c  Differential equation:
c
c    (1-X*X) * P(N,X)'' - 2 * X * P(N,X)' + N * (N+1) = 0
c
c  First terms:
c
c    P( 0,X) =       1
c    P( 1,X) =       1 X
c    P( 2,X) =  (    3 X^2 -       1)/2
c    P( 3,X) =  (    5 X^3 -     3 X)/2
c    P( 4,X) =  (   35 X^4 -    30 X^2 +     3)/8
c    P( 5,X) =  (   63 X^5 -    70 X^3 +    15 X)/8
c    P( 6,X) =  (  231 X^6 -   315 X^4 +   105 X^2 -     5)/16
c    P( 7,X) =  (  429 X^7 -   693 X^5 +   315 X^3 -    35 X)/16
c    P( 8,X) =  ( 6435 X^8 - 12012 X^6 +  6930 X^4 -  1260 X^2 +   35)/128
c    P( 9,X) =  (12155 X^9 - 25740 X^7 + 18018 X^5 -  4620 X^3 +  315 X)/128
c    P(10,X) =  (46189 X^10-109395 X^8 + 90090 X^6 - 30030 X^4 + 3465 X^2
c                 -63 ) /256
c
c  Recursion:
c
c    P(0,X) = 1
c    P(1,X) = X
c    P(N,X) = ( (2*N-1)*X*P(N-1,X)-(N-1)*P(N-2,X) ) / N
c
c    P'(0,X) = 0
c    P'(1,X) = 1
c    P'(N,X) = ( (2*N-1)*(P(N-1,X)+X*P'(N-1,X)-(N-1)*P'(N-2,X) ) / N
c
c  Orthogonality:
c
c    Integral ( -1 <= X <= 1 ) P(I,X) * P(J,X) dX
c      = 0 if I =/= J
c      = 2 / ( 2*I+1 ) if I = J.
c
c  Approximation:
c
c    A function F(X) defined on [-1,1] may be approximated by the series
c
c      C0*P(0,X) + C1*P(1,X) + ... + CN*P(N,X)
c
c    where
c
c      C(I) = (2*I+1)/(2) * Integral ( -1 <= X <= 1 ) F(X) P(I,X) dx.
c
c  Special values:
c
c    P(N,1) = 1.
c    P(N,-1) = (-1)**N.
c    | P(N,X) | <= 1 in [-1,1].
c
c    P(N,0,X) = P(N,X), that is, for M=0, the associated Legendre
c    function of the first kind and order N equals the Legendre polynomial
c    of the first kind and order N.
c
c    The N zeroes of P(N,X) are the abscissas used for Gauss-Legendre
c    quadrature of the integral of a function F(X) with weight function 1
c    over the interval [-1,1].
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    24 March 2007
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Milton Abramowitz, Irene Stegun,
c    Handbook of Mathematical Functions,
c    National Bureau of Standards, 1964,
c    ISBN: 0-486-61272-4,
c    LC: QA47.A34.
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
c    Output, integer N, the order of the function.
c
c    Output, double precision X, the point where the function is evaluated.
c
c    Output, double precision FX, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 22 )

      double precision fx
      double precision fx_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)
      double precision x
      double precision x_vec(n_max)

      save fx_vec
      save n_vec
      save x_vec

      data fx_vec /
     &   0.1000000000000000D+01,
     &   0.2500000000000000D+00,
     &  -0.4062500000000000D+00,
     &  -0.3359375000000000D+00,
     &   0.1577148437500000D+00,
     &   0.3397216796875000D+00,
     &   0.2427673339843750D-01,
     &  -0.2799186706542969D+00,
     &  -0.1524540185928345D+00,
     &   0.1768244206905365D+00,
     &   0.2212002165615559D+00,
     &   0.0000000000000000D+00,
     &  -0.1475000000000000D+00,
     &  -0.2800000000000000D+00,
     &  -0.3825000000000000D+00,
     &  -0.4400000000000000D+00,
     &  -0.4375000000000000D+00,
     &  -0.3600000000000000D+00,
     &  -0.1925000000000000D+00,
     &   0.8000000000000000D-01,
     &   0.4725000000000000D+00,
     &   0.1000000000000000D+01 /
      data n_vec /
     &   0,  1,  2,
     &   3,  4,  5,
     &   6,  7,  8,
     &   9, 10,  3,
     &   3,  3,  3,
     &   3,  3,  3,
     &   3,  3,  3,
     &   3 /
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
     &  0.00D+00,
     &  0.10D+00,
     &  0.20D+00,
     &  0.30D+00,
     &  0.40D+00,
     &  0.50D+00,
     &  0.60D+00,
     &  0.70D+00,
     &  0.80D+00,
     &  0.90D+00,
     &  1.00D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        x = 0.0D+00
        fx = 0.0D+00
      else
        n = n_vec(n_data)
        x = x_vec(n_data)
        fx = fx_vec(n_data)
      end if

      return
      end
