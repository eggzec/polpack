      subroutine cardan_poly_coef ( n, s, c )

c*********************************************************************72
c
cc CARDAN_POLY_COEF computes the coefficients of the N-th Cardan polynomial.
c
c  First terms:
c
c    2
c    0       1
c   -2 S     0       1
c    0      -3 S     0       1
c    2 S^2   0      -4 S     0       1
c    0       5 S^2   0      -5 S     0       1
c   -2 S^3   0       9 S^2   0      -6 S     0       1
c    0       7 S^3   0      14 S^2   0      -7 S     0       1
c    2 S^4   0     -16 S^3   0      20 S^2   0      -8 S     0        1
c    0       9 S^4   0     -30 S^3   0      27 S^2   0      -9 S      0     1
c   -2 S^5   0      25 S^4   0     -50 S^3   0      35 S^2   0      -10 S   0   1
c    0     -11 S^5   0      55 S^4   0     -77 S^3   0     +44 S^2    0   -11 S 0 1
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    03 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Thomas Osler,
c    Cardan Polynomials and the Reduction of Radicals,
c    Mathematics Magazine, 
c    Volume 74, Number 1, February 2001, pages 26-32.
c
c  Parameters:
c
c    Input, integer N, the order of the polynomial
c
c    Input, double precision S, the value of the parameter, which 
c    must be positive.
c
c    Output, double precision C(0:N), the coefficients.  C(0) is the 
c    constant term, and C(N) is the coefficient of X^N.
c
      implicit none

      integer n

      double precision c(0:n)
      double precision cm1(0:n)
      double precision cm2(0:n)
      integer i
      integer j
      double precision s

      if ( n .lt. 0 ) then
        return
      end if

      c(0) = 2.0D+00
      do i = 1, n
        c(i) = 0.0D+00
      end do

      if ( n .eq. 0 ) then
        return
      end if

      do i = 0, n
        cm1(i) = c(i)
      end do

      c(0) = 0.0D+00
      c(1) = 1.0D+00
      do i = 2, n
        c(i) = 0.0D+00
      end do

      do i = 2, n

        do j = 0, i - 2
          cm2(j) = cm1(j)
        end do

        do j = 0, i - 1
          cm1(j) = c(j)
        end do

        c(0) = 0.0D+00
        do j = 1, i
          c(j) = cm1(j-1)
        end do

        do j = 0, i - 2
          c(j) = c(j) - s * cm2(j)
        end do

      end do

      return
      end
