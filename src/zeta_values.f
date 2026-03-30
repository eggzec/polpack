      subroutine zeta_values ( n_data, n, zeta )

c*********************************************************************72
c
cc ZETA_VALUES returns some values of the Riemann Zeta function.
c
c  Discussion:
c
c    ZETA(N) = sum ( 1 <= I .lt. +oo ) 1 / I**N
c
c    In Mathematica, the function can be evaluated by:
c
c      Zeta[n]
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
c    Output, integer N, the argument of the Zeta function.
c
c    Output, double precision ZETA, the value of the Zeta function.
c
      implicit none

      integer n_max
      parameter ( n_max = 15 )

      integer n
      integer n_data
      integer n_vec(n_max)
      double precision zeta
      double precision zeta_vec(n_max)

      save n_vec
      save zeta_vec

      data n_vec /
     &   2,
     &   3,
     &   4,
     &   5,
     &   6,
     &   7,
     &   8,
     &   9,
     &  10,
     &  11,
     &  12,
     &  16,
     &  20,
     &  30,
     &  40 /
      data zeta_vec /
     &  0.164493406684822643647D+01,
     &  0.120205690315959428540D+01,
     &  0.108232323371113819152D+01,
     &  0.103692775514336992633D+01,
     &  0.101734306198444913971D+01,
     &  0.100834927738192282684D+01,
     &  0.100407735619794433939D+01,
     &  0.100200839292608221442D+01,
     &  0.100099457512781808534D+01,
     &  0.100049418860411946456D+01,
     &  0.100024608655330804830D+01,
     &  0.100001528225940865187D+01,
     &  0.100000095396203387280D+01,
     &  0.100000000093132743242D+01,
     &  0.100000000000090949478D+01 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        zeta = 0.0D+00
      else
        n = n_vec(n_data)
        zeta = zeta_vec(n_data)
      end if

      return
      end
