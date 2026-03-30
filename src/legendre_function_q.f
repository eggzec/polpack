      subroutine legendre_function_q ( n, x, cx )

c*********************************************************************72
c
cc LEGENDRE_FUNCTION_Q evaluates the Legendre Q functions.
c
c  Differential equation:
c
c    (1-X*X) Y'' - 2 X Y' + N (N+1) = 0
c
c  First terms:
c
c    Q(0,X) = 0.5 * log((1+X)/(1-X))
c    Q(1,X) = Q(0,X)*X - 1 
c    Q(2,X) = Q(0,X)*(3*X*X-1)/4 - 1.5*X
c    Q(3,X) = Q(0,X)*(5*X*X*X-3*X)/4 - 2.5*X^2 + 2/3
c    Q(4,X) = Q(0,X)*(35*X^4-30*X^2+3)/16 - 35/8 * X^3 + 55/24 * X
c    Q(5,X) = Q(0,X)*(63*X^5-70*X^3+15*X)/16 - 63/8*X^4 + 49/8*X^2 - 8/15
c
c  Recursion:
c
c    Q(0) = 0.5 * log ( (1+X) / (1-X) )
c    Q(1) = 0.5 * X * log ( (1+X) / (1-X) ) - 1.0
c
c    Q(N) = ( (2*N-1) * X * Q(N-1) - (N-1) * Q(N-2) ) / N
c
c  Restrictions:
c
c    -1 < X < 1
c
c  Special values:
c
c    Note that the Legendre function Q(N,X) is equal to the
c    associated Legendre function of the second kind,
c    Q(N,M,X) with M = 0.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    18 July 2008
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
c    Input, integer N, the highest order function to evaluate.
c
c    Input, double precision X, the point at which the functions are to be
c    evaluated.  X must satisfy -1 < X < 1.
c
c    Output, double precision CX(0:N), the values of the first N+1 Legendre
c    functions at the point X.
c
      implicit none

      integer n

      double precision cx(0:n)
      integer i
      double precision x
c
c  Check the value of X.
c
      if ( x .le. -1.0D+00 .or. 1.0D+00 .le. x ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'LEGENDRE_FUNCTION_Q - Fatal error!'
        write ( *, '(a,g14.6)' ) '  Illegal input value of X = ', x
        write ( *, '(a)' ) '  But X must be between -1 and 1.'
        stop 1
      end if
     
      if ( n .lt. 0 ) then
        return
      end if

      cx(0) = 0.5D+00 * log ( ( 1.0D+00 + x ) / ( 1.0D+00 - x ) )

      if ( n .eq. 0 ) then
        return
      end if

      cx(1) = x * cx(0) - 1.0D+00

      do i = 2, n
        cx(i) = ( dble ( 2 * i - 1 ) * x * cx(i-1) 
     &          + dble (   - i + 1 )     * cx(i-2) ) 
     &          / dble (     i     )
      end do 
     
      return
      end
