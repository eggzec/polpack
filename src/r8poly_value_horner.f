      function r8poly_value_horner ( m, c, x )

c*********************************************************************72
c
cc R8POLY_VALUE_HORNER evaluates a polynomial using Horner's method.
c
c  Discussion:
c
c    The polynomial 
c
c      p(x) = c0 + c1 * x + c2 * x^2 + ... + cm * x^m
c
c    is to be evaluated at X.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    02 January 2015
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer M, the degree.
c
c    Input, double precision C(0:M), the polynomial coefficients.  
c    C(I) is the coefficient of X^I.
c
c    Input, double precision X, the evaluation point.
c
c    Output, double precision R8POLY_VALUE_HORNER, the polynomial value.
c
      implicit none

      integer m

      double precision c(0:m)
      integer i
      double precision r8poly_value_horner
      double precision value
      double precision x

      value = c(m)
      do i = m - 1, 0, -1
        value = value * x + c(i)
      end do

      r8poly_value_horner = value

      return
      end
