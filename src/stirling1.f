      subroutine stirling1 ( n, m, s1 )

c*********************************************************************72
c
cc STIRLING1 computes the Stirling numbers of the first kind.
c
c  Discussion:
c
c    The absolute value of the Stirling number S1(N,M) gives the number
c    of permutations on N objects having exactly M cycles, while the
c    sign of the Stirling number records the sign (odd or even) of
c    the permutations.  For example, there are six permutations on 3 objects:
c
c      A B C   3 cycles (A) (B) (C)
c      A C B   2 cycles (A) (BC)
c      B A C   2 cycles (AB) (C)
c      B C A   1 cycle  (ABC)
c      C A B   1 cycle  (ABC)
c      C B A   2 cycles (AC) (B)
c
c    There are 
c
c      2 permutations with 1 cycle, and S1(3,1) = 2
c      3 permutations with 2 cycles, and S1(3,2) = -3,
c      1 permutation with 3 cycles, and S1(3,3) = 1.
c
c    Since there are N! permutations of N objects, the sum of the absolute 
c    values of the Stirling numbers in a given row, 
c
c      sum ( 1 <= I <= N ) abs ( S1(N,I) ) = N!
c
c  First terms:
c
c    N/M:  1     2      3     4     5    6    7    8
c
c    1     1     0      0     0     0    0    0    0
c    2    -1     1      0     0     0    0    0    0
c    3     2    -3      1     0     0    0    0    0
c    4    -6    11     -6     1     0    0    0    0
c    5    24   -50     35   -10     1    0    0    0
c    6  -120   274   -225    85   -15    1    0    0
c    7   720 -1764   1624  -735   175  -21    1    0
c    8 -5040 13068 -13132  6769 -1960  322  -28    1
c
c  Recursion:
c
c    S1(N,1) = (-1)^(N-1) * (N-1)! for all N.
c    S1(I,I) = 1 for all I.
c    S1(I,J) = 0 if I < J.
c
c    S1(N,M) = S1(N-1,M-1) - (N-1) * S1(N-1,M)
c
c  Properties:
c
c    sum ( 1 <= K <= M ) S2(I,K) * S1(K,J) = Delta(I,J)
c
c    X_N = sum ( 0 <= K <= N ) S1(N,K) X^K
c    where X_N is the falling factorial function.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    12 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the number of rows of the table.
c
c    Input, integer M, the number of columns of the table.
c
c    Output, integer S1(N,M), the Stirling numbers of the 
c    first kind.
c
      implicit none

      integer m
      integer n

      integer i
      integer j
      integer s1(n,m)

      if ( n .le. 0 ) then
        return
      end if

      if ( m .le. 0 ) then
        return
      end if

      s1(1,1) = 1
      do j = 2, m
        s1(1,j) = 0
      end do

      do i = 2, n

        s1(i,1) = - ( i - 1 ) * s1(i-1,1)

        do j = 2, m
          s1(i,j) = s1(i-1,j-1) - ( i - 1 ) * s1(i-1,j)
        end do

      end do
 
      return
      end
