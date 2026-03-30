      function euler_poly ( n, x )

c*********************************************************************72
c
cc EULER_POLY evaluates the N-th Euler polynomial at X.
c
c  First values:
c
c    E(0,X) = 1
c    E(1,X) = X - 1/2
c    E(2,X) = X^2 - X 
c    E(3,X) = X^3 - 3/2 X^2 + 1/4
c    E(4,X) = X^4 - 2*X^3 + X
c    E(5,X) = X^5 - 5/2 X^4 + 5/2 X^2 - 1/2
c    E(6,X) = X^6 - 3 X^5 + 5 X^3 - 3 X
c    E(7,X) = X^7 - 7/2 X^6 + 35/4 X^4 - 21/2 X^2 + 17/8
c    E(8,X) = X^8 - 4 X^7 + 14 X^5 - 28 X^3 + 17 X
c
c  Special values:
c
c    E'(N,X) = N * E(N-1,X)
c
c    E(N,1/2) = E(N) / 2^N, where E(N) is the N-th Euler number.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    08 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the order of the Euler polynomial to
c    be evaluated.  N must be 0 or greater.
c
c    Input, double precision X, the value at which the polynomial is to
c    be evaluated.
c
c    Output, double precision EULER_POLY, the value of E(N,X).
c
      implicit none

      double precision bx1
      double precision bx2
      double precision euler_poly
      integer n
      double precision x

      call bernoulli_poly2 ( n+1, x, bx1 )
      call bernoulli_poly2 ( n+1, 0.5D+00 * x, bx2 )

      euler_poly = 2.0D+00 * ( bx1 - bx2 * 2.0D+00 ** ( n + 1 ) ) 
     &  / dble ( n + 1 )

      return
      end
