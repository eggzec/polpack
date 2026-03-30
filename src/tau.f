      subroutine tau ( n, taun )

c*********************************************************************72
c
cc TAU returns the value of TAU(N), the number of distinct divisors of N.
c
c  Discussion:
c
c    TAU(N) is the number of distinct divisors of N, including 1 and N.
c
c    If the prime factorization of N is
c
c      N = P1^E1 * P2^E2 * ... * PM^EM,
c
c    then
c
c      TAU(N) = ( E1 + 1 ) * ( E2 + 1 ) * ... * ( EM + 1 ).
c
c    One consequence of this fact is that TAU is odd if and only
c    if N is a perfect square.
c
c  First values:
c
c     N   TAU(N)
c
c     1    1
c     2    2
c     3    2
c     4    3
c     5    2
c     6    4
c     7    2
c     8    4
c     9    3
c    10    4
c    11    2
c    12    6
c    13    2
c    14    4
c    15    4
c    16    5
c    17    2
c    18    6
c    19    2
c    20    6
c    21    4
c    22    4
c    23    2
c    24    8
c    25    3
c    26    4
c    27    4
c    28    6
c    29    2
c    30    8
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
c  Parameters:
c
c    Input, integer N, the value to be analyzed.  N must be 1 or
c    greater.
c
c    Output, integer TAUN, the value of TAU(N).  But if N is 0 or
c    less, TAUN is returned as 0, a nonsense value.  If there is
c    not enough room for factoring, TAUN is returned as -1.
c
      implicit none

      integer maxfactor
      parameter ( maxfactor = 20 )

      integer factor(maxfactor)
      integer i
      integer n
      integer nfactor
      integer nleft
      integer power(maxfactor)
      integer taun

      if ( n .le. 0 ) then
        taun = 0
        return
      end if

      if ( n .eq. 1 ) then
        taun = 1
        return
      end if
c
c  Factor N.
c
      call i4_factor ( n, maxfactor, nfactor, factor, power, nleft )

      if ( nleft .ne. 1 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'TAU - Fatal error!'
        write ( *, '(a)' ) '  Not enough factorization space.'
        taun = -1
        return
      end if

      taun = 1
      do i = 1, nfactor
        taun = taun * ( power(i) + 1 )
      end do

      return
      end
