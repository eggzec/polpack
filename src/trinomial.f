      function trinomial ( i, j, k )

c*********************************************************************72
c
cc TRINOMIAL computes a trinomial coefficient.
c
c  Discussion:
c
c    The trinomial coefficient is a generalization of the binomial
c    coefficient.  It may be interpreted as the number of combinations of
c    N objects, where I objects are of type 1, J of type 2, and K of type 3.
c    and N = I + J + K.
c
c    T(I,J,K) = N! / ( I! J! K! )
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    11 April 2015
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer I, J, K, the factors.
c    All should be nonnegative.
c
c    Output, integer TRINOMIAL, the trinomial coefficient.
c
c     implicit none

      integer i
      integer j
      integer k
      integer l
      integer t
      integer trinomial
      integer value
c
c  Each factor must be nonnegative.
c
      if ( i .lt. 0 .or. j .lt. 0 .or. k .lt. 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'TRINOMIAL - Fatal error!'
        write ( *, '(a)' ) '  Negative factor encountered.'
        stop 1
      end if

      value = 1

      t = 1

      do l = 1, i
c       value = value * t / l
        t = t + 1
      end do

      do l = 1, j
        value = value * t / l
        t = t + 1
      end do

      do l = 1, k
        value = value * t / l
        t = t + 1
      end do
  
      trinomial = value

      return
      end
