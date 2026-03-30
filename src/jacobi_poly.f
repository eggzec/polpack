      subroutine jacobi_poly ( n, alpha, beta, x, cx )

c*********************************************************************72
c
cc JACOBI_POLY evaluates the Jacobi polynomials at X.
c
c  Differential equation:
c
c    (1-X*X) Y'' + (BETA-ALPHA-(ALPHA+BETA+2) X) Y' + N (N+ALPHA+BETA+1) Y = 0
c
c  Recursion:
c
c    P(0,ALPHA,BETA,X) = 1,
c
c    P(1,ALPHA,BETA,X) = ( (2+ALPHA+BETA)*X + (ALPHA-BETA) ) / 2
c
c    P(N,ALPHA,BETA,X)  = 
c      ( 
c        (2*N+ALPHA+BETA-1) 
c        * ((ALPHA^2-BETA^2)+(2*N+ALPHA+BETA)*(2*N+ALPHA+BETA-2)*X) 
c        * P(N-1,ALPHA,BETA,X)
c        -2*(N-1+ALPHA)*(N-1+BETA)*(2*N+ALPHA+BETA) * P(N-2,ALPHA,BETA,X)
c      ) / 2*N*(N+ALPHA+BETA)*(2*N-2+ALPHA+BETA)
c
c  Restrictions:
c
c    -1 < ALPHA
c    -1 < BETA
c
c  Norm:
c
c    Integral ( -1 <= X <= 1 ) ( 1 - X )^ALPHA * ( 1 + X )^BETA 
c      * P(N,ALPHA,BETA,X)^2 dX 
c    = 2^(ALPHA+BETA+1) * Gamma ( N + ALPHA + 1 ) * Gamma ( N + BETA + 1 ) /
c      ( 2 * N + ALPHA + BETA ) * N! * Gamma ( N + ALPHA + BETA + 1 )
c
c  Special values:
c
c    P(N,ALPHA,BETA,1) = (N+ALPHA)!/(N!*ALPHA!) for integer ALPHA.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    06 July 2008
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
c    Input, double precision ALPHA, one of the parameters defining the Jacobi
c    polynomials, ALPHA must be greater than -1.
c
c    Input, double precision BETA, the second parameter defining the Jacobi
c    polynomials, BETA must be greater than -1.
c
c    Input, double precision X, the point at which the polynomials are 
c    to be evaluated.
c
c    Output, double precision CX(0:N), the values of the first N+1 Jacobi
c    polynomials at the point X.
c
      implicit none

      integer n

      double precision alpha
      double precision beta
      double precision cx(0:n)
      double precision c1
      double precision c2
      double precision c3
      double precision c4
      integer i
      double precision r_i
      double precision x

      if ( alpha .le. -1.0D+00 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'JACOBI_POLY - Fatal error!'
        write ( *, '(a,g14.6)' ) 
     &    '  Illegal input value of ALPHA = ', alpha
        write ( *, '(a)' ) '  But ALPHA must be greater than -1.'
        stop 1
      end if
 
      if ( beta .le. -1.0D+00 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'JACOBI_POLY - Fatal error!'
        write ( *, '(a,g14.6)' ) 
     &    '  Illegal input value of BETA = ', beta
        write ( *, '(a)' ) '  But BETA must be greater than -1.'
        stop 1
      end if
  
      if ( n .lt. 0 ) then
        return
      end if

      cx(0) = 1.0D+00

      if ( n .eq. 0 ) then
        return
      end if

      cx(1) = ( 1.0D+00 + 0.5D+00 * ( alpha + beta ) ) * x 
     &  + 0.5D+00 * ( alpha - beta )
 
      do i = 2, n

        r_i = dble ( i ) 

        c1 = 2.0D+00 * r_i * ( r_i + alpha + beta ) 
     &    * ( 2.0D+00 * r_i - 2.0D+00 + alpha + beta )

        c2 = ( 2.0D+00 * r_i - 1.0D+00 + alpha + beta ) 
     &    * ( 2.0D+00 * r_i  + alpha + beta ) 
     &    * ( 2.0D+00 * r_i - 2.0D+00 + alpha + beta )

        c3 = ( 2.0D+00 * r_i - 1.0D+00 + alpha + beta ) 
     &    * ( alpha + beta ) * ( alpha - beta )

        c4 = - 2.0D+00 * ( r_i - 1.0D+00 + alpha ) 
     &    * ( r_i - 1.0D+00 + beta ) 
     &    * ( 2.0D+00 * r_i + alpha + beta )

        cx(i) = ( ( c3 + c2 * x ) * cx(i-1) + c4 * cx(i-2) ) / c1

      end do

      return
      end
