      function plane_partition_num ( n )

c*********************************************************************72
c
cc PLANE_PARTITION_NUM returns the number of plane partitions of the integer N.
c
c  Discussion:
c
c    A plane partition of a positive integer N is a partition of N in which
c    the parts have been arranged in a 2D array that is nonincreasing across
c    rows and columns.  There are six plane partitions of 3:
c
c      3   2 1   2   1 1 1   1 1   1
c                1           1     1
c                                  1
c
c  First Values:
c
c     N PP(N)
c     0    1
c     1    1
c     2    3
c     3    6
c     4   13
c     5   24
c     6   48
c     7   86
c     8  160
c     9  282
c    10  500
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    27 April 2014
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Frank Olver, Daniel Lozier, Ronald Boisvert, Charles Clark,
c    NIST Handbook of Mathematical Functions,
c    Cambridge University Press, 2010,
c    ISBN: 978-0521140638,
c    LC: QA331.N57.
c    
c  Parameters:
c
c    Input, integer N, the number, which must be at least 0.
c
c    Output, integer PLANE_PARTITION_NUM, the number of 
c    plane partitions of N.
c
      implicit none

      integer n

      integer j
      integer k
      integer nn
      integer plane_partition_num
      integer pp(0:n)
      integer s2

      if ( n .lt. 0 ) then
        write ( *, '(a)' ) ''
        write ( *, '(a)' ) 'PLANE_PARTITION_NUM - Fatal error!'
        write ( *, '(a)' ) '  0 <= N is required.'
        stop 1
      end if

      nn = 0
      pp(nn) = 1

      nn = 1
      if ( nn .le. n ) then
        pp(nn) = 1
      end if

      do nn = 2, n
        pp(nn) = 0
        do j = 1, nn
          s2 = 0
          do k = 1, j
            if ( mod ( j, k ) .eq. 0 ) then
              s2 = s2 + k * k
            end if
          end do
          pp(nn) = pp(nn) + pp(nn-j) * s2
        end do
        pp(nn) = pp(nn) / nn
      end do

      plane_partition_num = pp(n)

      return
      end
