      function collatz_count ( n )

c*****************************************************************************80
c
cc COLLATZ_COUNT counts the number of terms in a Collatz sequence.
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
c     N  Sequence                                                Length
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
c    03 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Eric Weisstein,
c    CRC Concise Encyclopedia of Mathematics,
c    CRC Press, 2002,
c    Second edition,
c    ISBN: 1584883472,
c    LC: QA5.W45
c
c  Parameters:
c
c    Input, integer N, the first element of the sequence.
c
c    Output, integer COLLATZ_COUNT, the number of elements in
c    the Collatz sequence that begins with N.
c
      implicit none

      integer collatz_count
      integer count
      integer n
      integer n_local

      count = 1
      n_local = n

10    continue

        if ( n_local .le. 1 ) then
          go to 20
        else if ( mod ( n_local, 2 ) == 0 ) then
          n_local = n_local / 2
        else
          n_local = 3 * n_local + 1
        end if

        count = count + 1

      go to 10

20    continue

      collatz_count = count
 
      return
      end
