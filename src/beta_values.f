      subroutine beta_values ( n_data, x, y, fxy )

c*********************************************************************72
c
cc BETA_VALUES returns some values of the Beta function.
c
c  Discussion:
c
c    Beta(X,Y) = ( Gamma(X) * Gamma(Y) ) / Gamma(X+Y)
c
c    Both X and Y must be greater than 0.
c
c    In Mathematica, the function can be evaluated by:
c
c      Beta[X,Y]
c
c    Beta(X,Y) = Beta(Y,X).
c    Beta(X,Y) = Integral ( 0 .lt.= T .lt.= 1 ) T**(X-1) (1-T)**(Y-1) dT.
c    Beta(X,Y) = Gamma(X) * Gamma(Y) / Gamma(X+Y)
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
c    Output, double precision X, Y, the arguments of the function.
c
c    Output, double precision FXY, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 17 )

      double precision b_vec(n_max)
      double precision fxy
      integer n_data
      double precision x
      double precision x_vec(n_max)
      double precision y
      double precision y_vec(n_max)

      save b_vec
      save x_vec
      save y_vec

      data b_vec /
     &  0.5000000000000000D+01,
     7  0.2500000000000000D+01,
     &  0.1666666666666667D+01,
     &  0.1250000000000000D+01,
     &  0.5000000000000000D+01,
     &  0.2500000000000000D+01,
     &  0.1000000000000000D+01,
     &  0.1666666666666667D+00,
     &  0.3333333333333333D-01,
     &  0.7142857142857143D-02,
     &  0.1587301587301587D-02,
     &  0.2380952380952381D-01,
     &  0.5952380952380952D-02,
     &  0.1984126984126984D-02,
     &  0.7936507936507937D-03,
     &  0.3607503607503608D-03,
     &  0.8325008325008325D-04 /
      data x_vec /
     &  0.2D+00,
     &  0.4D+00,
     &  0.6D+00,
     &  0.8D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  2.0D+00,
     &  3.0D+00,
     &  4.0D+00,
     &  5.0D+00,
     &  6.0D+00,
     &  6.0D+00,
     &  6.0D+00,
     &  6.0D+00,
     &  6.0D+00,
     &  7.0D+00 /
      data y_vec /
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  0.2D+00,
     &  0.4D+00,
     &  1.0D+00,
     &  2.0D+00,
     &  3.0D+00,
     &  4.0D+00,
     &  5.0D+00,
     &  2.0D+00,
     &  3.0D+00,
     &  4.0D+00,
     &  5.0D+00,
     &  6.0D+00,
     &  7.0D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        x = 0.0D+00
        y = 0.0D+00
        fxy = 0.0D+00
      else
        x = x_vec(n_data)
        y = y_vec(n_data)
        fxy = b_vec(n_data)
      end if

      return
      end
