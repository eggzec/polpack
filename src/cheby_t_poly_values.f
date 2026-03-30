      subroutine cheby_t_poly_values ( n_data, n, x, fx )

c*********************************************************************72
c
cc CHEBY_T_POLY_VALUES returns values of Chebyshev polynomials T(n,x).
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    21 March 2007
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
     &   0.8000000000000000D+00,
     &   0.2800000000000000D+00,
     &  -0.3520000000000000D+00,
     &  -0.8432000000000000D+00,
     &  -0.9971200000000000D+00,
     &  -0.7521920000000000D+00,
     &  -0.2063872000000000D+00,
     &   0.4219724800000000D+00,
     &   0.8815431680000000D+00,
     &   0.9884965888000000D+00,
     &   0.7000513740800000D+00,
     &   0.1315856097280000D+00 /
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
