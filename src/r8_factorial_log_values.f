      subroutine r8_factorial_log_values ( n_data, n, fn )

c*********************************************************************72
c
cc R8_FACTORIAL_LOG_VALUES returns values of log(factorial(n)).
c
c  Discussion:
c
c    The function log(factorial(n)) can be written as
c
c     log(factorial(n)) = sum ( 1 <= i <= n ) log ( i )
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    25 March 2007
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
c    Output, integer N, the argument of the function.
c
c    Output, double precision FN, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 27 )

      double precision fn
      double precision fn_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)

      save fn_vec
      save n_vec

      data fn_vec /
     &  0.0000000000000000D+00,
     &  0.0000000000000000D+00,
     &  0.6931471805599453D+00,
     &  0.1791759469228055D+01,
     &  0.3178053830347946D+01,
     &  0.4787491742782046D+01,
     &  0.6579251212010101D+01,
     &  0.8525161361065414D+01,
     &  0.1060460290274525D+02,
     &  0.1280182748008147D+02,
     &  0.1510441257307552D+02,
     &  0.1750230784587389D+02,
     &  0.1998721449566189D+02,
     &  0.2255216385312342D+02,
     &  0.2519122118273868D+02,
     &  0.2789927138384089D+02,
     &  0.3067186010608067D+02,
     &  0.3350507345013689D+02,
     &  0.3639544520803305D+02,
     &  0.3933988418719949D+02,
     &  0.4233561646075349D+02,
     &  0.5800360522298052D+02,
     &  0.1484777669517730D+03,
     &  0.3637393755555635D+03,
     &  0.6050201058494237D+03,
     &  0.2611330458460156D+04,
     &  0.5912128178488163D+04 /
      data n_vec /
     &     0,
     &     1,
     &     2,
     &     3,
     &     4,
     &     5,
     &     6,
     &     7,
     &     8,
     &     9,
     &    10,
     &    11,
     &    12,
     &    13,
     &    14,
     &    15,
     &    16,
     &    17,
     &    18,
     &    19,
     &    20,
     &    25,
     &    50,
     &   100,
     &   150,
     &   500,
     &  1000 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        fn = 0.0D+00
      else
        n = n_vec(n_data)
        fn = fn_vec(n_data)
      end if

      return
      end
