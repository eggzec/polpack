      function agud ( g )

c*********************************************************************72
c
cc AGUD evaluates the inverse Gudermannian function.
c
c  Discussion:
c
c    The Gudermannian function relates the hyperbolic and trigonometric
c    functions.  For any argument X, there is a corresponding value
c    G so that
c
c      SINH(X) = TAN(G).
c
c    This value G(X) is called the Gudermannian of X.  The inverse
c    Gudermannian function is given as input a value G and computes
c    the corresponding value X.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    01 December 2007
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, double precision G, the value of the Gudermannian.
c
c    Output, double precision AGUD, the argument of the Gudermannian.
c
      implicit none

      double precision agud
      double precision g
      double precision r8_pi
      parameter ( r8_pi = 3.141592653589793D+00 )

      agud = log ( tan ( 0.25D+00 * r8_pi + 0.5D+00 * g ) )

      return
      end
