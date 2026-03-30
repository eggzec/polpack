      subroutine commul ( n, nfactor, factor, ncomb )

c*********************************************************************72
c
cc COMMUL computes a multinomial combinatorial coefficient.
c
c  Discussion:
c
c    The multinomial coefficient is a generalization of the binomial
c    coefficient.  It may be interpreted as the number of combinations of
c    N objects, where FACTOR(1) objects are indistinguishable of type 1,
c    ... and FACTOR(K) are indistinguishable of type NFACTOR.
c
c    The formula is:
c
c      NCOMB = N! / ( FACTOR(1)! FACTOR(2)! ... FACTOR(NFACTOR)! )
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    07 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, determines the numerator.
c
c    Input, integer NFACTOR, the number of factors in the 
c    numerator.
c
c    Input, integer FACTOR(NFACTOR).
c    FACTOR contains the NFACTOR values used in the denominator.
c    Note that the sum of these entries should be N,
c    and that all entries should be nonnegative.
c
c    Output, integer NCOMB, the value of the multinomial 
c    coefficient.
c
      implicit none

      integer nfactor

      double precision arg
      double precision fack
      double precision facn
      integer factor(nfactor)
      integer i
      integer isum
      integer j
      integer n
      integer ncomb
      double precision r8_gamma_log

      if ( nfactor .lt. 1 ) then
        ncomb = 1
        return
      end if

      do i = 1, nfactor

        if ( factor(i) .lt. 0 ) then
          write ( *, '(a)' ) ' '
          write ( *, '(a)' ) 'COMMUL - Fatal error!'
          write ( *, '(a,i8,a,i8)' ) 
     &      '  Entry ', I, ' of FACTOR = ', factor(i)
          write ( *, '(a)' ) '  But this value must be nonnegative.'
          stop 1
        end if

      end do
 
      isum = 0
      do j = 1, nfactor
        isum = isum + factor(j)
      end do

      if ( isum .ne. n ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'COMMUL - Fatal error!'
        write ( *, '(a,i8)' ) 
     &    '  The sum of the FACTOR entries is ', isum
        write ( *, '(a,i8)' ) '  But it must equal N = ', n
        stop 1
      end if
 
      arg = dble ( n + 1 )
      facn = r8_gamma_log ( arg )
 
      do i = 1, nfactor
 
        arg = dble ( factor(i) + 1 )
        fack = r8_gamma_log ( arg )
        facn = facn - fack
 
      end do
 
      ncomb = nint ( exp ( facn ) )
 
      return
      end
