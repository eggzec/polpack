      subroutine gamma_values ( n_data, x, fx )

c*********************************************************************72
c
cc GAMMA_VALUES returns some values of the Gamma function.
c
c  Discussion:
c
c    The Gamma function is defined as:
c
c      Gamma(Z) = Integral ( 0 <= T .lt. +oo) T**(Z-1) exp(-T) dT
c
c    It satisfies the recursion:
c
c      Gamma(X+1) = X * Gamma(X)
c
c    Gamma is undefined for nonpositive integral X.
c    Gamma(0.5) = sqrt(PI)
c    For N a positive integer, Gamma(N+1) = the standard factorial.
c
c    In Mathematica, the function can be evaluated by:
c
c      Gamma[x]
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    18 January 2008
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
c    Output, double precision X, the argument of the function.
c
c    Output, double precision FX, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 25 )

      double precision fx
      double precision fx_vec(n_max)
      integer n_data
      double precision x
      double precision x_vec(n_max)

      save fx_vec
      save x_vec

      data fx_vec /
     &  -0.3544907701811032D+01,
     &  -0.1005871979644108D+03,
     &   0.9943258511915060D+02,
     &   0.9513507698668732D+01,
     &   0.4590843711998803D+01,
     &   0.2218159543757688D+01,
     &   0.1772453850905516D+01,
     &   0.1489192248812817D+01,
     &   0.1164229713725303D+01,
     &   0.1000000000000000D+01,
     &   0.9513507698668732D+00,
     &   0.9181687423997606D+00,
     &   0.8974706963062772D+00,
     &   0.8872638175030753D+00,
     &   0.8862269254527580D+00,
     &   0.8935153492876903D+00,
     &   0.9086387328532904D+00,
     &   0.9313837709802427D+00,
     &   0.9617658319073874D+00,
     &   0.1000000000000000D+01,
     &   0.2000000000000000D+01,
     &   0.6000000000000000D+01,
     &   0.3628800000000000D+06,
     &   0.1216451004088320D+18,
     &   0.8841761993739702D+31 /
      data x_vec /
     &  -0.50D+00,
     &  -0.01D+00,
     &   0.01D+00,
     &   0.10D+00,
     &   0.20D+00,
     &   0.40D+00,
     &   0.50D+00,
     &   0.60D+00,
     &   0.80D+00,
     &   1.00D+00,
     &   1.10D+00,
     &   1.20D+00,
     &   1.30D+00,
     &   1.40D+00,
     &   1.50D+00,
     &   1.60D+00,
     &   1.70D+00,
     &   1.80D+00,
     &   1.90D+00,
     &   2.00D+00,
     &   3.00D+00,
     &   4.00D+00,
     &  10.00D+00,
     &  20.00D+00,
     &  30.00D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        x = 0.0D+00
        fx = 0.0D+00
      else
        x = x_vec(n_data)
        fx = fx_vec(n_data)
      end if

      return
      end
