      subroutine fibonacci_floor ( n, f, i )

c*********************************************************************72
c
cc FIBONACCI_FLOOR returns the largest Fibonacci number less than or equal to N.
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
c    Input, integer N, the positive integer whose Fibonacci 
c    "floor" is desired.
c
c    Output, integer F, the largest Fibonacci number less 
c    than or equal to N.
c
c    Output, integer I, the index of the F.
c
      implicit none

      integer f
      integer i
      integer n

      if ( n .le. 0 ) then

        i = 0
        f = 0

      else

        i = int ( 
     &      log ( 0.5D+00 * dble ( 2 * n + 1 ) * sqrt ( 5.0D+00 ) ) 
     &    / log ( 0.5D+00 * ( 1.0D+00 + sqrt ( 5.0D+00 ) ) ) )

        call fibonacci_direct ( i, f )

        if ( n .lt. f ) then
          i = i - 1
          call fibonacci_direct ( i, f )
        end if

      end if

      return
      end
