      function r8_erf_inverse ( y )

c*********************************************************************72
c
cc R8_ERF_INVERSE inverts the error function.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    05 August 2010
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, double precision Y, the value of the error function.
c
c    Output, double precision R8_ERF_INVERSE, the value X such that
c    R8_ERF(X) = Y.
c
      implicit none

      double precision r8_erf_inverse
      double precision normal_01_cdf_inverse
      double precision x
      double precision y
      double precision z

      z = ( y + 1.0D+00 ) / 2.0D+00

      x = normal_01_cdf_inverse ( z )

      r8_erf_inverse = x / sqrt ( 2.0D+00 )

      return
      end
