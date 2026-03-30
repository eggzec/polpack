      subroutine gegenbauer_poly ( n, alpha, x, cx )

c*********************************************************************72
c
cc GEGENBAUER_POLY computes the Gegenbauer polynomials C(I,ALPHA,X).
c
c  Discussion:
c
c    The Gegenbauer polynomial can be evaluated in Mathematica with
c    the command 
c
c      GegenbauerC[n,m,x]
c
c  Differential equation:
c
c    (1-X*X) Y'' - (2 ALPHA + 1) X Y' + N (N + 2 ALPHA) Y = 0
c
c  Recursion:
c
c    C(0,ALPHA,X) = 1,
c    C(1,ALPHA,X) = 2*ALPHA*X
c    C(N,ALPHA,X) = ( (2*N-2+2*ALPHA) * X * C(N-1,ALPHA,X) 
c                   + ( -N+2-2*ALPHA)     * C(N-2,ALPHA,X) ) / N
c
c  Restrictions:
c
c    ALPHA must be greater than -0.5.
c
c  Special values:
c
c    If ALPHA = 1, the Gegenbauer polynomials reduce to the Chebyshev
c    polynomials of the second kind.
c
c  Norm:
c
c    Integral ( -1 <= X <= 1 ) 
c      ( 1 - X^2 )^( ALPHA - 0.5 ) * C(N,ALPHA,X)^2 dX
c
c    = PI * 2^( 1 - 2 * ALPHA ) * Gamma ( N + 2 * ALPHA ) 
c      / ( N! * ( N + ALPHA ) * ( Gamma ( ALPHA ) )^2 )
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    09 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Stephen Wolfram,
c    The Mathematica Book,
c    Fourth Edition,
c    Cambridge University Press, 1999,
c    ISBN: 0-521-64314-7,
c    LC: QA76.95.W65.
c
c  Parameters:
c
c    Input, integer N, the highest order polynomial to compute.
c    Note that polynomials 0 through N will be computed.
c
c    Input, double precision ALPHA, a parameter which is part of the 
c    definition of the Gegenbauer polynomials.  It must be greater than -0.5.
c
c    Input, double precision X, the point at which the polynomials 
c    are to be evaluated.
c
c    Output, double precision CX(0:N), the values of the first N+1 Gegenbauer
c    polynomials at the point X.  
c
      implicit none

      integer n

      double precision alpha
      double precision cx(0:n)
      integer i
      double precision x

      if ( alpha .le. -0.5D+00 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'GEGENBAUER_POLY - Fatal error!'
        write ( *, '(a,g14.6)' ) '  Illegal value of ALPHA = ', alpha
        write ( *, '(a)' ) '  but ALPHA must be greater than -0.5.'
        return
      end if

      if ( n .lt. 0 ) then
        return
      end if

      cx(0) = 1.0D+00

      if ( n .eq. 0 ) then
        return
      end if

      cx(1) = 2.0D+00 * alpha * x

      do i = 2, n
        cx(i) = 
     &    ( ( dble ( 2 * i - 2 ) + 2.0D+00 * alpha ) * x * cx(i-1)   
     &    + ( dble (   - i + 2 ) - 2.0D+00 * alpha )     * cx(i-2) ) 
     &    /   dble (     i     )
      end do
 
      return
      end
