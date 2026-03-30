      subroutine i4_factorial_values ( n_data, n, fn )

c*********************************************************************72
c
cc I4_FACTORIAL_VALUES returns values of the factorial function.
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
c    Milton Abramowitz, Irene Stegun,
c    Handbook of Mathematical Functions,
c    National Bureau of Standards, 1964,
c    ISBN: 0-486-61272-4,
c    LC: QA47.A34.
c
c    Stephen Wolfram,
c    The Mathematica Book,
c    Fourth Edition,
c    Cambridge University Press, 1999,
c    ISBN: 0-521-64314-7,
c    LC: QA76.95.W65.
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
c    Output, integer FN, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 13 )

      integer fn_vec(n_max)
      integer fn
      integer n
      integer n_data
      integer n_vec(n_max)

      save fn_vec
      save n_vec

      data fn_vec /
     &          1,
     &          1,
     &          2,
     &          6,
     &         24,
     &        120,
     &        720,
     &       5040,
     &      40320,
     &     362880,
     &    3628800,
     &   39916800,
     &  479001600 /
      data n_vec /
     &   0,  1,  2,  3,
     &   4,  5,  6,  7,
     &   8,  9, 10, 11,
     &  12 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        fn = 0
      else
        n = n_vec(n_data)
        fn = fn_vec(n_data)
      end if

      return
      end
