      subroutine charlier ( n, a, x, value )

c*********************************************************************72
c
cc CHARLIER evaluates Charlier polynomials at a point.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    17 March 2009
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c   J Simoes Pereira,
c    Algorithm 234: Poisson-Charliers Polynomials,
c    Communications of the ACM,
c    Volume 7, Number 7, page 420, July 1964.
c
c    Walter Gautschi,
c    Orthogonal Polynomials: Computation and Approximation,
c    Oxford, 2004,
c    ISBN: 0-19-850672-4,
c    LC: QA404.5 G3555.
c
c    Gabor Szego,
c    Orthogonal Polynomials,
c    American Mathematical Society, 1975,
c    ISBN: 0821810235,
c    LC: QA3.A5.v23.
c
c    Eric Weisstein,
c    CRC Concise Encyclopedia of Mathematics,
c    CRC Press, 2002,
c    Second edition,
c    ISBN: 1584883472,
c    LC: QA5.W45.
c
c  Parameters:
c
c    Input, integer N, the maximum order of the polynomial.  
c    N must be at least 0.
c
c    Input, double precision A, the parameter.  A must not be 0.
c
c    Input, double precision X, the evaluation point.
c
c    Output, double precision VALUE(0:N), the value of the polynomials at X.
c
      implicit none

      integer n

      double precision a
      integer i
      double precision value(0:n)
      double precision x

      if ( a .eq. 0.0D+00 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'CHARLIER - Fatal error!'
        write ( *, '(a)' ) '  Parameter A cannot be zero.'
        stop 1
      end if

      if ( n .lt. 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'CHARLIER - Fatal error!'
        write ( *, '(a)' ) '  Parameter N must be nonnegative.'
        stop 1
      end if

      value(0) = 1.0D+00

      if ( n == 0 ) then
        return
      end if

      value(1) = - x / a

      if ( n == 1 ) then 
        return
      end if
  
      do i = 1, n - 1
        value(i+1) = ( ( dble ( i ) + a - x ) * value(i) 
     &                 - dble ( i ) * value(i-1) ) / a
      end do

      return
      end
