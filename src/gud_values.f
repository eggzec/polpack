      subroutine gud_values ( n_data, x, fx )

c*********************************************************************72
c
cc GUD_VALUES returns some values of the Gudermannian function.
c
c  Discussion:
c
c    The Gudermannian function relates the hyperbolic and trigonomentric
c    functions.  For any argument X, there is a corresponding value
c    GD so that
c
c      SINH(X) = TAN(GD).
c
c    This value GD is called the Gudermannian of X and symbolized
c    GD(X).  The inverse Gudermannian function is given as input a value
c    GD and computes the corresponding value X.
c
c    GD(X) = 2 * arctan ( exp ( X ) ) - PI / 2
c
c    In Mathematica, the function can be evaluated by:
c
c      2 * Atan[Exp[x]] - Pi/2
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    24 March 2007
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Stephen Wolfram,
c    The Mathematica Book,
c    Fourth Edition,
c    Cambridge University Press, 1999,
c    ISBN: 0-521-64314-7,
c    LC: QA76.95.W65.
c
c    Daniel Zwillinger, editor,
c    CRC Standard Mathematical Tables and Formulae,
c    30th Edition,
c    CRC Press, 1996,
c    ISBN: 0-8493-2479-3,
c    LC: QA47.M315.
c
c  Parameters:
c
c    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
c    first call.  On each call, the routine increments N_DATA by 1, and
c    returns the corresponding data; when there is no more data, the
c    output value of N_DATA will be 0 again.
c
c    Output, double precision X, the argument of the function.
c
c    Output, double precision FX, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 13 )

      double precision fx
      double precision fx_vec(n_max)
      integer n_data
      double precision x
      double precision x_vec(n_max)

      save fx_vec
      save x_vec

      data fx_vec /
     &  -0.1301760336046015D+01,
     &  -0.8657694832396586D+00,
     &   0.0000000000000000D+00,
     &   0.9983374879348662D-01,
     &   0.1986798470079397D+00,
     &   0.4803810791337294D+00,
     &   0.8657694832396586D+00,
     &   0.1131728345250509D+01,
     &   0.1301760336046015D+01,
     &   0.1406993568936154D+01,
     &   0.1471304341117193D+01,
     &   0.1510419907545700D+01,
     &   0.1534169144334733D+01 /
      data x_vec /
     &  -2.0D+00,
     &  -1.0D+00,
     &   0.0D+00,
     &   0.1D+00,
     &   0.2D+00,
     &   0.5D+00,
     &   1.0D+00,
     &   1.5D+00,
     &   2.0D+00,
     &   2.5D+00,
     &   3.0D+00,
     &   3.5D+00,
     &   4.0D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        x = 0.0D+00
        fx = 0.0D+00
      else
        x = x_vec(n_data)
        fx = fx_vec(n_data)
      end if

      return
      end
