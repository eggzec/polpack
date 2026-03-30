      subroutine legendre_associated_values ( n_data, n, m, x, fx )

c*********************************************************************72
c
cc LEGENDRE_ASSOCIATED_VALUES returns values of associated Legendre functions.
c
c  Discussion:
c
c    The function considered is the associated Legendre polynomial P^M_N(X).
c
c    In Mathematica, the function can be evaluated by:
c
c      LegendreP [ n, m, x ]
c
c  Differential equation:
c
c    (1-X*X) * Y'' - 2 * X * Y + ( N (N+1) - (M*M/(1-X*X)) * Y = 0
c
c  First terms:
c
c    M = 0  ( = Legendre polynomials of first kind P(N,X) )
c
c    P00 =    1
c    P10 =    1 X
c    P20 = (  3 X^2 -   1)/2
c    P30 = (  5 X^3 -   3 X)/2
c    P40 = ( 35 X^4 -  30 X^2 +   3)/8
c    P50 = ( 63 X^5 -  70 X^3 +  15 X)/8
c    P60 = (231 X^6 - 315 X^4 + 105 X^2 -  5)/16
c    P70 = (429 X^7 - 693 X^5 + 315 X^3 - 35 X)/16
c
c    M = 1
c
c    P01 =   0
c    P11 =   1 * SQRT(1-X*X)
c    P21 =   3 * SQRT(1-X*X) * X
c    P31 = 1.5 * SQRT(1-X*X) * (5*X*X-1)
c    P41 = 2.5 * SQRT(1-X*X) * (7*X*X*X-3*X)
c
c    M = 2
c
c    P02 =   0
c    P12 =   0
c    P22 =   3 * (1-X*X)
c    P32 =  15 * (1-X*X) * X
c    P42 = 7.5 * (1-X*X) * (7*X*X-1)
c
c    M = 3
c
c    P03 =   0
c    P13 =   0
c    P23 =   0
c    P33 =  15 * (1-X*X)^1.5
c    P43 = 105 * (1-X*X)^1.5 * X
c
c    M = 4
c
c    P04 =   0
c    P14 =   0
c    P24 =   0
c    P34 =   0
c    P44 = 105 * (1-X*X)^2
c
c  Recursion:
c
c    if N .lt. M:
c      P(N,M) = 0
c    if N = M:
c      P(N,M) = (2*M-1)!! * (1-X*X)**(M/2) where N!! means the product of
c      all the odd integers less than or equal to N.
c    if N = M+1:
c      P(N,M) = X*(2*M+1)*P(M,M)
c    if M+1 .lt. N:
c      P(N,M) = ( X*(2*N-1)*P(N-1,M) - (N+M-1)*P(N-2,M) )/(N-M)
c
c  Restrictions:
c
c    -1 <= X <= 1
c     0 <= M <= N
c
c  Special values:
c
c    P(N,0,X) = P(N,X), that is, for M=0, the associated Legendre
c    polynomial of the first kind equals the Legendre polynomial of the
c    first kind.
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
c    Output, integer N, integer M, double precision X,
c    the arguments of the function.
c
c    Output, double precision FX, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 20 )

      double precision fx
      double precision fx_vec(n_max)
      integer m
      integer m_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)
      double precision x
      double precision x_vec(n_max)

      save fx_vec
      save m_vec
      save n_vec
      save x_vec

      data fx_vec /
     &   0.0000000000000000D+00,
     &  -0.5000000000000000D+00,
     &   0.0000000000000000D+00,
     &   0.3750000000000000D+00,
     &   0.0000000000000000D+00,
     &  -0.8660254037844386D+00,
     &  -0.1299038105676658D+01,
     &  -0.3247595264191645D+00,
     &   0.1353164693413185D+01,
     &  -0.2800000000000000D+00,
     &   0.1175755076535925D+01,
     &   0.2880000000000000D+01,
     &  -0.1410906091843111D+02,
     &  -0.3955078125000000D+01,
     &  -0.9997558593750000D+01,
     &   0.8265311444100484D+02,
     &   0.2024442836815152D+02,
     &  -0.4237997531890869D+03,
     &   0.1638320624828339D+04,
     &  -0.2025687389227225D+05 /
      data m_vec /
     &  0, 0, 0, 0,
     &  0, 1, 1, 1,
     &  1, 0, 1, 2,
     &  3, 2, 2, 3,
     &  3, 4, 4, 5 /
      data n_vec /
     &  1,  2,  3,  4,
     &  5,  1,  2,  3,
     &  4,  3,  3,  3,
     &  3,  4,  5,  6,
     &  7,  8,  9, 10 /
      data x_vec /
     &  0.00D+00,
     &  0.00D+00,
     &  0.00D+00,
     &  0.00D+00,
     &  0.00D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.50D+00,
     &  0.20D+00,
     &  0.20D+00,
     &  0.20D+00,
     &  0.20D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        m = 0
        x = 0.0D+00
        fx = 0.0D+00
      else
        n = n_vec(n_data)
        m = m_vec(n_data)
        x = x_vec(n_data)
        fx = fx_vec(n_data)
      end if

      return
      end
