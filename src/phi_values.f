      subroutine phi_values ( n_data, n, c )

c*********************************************************************72
c
cc PHI_VALUES returns some values of the PHI function.
c
c  Discussion:
c
c    PHI(N) is the number of integers between 1 and N which are
c    relatively prime to N.  I and J are relatively prime if they
c    have no common factors.  The function PHI(N) is known as
c    "Euler's totient function".
c
c    By convention, 1 and N are relatively prime.
c
c    In Mathematica, the function can be evaluated by:
c
c      EulerPhi[n]
c
c    The formula is:
c
c      PHI(U*V) = PHI(U) * PHI(V) if U and V are relatively prime.
c
c      PHI(P**K) = P**(K-1) * ( P - 1 ) if P is prime.
c
c      PHI(N) = N * Product ( P divides N ) ( 1 - 1 / P )
c
c      N = Sum ( D divides N ) PHI(D).
c
c  Example:
c
c     N  PHI(N)
c
c     1    1
c     2    1
c     3    2
c     4    2
c     5    4
c     6    2
c     7    6
c     8    4
c     9    6
c    10    4
c    11   10
c    12    4
c    13   12
c    14    6
c    15    8
c    16    8
c    17   16
c    18    6
c    19   18
c    20    8
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
c    Output, integer N, the argument of the PHI function.
c
c    Output, integer C, the value of the PHI function.
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
     &    1,   1,   2,   2,   4,   2,   6,   4,   6,   4,
     &    8,   8,  16,  20,  16,  40, 148, 200, 200, 648 /
      data n_vec /
     &    1,   2,   3,   4,   5,   6,   7,   8,   9,  10,
     &   20,  30,  40,  50,  60, 100, 149, 500, 750, 999 /

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
