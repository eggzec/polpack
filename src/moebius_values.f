      subroutine moebius_values ( n_data, n, c )

c*********************************************************************72
c
cc MOEBIUS_VALUES returns some values of the Moebius function.
c
c  Discussion:
c
c    MU(N) is defined as follows:
c
c      MU(N) = 1 if N = 1;
c              0 if N is divisible by the square of a prime;
c              (-1)**K, if N is the product of K distinct primes.
c
c    In Mathematica, the function can be evaluated by:
c
c      MoebiusMu[n]
c
c    The Moebius function is related to Euler's totient function:
c
c      PHI(N) = Sum ( D divides N ) MU(D) * ( N / D ).
c
c  First values:
c
c     N  MU(N)
c
c     1    1
c     2   -1
c     3   -1
c     4    0
c     5   -1
c     6    1
c     7   -1
c     8    0
c     9    0
c    10    1
c    11   -1
c    12    0
c    13   -1
c    14    1
c    15    1
c    16    0
c    17   -1
c    18    0
c    19   -1
c    20    0
c
c    Note that, as special cases, MU(N) is -1 if N is a prime, and MU(N) is 0
c    if N is a square, cube, etc.
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
c    Output, integer N, the argument of the Moebius function.
c
c    Output, integer C, the value of the Moebius function.
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
     &    1,  -1,  -1,   0,  -1,   1,  -1,   0,   0,   1,
     &   -1,   0,  -1,   1,   1,   0,  -1,   0,  -1,   0 /
      data n_vec /
     &    1,   2,   3,   4,   5,   6,   7,   8,   9,  10,
     &   11,  12,  13,  14,  15,  16,  17,  18,  19,  20 /

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
