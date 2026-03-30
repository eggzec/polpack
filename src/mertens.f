      function mertens ( n )

c*********************************************************************72
c
cc MERTENS evaluates the Mertens function.
c
c  Discussion:
c
c    The Mertens function M(N) is the sum from 1 to N of the Moebius
c    function MU.  That is,
c
c    M(N) = sum ( 1 <= I <= N ) MU(I)
c
c        N   M(N)
c        --  ----
c         1     1
c         2     0
c         3    -1
c         4    -1
c         5    -2
c         6    -1
c         7    -2
c         8    -2
c         9    -2
c        10    -1
c        11    -2
c        12    -2
c       100     1
c      1000     2
c     10000   -23
c    100000   -48
c
c    The determinant of the Redheffer matrix of order N is equal
c    to the Mertens function M(N).
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
c    M Deleglise, J Rivat,
c    Computing the Summation of the Moebius Function,
c    Experimental Mathematics,
c    Volume 5, 1996, pages 291-295.
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
c    Input, integer N, the argument.
c
c    Output, integer MERTENS, the value.
c
      implicit none

      integer i
      integer mertens
      integer mu_i
      integer n
      integer value

      value = 0

      do i = 1, n
        call moebius ( i, mu_i )
        value = value + mu_i
      end do

      mertens = value

      return
      end
