      subroutine motzkin ( n, a )

c*********************************************************************72
c
cc MOTZKIN returns the Motzkin numbers up to order N.
c
c  Discussion:
c
c    The Motzkin number A(N) counts the number of distinct paths
c    from (0,0) to (0,N) in which the only steps used are
c    (1,1), (1,-1) and (1,0), and the path is never allowed to
c    go below the X axis.
c
c  First values:
c
c     N  A(N)
c
c     0    1
c     1    1
c     2    2
c     3    4
c     4    9
c     5   21
c     6   51
c     7  127
c     8  323
c     9  835
c    10 2188
c
c  Recursion:
c
c    A(N) = A(N-1) + sum ( 0 <= K <= N-2 ) A(K) * A(N-2-K)
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    05 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Eric Weisstein,
c    CRC Concise Encyclopedia of Mathematics,
c    CRC Press, 2002,
c    Second edition,
c    ISBN: 1584883472,
c    LC: QA5.W45
c
c  Parameters:
c
c    Input, integer N, the highest order Motzkin number to compute.
c
c    Output, integer A(0:N), the Motzkin numbers.
c
      implicit none

      integer n

      integer a(0:n)
      integer i
      integer j

      if ( n .lt. 0 ) then
        return
      end if

      a(0) = 1

      do i = 1, n
        a(i) = a(i-1)
        do j = 0, i - 2
          a(i) = a(i) + a(j) * a(i-2-j)
        end do
      end do

      return
      end
