      subroutine i4_factor ( n, factor_max, factor_num, factor, power, 
     &  nleft )

c*********************************************************************72
c
cc I4_FACTOR factors an I4 into prime factors.
c
c  Discussion:
c
c    The formula used is:
c
c      N = NLEFT * product ( 1 <= I <= FACTOR_NUM ) FACTOR(I)**POWER(I).
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    23 January 2007
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the integer to be factored.  N may be positive,
c    negative, or 0.
c
c    Input, integer FACTOR_MAX, the maximum number of prime factors for
c    which storage has been allocated.
c
c    Output, integer FACTOR_NUM, the number of prime factors of N discovered
c    by the routine.
c
c    Output, integer FACTOR(FACTOR_MAX), the prime factors of N.
c
c    Output, integer POWER(FACTOR_MAX).  POWER(I) is the power of
c    the FACTOR(I) in the representation of N.
c
c    Output, integer NLEFT, the factor of N that the routine could not
c    divide out.  If NLEFT is 1, then N has been completely factored.
c    Otherwise, NLEFT represents factors of N involving large primes.
c
      implicit none

      integer factor_max

      integer factor(factor_max)
      integer factor_num
      integer i
      integer n
      integer nleft
      integer p
      integer power(factor_max)
      integer prime
      integer prime_max

      factor_num = 0

      do i = 1, factor_max
        factor(i) = 0
      end do

      do i = 1, factor_max
        power(i) = 0
      end do

      nleft = n

      if ( n .eq. 0 ) then
        return
      end if

      if ( abs ( n ) .eq. 1 ) then
        factor_num = 1
        factor(1) = 1
        power(1) = 1
        return
      end if
c
c  Find out how many primes we stored.
c
      prime_max = prime ( -1 )
c
c  Try dividing the remainder by each prime.
c
      do i = 1, prime_max

        p = prime ( i )

        if ( mod ( abs ( nleft ), p ) .eq. 0 ) then
    
          if ( factor_num .lt. factor_max ) then

            factor_num = factor_num + 1
            factor(factor_num) = p
            power(factor_num) = 0

10          continue

              power(factor_num) = power(factor_num) + 1
              nleft = nleft / p

              if ( mod ( abs ( nleft ), p ) .ne. 0 ) then
                go to 20
              end if

            go to 10

20          continue

            if ( abs ( nleft ) .eq. 1 ) then
              go to 30
            end if

          end if

        end if

      end do

30    continue

      return
      end
