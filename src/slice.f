      subroutine slice ( dim_num, slice_num, piece_num )

c*********************************************************************72
c
cc SLICE: maximum number of pieces created by a given number of slices.
c
c  Discussion:
c
c    If we imagine slicing a pizza, each slice produce more pieces.  
c    The position of the slice affects the number of pieces created, but there
c    is a maximum.  
c
c    This function determines the maximum number of pieces created by a given
c    number of slices, applied to a space of a given dimension.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    12 August 2011
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Robert Banks,
c    Slicing Pizzas, Racing Turtles, and Further Adventures in 
c    Applied Mathematics,
c    Princeton, 1999,
c    ISBN13: 9780691059471,
c    LC: QA93.B358.
c
c  Parameters:
c
c    Input, integer DIM_NUM, the spatial dimension.
c
c    Input, integer SLICE_NUM, the number of slices.
c
c    Input, integer PIECE_NUM, the maximum number of pieces that can
c    be created by the given number of slices applied in the given dimension.
c
      implicit none

      integer dim_num
      integer i4_choose
      integer j
      integer piece_num
      integer slice_num

      piece_num = 0
      do j = 0, min ( dim_num, slice_num )
        piece_num = piece_num + i4_choose ( slice_num, j )
      end do

      return
      end
