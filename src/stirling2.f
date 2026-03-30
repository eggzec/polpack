      subroutine stirling2 ( n, m, s2 )

c*********************************************************************72
c
cc STIRLING2 computes the Stirling numbers of the second kind.
c
c  Discussion:
c
c    S2(N,M) represents the number of distinct partitions of N elements
c    into M nonempty sets.  For a fixed N, the sum of the Stirling
c    numbers S2(N,M) is represented by B(N), called "Bell's number",
c    and represents the number of distinct partitions of N elements.
c
c    For example, with 4 objects, there are:
c
c    1 partition into 1 set:
c
c      (A,B,C,D)
c
c    7 partitions into 2 sets:
c
c      (A,B,C) (D)
c      (A,B,D) (C)
c      (A,C,D) (B)
c      (A) (B,C,D)
c      (A,B) (C,D)
c      (A,C) (B,D)
c      (A,D) (B,C)
c
c    6 partitions into 3 sets:
c
c      (A,B) (C) (D)
c      (A) (B,C) (D)
c      (A) (B) (C,D)
c      (A,C) (B) (D)
c      (A,D) (B) (C)
c      (A) (B,D) (C)
c
c    1 partition into 4 sets:
c
c      (A) (B) (C) (D)
c
c    So S2(4,1) = 1, S2(4,2) = 7, S2(4,3) = 6, S2(4,4) = 1, and B(4) = 15.
c
c    The Stirling numbers of the second kind S(N,1:N) are the coefficients of
c    the Bell polynomial B(N,X):
c
c      B(0,X) = 1
c      B(N,X) = sum ( 1 <= M <= N ) S(N,M) * X^M
c
c  First terms:
c
c    N/M: 1    2    3    4    5    6    7    8
c
c    1    1    0    0    0    0    0    0    0
c    2    1    1    0    0    0    0    0    0
c    3    1    3    1    0    0    0    0    0
c    4    1    7    6    1    0    0    0    0
c    5    1   15   25   10    1    0    0    0
c    6    1   31   90   65   15    1    0    0
c    7    1   63  301  350  140   21    1    0
c    8    1  127  966 1701 1050  266   28    1
c
c  Recursion:
c
c    S2(N,1) = 1 for all N.
c    S2(I,I) = 1 for all I.
c    S2(I,J) = 0 if I < J.
c
c    S2(N,M) = M * S2(N-1,M) + S2(N-1,M-1)
c
c  Properties:
c
c    sum ( 1 <= K <= M ) S2(I,K) * S1(K,J) = Delta(I,J)
c
c    X^N = sum ( 0 <= K <= N ) S2(N,K) X_K
c    where X_K is the falling factorial function.
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
c    Output, integer S2(N,M), the Stirling numbers of the 
c    second kind.
c
      implicit none

      integer m
      integer n

      integer i
      integer j
      integer s2(n,m)

      if ( n .le. 0 ) then
        return
      end if

      if ( m .le. 0 ) then
        return
      end if

      s2(1,1) = 1
      do j = 2, m
        s2(1,j) = 0
      end do

      do i = 2, n

        s2(i,1) = 1

        do j = 2, m
          s2(i,j) = j * s2(i-1,j) + s2(i-1,j-1)
        end do

      end do
 
      return
      end
