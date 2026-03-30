      subroutine zernike_poly ( m, n, rho, z )

!*********************************************************************72
!
!! ZERNIKE_POLY evaluates a Zernike polynomial at RHO.
!
!  Discussion:
!
!    This routine uses the facts that:
!
!    *) R^M_N = 0 if M < 0, or N < 0, or N < M.
!    *) R^M_M = RHO^M
!    *) R^M_N = 0 if mod ( N - M, 2 ) = 1.
!
!    and the recursion:
!
!    R^M_(N+2) = A * [ ( B * RHO * RHO - C ) * R^M_N - D * R^M_(N-2) ]
!
!    where 
!
!    A = ( N + 2 ) / ( ( N + 2 )^2 - M * M )
!    B = 4 * ( N + 1 )
!    C = ( N + M )^2 / N + ( N - M + 2 )^2 / ( N + 2 )
!    D = ( N^2 - M^2 ) / N
!
!    I wish I could clean up the recursion in the code, but for
!    now, I have to treat the case M = 0 specially.
!
!  Licensing:
!
!    This code is distributed under the GNU LGPL license. 
!
!  Modified:
!
!    18 July 2008
!
!  Author:
!
!    John Burkardt
!
!  Reference:
!
!    Eric Weisstein,
!    CRC Concise Encyclopedia of Mathematics,
!    CRC Press, 2002,
!    Second edition,
!    ISBN: 1584883472,
!    LC: QA5.W45
!
!  Parameters:
!
!    Input, integer M, the upper index.
!
!    Input, integer N, the lower index.
!
!    Input, double precision RHO, the radial coordinate.
!
!    Output, double precision Z, the value of the Zernike 
!    polynomial R^M_N at the point RHO.
!
      implicit none

      double precision a
      double precision b
      double precision c
      double precision d
      integer m
      integer n
      integer nn
      double precision rho
      double precision z
      double precision zm2
      double precision zp2
!
!  Do checks.
!
      if ( m .lt. 0 ) then
        z = 0.0D+00
        return
      end if

      if ( n .lt. 0 ) then
        z = 0.0D+00
        return
      end if

      if ( n .lt. m ) then
        z = 0.0D+00
        return
      end if

      if ( mod ( n - m, 2 ) .eq. 1 ) then
        z = 0.0D+00
        return
      end if

      zm2 = 0.0D+00
      z = rho ** m

      if ( m .eq. 0 ) then

        if ( n .eq. 0 ) then
          return
        end if

        zm2 = z
        z = 2.0D+00 * rho * rho - 1.0D+00

        do nn = m + 2, n - 2, 2

          a = dble ( nn + 2 ) / dble ( ( nn + 2 ) ** 2 - m ** 2 )
          b = dble ( 4 * ( nn + 1 ) )
          c = dble ( ( nn + m ) ** 2 ) / dble ( nn ) 
     &      + dble ( ( nn - m + 2 ) ** 2 ) / dble ( nn + 2 )
          d = dble ( nn ** 2 - m ** 2 ) / dble ( nn )

          zp2 = a * ( ( b * rho * rho - c ) * z - d * zm2 ) 
          zm2 = z
          z = zp2

        end do

      else

        do nn = m, n-2, 2

          a = dble ( nn + 2 ) / dble ( ( nn + 2 ) ** 2 - m ** 2 )
          b = dble ( 4 * ( nn + 1 ) )
          c = dble ( ( nn + m ) ** 2 ) / dble ( nn ) 
     &      + dble ( ( nn - m + 2 ) ** 2 ) / dble ( nn + 2 )
          d = dble ( nn ** 2 - m ** 2 ) / dble ( nn )

          zp2 = a * ( ( b * rho * rho - c ) * z - d * zm2 ) 
          zm2 = z
          z = zp2

        end do

      end if

      return
      end
