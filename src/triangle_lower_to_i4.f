      subroutine triangle_lower_to_i4 ( i, j, k )

c*********************************************************************72
c
cc TRIANGLE_LOWER_TO_I4 converts a lower triangular coordinate to an integer.
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
c    Thus, our goal is, given the row I and column J of the data,
c    to produce the value K which indicates its position in the linear
c    array.
c
c    The triangular numbers are the indices associated with the
c    diagonal elements of the original array, T(1,1), T(2,2), T(3,3)
c    and so on.
c
c    The formula is:
c
c      K = J + ( (I-1) * I ) / 2
c
c  First Values:
c
c     I  J  K
c
c     0  0  0
c     1  1  1
c     2  1  2
c     2  2  3
c     3  1  4
c     3  2  5
c     3  3  6
c     4  1  7
c     4  2  8
c     4  3  9
c     4  4 10
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    04 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer I, J, the row and column indices.  I and J must
c    be nonnegative, and J must not be greater than I.
c
c    Output, integer K, the linear index of the (I,J) element.
c
      implicit none

      integer i
      integer j
      integer k

      if ( i .lt. 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'TRIANGLE_LOWER_TO_I4 - Fatal error!'
        write ( *, '(a)' ) '  I < 0.'
        write ( *, '(a,i8)' ) '  I = ', i
        stop 1
      else if ( j .lt. 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'TRIANGLE_LOWER_TO_I4 - Fatal error!'
        write ( *, '(a)' ) '  J < 0.'
        write ( *, '(a,i8)' ) '  J = ', j
        stop 1
      else if ( i .lt. j ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'TRIANGLE_LOWER_TO_I4 - Fatal error!'
        write ( *, '(a)' ) '  I < J.'
        write ( *, '(a,i8)' ) '  I = ', i
        write ( *, '(a,i8)' ) '  J = ', j
        stop 1
      end if

      k = j + ( ( i - 1 ) * i ) / 2

      return
      end
