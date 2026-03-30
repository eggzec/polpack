      subroutine legendre_associated_normalized_sphere_values ( n_data, 
     &  n, m, x, fx )

c*********************************************************************72
c
cc LEGENDRE_ASSOCIATED_NORMALIZED_SPHERE_VALUES: normalized associated Legendre.
c
c  Discussion:
c
c    The function considered is the associated Legendre polynomial P^M_N(X).
c
c    In Mathematica, the function can be evaluated by:
c
c      LegendreP [ n, m, x ]
c
c    The function is normalized for the sphere by dividing by
c
c      sqrt ( 4 * pi * ( n + m )! / ( 4 * pi * n + 1 ) / ( n - m )! )
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    01 September 2010
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
c    Input/output, integer N_DATA.  The user sets N_DATA to 0
c    before the first call.  On each call, the routine increments N_DATA by 1,
c    and returns the corresponding data; when there is no more data, the
c    output value of N_DATA will be 0 again.
c
c    Output, integer N, integer M, double precision X,
c    the arguments of the function.
c
c    Output, double precision FX, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 21 )

      double precision fx
      double precision fx_vec(n_max)
      integer m
      integer m_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)
      double precision x
      double precision x_vec(n_max)

      save fx_vec
      save m_vec
      save n_vec
      save x_vec

      data fx_vec /
     &   0.2820947917738781D+00,
     &   0.2443012559514600D+00,
     &  -0.2992067103010745D+00,
     &  -0.07884789131313000D+00,
     &  -0.3345232717786446D+00,
     &   0.2897056515173922D+00,
     &  -0.3265292910163510D+00,
     &  -0.06997056236064664D+00,
     &   0.3832445536624809D+00,
     &  -0.2709948227475519D+00,
     &  -0.2446290772414100D+00,
     &   0.2560660384200185D+00,
     &   0.1881693403754876D+00,
     &  -0.4064922341213279D+00,
     &   0.2489246395003027D+00,
     &   0.08405804426339821D+00,
     &   0.3293793022891428D+00,
     &  -0.1588847984307093D+00,
     &  -0.2808712959945307D+00,
     &   0.4127948151484925D+00,
     &  -0.2260970318780046D+00 /
      data m_vec /
     &  0, 0, 1, 0,
     &  1, 2, 0, 1,
     &  2, 3, 0, 1,
     &  2, 3, 4, 0,
     &  1, 2, 3, 4,
     &  5 /
      data n_vec /
     &  0,  1,  1,  2,
     &  2,  2,  3,  3,
     &  3,  3,  4,  4,
     &  4,  4,  4,  5,
     &  5,  5,  5,  5,
     &  5 /
      data x_vec /
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        m = 0
        x = 0.0D+00
        fx = 0.0D+00
      else
        n = n_vec(n_data)
        m = m_vec(n_data)
        x = x_vec(n_data)
        fx = fx_vec(n_data)
      end if

      return
      end
