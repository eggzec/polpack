      subroutine catalan_row_next ( ido, n, irow )

c*********************************************************************72
c
cc CATALAN_ROW_NEXT computes row N of Catalan's triangle.
c
c  Example:
c
c    I\J 0   1   2   3   4   5   6
c
c    0   1
c    1   1   1
c    2   1   2   2
c    3   1   3   5   5
c    4   1   4   9  14  14
c    5   1   5  14  28  42  42
c    6   1   6  20  48  90 132 132
c
c  Recursion:
c
c    C(0,0) = 1
c    C(I,0) = 1
c    C(I,J) = 0 for I .lt. J
c    C(I,J) = C(I,J-1) + C(I-1,J)
c    C(I,I) is the I-th Catalan number.
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
c    Input, integer IDO, indicates whether this is a call for
c    the 'next' row of the triangle.
c    IDO = 0, this is a startup call.  Row N is desired, but
c    presumably this is a first call, or row N-1 was not computed
c    on the previous call.
c    IDO = 1, this is not the first call, and row N-1 was computed
c    on the previous call.  In this case, much work can be saved
c    by using the information from the previous values of IROW
c    to build the next values.
c
c    Input, integer N, the index of the row of the triangle 
c    desired.  
c
c    Input/output, integer IROW(0:N), the row of coefficients.
c    If IDO = 0, then IROW is not required to be set on input.
c    If IDO = 1, then IROW must be set on input to the value of
c    row N-1.
c
      implicit none

      integer n

      integer i
      integer ido
      integer irow(0:n)
      integer j

      if ( n .lt. 0 ) then
        return
      end if

      if ( ido .eq. 0 ) then
     
        irow(0) = 1
        do i = 1, n
          irow(i) = 0
        end do
     
        do i = 1, n

          irow(0) = 1

          do j = 1, i - 1
            irow(j) = irow(j) + irow(j-1)
          end do

          irow(i) = irow(i-1)

        end do
     
      else
     
        irow(0) = 1

        do j = 1, n - 1
          irow(j) = irow(j) + irow(j-1)
        end do

        if ( 1 .le. n ) then
          irow(n) = irow(n-1)
        end if
     
      end if
     
      return
      end
