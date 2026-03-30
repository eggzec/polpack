      subroutine i4_partition_distinct_count ( n, q )

c*********************************************************************72
c
cc I4_PARTITION_DISTINCT_COUNT returns any value of Q(N).
c
c  Discussion:
c
c    A partition of an integer N is a representation of the integer
c    as the sum of nonzero positive integers.  The order of the summands
c    does not matter.  The number of partitions of N is symbolized
c    by P(N).  Thus, the number 5 has P(N) = 7, because it has the 
c    following partitions:
c
c    5 = 5
c      = 4 + 1 
c      = 3 + 2 
c      = 3 + 1 + 1 
c      = 2 + 2 + 1 
c      = 2 + 1 + 1 + 1 
c      = 1 + 1 + 1 + 1 + 1
c
c    However, if we require that each member of the partition
c    be distinct, we are computing something symbolized by Q(N).
c    The number 5 has Q(N) = 3, because it has the following partitions 
c    into distinct parts:
c
c    5 = 5
c      = 4 + 1 
c      = 3 + 2 
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
c  Reference:
c
c    Milton Abramowitz, Irene Stegun,
c    Handbook of Mathematical Functions,
c    National Bureau of Standards, 1964,
c    ISBN: 0-486-61272-4,
c    LC: QA47.A34.
c
c  Parameters:
c
c    Input, integer N, the integer to be partitioned.
c
c    Output, integer Q, the number of partitions of the integer
c    into distinct parts.
c
      implicit none

      integer n

      integer c(0:n)
      integer i
      logical i4_is_triangular
      integer k
      integer k2
      integer k_sign
      integer q

      c(0) = 1

      do i = 1, n

        if ( i4_is_triangular ( i ) ) then
          c(i) = 1
        else
          c(i) = 0
        end if

        k = 0
        k_sign = -1

10      continue

          k = k + 1
          k_sign = - k_sign
          k2 = k * ( 3 * k + 1 )

          if ( i .lt. k2 ) then
            go to 20
          end if

          c(i) = c(i) + k_sign * c(i-k2)

        go to 10

20      continue

        k = 0
        k_sign = -1

30      continue

          k = k + 1
          k_sign = - k_sign
          k2 = k * ( 3 * k - 1 )

          if ( i .lt. k2 ) then
            go to 40
          end if

          c(i) = c(i) + k_sign * c(i-k2)

        go to 30

40      continue

      end do

      q = c(n)

      return
      end
