      subroutine hermite_poly_phys ( n, x, cx )

c*********************************************************************72
c
cc HERMITE_POLY_PHYS evaluates the physicisist's Hermite polynomials at X.
c
c  Differential equation:
c
c    Y'' - 2 X Y' + 2 N Y = 0
c
c  First terms:
c
c      1
c      2 X
c      4 X^2     -  2
c      8 X^3     - 12 X
c     16 X^4     - 48 X^2     + 12
c     32 X^5    - 160 X^3    + 120 X
c     64 X^6    - 480 X^4    + 720 X^2    - 120
c    128 X^7   - 1344 X^5   + 3360 X^3   - 1680 X
c    256 X^8   - 3584 X^6  + 13440 X^4  - 13440 X^2   + 1680
c    512 X^9   - 9216 X^7  + 48384 X^5  - 80640 X^3  + 30240 X
c   1024 X^10 - 23040 X^8 + 161280 X^6 - 403200 X^4 + 302400 X^2 - 30240
c
c  Recursion:
c
c    H(0,X) = 1,
c    H(1,X) = 2*X,
c    H(N,X) = 2*X * H(N-1,X) - 2*(N-1) * H(N-2,X)
c
c  Norm:
c
c    Integral ( -oo < X < oo ) exp ( - X^2 ) * H(N,X)^2 dX
c    = sqrt ( PI ) * 2^N * N!
c
c    H(N,X) = (-1)^N * exp ( X^2 ) * dn/dXn ( exp(-X^2 ) )
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    10 July 2008
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
c    Larry Andrews,
c    Special Functions of Mathematics for Engineers,
c    Second Edition, 
c    Oxford University Press, 1998.
c
c  Parameters:
c
c    Input, integer N, the highest order polynomial to compute.
c    Note that polynomials 0 through N will be computed.
c
c    Input, double precision X, the point at which the polynomials are 
c    to be evaluated.
c
c    Output, double precision CX(0:N), the values of the first N+1 Hermite
c    polynomials at the point X.
c
      implicit none

      integer n

      double precision cx(0:n)
      integer i
      double precision x

      if ( n .lt. 0 ) then
        return
      end if

      cx(0) = 1.0D+00

      if ( n .eq. 0 ) then
        return
      end if

      cx(1) = 2.0D+00 * x
 
      do i = 2, n
        cx(i) = 2.0D+00 * x * cx(i-1) 
     &    - 2.0D+00 * dble ( i - 1 ) * cx(i-2)
      end do
 
      return
      end
