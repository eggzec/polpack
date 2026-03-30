      subroutine bernstein_poly ( n, x, bern )

c*********************************************************************72
c
cc BERNSTEIN_POLY evaluates the Bernstein polynomials at a point X.
c
c  Discussion:
c
c    The Bernstein polynomials are assumed to be based on [0,1].
c
c    The formula is:
c
c      B(N,I,X) = [N!/(I!*(N-I)!)] * (1-X)**(N-I) * X^I
c
c    B(N,I,X) has a unique maximum value at X = I/N.
c
c    B(N,I,X) has an I-fold zero at 0 and and N-I fold zero at 1.
c
c    B(N,I,1/2) = C(N,K) / 2**N
c
c    For a fixed X and N, the polynomials add up to 1:
c
c      Sum ( 0 <= I <= N ) B(N,I,X) = 1
c
c  First values:
c
c    B(0,0,X) = 1
c
c    B(1,0,X) =      1-X
c    B(1,1,X) =                X
c
c    B(2,0,X) =     (1-X)^2
c    B(2,1,X) = 2 * (1-X)    * X
c    B(2,2,X) =                X^2
c
c    B(3,0,X) =     (1-X)**3
c    B(3,1,X) = 3 * (1-X)^2 * X
c    B(3,2,X) = 3 * (1-X)    * X^2
c    B(3,3,X) =                X^3
c
c    B(4,0,X) =     (1-X)**4
c    B(4,1,X) = 4 * (1-X)**3 * X
c    B(4,2,X) = 6 * (1-X)^2 * X^2
c    B(4,3,X) = 4 * (1-X)    * X^3
c    B(4,4,X) =                X^4
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
c  Parameters:
c
c    Input, integer N, the degree of the Bernstein polynomials 
c    to be used.  For any N, there is a set of N+1 Bernstein polynomials,
c    each of degree N, which form a basis for polynomials on [0,1].
c
c    Input, double precision X, the evaluation point.
c
c    Output, double precision BERN(0:N), the values of the N+1 
c    Bernstein polynomials at X.
c
      implicit none

      integer  n

      double precision bern(0:n)
      integer i
      integer j
      double precision x

      if ( n .eq. 0 ) then
 
        bern(0) = 1.0D+00
 
      else if ( 0 .lt. n ) then
 
        bern(0) = 1.0D+00 - x
        bern(1) = x
 
        do i = 2, n
          bern(i) = x * bern(i-1)
          do j = i - 1, 1, -1
            bern(j) =             x   * bern(j-1) 
     &              + ( 1.0D+00 - x ) * bern(j)
          end do
          bern(0) = ( 1.0D+00 - x ) * bern(0)
        end do
 
      end if
 
      return
      end
