      subroutine gamma_log_values ( n_data, x, fx )

c*********************************************************************72
c
cc GAMMA_LOG_VALUES returns some values of the Log Gamma function.
c
c  Discussion:
c
c    In Mathematica, the function can be evaluated by:
c
c      Log[Gamma[x]]
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    03 January 2006
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
      parameter ( n_max = 20 )

      double precision fx
      double precision fx_vec(n_max)
      integer n_data
      double precision x
      double precision x_vec(n_max)

      save fx_vec
      save x_vec

      data fx_vec /
     &  0.1524063822430784D+01,
     &  0.7966778177017837D+00,
     &  0.3982338580692348D+00,
     &  0.1520596783998375D+00,
     &  0.0000000000000000D+00,
     & -0.4987244125983972D-01,
     & -0.8537409000331584D-01,
     & -0.1081748095078604D+00,
     & -0.1196129141723712D+00,
     & -0.1207822376352452D+00,
     & -0.1125917656967557D+00,
     & -0.9580769740706586D-01,
     & -0.7108387291437216D-01,
     & -0.3898427592308333D-01,
     &  0.00000000000000000D+00,
     &  0.69314718055994530D+00,
     &  0.17917594692280550D+01,
     &  0.12801827480081469D+02,
     &  0.39339884187199494D+02,
     &  0.71257038967168009D+02 /
      data x_vec /
     &  0.20D+00,
     &  0.40D+00,
     &  0.60D+00,
     &  0.80D+00,
     &  1.00D+00,
     &  1.10D+00,
     &  1.20D+00,
     &  1.30D+00,
     &  1.40D+00,
     &  1.50D+00,
     &  1.60D+00,
     &  1.70D+00,
     &  1.80D+00,
     &  1.90D+00,
     &  2.00D+00,
     &  3.00D+00,
     &  4.00D+00,
     & 10.00D+00,
     & 20.00D+00,
     & 30.00D+00 /

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
