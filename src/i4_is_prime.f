      function i4_is_prime ( n )

c*********************************************************************72
c
cc I4_IS_PRIME reports whether an I4 is prime.
c
c  Discussion:
c
c    A simple, unoptimized sieve of Erasthosthenes is used to
c    check whether N can be divided by any integer between 2
c    and SQRT(N).
c
c    Note that negative numbers, 0 and 1 are not considered prime.
c
c    An I4 is an integer value.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    26 October 2007
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the integer to be tested.
c
c    Output, logical I4_IS_PRIME, is TRUE if N is prime, and FALSE
c    otherwise.
c
      implicit none

      integer i
      logical i4_is_prime
      integer n
      integer nhi

      if ( n .le. 0 ) then
        i4_is_prime = .false.
        return
      end if

      if ( n .eq. 1 ) then
        i4_is_prime = .false.
        return
      end if

      if ( n .le. 3 ) then
        i4_is_prime = .true.
        return
      end if

      nhi = int ( sqrt ( dble ( n ) ) )

      do i = 2, nhi
        if ( mod ( n, i ) .eq. 0 ) then
          i4_is_prime = .false.
          return
        end if
      end do

      i4_is_prime = .true.

      return
      end
