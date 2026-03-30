      subroutine cheby_u_poly_values ( n_data, n, x, fx )

c*********************************************************************72
c
cc CHEBY_U_POLY_VALUES returns values of Chebyshev polynomials U(n,x).
c
c  Discussion:
c
c    In Mathematica, the function can be evaluated by:
c
c      ChebyshevU[n,x]
c
c    The Chebyshev U polynomial is a solution to the differential equation:
c
c    (1-X*X) Y'' - 3 X Y' + N (N+2) Y = 0
c
c  First terms:
c
c    U(0,X) =   1
c    U(1,X) =   2 X
c    U(2,X) =   4 X^2 -   1
c    U(3,X) =   8 X^3 -   4 X
c    U(4,X) =  16 X^4 -  12 X^2 +  1
c    U(5,X) =  32 X^5 -  32 X^3 +  6 X
c    U(6,X) =  64 X^6 -  80 X^4 + 24 X^2 - 1
c    U(7,X) = 128 X^7 - 192 X^5 + 80 X^3 - 8X
c
c  Recursion:
c
c    U(0,X) = 1,
c    U(1,X) = 2 * X,
c    U(N,X) = 2 * X * U(N-1,X) - U(N-2,X)
c
c  Norm:
c
c    Integral ( -1 <= X <= 1 ) ( 1 - X^2 ) * U(N,X)^2 dX = PI/2
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    25 April 2012
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
      parameter ( n_max = 13 )

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
     &   0.1600000000000000D+01,
     &   0.1560000000000000D+01,
     &   0.8960000000000000D+00,
     &  -0.1264000000000000D+00,
     &  -0.1098240000000000D+01,
     &  -0.1630784000000000D+01,
     &  -0.1511014400000000D+01,
     &  -0.7868390400000000D+00,
     &   0.2520719360000000D+00,
     &   0.1190154137600000D+01,
     &   0.1652174684160000D+01,
     &   0.1453325357056000D+01 /
      data n_vec /
     &   0,  1,  2,
     &   3,  4,  5,
     &   6,  7,  8,
     &   9, 10, 11,
     &  12 /
      data x_vec /
     &  0.8D+00,
     &  0.8D+00,
     &  0.8D+00,
     &  0.8D+00,
     &  0.8D+00,
     &  0.8D+00,
     &  0.8D+00,
     &  0.8D+00,
     &  0.8D+00,
     &  0.8D+00,
     &  0.8D+00,
     &  0.8D+00,
     &  0.8D+00 /

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
