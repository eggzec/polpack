      function r8_nint ( x )

c*****************************************************************************80
c
cc R8_NINT returns the nearest integer to an R8.
c
c  Example:
c
c        X        R8_NINT
c
c      1.3         1
c      1.4         1
c      1.5         1 or 2
c      1.6         2
c      0.0         0
c     -0.7        -1
c     -1.1        -1
c     -1.6        -2
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    08 September 2005
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, double precision X, the value.
c
c    Output, integer R8_NINT, the nearest integer to X.
c
      implicit none

      integer r8_nint
      integer s
      double precision x

      if ( x .lt. 0.0D+00 ) then
        s = -1
      else
        s = 1
      end if

      r8_nint = s * int ( abs ( x ) + 0.5D+00 )

      return
      end
