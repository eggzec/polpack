      subroutine cheby_t_poly_zero ( n, z )

c*********************************************************************72
c
cc CHEBY_T_POLY_ZERO returns zeroes of Chebyshev polynomials T(n,x).
c
c  Discussion:
c
c    The I-th zero of T(N,X) is cos((2*I-1)*PI/(2*N)), I = 1 to N
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    04 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the order of the polynomial.
c
c    Output, double precision Z(N), the zeroes of T(N,X).
c
      implicit none

      integer n

      double precision angle
      integer i
      double precision pi
      parameter ( pi = 3.141592653589793D+00 )
      double precision z(n)

      do i = 1, n
        angle = dble ( 2 * i - 1 ) * pi / dble ( 2 * n )
        z(i) = cos ( angle )
      end do

      return
      end
