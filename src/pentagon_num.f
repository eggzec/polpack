      subroutine pentagon_num ( n, p )

c*********************************************************************72
c
cc PENTAGON_NUM computes the N-th pentagonal number.
c
c  Discussion:
c
c    The pentagonal number P(N) counts the number of dots in a figure of
c    N nested pentagons.  The pentagonal numbers are defined for both
c    positive and negative N.
c
c    The formula is:
c
c      P(N) = ( N * ( 3 * N - 1 ) ) / 2
c
c  Example:
c
c    N   P
c
c   -5  40
c   -4  26
c   -3  15
c   -2   7
c   -1   2
c    0   0
c    1   1
c    2   5
c    3  12
c    4  22
c    5  35
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
c    Input, integer N, the index of the pentagonal number desired.
c
c    Output, integer P, the value of the N-th pentagonal number.
c
      implicit none

      integer n
      integer p

      p = ( n * ( 3 * n - 1 ) ) / 2

      return
      end
