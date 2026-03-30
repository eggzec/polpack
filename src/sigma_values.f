      subroutine sigma_values ( n_data, n, c )

c*********************************************************************72
c
cc SIGMA_VALUES returns some values of the Sigma function.
c
c  Discussion:
c
c    SIGMA(N) is the sum of the distinct divisors of N, including 1 and N.
c
c    In Mathematica, the function can be evaluated by:
c
c      DivisorSigma[1,n]
c
c    The formula is:
c
c    SIGMA(U*V) = SIGMA(U) * SIGMA(V) if U and V are relatively prime.
c
c    SIGMA(P^K) = ( P^(K+1) - 1 ) / ( P - 1 ) if P is prime.
c
c  First values:
c
c     N  SIGMA(N)
c
c     1    1
c     2    3
c     3    4
c     4    7
c     5    6
c     6   12
c     7    8
c     8   15
c     9   13
c    10   18
c    11   12
c    12   28
c    13   14
c    14   24
c    15   24
c    16   31
c    17   18
c    18   39
c    19   20
c    20   42
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
c    Output, integer N, the argument of the Sigma function.
c
c    Output, integer C, the value of the Sigma function.
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
     &   1,    3,    4,    7,    6,   12,    8,   15,   13,   18,
     &  72,  128,  255,  176,  576, 1170,  618,  984, 2232, 2340 /
      data n_vec /
     &    1,   2,   3,   4,   5,   6,   7,   8,   9,   10,
     &   30, 127, 128, 129, 210, 360, 617, 815, 816, 1000 /

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
