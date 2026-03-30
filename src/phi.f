      subroutine phi ( n, phin )

c*********************************************************************72
c
cc PHI computes the number of relatively prime predecessors of an integer.
c
c  Discussion:
c
c    PHI(N) is the number of integers between 1 and N which are
c    relatively prime to N.  I and J are relatively prime if they
c    have no common factors.  The function PHI(N) is known as
c    "Euler's totient function".
c
c    By convention, 1 and N are relatively prime.
c
c    The formula is:
c
c      PHI(U*V) = PHI(U) * PHI(V) if U and V are relatively prime.
c
c      PHI(P**K) = P**(K-1) * ( P - 1 ) if P is prime.
c
c      PHI(N) = N * Product ( P divides N ) ( 1 - 1 / P )
c
c      N = Sum ( D divides N ) PHI(D).
c
c  Example:
c
c     N  PHI(N)
c
c     1    1
c     2    1
c     3    2
c     4    2
c     5    4
c     6    2
c     7    6
c     8    4
c     9    6
c    10    4
c    11   10
c    12    4
c    13   12
c    14    6
c    15    8
c    16    8
c    17   16
c    18    6
c    19   18
c    20    8
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    11 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the value to be analyzed.
c
c    Output, integer PHIN, the value of PHI(N).  If N is less than
c    or equal to 0, PHI will be returned as 0.  If there is not enough
c    room for full factoring of N, PHI will be returned as -1.
c
      implicit none

      integer maxfactor
      parameter ( maxfactor = 20 )

      integer factor(maxfactor)
      integer i
      integer n
      integer nfactor
      integer nleft
      integer phin
      integer power(maxfactor)

      if ( n .le. 0 ) then
        phin = 0
        return
      end if

      if ( n .eq. 1 ) then
        phin = 1
        return
      end if
c
c  Factor N.
c
      call i4_factor ( n, maxfactor, nfactor, factor, power, nleft )

      if ( nleft .ne. 1 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'PHI - Fatal error!'
        write ( *, '(a)' ) '  Not enough factorization space!'
        phin = -1
        return
      end if

      phin = 1
      do i = 1, nfactor
        phin = phin * factor(i)**( power(i) - 1 ) * ( factor(i) - 1 )
      end do

      return
      end
