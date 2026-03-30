      subroutine laguerre_associated ( n, m, x, cx )

c*********************************************************************72
c
cc LAGUERRE_ASSOCIATED evaluates associated Laguerre polynomials L(N,M,X).
c
c  Differential equation:
c
c    X Y'' + (M+1-X) Y' + (N-M) Y = 0
c
c  First terms:
c
c    M = 0
c
c    L(0,0,X) =   1
c    L(1,0,X) =  -X    +  1
c    L(2,0,X) =   X^2  -  4 X     +  2
c    L(3,0,X) =  -X^3 +  9 X^2  -  18 X    +    6
c    L(4,0,X) =   X^4 - 16 X^3 +  72 X^2  -   96 X +      24
c    L(5,0,X) =  -X^5 + 25 X^4 - 200 X^3 +  600 X^2  -  600 x    +  120
c    L(6,0,X) =   X^6 - 36 X^5 + 450 X^4 - 2400 X^3 + 5400 X^2  - 4320 X + 720
c
c    M = 1
c
c    L(0,1,X) =    0
c    L(1,1,X) =   -1,
c    L(2,1,X) =    2 X - 4,
c    L(3,1,X) =   -3 X^2  + 18 X - 18,
c    L(4,1,X) =    4 X^3 - 48 X^2 + 144 X - 96
c
c    M = 2
c
c    L(0,2,X) =    0
c    L(1,2,X) =    0,
c    L(2,2,X) =    2,
c    L(3,2,X) =   -6 X + 18,
c    L(4,2,X) =   12 X^2 - 96 X + 144
c
c    M = 3
c
c    L(0,3,X) =    0
c    L(1,3,X) =    0,
c    L(2,3,X) =    0,
c    L(3,3,X) =   -6,
c    L(4,3,X) =   24 X - 96
c
c    M = 4
c
c    L(0,4,X) =    0
c    L(1,4,X) =    0
c    L(2,4,X) =    0
c    L(3,4,X) =    0
c    L(4,4,X) =   24
c
c  Recursion:
c
c    if N = 0:
c
c      L(N,M,X)   = 0 
c
c    if N = 1:
c
c      L(N,M,X)   = (M+1-X)
c
c    if 2 <= N:
c
c      L(N,M,X)   = ( (M+2*N-1-X) * L(N-1,M,X) 
c                  +   (1-M-N)     * L(N-2,M,X) ) / N
c
c  Special values:
c
c    For M = 0, the associated Laguerre polynomials L(N,M,X) are equal 
c    to the Laguerre polynomials L(N,X).
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
c    Input, integer M, the parameter.  M must be nonnegative.
c
c    Input, double precision X, the point at which the polynomials are 
c    to be evaluated.
c
c    Output, double precision CX(0:N), the associated Laguerre polynomials of 
c    degrees 0 through N evaluated at the point X.
c
      implicit none

      integer n

      double precision cx(0:n)
      integer i
      integer m
      double precision x

      if ( m .lt. 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'LAGUERRE_ASSOCIATED - Fatal error!'
        write ( *, '(a,i8)' ) '  Input value of M = ', m
        write ( *, '(a)' ) '  but M must be nonnegative.'
        stop 1
      end if

      if ( n .lt. 0 ) then
        return
      end if

      cx(0) = 1.0D+00

      if ( n .eq. 0 ) then
        return
      end if

      cx(1) = dble ( m + 1 ) - x

      do i = 2, n
        cx(i) = ( ( dble (   m + 2 * i - 1 ) - x ) * cx(i-1)   
     &            + dble ( - m     - i + 1 )       * cx(i-2) ) 
     &            / dble (           i     )
      end do

      return
      end
