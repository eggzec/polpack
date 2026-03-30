      subroutine legendre_associated_normalized ( n, m, x, cx )

c*********************************************************************72
c
cc LEGENDRE_ASSOCIATED_NORMALIZED: normalized associated Legendre functions.
c
c  Discussion:
c
c    The unnormalized associated Legendre functions P_N^M(X) have
c    the property that
c
c      Integral ( -1 <= X <= 1 ) ( P_N^M(X) )^2 dX 
c      = 2 * ( N + M )c / ( ( 2 * N + 1 ) * ( N - M )c )
c
c    By dividing the function by the square root of this term,
c    the normalized associated Legendre functions have norm 1.
c
c    However, we plan to use these functions to build spherical
c    harmonics, so we use a slightly different normalization factor of
c
c      sqrt ( ( ( 2 * N + 1 ) * ( N - M )! ) / ( 4 * pi * ( N + M )! ) ) 
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
      double precision factor
      integer i
      integer m
      integer mm
      double precision pi
      parameter ( pi = 3.141592653589793D+00 )
      double precision r8_factorial
      double precision somx2
      double precision x

      if ( m .lt. 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 
     &    'LEGENDRE_ASSOCIATED_NORMALIZED - Fatal error!'
        write ( *, '(a,i8)' ) '  Input value of M is ', m
        write ( *, '(a)' ) '  but M must be nonnegative.'
        stop 1
      end if
     
      if ( n .lt. m ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 
     &    'LEGENDRE_ASSOCIATED_NORMALIZED - Fatal error!'
        write ( *, '(a,i8)' ) '  Input value of M = ', m
        write ( *, '(a,i8)' ) '  Input value of N = ', n
        write ( *, '(a)' ) '  but M must be less than or equal to N.'
        stop 1
      end if
     
      if ( x .lt. -1.0D+00 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 
     &    'LEGENDRE_ASSOCIATED_NORMALIZED - Fatal error!'
        write ( *, '(a,g14.6)' ) '  Input value of X = ', x
        write ( *, '(a)' ) '  but X must be no less than -1.'
        stop 1
      end if
     
      if ( 1.0D+00 .lt. x ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 
     &    'LEGENDRE_ASSOCIATED_NORMALIZED - Fatal error!'
        write ( *, '(a,g14.6)' ) '  Input value of X = ', x
        write ( *, '(a)' ) '  but X must be no more than 1.'
        stop 1
      end if
c
c  Entries 0 through M-1 are zero.
c
      do i = 0, m - 1
        cx(i) = 0.0D+00
      end do
      cx(m) = 1.0D+00
      somx2 = sqrt ( 1.0D+00 - x * x )
     
      factor = 1.0D+00
      do i = 1, m
        cx(m) = - cx(m) * factor * somx2
        factor = factor + 2.0D+00
      end do
     
      if ( m + 1 .le. n ) then
        cx(m+1) = x * dble ( 2 * m + 1 ) * cx(m)
      end if

      do i = m + 2, n
        cx(i) = ( dble ( 2 * i     - 1 ) * x * cx(i-1) 
     &          + dble (   - i - m + 1 ) *     cx(i-2) ) 
     &          / dble (     i - m     )
      end do
c
c  Normalization.
c
      do mm = m, n
        factor = sqrt ( ( dble ( 2 * mm + 1 ) 
     &    * r8_factorial ( mm - m ) ) 
     &    / ( 4.0D+00 * pi * r8_factorial ( mm + m ) ) )
        cx(mm) = cx(mm) * factor
      end do

      return
      end
