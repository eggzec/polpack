      subroutine delannoy ( m, n, a )

c*********************************************************************72
c
cc DELANNOY returns the Delannoy numbers up to orders (M,N).
c
c  Discussion:
c
c    The Delannoy number A(M,N) counts the number of distinct paths
c    from (0,0) to (M,N) in which the only steps used are
c    (1,1), (1,0) and (0,1).
c
c  First values:
c
c      \N 0  1   2   3    4     5     6      7      8
c     M-+--------------------------------------------
c     0 | 1  1   1   1    1     1     1      1      1
c     1 | 1  3   5   7    9    11    13     15     17
c     2 | 1  5  13  25   41    61    85    113    145
c     3 | 1  7  25  63  129   231   377    575    833
c     4 | 1  9  41 129  321   681  1289   2241   3649
c     5 | 1 11  61 231  681  1683  3653   7183  13073
c     6 | 1 13  85 377 1289  3653  8989  19825  40081
c     7 | 1 15 113 575 2241  7183 19825  48639 108545
c     8 | 1 17 145 833 3649 13073 40081 108545 265729
c
c  Recursion:
c
c    A(0,0) = 1
c    A(M,0) = 1
c    A(0,N) = 1
c    A(M,N) = A(M-1,N) + A(M,N-1) + A(M-1,N-1)
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
c    Input, integer M, N, define the highest order number to 
c    compute.
c
c    Output, integer A(0:M,0:N), the Delannoy numbers.
c
      implicit none

      integer m
      integer n

      integer a(0:m,0:n)
      integer i
      integer j

      if ( m .lt. 0 ) then
        return
      end if

      if ( n .lt. 0 ) then
        return
      end if
   
      a(0,0) = 1

      do i = 1, m
        a(i,0) = 1
      end do

      do j = 1, n
        a(0,j) = 1
      end do

      do i = 1, m
        do j = 1, n
          a(i,j) = a(i-1,j) + a(i,j-1) + a(i-1,j-1)
        end do
      end do

      return
      end
