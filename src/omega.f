      subroutine omega ( n, ndiv )

c*********************************************************************72
c
cc OMEGA returns OMEGA(N), the number of distinct prime divisors of N.
c
c  Discussion:
c
c    If N = 1, then
c
c      OMEGA(N) = 1
c
c    else if the prime factorization of N is
c
c      N = P1^E1 * P2^E2 * ... * PM^EM,
c
c    then
c
c      OMEGA(N) = M
c
c  Example:
c
c     N   OMEGA(N)
c
c     1    1
c     2    1
c     3    1
c     4    1
c     5    1
c     6    2
c     7    1
c     8    1
c     9    1
c    10    2
c    11    1
c    12    2
c    13    1
c    14    2
c    15    2
c    16    1
c    17    1
c    18    2
c    19    1
c    20    2
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    05 July 2008
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
c    Output, integer NDIV, the value of OMEGA(N).  But if N is 0 or
c    less, NDIV is returned as 0, a nonsense value.  If there is
c    not enough room for factoring, NDIV is returned as -1.
c
      implicit none

      integer maxfactor
      parameter ( maxfactor = 20 )

      integer factor(maxfactor)
      integer n
      integer ndiv
      integer nfactor
      integer nleft
      integer power(maxfactor)

      if ( n .le. 0 ) then
        ndiv = 0
        return
      end if

      if ( n .eq. 1 ) then
        ndiv = 1
        return
      end if
c
c  Factor N.
c
      call i4_factor ( n, maxfactor, nfactor, factor, power, nleft )

      if ( nleft .ne. 1 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'OMEGA - Fatal error!'
        write ( *, '(a)' ) '  Not enough factorization space.'
        ndiv = -1
        return
      end if

      ndiv = nfactor

      return
      end
