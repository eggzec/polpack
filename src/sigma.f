      subroutine sigma ( n, sigma_n )

c*********************************************************************72
c
cc SIGMA returns the value of SIGMA(N), the divisor sum.
c
c  Discussion:
c
c    SIGMA(N) is the sum of the distinct divisors of N, including 1 and N.
c
c    The formula is:
c
c      SIGMA(U*V) = SIGMA(U) * SIGMA(V) if U and V are relatively prime.
c
c      SIGMA(P^K) = ( P^(K+1) - 1 ) / ( P - 1 ) if P is prime.
c
c  Example:
c
c     N  SIGMA(N)
c
c     1    1
c     2    3
c     3    4
c     4    7
c     5    6
c     6   12
c     7    8
c     8   15
c     9   13
c    10   18
c    11   12
c    12   28
c    13   14
c    14   24
c    15   24
c    16   31
c    17   18
c    18   39
c    19   20
c    20   42
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    12 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the value to be analyzed.
c
c    Output, integer SIGMA_N, the value of SIGMA(N).  If N is
c    less than or equal to 0, SIGMA_N will be returned as 0.  If there is not
c    enough room for factoring N, SIGMA_N is returned as -1.
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
      integer sigma_n

      if ( n .le. 0 ) then
        sigma_n = 0
        return
      end if

      if ( n .eq. 1 ) then
        sigma_n = 1
        return
      end if
!
!  Factor N.
!
      call i4_factor ( n, maxfactor, nfactor, factor, power, nleft )

      if ( nleft .ne. 1 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'SIGMA - Fatal error!'
        write ( *, '(a)' ) '  Not enough factorization space.'
        sigma_n = -1
        return
      end if

      sigma_n = 1
      do i = 1, nfactor
        sigma_n = ( sigma_n * ( factor(i)**( power(i) + 1 ) - 1 ) ) 
     &    / ( factor(i) - 1 )
      end do

      return
      end
