      subroutine agm_values ( n_data, a, b, fx )

c*********************************************************************72
c
cc AGM_VALUES returns some values of the arithmetic geometric mean.
c
c  Discussion:
c
c    The AGM is defined for nonnegative A and B.
c
c    The AGM of numbers A and B is defined by setting
c
c      A(0) = A,
c      B(0) = B
c
c      A(N+1) = ( A(N) + B(N) ) / 2
c      B(N+1) = sqrt ( A(N) * B(N) )
c
c    The two sequences both converge to AGM(A,B).
c
c    In Mathematica, the AGM can be evaluated by
c
c      ArithmeticGeometricMean [ a, b ]
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    09 February 2008
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
c  Parameters:
c
c    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
c    first call.  On each call, the routine increments N_DATA by 1, and
c    returns the corresponding data; when there is no more data, the
c    output value of N_DATA will be 0 again.
c
c    Output, double precision A, B, the numbers whose AGM is desired.
c
c    Output, double precision FX, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 15 )

      double precision a
      double precision a_vec(n_max) 
      double precision b
      double precision b_vec(n_max) 
      double precision fx
      double precision fx_vec(n_max) 
      integer n_data

      save a_vec
      save b_vec
      save fx_vec

      data a_vec /
     &   22.0D+00, 
     &   83.0D+00, 
     &   42.0D+00, 
     &   26.0D+00, 
     &    4.0D+00, 
     &    6.0D+00, 
     &   40.0D+00,
     &   80.0D+00,
     &   90.0D+00,
     &    9.0D+00,
     &   53.0D+00,
     &    1.0D+00,
     &    1.0D+00,
     &    1.0D+00,
     &    1.5D+00 /
      data b_vec /
     &   96.0D+00,
     &   56.0D+00,
     &    7.0D+00,
     &   11.0D+00,
     &   63.0D+00,
     &   45.0D+00,
     &   75.0D+00,
     &    0.0D+00,
     &   35.0D+00,
     &    1.0D+00,
     &   53.0D+00,
     &    2.0D+00,
     &    4.0D+00,
     &    8.0D+00,
     &    8.0D+00 /
      data fx_vec / 
     &   52.274641198704240049D+00,
     &   68.836530059858524345D+00,
     &   20.659301196734009322D+00,
     &   17.696854873743648823D+00,
     &   23.867049721753300163D+00,
     &   20.717015982805991662D+00,
     &   56.127842255616681863D+00,
     &    0.000000000000000000D+00,
     &   59.269565081229636528D+00,
     &   3.9362355036495554780D+00,
     &   53.000000000000000000D+00,
     &   1.4567910310469068692D+00,
     &   2.2430285802876025701D+00,
     &   3.6157561775973627487D+00,
     &   4.0816924080221632670D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        a = 0.0D+00
        b = 0.0D+00
        fx = 0.0D+00
      else
        a = a_vec(n_data)
        b = b_vec(n_data)
        fx = fx_vec(n_data)
      end if

      return
      end
