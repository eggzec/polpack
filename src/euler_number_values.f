      subroutine euler_number_values ( n_data, n, c )

c*********************************************************************72
c
cc EULER_NUMBER_VALUES returns some values of the Euler numbers.
c
c  Discussion:
c
c    In Mathematica, the function can be evaluated by:
c
c      EulerE[n]
c
c    These numbers rapidly get too big to store in an ordinary integer.
c
c    The terms of odd index are 0.
c
c    E(N) = -C(N,N-2) * E(N-2) - C(N,N-4) * E(N-4) - ... - C(N,0) * E(0).
c
c  First terms:
c
c    E0  = 1
c    E1  = 0
c    E2  = -1
c    E3  = 0
c    E4  = 5
c    E5  = 0
c    E6  = -61
c    E7  = 0
c    E8  = 1385
c    E9  = 0
c    E10 = -50521
c    E11 = 0
c    E12 = 2702765
c    E13 = 0
c    E14 = -199360981
c    E15 = 0
c    E16 = 19391512145
c    E17 = 0
c    E18 = -2404879675441
c    E19 = 0
c    E20 = 370371188237525
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    04 February 2015
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
c    Output, integer N, the order of the Euler number.
c
c    Output, integer C, the value of the Euler number.
c
      implicit none

      integer n_max
      parameter ( n_max = 8 )

      integer c
      integer c_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)

      save c_vec
      save n_vec

      data c_vec /
     &  1, 0, -1, 5, -61, 1385, -50521, 2702765 /
      data n_vec /
     &   0, 1, 2, 4, 6, 8, 10, 12 /

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
