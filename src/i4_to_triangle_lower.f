      subroutine i4_to_triangle_lower ( k, i, j )

c*********************************************************************72
c
cc I4_TO_TRIANGLE_LOWER converts an integer to lower triangular coordinates.
c
c  Discussion:
c
c    Triangular coordinates are handy when storing a naturally triangular
c    array (such as the lower half of a matrix) in a linear array.
c
c    Thus, for example, we might consider storing 
c
c    (1,1)
c    (2,1) (2,2)
c    (3,1) (3,2) (3,3)
c    (4,1) (4,2) (4,3) (4,4)
c
c    as the linear array
c
c    (1,1) (2,1) (2,2) (3,1) (3,2) (3,3) (4,1) (4,2) (4,3) (4,4)    
c
c    Here, the quantities in parenthesis represent the natural row and
c    column indices of a single number when stored in a rectangular array.
c
c    In this routine, we are given the location K of an item in the 
c    linear array, and wish to determine the row I and column J
c    of the item when stored in the triangular array.
c 
c  First Values:
c
c     K  I  J
c
c     0  0  0
c     1  1  1
c     2  2  1
c     3  2  2
c     4  3  1
c     5  3  2
c     6  3  3
c     7  4  1
c     8  4  2
c     9  4  3
c    10  4  4
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    03 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer K, the linear index of the (I,J) element, 
c    which must be nonnegative.
c
c    Output, integer I, J, the row and column indices.
c
      implicit none

      integer i
      integer j
      integer k

      if ( k .lt. 0 ) then

        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'I4_TO_TRIANGLE_LOWER - Fatal error!'
        write ( *, '(a)' ) '  K < 0.'
        write ( *, '(a,i8)' ) '  K = ', k
        stop 1
  
      else if ( k .eq. 0 ) then

        i = 0
        j = 0
        return

      end if

      i = int ( sqrt ( dble ( 2 * k ) ) )

      if ( i * i + i .lt. 2 * k ) then
        i = i + 1
      end if

      j = k - ( i * ( i - 1 ) ) / 2

      return
      end
