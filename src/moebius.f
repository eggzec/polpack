      subroutine moebius ( n, mu )

c*********************************************************************72
c
cc MOEBIUS returns the value of MU(N), the Moebius function of N.
c
c  Discussion:
c
c    MU(N) is defined as follows:
c
c      MU(N) = 1 if N = 1;
c              0 if N is divisible by the square of a prime;
c              (-1)**K, if N is the product of K distinct primes.
c
c    As special cases, MU(N) is -1 if N is a prime, and MU(N) is 0
c    if N is a square, cube, etc.
c
c    The Moebius function MU(D) is related to Euler's totient 
c    function PHI(N):
c
c      PHI(N) = sum ( D divides N ) MU(D) * ( N / D ).
c
c  First values:
c
c     N  MU(N)
c
c     1    1
c     2   -1
c     3   -1
c     4    0
c     5   -1
c     6    1
c     7   -1
c     8    0
c     9    0
c    10    1
c    11   -1
c    12    0
c    13   -1
c    14    1
c    15    1
c    16    0
c    17   -1
c    18    0
c    19   -1
c    20    0
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    20 January 2007
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the value to be analyzed.
c
c    Output, integer MU, the value of MU(N).
c    If N is less than or equal to 0, MU will be returned as -2.
c    If there was not enough internal space for factoring, MU
c    is returned as -3.
c
      implicit none

      integer maxfactor
      parameter ( maxfactor = 20 )

      integer exponent(maxfactor)
      integer factor(maxfactor)
      integer i
      integer mu
      integer n
      integer nfactor
      integer nleft

      if ( n .le. 0 ) then
        mu = -2
        return
      end if

      if ( n .eq. 1 ) then
        mu = 1
        return
      end if
c
c  Factor N.
c
      call i4_factor ( n, maxfactor, nfactor, factor, exponent, nleft )

      if ( nleft .ne. 1 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'MOEBIUS - Fatal error!'
        write ( *, '(a)' ) '  Not enough factorization space.'
        mu = -3
        return
      end if

      mu = 1

      do i = 1, nfactor

        mu = -mu

        if ( 1 .lt. exponent(i) ) then
          mu = 0
          return
        end if

      end do

      return
      end
