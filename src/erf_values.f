      subroutine erf_values ( n_data, x, fx )

c*********************************************************************72
c
cc ERF_VALUES returns some values of the ERF or "error" function for testing.
c
c  Discussion:
c
c    The error function is defined by:
c
c      ERF(X) = ( 2 / sqrt ( PI ) * integral ( 0 <= T <= X ) exp ( - T^2 ) dT
c
c    In Mathematica, the function can be evaluated by:
c
c      Erf[x]
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    29 March 2007
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
c    Input/output, integer N_DATA.
c    On input, if N_DATA is 0, the first test data is returned, and
c    N_DATA is set to the index of the test data.  On each subsequent
c    call, N_DATA is incremented and that test data is returned.  When
c    there is no more test data, N_DATA is set to 0.
c
c    Output, double precision X, the argument of the function.
c
c    Output, double precision FX, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 21 )

      double precision bvec ( n_max )
      double precision fx
      integer n_data
      double precision x
      double precision xvec ( n_max )

      data bvec /
     & 0.0000000000000000D+00,
     & 0.1124629160182849D+00,
     & 0.2227025892104785D+00,
     & 0.3286267594591274D+00,
     & 0.4283923550466685D+00,
     & 0.5204998778130465D+00,
     & 0.6038560908479259D+00,
     & 0.6778011938374185D+00,
     & 0.7421009647076605D+00,
     & 0.7969082124228321D+00,
     & 0.8427007929497149D+00,
     & 0.8802050695740817D+00,
     & 0.9103139782296354D+00,
     & 0.9340079449406524D+00,
     & 0.9522851197626488D+00,
     & 0.9661051464753107D+00,
     & 0.9763483833446440D+00,
     & 0.9837904585907746D+00,
     & 0.9890905016357307D+00,
     & 0.9927904292352575D+00,
     & 0.9953222650189527D+00 /
      data xvec /
     &  0.0D+00,
     &  0.1D+00,
     &  0.2D+00,
     &  0.3D+00,
     &  0.4D+00,
     &  0.5D+00,
     &  0.6D+00,
     &  0.7D+00,
     &  0.8D+00,
     &  0.9D+00,
     &  1.0D+00,
     &  1.1D+00,
     &  1.2D+00,
     &  1.3D+00,
     &  1.4D+00,
     &  1.5D+00,
     &  1.6D+00,
     &  1.7D+00,
     &  1.8D+00,
     &  1.9D+00,
     &  2.0D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        x = 0.0D+00
        fx = 0.0D+00
      else
        x = xvec(n_data)
        fx = bvec(n_data)
      end if

      return
      end
