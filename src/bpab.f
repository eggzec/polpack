      subroutine bpab ( n, x, a, b, bern )

c*********************************************************************72
c
cc BPAB evaluates at X the Bernstein polynomials based in [A,B].
c
c  Discussion:
c
c    The formula is:
c
c      BERN(N,I,X) = [N!/(I!*(N-I)!)] * (B-X)^(N-I) * (X-A)^I / (B-A)^N
c
c  First values:
c
c    B(0,0,X) =   1
c
c    B(1,0,X) = (      B-X                ) / (B-A)
c    B(1,1,X) = (                 X-A     ) / (B-A)
c
c    B(2,0,X) = (     (B-X)^2            ) / (B-A)^2
c    B(2,1,X) = ( 2 * (B-X)    * (X-A)    ) / (B-A)^2
c    B(2,2,X) = (                (X-A)^2 ) / (B-A)^2
c
c    B(3,0,X) = (     (B-X)^3            ) / (B-A)^3
c    B(3,1,X) = ( 3 * (B-X)^2 * (X-A)    ) / (B-A)^3
c    B(3,2,X) = ( 3 * (B-X)    * (X-A)^2 ) / (B-A)^3
c    B(3,3,X) = (                (X-A)^3 ) / (B-A)^3
c
c    B(4,0,X) = (     (B-X)^4            ) / (B-A)^4
c    B(4,1,X) = ( 4 * (B-X)^3 * (X-A)    ) / (B-A)^4
c    B(4,2,X) = ( 6 * (B-X)^2 * (X-A)^2 ) / (B-A)^4
c    B(4,3,X) = ( 4 * (B-X)    * (X-A)^3 ) / (B-A)^4
c    B(4,4,X) = (                (X-A)^4 ) / (B-A)^4
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
c    each of degree N, which form a basis for polynomials on [A,B].
c
c    Input, double precision X, the point at which the polynomials 
c    are to be evaluated.
c
c    Input, double precision A, B, the endpoints of the interval on which the
c    polynomials are to be based.  A and B should not be equal.
c
c    Output, double precision BERN(0:N), the values of the N+1
c    Bernstein polynomials at X.
c
      implicit none

      integer n

      double precision a
      double precision b
      double precision bern(0:n)
      integer i
      integer j
      double precision x

      if ( b .eq. a ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'BPAB - Fatal error!'
        write ( *, '(a,g14.6)' ) '  A = B = ', a
        stop 1
      end if

      if ( n .eq. 0 ) then
 
        bern(0) = 1.0D+00
 
      else if ( 0 .lt. n ) then
 
        bern(0) = ( b - x ) / ( b - a )
        bern(1) = ( x - a ) / ( b - a )
 
        do i = 2, n
          bern(i) = ( x - a ) * bern(i-1) / ( b - a )
          do j = i - 1, 1, -1
            bern(j) = ( ( b - x     ) * bern(j)     
     &                + (     x - a ) * bern(j-1) ) 
     &                / ( b     - a )
          end do
          bern(0) = ( b - x ) * bern(0) / ( b - a )
        end do
 
      end if
 
      return
      end
