      subroutine laguerre_polynomial_values ( n_data, n, x, fx )

c*********************************************************************72
c
cc LAGUERRE_POLYNOMIAL_VALUES returns some values of the Laguerre polynomial.
c
c  Discussion:
c
c    In Mathematica, the function can be evaluated by:
c
c      LaguerreL[n,x]
c
c  Differential equation:
c
c    X * Y'' + (1-X) * Y' + N * Y = 0
c
c  First terms:
c
c      1
c     -X    +  1
c   (  X^2 -  4 X     +  2 ) / 2
c   ( -X^3 +  9 X^2 -  18 X    +    6 ) / 6
c   (  X^4 - 16 X^3 +  72 X^2 -   96 X +      24 ) / 24
c   ( -X^5 + 25 X^4 - 200 X^3 +  600 X^2 -  600 x    +  120 ) / 120
c   (  X^6 - 36 X^5 + 450 X^4 - 2400 X^3 + 5400 X^2 - 4320 X + 720 ) / 720
c   ( -X^7 + 49 X^6 - 882 X^5 + 7350 X^4 - 29400 X^3
c      + 52920 X^2 - 35280 X + 5040 ) / 5040
c
c  Recursion:
c
c    L(0,X) = 1,
c    L(1,X) = 1-X,
c    N * L(N,X) = (2*N-1-X) * L(N-1,X) - (N-1) * L(N-2,X)
c
c  Orthogonality:
c
c    Integral ( 0 <= X .lt. +oo ) exp ( - X ) * L(N,X) * L(M,X) dX
c    = 0 if N /= M
c    = 1 if N == M
c
c  Special values:
c
c    L(N,0) = 1.
c
c  Relations:
c
c    L(N,X) = (-1)^N / N! * exp ( x ) * (d/dx)^n ( exp ( - x ) * x^n )
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
c    Output, integer N, the order of the polynomial.
c
c    Output, double precision X, the point where the polynomial is evaluated.
c
c    Output, double precision FX, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 17 )

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
     &   0.0000000000000000D+00,
     &  -0.5000000000000000D+00,
     &  -0.6666666666666667D+00,
     &  -0.6250000000000000D+00,
     &  -0.4666666666666667D+00,
     &  -0.2569444444444444D+00,
     &  -0.4047619047619048D-01,
     &   0.1539930555555556D+00,
     &   0.3097442680776014D+00,
     &   0.4189459325396825D+00,
     &   0.4801341790925124D+00,
     &   0.4962122235082305D+00,
     &  -0.4455729166666667D+00,
     &   0.8500000000000000D+00,
     &  -0.3166666666666667D+01,
     &   0.3433333333333333D+02 /
      data n_vec /
     &   0,  1,  2,
     &   3,  4,  5,
     &   6,  7,  8,
     &   9, 10, 11,
     &  12,  5,  5,
     &   5,  5 /
      data x_vec /
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  0.5D+00,
     &  3.0D+00,
     &  5.0D+00,
     &  1.0D+01 /

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
