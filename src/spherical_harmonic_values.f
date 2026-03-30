      subroutine spherical_harmonic_values ( n_data, l, m, theta, phi,
     &  yr, yi )

c*********************************************************************72
c
cc SPHERICAL_HARMONIC_VALUES returns values of spherical harmonic functions.
c
c  Discussion:
c
c    In Mathematica, the function can be evaluated by
c
c      SphericalHarmonicY [ l, m, theta, phi ]
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    25 March 2007
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
c    Eric Weisstein,
c    CRC Concise Encyclopedia of Mathematics,
c    CRC Press, 1998.
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
c    Output, integer L, integer M, double precision THETA, PHI, the arguments
c    of the function.
c
c    Output, double precision YR, YI, the real and imaginary parts of
c    the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 20 )

      integer l
      integer l_vec(n_max)
      integer m
      integer m_vec(n_max)
      integer n_data
      double precision phi
      double precision phi_vec(n_max)
      double precision theta
      double precision theta_vec(n_max)
      double precision yi
      double precision yi_vec(n_max)
      double precision yr
      double precision yr_vec(n_max)

      save l_vec
      save m_vec
      save phi_vec
      save theta_vec
      save yi_vec
      save yr_vec

      data l_vec /
     &   0,  1,  2,
     &   3,  4,  5,
     &   5,  5,  5,
     &   5,  4,  4,
     &   4,  4,  4,
     &   3,  3,  3,
     &   3,  3 /
      data m_vec /
     &   0,  0,  1,
     &   2,  3,  5,
     &   4,  3,  2,
     &   1,  2,  2,
     &   2,  2,  2,
     &  -1, -1, -1,
     &  -1, -1 /
      data phi_vec /
     &  0.1047197551196598D+01,
     &  0.1047197551196598D+01,
     &  0.1047197551196598D+01,
     &  0.1047197551196598D+01,
     &  0.1047197551196598D+01,
     &  0.6283185307179586D+00,
     &  0.6283185307179586D+00,
     &  0.6283185307179586D+00,
     &  0.6283185307179586D+00,
     &  0.6283185307179586D+00,
     &  0.7853981633974483D+00,
     &  0.7853981633974483D+00,
     &  0.7853981633974483D+00,
     &  0.7853981633974483D+00,
     &  0.7853981633974483D+00,
     &  0.4487989505128276D+00,
     &  0.8975979010256552D+00,
     &  0.1346396851538483D+01,
     &  0.1795195802051310D+01,
     &  0.2243994752564138D+01 /
      data theta_vec /
     &  0.5235987755982989D+00,
     &  0.5235987755982989D+00,
     &  0.5235987755982989D+00,
     &  0.5235987755982989D+00,
     &  0.5235987755982989D+00,
     &  0.2617993877991494D+00,
     &  0.2617993877991494D+00,
     &  0.2617993877991494D+00,
     &  0.2617993877991494D+00,
     &  0.2617993877991494D+00,
     &  0.6283185307179586D+00,
     &  0.1884955592153876D+01,
     &  0.3141592653589793D+01,
     &  0.4398229715025711D+01,
     &  0.5654866776461628D+01,
     &  0.3926990816987242D+00,
     &  0.3926990816987242D+00,
     &  0.3926990816987242D+00,
     &  0.3926990816987242D+00,
     &  0.3926990816987242D+00 /
      data yi_vec /
     &  0.0000000000000000D+00,
     &  0.0000000000000000D+00,
     & -0.2897056515173922D+00,
     &  0.1916222768312404D+00,
     &  0.0000000000000000D+00,
     &  0.0000000000000000D+00,
     &  0.3739289485283311D-02,
     & -0.4219517552320796D-01,
     &  0.1876264225575173D+00,
     & -0.3029973424491321D+00,
     &  0.4139385503112256D+00,
     & -0.1003229830187463D+00,
     &  0.0000000000000000D+00,
     & -0.1003229830187463D+00,
     &  0.4139385503112256D+00,
     & -0.1753512375142586D+00,
     & -0.3159720118970196D+00,
     & -0.3940106541811563D+00,
     & -0.3940106541811563D+00,
     & -0.3159720118970196D+00 /
      data yr_vec /
     &  0.2820947917738781D+00,
     &  0.4231421876608172D+00,
     & -0.1672616358893223D+00,
     & -0.1106331731112457D+00,
     &  0.1354974113737760D+00,
     &  0.5390423109043568D-03,
     & -0.5146690442951909D-02,
     &  0.1371004361349490D-01,
     &  0.6096352022265540D-01,
     & -0.4170400640977983D+00,
     &  0.0000000000000000D+00,
     &  0.0000000000000000D+00,
     &  0.0000000000000000D+00,
     &  0.0000000000000000D+00,
     &  0.0000000000000000D+00,
     &  0.3641205966137958D+00,
     &  0.2519792711195075D+00,
     &  0.8993036065704300D-01,
     & -0.8993036065704300D-01,
     & -0.2519792711195075D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        l = 0
        m = 0
        theta = 0.0D+00
        phi = 0.0D+00
        yr = 0.0D+00
        yi = 0.0D+00
      else
        l = l_vec(n_data)
        m = m_vec(n_data)
        theta = theta_vec(n_data)
        phi = phi_vec(n_data)
        yr = yr_vec(n_data)
        yi = yi_vec(n_data)
      end if

      return
      end
