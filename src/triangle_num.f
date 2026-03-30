      function triangle_num ( n )

c*********************************************************************72
c
cc TRIANGLE_NUM returns the N-th triangular number.
c
c  Discussion:
c
c    The N-th triangular number T(N) is formed by the sum of the first
c    N integers:
c
c      T(N) = sum ( 1 <= I <= N ) I
c
c    By convention, T(0) = 0.
c
c    T(N) can be computed quickly by the formula:
c
c      T(N) = ( N * ( N + 1 ) ) / 2
c
c  First Values:
c
c     0
c     1
c     3
c     6
c    10
c    15
c    21
c    28
c    36
c    45
c    55
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    04 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the index of the desired number, 
c    which must be at least 0.
c
c    Output, integer TRIANGLE_NUM, the N-th triangular number.
c
      implicit none

      integer n
      integer triangle_num

      triangle_num = ( n * ( n + 1 ) ) / 2

      return
      end
