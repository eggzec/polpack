      subroutine partition_distinct_count_values ( n_data, n, c )

c*********************************************************************72
c
cc PARTITION_DISTINCT_COUNT_VALUES returns some values of Q(N).
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
c    be distinct, so that no nonzero summand occurs more than once,
c    we are computing something symbolized by Q(N).
c    The number 5 has Q(N) = 3, because it has the following partitions
c    into distinct parts:
c
c    5 = 5
c      = 4 + 1
c      = 3 + 2
c
c    In Mathematica, the function can be evaluated by
c
c      PartitionsQ[n]
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    25 March 2007
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
c    Stephen Wolfram,
c    The Mathematica Book,
c    Fourth Edition,
c    Cambridge University Press, 1999,
c    ISBN: 0-521-64314-7,
c    LC: QA76.95.W65.
c
c  Parameters:
c
c    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
c    first call.  On each call, the routine increments N_DATA by 1, and
c    returns the corresponding data; when there is no more data, the
c    output value of N_DATA will be 0 again.
c
c    Output, integer N, the integer.
c
c    Output, integer C, the number of partitions of the integer
c    into distinct parts.
c
      implicit none

      integer n_max
      parameter ( n_max = 21 )

      integer c
      integer c_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)

      save c_vec
      save n_vec

      data c_vec /
     &    1,
     &    1,   1,   2,   2,   3,   4,   5,   6,   8,  10,
     &   12,  15,  18,  22,  27,  32,  38,  46,  54,  64 /
      data n_vec /
     &   0,
     &   1,  2,  3,  4,  5,  6,  7,  8,  9, 10,
     &  11, 12, 13, 14, 15, 16, 17, 18, 19, 20 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        c = 0
      else
        n = n_vec(n_data)
        c = c_vec(n_data)
      end if

      return
      end
