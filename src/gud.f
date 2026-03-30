      function gud ( x )

c*********************************************************************72
c
cc GUD evaluates the Gudermannian function.
c
c  Discussion:
c
c    The Gudermannian function relates the hyperbolic and trigonometric
c    functions.  For any argument X, there is a corresponding value
c    GAMMA so that
c
c      sinh(x) = tan(gamma).
c
c    The value GAMMA is called the Gudermannian of X.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    02 March 1999
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, double precision X, the argument of the Gudermannian.
c
c    Output, double precision GUD, the value of the Gudermannian.
c
      implicit none

      double precision gud
      double precision x

      gud = 2.0D+00 * atan ( tanh ( 0.5D+00 * x ) )

      return
      end
