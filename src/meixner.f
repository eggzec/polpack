      subroutine meixner ( n, beta, c, x, v )

c*********************************************************************72
c
cc MEIXNER evaluates Meixner polynomials at a point.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    18 March 2009
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Walter Gautschi,
c    Orthogonal Polynomials: Computation and Approximation,
c    Oxford, 2004,
c    ISBN: 0-19-850672-4,
c    LC: QA404.5 G3555.
c
c  Parameters:
c
c    Input, integer N, the maximum order of the polynomial.  
c    N must be at least 0.
c
c    Input, double precision BETA, the Beta parameter.  0 < BETA.
c
c    Input, double precision C, the C parameter.  0 < C < 1.
c
c    Input, double precision X, the evaluation point.
c
c    Output, double precision V(0:N), the value of the polynomials at X.
c
      implicit none

      integer n

      double precision beta
      double precision c
      integer i
      double precision v(0:n)
      double precision x

      if ( beta .le. 0.0D+00 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'MEIXNER - Fatal error!'
        write ( *, '(a)' ) '  Parameter BETA must be positive.'
        stop 1
      end if

      if ( c .le. 0.0D+00 .or. 1.0D+00 .le. c ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'MEIXNER - Fatal error!'
        write ( *, '(a)' ) 
     &  '  Parameter C must be strictly between 0 and 1.'
        stop 1
      end if

      if ( n .lt. 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'MEIXNER - Fatal error!'
        write ( *, '(a)' ) '  Parameter N must be nonnegative.'
        stop 1
      end if

      v(0) = 1.0D+00

      if ( n .eq. 0 ) then
        return
      end if

      v(1) = ( c - 1.0D+00 ) * x / beta / c + 1.0D+00

      if ( n == 1 ) then
        return
      end if

      do i = 1, n - 1
        v(i+1) = ( 
     &    ( ( c - 1.0D+00 ) * x + ( 1.0D+00 + c ) 
     &    * dble ( i ) + beta * c ) * v(i) 
     &    - dble ( i ) * v(i-1) 
     &    ) / ( dble ( i ) + beta )
      end do

      return
      end
