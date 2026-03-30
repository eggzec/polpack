      subroutine gen_laguerre_poly ( n, alpha, x, cx )

c*********************************************************************72
c
cc GEN_LAGUERRE_POLY evaluates generalized Laguerre polynomials.
c
c  Differential equation:
c
c    X * Y'' + (ALPHA+1-X) * Y' + N * Y = 0
c
c  Recursion:
c
c    L(0,ALPHA,X) = 1
c    L(1,ALPHA,X) = 1+ALPHA-X
c
c    L(N,ALPHA,X) = ( (2*N-1+ALPHA-X) * L(N-1,ALPHA,X) 
c                   - (N-1+ALPHA) * L(N-2,ALPHA,X) ) / N
c
c  Restrictions:
c
c    -1 < ALPHA
c
c  Special values:
c
c    For ALPHA = 0, the generalized Laguerre polynomial L(N,ALPHA,X)
c    is equal to the Laguerre polynomial L(N,X).
c
c    For ALPHA integral, the generalized Laguerre polynomial
c    L(N,ALPHA,X) equals the associated Laguerre polynomial L(N,ALPHA,X).
c
c  Norm:
c
c    Integral ( 0 <= X < +oo ) exp ( - X ) * L(N,ALPHA,X)^2 dX
c    = Gamma ( N + ALPHA + 1 ) / N!
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    28 February 2010
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
c    Input, integer N, the highest order function to compute.
c
c    Input, double precision ALPHA, the parameter.  -1 < ALPHA is required.
c
c    Input, double precision X, the point at which the functions are to be
c    evaluated.
c
c    Output, double precision CX(0:N), the polynomials of 
c    degrees 0 through N evaluated at the point X.
c
      implicit none

      integer n

      double precision alpha
      double precision cx(0:n)
      integer i
      double precision x

      if ( alpha .le. -1.0D+00 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'GEN_LAGUERRE_POLY - Fatal error!'
        write ( *, '(a,g14.6)' ) 
     &    '  The input value of ALPHA is ', alpha
        write ( *, '(a)' ) '  but ALPHA must be greater than -1.'
        stop 1
      end if
     
      if ( n .lt. 0 ) then
        return
      end if

      cx(0) = 1.0D+00

      if ( n .eq. 0 ) then
        return
      end if

      cx(1) = 1.0D+00 + alpha - x

      do i = 2, n
        cx(i) = ( ( dble ( 2 * i - 1 ) + alpha - x ) * cx(i-1)   
     &          + ( dble (   - i + 1 ) - alpha     ) * cx(i-2) ) 
     &            / dble (     i     )
      end do

      return
      end
