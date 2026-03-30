      subroutine krawtchouk ( n, p, x, m, v )

c*********************************************************************72
c
cc KRAWTCHOUK evaluates the Krawtchouk polynomials at X.
c
c  Discussion:
c
c    The polynomial has a parameter P, which must be striclty between
c    0 and 1, and a parameter M which must be a nonnegative integer.
c
c    The Krawtchouk polynomial of order N, with parameters P and M,
c    evaluated at X, may be written K(N,P,X,M).
c
c    The first two terms are:
c
c      K(0,P,X,M) = 1
c      K(1,P,X,M) = X - P * M
c
c    and the recursion, for fixed P and M is
c
c                             ( N + 1 ) * K(N+1,P,X,M) =
c        ( X - ( N + P * ( M - 2 * N))) * K(N,  P,X,M)
c       - ( M - N + 1 ) * P * ( 1 - P ) * K(N-1,P,X,M)
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
c    Input, integer N, the highest order polynomial to evaluate.
c    0 <= N.
c
c    Input, double precision P, the parameter.  0 < P < 1.
c
c    Input, double precision X, the evaluation parameter.
c
c    Input, integer M, the parameter.  0 <= M.
c
c    Output, double precision V(0:N), the values of the Krawtchouk polynomials
c    of orders 0 through N at X.
c
      implicit none

      integer  n

      integer i
      integer m
      double precision p
      double precision x
      double precision v(0:n)

      if ( n .lt. 0 ) then
        write ( * , '(a)' ) ' '
        write ( * , '(a)' ) 'KRAWTCHOUK - Fatal error!'
        write ( * , '(a)' ) '  0 <= N is required.'
        stop 1
      end if

      if ( p .le. 0.0 .or. 1.0 .le. p ) then
        write ( * , '(a)' ) ' '
        write ( * , '(a)' ) 'KRAWTCHOUK - Fatal error!'
        write ( * , '(a)' ) '  0 < P < 1 is required.'
        stop 1
      end if

      if ( m .lt. 0 ) then
        write ( * , '(a)' ) ' '
        write ( * , '(a)' ) 'KRAWTCHOUK - Fatal error!'
        write ( * , '(a)' ) '  0 <= M is required.'
        stop 1
      end if

      v(0) = 1.0D+00

      if ( 1 <= n ) then
        v(1) = x - p * dble ( m )
      end if

      do i = 1, n - 1
        v(i+1) = ( 
     &    ( x - ( dble ( i ) + p * dble ( m - 2 * i ) ) )
     &      * v(i)
     &    - dble ( m - i + 1 ) * p * ( 1.0D+00 - p ) * v(i-1)
     &    ) / dble ( i + 1 )
      end do

      return
      end
