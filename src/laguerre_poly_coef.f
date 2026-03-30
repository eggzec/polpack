      subroutine laguerre_poly_coef ( n, c )

c*****************************************************************************80
c
cc LAGUERRE_POLY_COEF evaluates the Laguerre polynomial coefficients.
c
c  First terms:
c
c    0: 1
c    1: 1  -1
c    2: 1  -2  1/2
c    3: 1  -3  3/2  1/6
c    4: 1  -4  4   -2/3  1/24
c    5: 1  -5  5   -5/3  5/24  -1/120
c
c  Recursion:
c
c    L(0) = ( 1,  0, 0, ..., 0 )
c    L(1) = ( 1, -1, 0, ..., 0 )
c    L(N) = (2*N-1-X) * L(N-1) - (N-1) * L(N-2) / N
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    14 July 2008
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
c    Output, double precision C(0:N,0:N), the coefficients of the
c    Laguerre polynomials of degree 0 through N.  Each polynomial 
c   is stored as a row.
c
      implicit none

      integer n

      double precision c(0:n,0:n)
      integer i
      integer j

      if ( n .lt. 0 ) then
        return
      end if

      do i = 0, n
        c(i,0) = 1.0D+00
        do j = 1, n
          c(i,j) = 0.0D+00
        end do
      end do

      if ( n .eq. 0 ) then
        return
      end if

      c(1,1) = -1.0D+00
     
      do i = 2, n

        do j = 1, n
          c(i,j) = ( 
     &        dble ( 2 * i - 1 ) * c(i-1,j)     
     &      + dble (   - i + 1 ) * c(i-2,j)     
     &      -                      c(i-1,j-1) ) 
     &      / dble (     i     )
        end do
      end do

      return
      end
