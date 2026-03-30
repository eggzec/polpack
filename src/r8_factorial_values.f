      subroutine r8_factorial_values ( n_data, n, fn )

c*********************************************************************72
c
cc R8_FACTORIAL_VALUES returns values of the real factorial function.
c
c  Discussion:
c
c    Factorial(N) = Product ( 1 <= I <= N ) I
c
c    Although the factorial is an integer valued function, it quickly
c    becomes too large for an integer to hold.  This routine still accepts
c    an integer as the input argument, but returns the function value
c    as a real number.
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
c    Output, double precision FN, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 25 )

      double precision fn
      double precision fn_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)

      save fn_vec
      save n_vec

      data fn_vec /
     &  0.1000000000000000D+01,
     &  0.1000000000000000D+01,
     &  0.2000000000000000D+01,
     &  0.6000000000000000D+01,
     &  0.2400000000000000D+02,
     &  0.1200000000000000D+03,
     &  0.7200000000000000D+03,
     &  0.5040000000000000D+04,
     &  0.4032000000000000D+05,
     &  0.3628800000000000D+06,
     &  0.3628800000000000D+07,
     &  0.3991680000000000D+08,
     &  0.4790016000000000D+09,
     &  0.6227020800000000D+10,
     &  0.8717829120000000D+11,
     &  0.1307674368000000D+13,
     &  0.2092278988800000D+14,
     &  0.3556874280960000D+15,
     &  0.6402373705728000D+16,
     &  0.1216451004088320D+18,
     &  0.2432902008176640D+19,
     &  0.1551121004333099D+26,
     &  0.3041409320171338D+65,
     &  0.9332621544394415D+158,
     &  0.5713383956445855D+263 /
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
     &   150 /

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
