      subroutine cheby_u_poly_zero ( n, z )

c*********************************************************************72
c
cc CHEBY_U_POLY_ZERO returns zeroes of Chebyshev polynomials U(n,x).
c
c  Discussion:
c
c    The I-th zero of U(N,X) is cos((I-1)*PI/(N-1)), I = 1 to N
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    07 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the order of the polynomial.
c
c    Output, double precision Z(N), the zeroes of U(N,X).
c
      implicit none

      integer n

      double precision angle
      integer i
      double precision pi
      parameter ( pi = 3.141592653589793D+00 )
      double precision z(n)

      do i = 1, n
        angle = dble ( i ) * pi / dble ( n + 1 )
        z(i) = cos ( angle )
      end do

      return
      end
