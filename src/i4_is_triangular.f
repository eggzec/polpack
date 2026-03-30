      function i4_is_triangular ( i )

c*********************************************************************72
c
cc I4_IS_TRIANGULAR determines whether an integer is triangular.
c
c  Discussion:
c
c    The N-th triangular number is equal to the sum of the first
c    N integers.
c
c  First Values:
c
c    Index  Value
c     0      0
c     1      1
c     2      3
c     3      6
c     4     10
c     5     15
c     6     21
c     7     28
c     8     36
c     9     45
c    10     55
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    19 February 2003
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer I, the integer to be checked.
c
c    Output, logical I4_IS_TRIANGULAR, is TRUE if I is triangular.
c
      implicit none

      integer i
      logical i4_is_triangular
      integer j
      integer k

      if ( i .lt. 0 ) then

        i4_is_triangular = .false.

      else if ( i .eq. 0 ) then

        i4_is_triangular = .true.

      else

        call i4_to_triangle_lower ( i, j, k )

        if ( j .eq. k ) then
          i4_is_triangular = .true.
        else
          i4_is_triangular = .false.
        end if

      end if

      return
      end
