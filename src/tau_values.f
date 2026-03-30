      subroutine tau_values ( n_data, n, c )

c*********************************************************************72
c
cc TAU_VALUES returns some values of the Tau function.
c
c  Discussion:
c
c    TAU(N) is the number of divisors of N, including 1 and N.
c
c    In Mathematica, the function can be evaluated by:
c
c      DivisorSigma[1,n]
c
c    If the prime factorization of N is
c
c      N = P1^E1 * P2^E2 * ... * PM^EM,
c
c    then
c
c      TAU(N) = ( E1 + 1 ) * ( E2 + 1 ) * ... * ( EM + 1 ).
c
c  First values:
c
c     N   TAU(N)
c
c     1    1
c     2    2
c     3    2
c     4    3
c     5    2
c     6    4
c     7    2
c     8    4
c     9    3
c    10    4
c    11    2
c    12    6
c    13    2
c    14    4
c    15    4
c    16    5
c    17    2
c    18    6
c    19    2
c    20    6
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
c    Output, integer N, the argument of the Tau function.
c
c    Output, integer C, the value of the Tau function.
c
      implicit none

      integer n_max
      parameter ( n_max = 20 )

      integer c
      integer c_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)

      save c_vec
      save n_vec

      data c_vec /
     &  1,  2,  2,  3,  2,  4,  2,  4,  3,  4,
     &  2, 12, 12,  4, 18, 24,  2,  8, 14, 28 /
      data n_vec /
     &    1,   2,   3,   4,   5,   6,   7,   8,   9,  10,
     &   23,  72, 126, 226, 300, 480, 521, 610, 832, 960 /

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
