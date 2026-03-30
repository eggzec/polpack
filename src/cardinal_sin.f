      subroutine cardinal_sin ( j, m, n, t, s )

c*********************************************************************72
c
cc CARDINAL_SIN evaluates the J-th cardinal sine basis function.
c
c  Discussion:
c
c    The base points are T(I) = pi * I / ( M + 1 ), 0 <= I <= M + 1.
c    Basis function J is 1 at T(J), and 0 at T(I) for I /= J
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    13 May 2014
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    John Boyd,
c    Exponentially convergent Fourier-Chebyshev quadrature schemes on
c    bounded and infinite intervals,
c    Journal of Scientific Computing,
c    Volume 2, Number 2, 1987, pages 99-109.
c
c  Parameters:
c
c    Input, integer J, the index of the basis function.
c    0 <= J <= M + 1.
c
c    Input, integer M, indicates the size of the basis set.
c
c    Input, integer N, the number of sample points.
c
c    Input, double precision T(N), one or more points in [0,pi] where the
c    basis function is to be evaluated.
c
c    Output, double precision S(N), the value of the function at T.
c
      implicit none

      integer n

      integer i
      integer j
      integer m
      double precision r8_eps
      parameter ( r8_eps = 2.220446049250313D-016 )
      double precision r8_mop
      double precision r8_pi
      parameter ( r8_pi = 3.141592653589793D+00 )
      double precision s(n)
      double precision t(n)
      double precision tj

      tj = r8_pi * dble ( j ) / dble ( m + 1 )

      do i = 1, n

        if ( abs ( t(i) - tj ) .le. r8_eps ) then
          s(i) = 1.0D+00
        else
          s(i) = r8_mop ( j + 1 ) 
     &      * sin ( tj ) 
     &      * sin ( dble ( m + 1 ) * t(i) ) 
     &      / dble ( m + 1 ) 
     &      / ( cos ( t(i) ) - cos ( tj ) )
        end if

      end do

      return
      end
