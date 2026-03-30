      subroutine lerch_values ( n_data, z, s, a, fx )

c*********************************************************************72
c
cc LERCH_VALUES returns some values of the Lerch transcendent function.
c
c  Discussion:
c
c    The Lerch function is defined as
c
c      Phi(z,s,a) = Sum ( 0 <= k .lt. +oo ) z^k / ( a + k )^s
c
c    omitting any terms with ( a + k ) = 0.
c
c    In Mathematica, the function can be evaluated by:
c
c      LerchPhi[z,s,a]
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
c    Output, double precision Z, the parameters of the function.
c
c    Output, integer S, the parameters of the function.
c
c    Output, double precision A, the parameters of the function.
c
c    Output, double precision FX, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 12 )

      double precision a
      double precision a_vec(n_max)
      double precision fx
      double precision fx_vec(n_max)
      integer n_data
      integer s
      integer s_vec(n_max)
      double precision z
      double precision z_vec(n_max)

      save a_vec
      save fx_vec
      save s_vec
      save z_vec

      data a_vec /
     &  0.0D+00,
     &  0.0D+00,
     &  0.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  1.0D+00,
     &  2.0D+00,
     &  2.0D+00,
     &  2.0D+00,
     &  3.0D+00,
     &  3.0D+00,
     &  3.0D+00 /
      data fx_vec /
     &  0.1644934066848226D+01,
     &  0.1202056903159594D+01,
     &  0.1000994575127818D+01,
     &  0.1164481052930025D+01,
     &  0.1074426387216080D+01,
     &  0.1000492641212014D+01,
     &  0.2959190697935714D+00,
     &  0.1394507503935608D+00,
     &  0.9823175058446061D-03,
     &  0.1177910993911311D+00,
     &  0.3868447922298962D-01,
     &  0.1703149614186634D-04 /
      data s_vec /
     &   2, 3, 10,
     &   2, 3, 10,
     &   2, 3, 10,
     &   2, 3, 10 /
      data z_vec /
     &  0.1000000000000000D+01,
     &  0.1000000000000000D+01,
     &  0.1000000000000000D+01,
     &  0.5000000000000000D+00,
     &  0.5000000000000000D+00,
     &  0.5000000000000000D+00,
     &  0.3333333333333333D+00,
     &  0.3333333333333333D+00,
     &  0.3333333333333333D+00,
     &  0.1000000000000000D+00,
     &  0.1000000000000000D+00,
     &  0.1000000000000000D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        z = 0.0D+00
        s = 0
        a = 0.0D+00
        fx = 0.0D+00
      else
        z = z_vec(n_data)
        s = s_vec(n_data)
        a = a_vec(n_data)
        fx = fx_vec(n_data)
      end if

      return
      end
