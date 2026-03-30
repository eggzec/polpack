      subroutine chebyshev_discrete ( n, m, x, v )

c*********************************************************************72
c
cc CHEBYSHEV_DISCRETE evaluates discrete Chebyshev polynomials at a point.
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
c    Input, integer N, the highest order of the polynomials to 
c    be evaluated.  0 <= N <= M.
c
c    Input, integer M, the maximum order of the polynomials.
c    0 <= M.
c
c    Input, double precision X, the evaluation point.
c
c    Output, double precision V(0:N), the value of the polynomials at X.
c
      implicit none

      integer n

      integer i
      integer m
      double precision x
      double precision v(0:n)

      if ( m .lt. 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'CHEBYSHEV_DISCRETE - Fatal error!'
        write ( *, '(a)' ) '  Parameter M must be nonnegative.'
        stop 1
      end if

      if ( n .lt. 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'CHEBYSHEV_DISCRETE - Fatal error!'
        write ( *, '(a)' ) '  Parameter N must be nonnegative.'
        stop 1
      end if

      if ( m .lt. n ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'CHEBYSHEV_DISCRETE - Fatal error!'
        write ( *, '(a)' ) '  Parameter N must be no greater than M.'
        stop 1
      end if

      v(0) = 1.0D+00

      if ( n .eq. 0 ) then
        return
      end if

      v(1) = 2.0D+00 * x + dble ( 1 - m )

      if ( n .eq. 1 ) then
        return
      end if

      do i = 1, n - 1
        v(i+1) = ( 
     &    dble ( 2 * i + 1 ) 
     &    * ( 2.0D+00 * x + dble ( 1 - m ) ) * v(i) 
     &    - dble ( i * ( m + i ) * ( m - i ) ) * v(i-1) 
     &  ) / dble ( i + 1 )
      end do

      return
      end
