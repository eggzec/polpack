      subroutine zernike_poly_coef ( m, n, c )

c*********************************************************************72
c
cc ZERNIKE_POLY_COEF: coefficients of a Zernike polynomial.
c
c  Discussion:
c
c    With our coefficients stored in C(0:N), the
c    radial function R^M_N(RHO) is given by
c
c      R^M_N(RHO) = C(0) 
c                 + C(1) * RHO
c                 + C(2) * RHO^2
c                 + ...
c                 + C(N) * RHO^N
c
c    and the odd and even Zernike polynomials are
c
c      Z^M_N(RHO,PHI,odd)  = R^M_N(RHO) * sin(PHI)
c      Z^M_N(RHO,PHI,even) = R^M_N(RHO) * cos(PHI)
c
c    The first few "interesting" values of R are:
c
c    R^0_0 = 1
c
c    R^1_1 = RHO
c
c    R^0_2 = 2 * RHO^2 - 1
c    R^2_2 =     RHO^2
c
c    R^1_3 = 3 * RHO^3 - 2 * RHO
c    R^3_3 =     RHO^3
c
c    R^0_4 = 6 * RHO^4 - 6 * RHO^2 + 1
c    R^2_4 = 4 * RHO^4 - 3 * RHO^2
c    R^4_4 =     RHO^4
c
c    R^1_5 = 10 * RHO^5 - 12 * RHO^3 + 3 * RHO
c    R^3_5 =  5 * RHO^5 -  4 * RHO^3
c    R^5_5 =      RHO^5
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    18 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Eric Weisstein,
c    CRC Concise Encyclopedia of Mathematics,
c    CRC Press, 2002,
c    Second edition,
c    ISBN: 1584883472,
c    LC: QA5.W45
c
c  Parameters:
c
c    Input, integer M, N, the parameters of the polynomial.
c    Normally, 0 <= M <= N and 0 <= N.
c  
c    Output, double precision C(0:N), the coefficients of the polynomial.
c
      implicit none

      integer n

      double precision c(0:n)
      integer i
      integer l
      integer m
      integer nm_minus
      integer nm_plus
      double precision r8_choose

      do i = 0, n
        c(i) = 0.0D+00
      end do

      if ( n .lt. 0 ) then
        return
      end if

      if ( m .lt. 0 ) then
        return
      end if
          
      if ( n .lt. m ) then
        return
      end if

      if ( mod ( n - m, 2 ) .eq. 1 ) then
        return
      end if

      nm_plus = ( m + n ) / 2
      nm_minus = ( n - m ) / 2

      c(n) = r8_choose ( n, nm_plus )

      do l = 0, nm_minus - 1

        c(n-2*l-2) = - dble ( ( nm_plus - l ) * ( nm_minus - l ) ) 
     &    * c(n-2*l) / dble ( ( n - l ) * ( l + 1 ) )

      end do

      return
      end
