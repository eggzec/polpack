      subroutine gen_hermite_poly ( n, x, mu, p )

c*********************************************************************72
c
cc GEN_HERMITE_POLY evaluates the generalized Hermite polynomials at X.
c
c  Discussion:
c
c    The generalized Hermite polynomials are orthogonal under the weight
c    function:
c
c      w(x) = |x|^(2*MU) * exp ( - x^2 )
c
c    over the interval (-oo,+oo).
c
c    When MU = 0, the generalized Hermite polynomial reduces to the standard
c    Hermite polynomial.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    26 February 2010
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Theodore Chihara,
c    An Introduction to Orthogonal Polynomials,
c    Gordon and Breach, 1978,
c    ISBN: 0677041500,
c    LC: QA404.5 C44.
c
c  Parameters:
c
c    Input, integer N, the highest order polynomial to compute.
c
c    Input, double precision X, the point at which the polynomials are 
c    to be evaluated.
c
c    Input, double precision MU, the parameter.
c    - 1 / 2 < MU.
c
c    Output, double precision P(0:N), the values of the first N+1
c    polynomials at the point X.
c
      implicit none

      integer n

      integer i
      double precision mu
      double precision p(0:n)
      double precision theta
      double precision x

      if ( n .lt. 0 ) then
        return
      end if

      p(0) = 1.0D+00

      if ( n .eq. 0 ) then
        return
      end if

      p(1) = 2.0D+00 * x
     
      do i = 1, n - 1

        if ( mod ( i, 2 ) .eq. 0 ) then
          theta = 0.0D+00
        else
          theta = 2.0D+00 * mu
        end if

        p(i+1) = 2.0D+00 * x * p(i) 
     &    - 2.0D+00 * ( dble ( i ) + theta ) * p(i-1)

      end do
     
      return
      end
