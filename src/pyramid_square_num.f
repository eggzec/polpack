      function pyramid_square_num ( n )

c*********************************************************************72
c
cc PYRAMID_SQUARE_NUM returns the N-th pyramidal square number.
c
c  Discussion:
c
c    The N-th pyramidal square number PS(N) is formed by the sum of the first
c    N squares S:
c
c      S(I) = I^2
c
c      PS(N) = sum ( 1 <= I <= N ) S(I)
c
c    By convention, PS(0) = 0.
c
c    The formula is:
c
c      PS(N) = ( N * ( N + 1 ) * ( 2*N+1 ) ) / 6
c
c    Note that geometrically, this pyramid will have a square base.
c
c  Example:
c
c    0    0
c    1    1
c    2    5
c    3   14
c    4   30
c    5   55
c    6   91
c    7  140
c    8  204
c    9  285
c   10  385
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    14 August 2014
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the index.
c    0 <= N.
c
c    Output, integer PYRAMID_SQUARE_NUM, the N-th 
c    pyramid square number.
c
      implicit none

      integer n
      integer pyramid_square_num

      pyramid_square_num = ( n * ( n + 1 ) * ( 2 * n + 1 ) ) / 6

      return
      end
