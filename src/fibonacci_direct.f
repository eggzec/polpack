      subroutine fibonacci_direct ( n, f )

c*********************************************************************72
c
cc FIBONACCI_DIRECT computes the N-th Fibonacci number directly.
c
c  Discussion:
c
c    A direct formula for the N-th Fibonacci number is:
c
c      F(N) = ( PHIP^N - PHIM^N ) / sqrt(5)
c
c    where 
c
c      PHIP = ( 1 + sqrt(5) ) / 2, 
c      PHIM = ( 1 - sqrt(5) ) / 2.
c
c  Example:
c
c     N   F
c    --  --
c     0   0
c     1   1
c     2   1
c     3   2
c     4   3
c     5   5
c     6   8
c     7  13
c     8  21
c     9  34
c    10  55
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    13 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the index of the Fibonacci number 
c    to compute.  N should be nonnegative.
c
c    Output, integer F, the value of the N-th Fibonacci number.
c
      implicit none

      integer f
      integer n
      double precision sqrt5
      parameter ( sqrt5 = 2.236068D+00 )
      double precision phim
      parameter ( phim = ( 1.0D+00 - sqrt5 ) / 2.0D+00 )
      double precision phip
      parameter ( phip = ( 1.0D+00 + sqrt5 ) / 2.0D+00 )

      if ( n .lt. 0 ) then
       f = 0
      else
        f = nint ( ( phip ** n - phim ** n ) / sqrt ( 5.0D+00 ) )
      end if
 
      return
      end
