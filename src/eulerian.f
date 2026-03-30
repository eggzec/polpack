      subroutine eulerian ( n, e )

c*********************************************************************72
c
cc EULERIAN computes the Eulerian number E(N,K).
c
c  Discussion:
c
c    A run in a permutation is a sequence of consecutive ascending values.
c
c    E(N,K) is the number of permutations of N objects which contain
c    exactly K runs.
c
c  Examples:
c
c     N = 7
c
c     1     0     0     0     0     0     0
c     1     1     0     0     0     0     0
c     1     4     1     0     0     0     0
c     1    11    11     1     0     0     0
c     1    26    66    26     1     0     0
c     1    57   302   302    57     1     0
c     1   120  1191  2416  1191   120     1
c
c  Recursion:
c
c    E(N,K) = K * E(N-1,K) + (N-K+1) * E(N-1,K-1).
c
c  Properties:
c
c    E(N,1) = E(N,N) = 1.
c    E(N,K) = 0 if K <= 0 or N < K.
c    sum ( 1 <= K <= N ) E(N,K) = N!.
c    X^N = sum ( 0 <= K <= N ) COMB(X+K-1, N ) E(N,K)
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    08 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Dennis Stanton, Dennis White,
c    Constructive Combinatorics,
c    Springer Verlag, 1986
c
c  Parameters:
c
c    Input, integer N, the number of rows desired.
c
c    Output, integer E(N,N), the first N rows of Eulerian numbers.
c
      implicit none

      integer n

      integer e(n,n)
      integer i
      integer j

      if ( n .lt. 1 ) then
        return
      end if
!
!  Construct rows 1, 2, ..., N of the Eulerian triangle.
!
      e(1,1) = 1
      do j = 2, n
        e(1,j) = 0
      end do

      do i = 2, n
        e(i,1) = 1
        do j = 2, n
          e(i,j) = j * e(i-1,j) + ( i - j + 1 ) * e(i-1,j-1)
        end do
      end do

      return
      end
