      subroutine hermite_poly_phys_values ( n_data, n, x, fx )

c*********************************************************************72
c
cc HERMITE_POLY_PHYS_VALUES returns some values of the physicist's Hermite polynomial.
c
c  Discussion:
c
c    In Mathematica, the function can be evaluated by:
c
c      HermiteH[n,x]
c
c  Differential equation:
c
c    Y'' - 2 X Y' + 2 N Y = 0
c
c  First terms:
c
c      1
c      2 X
c      4 X^2     -  2
c      8 X^3     - 12 X
c     16 X^4     - 48 X^2     + 12
c     32 X^5    - 160 X^3    + 120 X
c     64 X^6    - 480 X^4    + 720 X^2    - 120
c    128 X^7   - 1344 X^5   + 3360 X^3   - 1680 X
c    256 X^8   - 3584 X^6  + 13440 X^4  - 13440 X^2   + 1680
c    512 X^9   - 9216 X^7  + 48384 X^5  - 80640 X^3  + 30240 X
c   1024 X^10 - 23040 X^8 + 161280 X^6 - 403200 X^4 + 302400 X^2 - 30240
c
c  Recursion:
c
c    H(0,X) = 1,
c    H(1,X) = 2*X,
c    H(N,X) = 2*X * H(N-1,X) - 2*(N-1) * H(N-2,X)
c
c  Norm:
c
c    Integral ( -oo .lt. X .lt. +oo ) exp ( - X^2 ) * H(N,X)^2 dX
c    = sqrt ( PI ) * 2^N * N!
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
     &   0.1000000000000000D+02,
     &   0.9800000000000000D+02,
     &   0.9400000000000000D+03,
     &   0.8812000000000000D+04,
     &   0.8060000000000000D+05,
     &   0.7178800000000000D+06,
     &   0.6211600000000000D+07,
     &   0.5206568000000000D+08,
     &   0.4212712000000000D+09,
     &   0.3275529760000000D+10,
     &   0.2432987360000000D+11,
     &   0.1712370812800000D+12,
     &   0.4100000000000000D+02,
     &  -0.8000000000000000D+01,
     &   0.3816000000000000D+04,
     &   0.3041200000000000D+07 /
      data n_vec /
     &   0,  1,  2,
     &   3,  4,  5,
     &   6,  7,  8,
     &   9, 10, 11,
     &  12,  5,  5,
     &   5,  5 /
      data x_vec /
     &  5.0D+00,
     &  5.0D+00,
     &  5.0D+00,
     &  5.0D+00,
     &  5.0D+00,
     &  5.0D+00,
     &  5.0D+00,
     &  5.0D+00,
     &  5.0D+00,
     &  5.0D+00,
     &  5.0D+00,
     &  5.0D+00,
     &  5.0D+00,
     &  0.5D+00,
     &  1.0D+00,
     &  3.0D+00,
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
