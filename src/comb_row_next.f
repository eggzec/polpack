      subroutine comb_row_next ( n, row )

c*********************************************************************72
c
cc COMB_ROW_NEXT computes the next row of Pascal's triangle.
c
c  Discussion:
c
c    Row N contains the combinatorial coefficients
c
c      C(N,0), C(N,1), C(N,2), ... C(N,N)
c
c    The sum of the elements of row N is equal to 2^N.
c
c    The formula is:
c
c      C(N,K) = N! / ( K! * (N-K)! )
c
c  First terms:
c
c     N K:0  1   2   3   4   5   6   7  8  9 10
c
c     0   1
c     1   1  1
c     2   1  2   1
c     3   1  3   3   1
c     4   1  4   6   4   1
c     5   1  5  10  10   5   1
c     6   1  6  15  20  15   6   1
c     7   1  7  21  35  35  21   7   1
c     8   1  8  28  56  70  56  28   8  1
c     9   1  9  36  84 126 126  84  36  9  1
c    10   1 10  45 120 210 252 210 120 45 10  1
c
c  Recursion:
c
c    C(N,K) = C(N-1,K-1)+C(N-1,K)
c
c  Special values:
c
c    C(N,0) = C(N,N) = 1
c    C(N,1) = C(N,N-1) = N
c    C(N,N-2) = sum ( 1 <= I <= N ) N
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    25 December 2014
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, indicates the desired row.
c
c    Input/output, integer ROW(0:N).  On input, row N-1 is
c    contained in entries 0 through N-1.  On output, row N is contained
c    in entries 0 through N.
c
      implicit none

      integer n

      integer i
      integer row(0:n)

       if ( n .lt. 0 ) then
        return
      end if

      row(n) = 1
      do i = n - 1, 1, -1
        row(i) = row(i) + row(i-1)
      end do
      row(0) = 1

      return
      end
