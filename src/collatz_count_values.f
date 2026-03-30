      subroutine collatz_count_values ( n_data, n, count )

c*********************************************************************72
c
cc COLLATZ_COUNT_VALUES returns some values of the Collatz count function.
c
c  Discussion:
c
c    The rules for generation of the Collatz sequence are recursive.
c    If T is the current entry of the sequence, (T is
c    assumed to be a positive integer), then the next
c    entry, U is determined as follows:
c
c      if T is 1 (or less)
c        terminate the sequence;
c      else if T is even
c        U = T/2.
c      else (if T is odd and not 1)
c        U = 3*T+1;
c
c    The Collatz count is the length of the Collatz sequence for a given
c    starting value.  By convention, we include the initial value in the
c    count, so the minimum value of the count is 1.
c
c     N  Sequence                                                 Count
c
c     1                                                               1
c     2   1                                                           2
c     3  10,  5, 16,  8,  4,  2,  1                                   8
c     4   2   1                                                       3
c     5  16,  8,  4,  2,  1                                           6
c     6   3, 10,  5, 16,  8,  4,  2,  1                               9
c     7  22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1   17
c     8   4,  2,  1                                                   4
c     9  28, 14,  7, ...                                             20
c    10   5, 16,  8,  4,  2,  1                                       7
c    11  34, 17, 52, 26, 13, 40, 20, 10,  5, 16, 8, 4, 2, 1          15
c    12   6,  3, 10,  5, 16,  8,  4,  2,  1                          10
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    07 March 2006
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Eric Weisstein,
c    "The Collatz Problem",
c    CRC Concise Encyclopedia of Mathematics,
c    CRC 1998.
c
c  Parameters:
c
c    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
c    first call.  On each call, the routine increments N_DATA by 1, and
c    returns the corresponding data; when there is no more data, the
c    output value of N_DATA will be 0 again.
c
c    Output, integer N, the initial value of a Collatz sequence.
c
c    Output, integer COUNT, the length of the Collatz sequence starting
c    with N.
c
      implicit none

      integer n_max
      parameter ( n_max = 20 )

      integer count
      integer count_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)

      save count_vec
      save n_vec

      data count_vec /
     &     1,   2,   8,   3,   6,   9,   17,   4,  20,   7,
     &  112,  25,  26,  27,  17,  28,  111,  18,  83,  29 /
      data n_vec /
     &    1,   2,   3,   4,   5,   6,   7,   8,   9,  10,
     &   27,  50, 100, 200, 300, 400, 500, 600, 700, 800 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        count = 0
      else
        n = n_vec(n_data)
        count = count_vec(n_data)
      end if

      return
      end
