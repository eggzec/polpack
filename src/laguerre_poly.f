      subroutine laguerre_poly ( n, x, cx )

c*********************************************************************72
c
cc LAGUERRE_POLY evaluates the Laguerre polynomials at X.
c
c  Differential equation:
c
c    X * Y'' + (1-X) * Y' + N * Y = 0
c
c  First terms:
c
c      1
c     -X    +  1
c   (  X^2  -  4 X     +  2 ) / 2
c   ( -X^3 +  9 X^2  -  18 X    +    6 ) / 6
c   (  X^4 - 16 X^3 +  72 X^2  -   96 X +      24 ) / 24
c   ( -X^5 + 25 X^4 - 200 X^3 +  600 X^2  -  600 X    +  120 ) / 120
c   (  X^6 - 36 X^5 + 450 X^4 - 2400 X^3 + 5400 X^2 - 4320 X + 720 ) / 720
c   ( -X^7 + 49 X^6 - 882 X^5 + 7350 X^4 - 29400 X^3 
c      + 52920 X^2 - 35280 X + 5040 ) / 5040
c
c  Recursion:
c
c    L(0,X) = 1,
c    L(1,X) = 1-X,
c    N * L(N,X) = (2*N-1-X) * L(N-1,X) - (N-1) * L(N-2,X)
c
c  Orthogonality:
c
c    Integral ( 0 <= X < +oo ) exp ( - X ) * L(N,X) * L(M,X) dX
c    = 0 if N /= M
c    = 1 if N == M
c
c  Special values:
c
c    L(N,0) = 1.
c
c  Relations:
c
c    L(N,X) = (-1)^N / N! * exp ( x ) * (d/dx)^n ( exp ( - x ) * x^n )  
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    14 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Milton Abramowitz, Irene Stegun,
c    Handbook of Mathematical Functions,
c    National Bureau of Standards, 1964,
c    ISBN: 0-486-61272-4,
c    LC: QA47.A34.
c
c  Parameters:
c
c    Input, integer N, the highest order polynomial to compute.
c    Note that polynomials 0 through N will be computed.
c
c    Input, double precision X, the point at which the polynomials are 
c    to be evaluated.
c
c    Output, double precision CX(0:N), the Laguerre polynomials of 
c    degree 0 through N evaluated at the point X.
c
      implicit none

      integer n

      double precision cx(0:n)
      integer i
      double precision x

      if ( n .lt. 0 ) then
        return
      end if

      cx(0) = 1.0D+00

      if ( n .eq. 0 ) then
        return
      end if

      cx(1) = 1.0D+00 - x
     
      do i = 2, n

        cx(i) = ( ( dble ( 2 * i - 1 ) - x ) * cx(i-1)   
     &            - dble (     i - 1 )       * cx(i-2) ) 
     &            / dble (     i     )

      end do

      return
      end
