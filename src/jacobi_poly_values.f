      subroutine jacobi_poly_values ( n_data, n, a, b, x, fx )

c*********************************************************************72
c
cc JACOBI_POLY_VALUES returns some values of the Jacobi polynomial.
c
c  Discussion:
c
c    In Mathematica, the function can be evaluated by:
c
c      JacobiP[ n, a, b, x ]
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    19 April 2012
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
c    Output, integer N, the degree of the polynomial.
c
c    Output, integer A, B, parameters of the function.
c
c    Output, double precision X, the argument of the function.
c
c    Output, double precision FX, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 26 )

      double precision a
      double precision a_vec(n_max)
      double precision b
      double precision b_vec(n_max)
      double precision fx
      double precision fx_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)
      double precision x
      double precision x_vec(n_max)

      save a_vec
      save b_vec
      save fx_vec
      save n_vec
      save x_vec

      data a_vec /
     &   0.0D+00, 0.0D+00, 0.0D+00, 0.0D+00,
     &   0.0D+00, 0.0D+00, 1.0D+00, 2.0D+00,
     &   3.0D+00, 4.0D+00, 5.0D+00, 0.0D+00,
     &   0.0D+00, 0.0D+00, 0.0D+00, 0.0D+00,
     &   0.0D+00, 0.0D+00, 0.0D+00, 0.0D+00,
     &   0.0D+00, 0.0D+00, 0.0D+00, 0.0D+00,
     &   0.0D+00, 0.0D+00 /
      data b_vec /
     &   1.0D+00, 1.0D+00, 1.0D+00, 1.0D+00,
     &   1.0D+00, 1.0D+00, 1.0D+00, 1.0D+00,
     &   1.0D+00, 1.0D+00, 1.0D+00, 2.0D+00,
     &   3.0D+00, 4.0D+00, 5.0D+00, 1.0D+00,
     &   1.0D+00, 1.0D+00, 1.0D+00, 1.0D+00,
     &   1.0D+00, 1.0D+00, 1.0D+00, 1.0D+00,
     &   1.0D+00, 1.0D+00 /
      data fx_vec /
     &    0.1000000000000000D+01,
     &    0.2500000000000000D+00,
     &   -0.3750000000000000D+00,
     &   -0.4843750000000000D+00,
     &   -0.1328125000000000D+00,
     &    0.2753906250000000D+00,
     &   -0.1640625000000000D+00,
     &   -0.1174804687500000D+01,
     &   -0.2361328125000000D+01,
     &   -0.2616210937500000D+01,
     &    0.1171875000000000D+00,
     &    0.4218750000000000D+00,
     &    0.5048828125000000D+00,
     &    0.5097656250000000D+00,
     &    0.4306640625000000D+00,
     &   -0.6000000000000000D+01,
     &    0.3862000000000000D-01,
     &    0.8118400000000000D+00,
     &    0.3666000000000000D-01,
     &   -0.4851200000000000D+00,
     &   -0.3125000000000000D+00,
     &    0.1891200000000000D+00,
     &    0.4023400000000000D+00,
     &    0.1216000000000000D-01,
     &   -0.4396200000000000D+00,
     &    0.1000000000000000D+01 /
      data n_vec /
     &    0, 1, 2, 3,
     &    4, 5, 5, 5,
     &    5, 5, 5, 5,
     &    5, 5, 5, 5,
     &    5, 5, 5, 5,
     &    5, 5, 5, 5,
     &    5, 5 /
      data x_vec /
     &    0.5D+00,
     &    0.5D+00,
     &    0.5D+00,
     &    0.5D+00,
     &    0.5D+00,
     &    0.5D+00,
     &    0.5D+00,
     &    0.5D+00,
     &    0.5D+00,
     &    0.5D+00,
     &    0.5D+00,
     &    0.5D+00,
     &    0.5D+00,
     &    0.5D+00,
     &    0.5D+00,
     &   -1.0D+00,
     &   -0.8D+00,
     &   -0.6D+00,
     &   -0.4D+00,
     &   -0.2D+00,
     &    0.0D+00,
     &    0.2D+00,
     &    0.4D+00,
     &    0.6D+00,
     &    0.8D+00,
     &    1.0D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        a = 0.0D+00
        b = 0.0D+00
        x = 0.0D+00
        fx = 0.0D+00
      else
        n = n_vec(n_data)
        a = a_vec(n_data)
        b = b_vec(n_data)
        x = x_vec(n_data)
        fx = fx_vec(n_data)
      end if

      return
      end
