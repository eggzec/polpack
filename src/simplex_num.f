      function simplex_num ( m, n )

c*********************************************************************72
c
cc SIMPLEX_NUM evaluates the N-th Simplex number in M dimensions.
c
c  Discussion:
c
c     N\M: 1    2    3    4    5
c    --   --   --   --   --   --
c     0    0    0    0    0    0
c     1    1    1    1    1    1
c     2    2    3    4    5    6
c     3    3    6   10   15   21
c     4    4   10   20   35   56
c     5    5   15   35   70  126
c     6    6   21   56  126  252
c     7    7   28   84  210  462
c     8    8   36  120  330  792
c     9    9   45  165  495 1287
c    10   10   55  220  715 2002
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    26 February 2015
c
c  Author:
c
c    John Burkardt
c
c  Parameters
c
c    Input, integer M, the spatial dimension.
c
c    Input, integer N, the index of the number.
c
c    Output, integer SIMPLEX_NUM, the desired value.
c
      implicit none

      integer i
      integer m
      integer n
      integer simplex_num
      integer value
  
      value = 1
      do i = 1, m
        value = ( value * ( n + i - 1 ) ) / i
      end do

      simplex_num = value

      return
      end
