      function r8_beta ( x, y )

c*********************************************************************72
c
cc R8_BETA returns the value of the Beta function.
c
c  Discussion:
c
c    The Beta function can be defined in terms of the Gamma function:
c
c      BETA(X,Y) = ( GAMMA(X) * GAMMA(Y) ) / GAMMA(X+Y)
c
c      Both X and Y must be greater than 0.
c
c    The function has the following properties:
c
c      BETA(X,Y) = BETA(Y,X).
c      BETA(X,Y) = Integral ( 0 <= T <= 1 ) T^(X-1) (1-T)^(Y-1) dT.
c      BETA(X,Y) = GAMMA(X) * GAMMA(Y) / GAMMA(X+Y)
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    16 June 1999
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, double precision X, Y, the two parameters that define 
c    the Beta function.  X and Y must be greater than 0.
c
c    Output, double precision R8_BETA, the value of the Beta function.
c
      implicit none

      double precision r8_beta
      double precision r8_gamma_log
      double precision x
      double precision y

      if ( x .le. 0.0D+00 .or. y .le. 0.0D+00 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'R8_BETA - Fatal error!'
        write ( *, '(a)' ) '  Both X and Y must be greater than 0.'
        stop 1
      end if

      r8_beta = exp ( lgamma ( x ) + lgamma ( y ) - lgamma ( x + y ) )

      return
      end
