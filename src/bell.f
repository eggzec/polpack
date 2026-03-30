      subroutine bell ( n, b )

c*********************************************************************72
c
cc BELL returns the Bell numbers from 0 to N.
c
c  Discussion:
c
c    The Bell number B(N) is the number of restricted growth functions on N.
c
c    Note that the Stirling numbers of the second kind, S^m_n, count the
c    number of partitions of N objects into M classes, and so it is
c    true that
c
c      B(N) = S^1_N + S^2_N + ... + S^N_N.
c
c    The Bell numbers were named for Eric Temple Bell.
c
c  Definition:
c
c    The Bell number B(N) is defined as the number of partitions (of
c    any size) of a set of N distinguishable objects.
c
c    A partition of a set is a division of the objects of the set into
c    subsets.
c
c  Examples:
c
c    There are 15 partitions of a set of 4 objects:
c
c      (1234),
c      (123) (4),
c      (124) (3),
c      (12) (34),
c      (12) (3) (4),
c      (134) (2),
c      (13) (24),
c      (13) (2) (4),
c      (14) (23),
c      (1) (234),
c      (1) (23) (4),
c      (14) (2) (3),
c      (1) (24) (3),
c      (1) (2) (34),
c      (1) (2) (3) (4).
c
c    and so B(4) = 15.
c
c  First values:
c
c     N         B(N)
c     0           1
c     1           1
c     2           2
c     3           5
c     4          15
c     5          52
c     6         203
c     7         877
c     8        4140
c     9       21147
c    10      115975
c
c  Recursion:
c
c    B(I) = sum ( 1 <= J <=I ) Binomial ( I-1, J-1 ) * B(I-J)
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    01 December 2007
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the number of Bell numbers desired.
c
c    Output, integer B(0:N), the Bell numbers from 0 to N.
c
      implicit none

      integer n

      integer b(0:n)
      integer combo
      integer i
      integer i4_choose
      integer j

      if ( n .lt. 0 ) then
        return
      end if

      b(0) = 1

      do i = 1, n
        b(i) = 0
        do j = 1, i
          combo = i4_choose ( i-1, j-1 )
          b(i) = b(i) + combo * b(i-j)
        end do
      end do

      return
      end
