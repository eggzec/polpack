      subroutine triangle_upper_to_i4 ( i, j, k )

c*********************************************************************72
c
cc TRIANGLE_UPPER_TO_I4 converts an upper triangular coordinate to an integer.
c
c  Discussion:
c
c    Triangular coordinates are handy when storing a naturally triangular
c    array (such as the upper half of a matrix) in a linear array.
c
c    Thus, for example, we might consider storing 
c
c    (1,1) (1,2) (1,3) (1,4)
c          (2,2) (2,3) (2,4)
c                (3,3) (3,4)
c                      (4,4)
c
c    as the linear array
c
c    (1,1) (1,2) (2,2) (1,3) (2,3) (3,3) (1,4) (2,4) (3,4) (4,4)    
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
c      K = I + ( (J-1) * J ) / 2
c
c  First Values:
c
c     I  J  K
c
c     0  0  0
c     1  1  1
c     1  2  2
c     2  2  3
c     1  3  4
c     2  3  5
c     3  3  6
c     1  4  7
c     2  4  8
c     3  4  9
c     4  4 10
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    22 March 2017
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer I, J, the row and column indices.  I and J must
c    be nonnegative, and I must not be greater than J.
c
c    Output, integer K, the linear index of the (I,J) element.
c
      implicit none

      integer i
      integer j
      integer k

      if ( i .lt. 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'TRIANGLE_UPPER_TO_I4 - Fatal error!'
        write ( *, '(a)' ) '  I < 0.'
        write ( *, '(a,i8)' ) '  I = ', i
        stop 1
      else if ( j .lt. 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'TRIANGLE_UPPER_TO_I4 - Fatal error!'
        write ( *, '(a)' ) '  J < 0.'
        write ( *, '(a,i8)' ) '  J = ', j
        stop 1
      else if ( j .lt. i ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'TRIANGLE_UPPER_TO_I4 - Fatal error!'
        write ( *, '(a)' ) '  J < I.'
        write ( *, '(a,i8)' ) '  I = ', i
        write ( *, '(a,i8)' ) '  J = ', j
        stop 1
      end if

      k = i + ( ( j - 1 ) * j ) / 2

      return
      end
