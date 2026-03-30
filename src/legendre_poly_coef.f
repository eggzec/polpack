      subroutine legendre_poly_coef ( n, c )

c*********************************************************************72
c
cc LEGENDRE_POLY_COEF evaluates the Legendre polynomial coefficients.
c
c  First terms:
c
c     1
c     0     1
c    -1/2   0      3/2
c     0    -3/2    0     5/2
c     3/8   0    -30/8   0     35/8
c     0    15/8    0   -70/8    0     63/8
c    -5/16  0    105/16  0   -315/16   0    231/16
c     0   -35/16   0   315/16   0   -693/16   0    429/16
c
c     1.00000
c     0.00000  1.00000
c    -0.50000  0.00000  1.50000
c     0.00000 -1.50000  0.00000  2.5000
c     0.37500  0.00000 -3.75000  0.00000  4.37500
c     0.00000  1.87500  0.00000 -8.75000  0.00000  7.87500
c    -0.31250  0.00000  6.56250  0.00000 -19.6875  0.00000  14.4375
c     0.00000 -2.1875   0.00000  19.6875  0.00000 -43.3215  0.00000  26.8125
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
c    Milton Abramowitz, Irene Stegun,
c    Handbook of Mathematical Functions,
c    National Bureau of Standards, 1964,
c    ISBN: 0-486-61272-4,
c    LC: QA47.A34.
c
c    Daniel Zwillinger, editor,
c    CRC Standard Mathematical Tables and Formulae,
c    30th Edition,
c    CRC Press, 1996.
c
c  Parameters:
c
c    Input, integer N, the highest order polynomial to evaluate.
c    Note that polynomials 0 through N will be evaluated.
c
c    Output, double precision C(0:N,0:N), the coefficients of the 
c    Legendre polynomials of degree 0 through N.  Each polynomial is 
c    stored as a row.
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

      if ( n .le. 0 ) then
        return
      end if

      c(1,1) = 1.0D+00
     
      do i = 2, n
        do j = 0, i - 2
          c(i,j) =          dble (   - i + 1 ) * c(i-2,j) 
     &                    / dble (     i     )
        end do
        do j = 1, i
          c(i,j) = c(i,j) + dble ( i + i - 1 ) * c(i-1,j-1) 
     &                    / dble (     i     )
        end do
      end do
     
      return
      end
