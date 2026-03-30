      subroutine cos_power_int_values ( n_data, a, b, n, fx )

c*********************************************************************72
c
cc COS_POWER_INT_VALUES returns some values of the cosine power integral.
c
c  Discussion:
c
c    The function has the form
c
c      COS_POWER_INT(A,B,N) = Integral ( A <= T <= B ) ( cos(T) )^N dt
c
c    In Mathematica, the function can be evaluated by:
c
c      Integrate [ ( Cos[x] )^n, { x, a, b } ]
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    30 March 2012
c
c  Author:
c
c    John Burkardt
c
c  Reference:
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
c    Output, double precision A, B, the limits of integration.
c
c    Output, integer N, the power.
c
c    Output, double precision FX, the function value.
c
      implicit none

      integer n_max
      parameter ( n_max = 11 )

      double precision a
      double precision a_vec(n_max)
      double precision b
      double precision b_vec(n_max)
      double precision fx
      double precision fx_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)

      save a_vec
      save b_vec
      save fx_vec
      save n_vec

      data a_vec /
     &   0.00D+00, 
     &   0.00D+00, 
     &   0.00D+00, 
     &   0.00D+00, 
     &   0.00D+00, 
     &   0.00D+00, 
     &   0.00D+00, 
     &   0.00D+00, 
     &   0.00D+00, 
     &   0.00D+00, 
     &   0.00D+00 /
      data b_vec /
     &   3.141592653589793D+00, 
     &   3.141592653589793D+00, 
     &   3.141592653589793D+00, 
     &   3.141592653589793D+00, 
     &   3.141592653589793D+00, 
     &   3.141592653589793D+00, 
     &   3.141592653589793D+00, 
     &   3.141592653589793D+00, 
     &   3.141592653589793D+00, 
     &   3.141592653589793D+00, 
     &   3.141592653589793D+00 /
      data fx_vec / 
     &   3.141592653589793D+00, 
     &   0.0D+00, 
     &   1.570796326794897D+00, 
     &   0.0D+00, 
     &   1.178097245096172D+00, 
     &   0.0D+00, 
     &   0.9817477042468104D+00, 
     &   0.0D+00, 
     &   0.8590292412159591D+00, 
     &   0.0D+00, 
     &   0.7731263170943632D+00 /
      data n_vec / 
     &   0, 
     &   1, 
     &   2, 
     &   3, 
     &   4, 
     &   5, 
     &   6, 
     &   7, 
     &   8, 
     &   9, 
     &  10 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        a = 0.0D+00
        b = 0.0D+00
        n = 0
        fx = 0.0D+00
      else
        a = a_vec(n_data)
        b = b_vec(n_data)
        n = n_vec(n_data)
        fx = fx_vec(n_data)
      end if

      return
      end
