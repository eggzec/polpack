      function cos_power_int ( a, b, n )

c*********************************************************************72
c
cc COS_POWER_INT evaluates the cosine power integral.
c
c  Discussion:
c
c    The function is defined by
c
c      COS_POWER_INT(A,B,N) = Integral ( A <= T <= B ) ( cos ( t ))^n dt
c
c    The algorithm uses the following fact:
c
c      Integral cos^n ( t ) = -(1/n) * (
c        cos^(n-1)(t) * sin(t) + ( n-1 ) * Integral cos^(n-2) ( t ) dt )
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    31 March 2012
c
c  Author:
c
c    John Burkardt
c
c  Parameters
c
c    Input, double precision A, B, the limits of integration.
c
c    Input, integer N, the power of the sine function.
c
c    Output, double precision COS_POWER_INT, the value of the integral.
c
      implicit none

      double precision a
      double precision b
      double precision ca
      double precision cb
      double precision cos_power_int
      integer m
      integer mlo
      integer n
      double precision sa
      double precision sb
      double precision value

      if ( n .lt. 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'COS_POWER_INT - Fatal error!'
        write ( *, '(a)' ) '  Power N < 0.'
        value = 0.0D+00
        stop 1
      end if

      sa = sin ( a )
      sb = sin ( b )
      ca = cos ( a )
      cb = cos ( b )

      if ( mod ( n, 2 ) .eq. 0 ) then
        value = b - a
        mlo = 2
      else
        value = sb - sa
        mlo = 3
      end if

      do m = mlo, n, 2
        value = ( dble ( m - 1 ) * value 
     &            - ca ** ( m - 1 ) * sa + cb ** ( m - 1 ) * sb ) 
     &    / dble ( m )
      end do

      cos_power_int = value

      return
      end
