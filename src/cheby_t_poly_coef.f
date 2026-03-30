      subroutine cheby_t_poly_coef ( n, c )

c*********************************************************************72
c
cc CHEBY_T_POLY_COEF evaluates coefficients of Chebyshev polynomials T(n,x).
c
c  First terms:
c
c    N/K     0     1      2      3       4     5      6    7      8    9   10
c
c     0      1
c     1      0     1
c     2     -1     0      2
c     3      0    -3      0      4
c     4      1     0     -8      0       8
c     5      0     5      0    -20       0    16
c     6     -1     0     18      0     -48     0     32
c     7      0    -7      0     56       0  -112      0    64
c
c  Recursion:
c
c    T(0,X) = 1,
c    T(1,X) = X,
c    T(N,X) = 2 * X * T(N-1,X) - T(N-2,X)
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
c  Reference:
c
c    Milton Abramowitz, Irene Stegun,
c    Handbook of Mathematical Functions,
c    National Bureau of Standards, 1964,
c    ISBN: 0-486-61272-4,
c    LC: QA47.A34.
c
c  Parameters:
c
c    Input, integer N, the highest order polynomial to compute.
c    Note that polynomials 0 through N will be computed.
c
c    Output, double precision C(0:N,0:N), the coefficients of the Chebyshev T
c    polynomials.
c
      implicit none

      integer n

      double precision c(0:n,0:n)
      integer i
      integer j

      if ( n .lt. 0 ) then
        return
      end if

      do j = 0, n
        do i = 0, n
          c(i,j) = 0.0D+00
        end do
      end do

      c(0,0) = 1.0D+00

      if ( n == 0 ) then
        return
      end if

      c(1,1) = 1.0D+00
 
      do i = 2, n
        c(i,0)     =                        - c(i-2,0)
        do j = 1, i - 2
          c(i,j) = 2.0D+00 * c(i-1,j-1) - c(i-2,j-1)
        end do
        c(i,  i-1) = 2.0D+00 * c(i-1,  i-2)
        c(i,  i  ) = 2.0D+00 * c(i-1,  i-1)
      end do
 
      return
      end
