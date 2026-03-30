      function pyramid_num ( n )

c*********************************************************************72
c
cc PYRAMID_NUM returns the N-th pyramidal number.
c
c  Discussion:
c
c    The N-th pyramidal number P(N) is formed by the sum of the first
c    N triangular numbers T(J):
c
c      T(J) = sum ( 1 <= J <= N ) J
c
c      P(N) = sum ( 1 <= I <= N ) T(I)
c
c    By convention, T(0) = 0.
c
c    The formula is:
c
c      P(N) = ( (N+1)^3 - (N+1) ) / 6
c
c    Note that this pyramid will have a triangular base.
c
c  Example:
c
c    0   0
c    1   1
c    2   4
c    3  10
c    4  20
c    5  35
c    6  56
c    7  84
c    8 120
c    9 165
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
c    Input, integer N, the index of the desired number, which 
c    must be at least 0.
c
c    Output, integer PYRAMID_NUM, the N-th pyramidal number.
c
      implicit none

      integer n
      integer pyramid_num

      pyramid_num = ( ( n + 1 )**3 - ( n + 1 ) ) / 6

      return
      end
