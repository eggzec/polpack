      subroutine legendre_associated ( n, m, x, cx )

c*********************************************************************72
c
cc LEGENDRE_ASSOCIATED evaluates the associated Legendre functions.
c
c  Differential equation:
c
c    (1-X*X) * Y'' - 2 * X * Y + ( N (N+1) - (M*M/(1-X*X)) * Y = 0
c
c  First terms:
c
c    M = 0  ( = Legendre polynomials of first kind P(N,X) )
c
c    P00 =    1
c    P10 =    1 X
c    P20 = (  3 X^2 -   1)/2
c    P30 = (  5 X^3 -   3 X)/2
c    P40 = ( 35 X^4 -  30 X^2 +   3)/8
c    P50 = ( 63 X^5 -  70 X^3 +  15 X)/8
c    P60 = (231 X^6 - 315 X^4 + 105 X^2 -  5)/16
c    P70 = (429 X^7 - 693 X^5 + 315 X^3 - 35 X)/16
c
c    M = 1
c
c    P01 =   0
c    P11 =   1 * SQRT(1-X*X)
c    P21 =   3 * SQRT(1-X*X) * X
c    P31 = 1.5 * SQRT(1-X*X) * (5*X*X-1)
c    P41 = 2.5 * SQRT(1-X*X) * (7*X*X*X-3*X)
c
c    M = 2
c
c    P02 =   0
c    P12 =   0
c    P22 =   3 * (1-X*X)
c    P32 =  15 * (1-X*X) * X
c    P42 = 7.5 * (1-X*X) * (7*X*X-1)
c
c    M = 3
c
c    P03 =   0
c    P13 =   0
c    P23 =   0
c    P33 =  15 * (1-X*X)**1.5
c    P43 = 105 * (1-X*X)**1.5 * X
c
c    M = 4
c
c    P04 =   0
c    P14 =   0
c    P24 =   0
c    P34 =   0
c    P44 = 105 * (1-X*X)^2
c
c  Recursion:
c
c    if N < M:
c      P(N,M) = 0
c    if N = M:
c      P(N,M) = (2*M-1)!! * (1-X*X)**(M/2) where N!! means the product of
c      all the odd integers less than or equal to N.
c    if N = M+1:
c      P(N,M) = X*(2*M+1)*P(M,M)
c    if M+1 < N:
c      P(N,M) = ( X*(2*N-1)*P(N-1,M) - (N+M-1)*P(N-2,M) )/(N-M)
c
c  Special values:
c
c    P(N,0,X) = P(N,X), that is, for M=0, the associated Legendre
c    function of the first kind equals the Legendre polynomial of the
c    first kind.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    17 July 2008
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
c    Input, integer N, the maximum first index of the Legendre
c    function, which must be at least 0.
c
c    Input, integer M, the second index of the Legendre function,
c    which must be at least 0, and no greater than N.
c
c    Input, double precision X, the point at which the function is to be
c    evaluated.  X must satisfy -1 <= X <= 1.
c
c    Output, double precision CX(0:N), the values of the first N+1 functions.
c
      implicit none

      integer n

      double precision cx(0:n)
      double precision fact
      integer i
      integer m
      double precision somx2
      double precision x

      if ( m .lt. 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'LEGENDRE_ASSOCIATED - Fatal error!'
        write ( *, '(a,i8)' ) '  Input value of M is ', m
        write ( *, '(a)' ) '  but M must be nonnegative.'
        stop 1
      end if
 
      if ( n .lt. m ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'LEGENDRE_ASSOCIATED - Fatal error!'
        write ( *, '(a,i8)' ) '  Input value of M = ', m
        write ( *, '(a,i8)' ) '  Input value of N = ', n
        write ( *, '(a)' ) '  but M must be less than or equal to N.'
        stop 1
      end if
 
      if ( x .lt. -1.0D+00 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'LEGENDRE_ASSOCIATED - Fatal error!'
        write ( *, '(a,g14.6)' ) '  Input value of X = ', x
        write ( *, '(a)' ) '  but X must be no less than -1.'
        stop 1
      end if
 
      if ( 1.0D+00 .lt. x ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'LEGENDRE_ASSOCIATED - Fatal error!'
        write ( *, '(a,g14.6)' ) '  Input value of X = ', x
        write ( *, '(a)' ) '  but X must be no more than 1.'
        stop 1
      end if
  
      do i = 0, m - 1
        cx(i) = 0.0D+00
      end do

      cx(m) = 1.0D+00
      somx2 = sqrt ( 1.0D+00 - x * x )
 
      fact = 1.0D+00
      do i = 1, m
        cx(m) = -cx(m) * fact * somx2
        fact = fact + 2.0D+00
      end do
 
      if ( m + 1 .le. n ) then
        cx(m+1) = x * dble ( 2 * m + 1 ) * cx(m)
      end if

      do i = m+2, n
        cx(i) = ( dble ( 2 * i     - 1 ) * x * cx(i-1) 
     &          + dble (   - i - m + 1 ) *     cx(i-2) ) 
     &          / dble (     i - m     )
      end do

      return
      end
