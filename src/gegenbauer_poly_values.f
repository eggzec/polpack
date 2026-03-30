      subroutine gegenbauer_poly_values ( n_data, n, a, x, fx )

c*********************************************************************72
c
cc GEGENBAUER_POLY_VALUES returns some values of the Gegenbauer polynomials.
c
c  Discussion:
c
c    The Gegenbauer polynomials are also known as the "spherical
c    polynomials" or "ultraspherical polynomials".
c
c    In Mathematica, the function can be evaluated by:
c
c      GegenbauerC[n,m,x]
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
c    Output, integer N, the order parameter of the function.
c
c    Output, double precision A, the real parameter of the function.
c
c    Output, double precision X, the argument of the function.
c
c    Output, double precision FX, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 38 )

      double precision a
      double precision a_vec(n_max)
      double precision fx
      double precision fx_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)
      double precision x
      double precision x_vec(n_max)

      save a_vec
      save fx_vec
      save n_vec
      save x_vec

      data a_vec /
     &   0.5D+00,
     &   0.5D+00,
     &   0.5D+00,
     &   0.5D+00,
     &   0.5D+00,
     &   0.5D+00,
     &   0.5D+00,
     &   0.5D+00,
     &   0.5D+00,
     &   0.5D+00,
     &   0.5D+00,
     &   0.0D+00,
     &   1.0D+00,
     &   2.0D+00,
     &   3.0D+00,
     &   4.0D+00,
     &   5.0D+00,
     &   6.0D+00,
     &   7.0D+00,
     &   8.0D+00,
     &   9.0D+00,
     &  10.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00,
     &   3.0D+00 /
      data fx_vec /
     &    1.0000000000D+00,
     &    0.2000000000D+00,
     &   -0.4400000000D+00,
     &   -0.2800000000D+00,
     &    0.2320000000D+00,
     &    0.3075200000D+00,
     &   -0.0805760000D+00,
     &   -0.2935168000D+00,
     &   -0.0395648000D+00,
     &    0.2459712000D+00,
     &    0.1290720256D+00,
     &    0.0000000000D+00,
     &   -0.3600000000D+00,
     &   -0.0800000000D+00,
     &    0.8400000000D+00,
     &    2.4000000000D+00,
     &    4.6000000000D+00,
     &    7.4400000000D+00,
     &   10.9200000000D+00,
     &   15.0400000000D+00,
     &   19.8000000000D+00,
     &   25.2000000000D+00,
     &   -9.0000000000D+00,
     &   -0.1612800000D+00,
     &   -6.6729600000D+00,
     &   -8.3750400000D+00,
     &   -5.5267200000D+00,
     &    0.0000000000D+00,
     &    5.5267200000D+00,
     &    8.3750400000D+00,
     &    6.6729600000D+00,
     &    0.1612800000D+00,
     &   -9.0000000000D+00,
     &  -15.4252800000D+00,
     &   -9.6969600000D+00,
     &   22.4409600000D+00,
     &  100.8892800000D+00,
     &  252.0000000000D+00 /
      data n_vec /
     &   0,  1,  2,
     &   3,  4,  5,
     &   6,  7,  8,
     &   9, 10,  2,
     &   2,  2,  2,
     &   2,  2,  2,
     &   2,  2,  2,
     &   2,  5,  5,
     &   5,  5,  5,
     &   5,  5,  5,
     &   5,  5,  5,
     &   5,  5,  5,
     &   5,  5 /
      data x_vec /
     &   0.20D+00,
     &   0.20D+00,
     &   0.20D+00,
     &   0.20D+00,
     &   0.20D+00,
     &   0.20D+00,
     &   0.20D+00,
     &   0.20D+00,
     &   0.20D+00,
     &   0.20D+00,
     &   0.20D+00,
     &   0.40D+00,
     &   0.40D+00,
     &   0.40D+00,
     &   0.40D+00,
     &   0.40D+00,
     &   0.40D+00,
     &   0.40D+00,
     &   0.40D+00,
     &   0.40D+00,
     &   0.40D+00,
     &   0.40D+00,
     &  -0.50D+00,
     &  -0.40D+00,
     &  -0.30D+00,
     &  -0.20D+00,
     &  -0.10D+00,
     &   0.00D+00,
     &   0.10D+00,
     &   0.20D+00,
     &   0.30D+00,
     &   0.40D+00,
     &   0.50D+00,
     &   0.60D+00,
     &   0.70D+00,
     &   0.80D+00,
     &   0.90D+00,
     &   1.00D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        a = 0.0D+00
        x = 0.0D+00
        fx = 0.0D+00
      else
        n = n_vec(n_data)
        a = a_vec(n_data)
        x = x_vec(n_data)
        fx = fx_vec(n_data)
      end if

      return
      end
