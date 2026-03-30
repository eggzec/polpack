      subroutine catalan ( n, c )

c*********************************************************************72
c
cc CATALAN computes the Catalan numbers, from C(0) to C(N).
c
c  Discussion:
c
c    The Catalan number C(N) counts:
c
c    1) the number of binary trees on N vertices;
c    2) the number of ordered trees on N+1 vertices;
c    3) the number of full binary trees on 2N+1 vertices;
c    4) the number of well formed sequences of 2N parentheses;
c    5) the number of ways 2N ballots can be counted, in order,
c       with N positive and N negative, so that the running sum
c       is never negative;
c    6) the number of standard tableaus in a 2 by N rectangular Ferrers diagram;
c    7) the number of monotone functions from [1..N] to [1..N] which 
c       satisfy f(i) <= i for all i;
c    8) the number of ways to triangulate a polygon with N+2 vertices.
c
c    The formula is:
c
c      C(N) = (2*N)! / ( (N+1) * (N!) * (N!) ) 
c           = 1 / (N+1) * COMB ( 2N, N )
c           = 1 / (2N+1) * COMB ( 2N+1, N+1).
c
c    C(N) = 2 * (2*N-1) * C(N-1) / (N+1)
c    C(N) = sum ( 1 <= I <= N-1 ) C(I) * C(N-I)
c
c  First values:
c
c     C(0)     1
c     C(1)     1
c     C(2)     2
c     C(3)     5
c     C(4)    14
c     C(5)    42
c     C(6)   132
c     C(7)   429
c     C(8)  1430
c     C(9)  4862
c    C(10) 16796
c
c  Example:
c
c    N = 3
c
c    ()()()
c    ()(())
c    (()())
c    (())()
c    ((()))
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
c    Dennis Stanton, Dennis White,
c    Constructive Combinatorics,
c    Springer, 1986,
c    ISBN: 0387963472.
c
c  Parameters:
c
c    Input, integer N, the number of Catalan numbers desired.
c
c    Output, integer C(0:N), the Catalan numbers from C(0) to C(N).
c
      implicit none

      integer n

      integer c(0:n)
      integer i

      if ( n .lt. 0 ) then
        return
      end if

      c(0) = 1
c
c  The extra parentheses ensure that the integer division is
c  done AFTER the integer multiplication.
c
      do i = 1, n
        c(i) = ( c(i-1) * 2 * ( 2 * i - 1 ) ) / ( i + 1 )
      end do
     
      return
      end
