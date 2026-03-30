      subroutine omega_values ( n_data, n, c )

c*********************************************************************72
c
cc OMEGA_VALUES returns some values of the OMEGA function.
c
c  Discussion:
c
c    In Mathematica, the function can be evaluated by
c
c      Length [ FactorInteger [ n ] ]
c
c    If N = 1, then
c
c      OMEGA(N) = 1
c
c    else if the prime factorization of N is
c
c      N = P1**E1 * P2**E2 * ... * PM**EM,
c
c    then
c
c      OMEGA(N) = M
c
c  Example:
c
c     N   OMEGA(N)
c
c     1    1
c     2    1
c     3    1
c     4    1
c     5    1
c     6    2
c     7    1
c     8    1
c     9    1
c    10    2
c    11    1
c    12    2
c    13    1
c    14    2
c    15    2
c    16    1
c    17    1
c    18    2
c    19    1
c    20    2
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
c    Output, integer N, the argument of the OMEGA function.
c
c    Output, integer C, the value of the OMEGA function.
c
      implicit none

      integer n_max
      parameter ( n_max = 23 )

      integer c
      integer c_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)

      save c_vec
      save n_vec

      data c_vec /
     &    1,   1,   1,   1,   1,
     &    2,   1,   1,   1,   2,
     &    3,   1,   4,   4,   3,
     &    1,   5,   2,   2,   1,
     &    6,   7,   8 /
      data n_vec /
     &         1,
     &         2,
     &         3,
     &         4,
     &         5,
     &         6,
     &         7,
     &         8,
     &         9,
     &        10,
     &        30,
     &       101,
     &       210,
     &      1320,
     &      1764,
     &      2003,
     &      2310,
     &      2827,
     &      8717,
     &     12553,
     &     30030,
     &    510510,
     &   9699690 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        c = 0
      else
        n = n_vec(n_data)
        c = c_vec(n_data)
      end if

      return
      end
