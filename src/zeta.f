      function zeta ( p )

c*********************************************************************72
c
cc ZETA estimates the Riemann Zeta function.
c
c  Discussion:
c
c    For 1 < P, the Riemann Zeta function is defined as:
c
c      ZETA ( P ) = Sum ( 1 <= N < +oo ) 1 / N^P
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
c    Daniel Zwillinger, editor,
c    CRC Standard Mathematical Tables and Formulae,
c    30th Edition,
c    CRC Press, 1996.
c
c  Parameters:
c
c    Input, double precision P, the power to which the integers are raised.
c    P must be greater than 1.
c
c    Output, double precision ZETA, an approximation to the Riemann 
c    Zeta function.
c
      implicit none

      integer n
      double precision p
      double precision total
      double precision total_old
      double precision zeta

      if ( p .le. 1.0D+00 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'ZETA - Fatal error!'
        write ( *, '(a)' ) '  Exponent P <= 1.0.'
        zeta = -1.0D+00
        stop 1
      end if

      total = 0.0D+00
      n = 0

10    continue

        n = n + 1
        total_old = total
        total = total + 1.0D+00 / ( dble ( n ) ) ** p

        if ( total .le. total_old .or. 1000 .le. n ) then
          go to 20
        end if

      go to 10

20    continue

      zeta = total

      return
      end
