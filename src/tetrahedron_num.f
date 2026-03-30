      function tetrahedron_num ( n )

c*********************************************************************72
c
cc TETRAHEDRON_NUM returns the N-th tetrahedral number.
c
c  Discussion:
c
c    The N-th tetrahedral number T3(N) is formed by the sum of the first
c    N triangular numbers:
c
c      T3(N) = sum ( 1 <= I <= N ) T2(I)
c            = sum ( 1 <= I <= N ) sum ( 1 <= J < I ) J
c
c    By convention, T3(0) = 0.
c
c    The formula is:
c
c      T3(N) = ( N * ( N + 1 ) * ( N + 2 ) ) / 6
c
c  First Values:
c
c     0
c     1
c     4
c    10
c    20
c    35
c    56
c    84
c   120
c   165
c   220
c   275
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    06 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the index of the desired number, which 
c    must be at least 0.
c
c    Output, integer TETRAHEDRON_NUM, the N-th tetrahedron number.
c
      implicit none

      integer n
      integer tetrahedron_num

      tetrahedron_num = ( n * ( n + 1 ) * ( n + 2 ) ) / 6

      return
      end
