      subroutine legendre_function_q_values ( n_data, n, x, fx )

c*********************************************************************72
c
cc LEGENDRE_FUNCTION_Q_VALUES returns values of the Legendre Q function.
c
c  Discussion:
c
c    In Mathematica, the function can be evaluated by:
c
c      LegendreQ[n,x]
c
c  Differential equation:
c
c    (1-X*X) Y'' - 2 X Y' + N (N+1) = 0
c
c  First terms:
c
c    Q(0,X) = 0.5 * log((1+X)/(1-X))
c    Q(1,X) = Q(0,X)*X - 1
c    Q(2,X) = Q(0,X)*(3*X*X-1)/4 - 1.5*X
c    Q(3,X) = Q(0,X)*(5*X*X*X-3*X)/4 - 2.5*X^2 + 2/3
c    Q(4,X) = Q(0,X)*(35*X^4-30*X^2+3)/16 - 35/8 * X^3 + 55/24 * X
c    Q(5,X) = Q(0,X)*(63*X^5-70*X^3+15*X)/16 - 63/8*X^4 + 49/8*X^2 - 8/15
c
c  Recursion:
c
c    Q(0) = 0.5 * log ( (1+X) / (1-X) )
c    Q(1) = 0.5 * X * log ( (1+X) / (1-X) ) - 1.0
c
c    Q(N) = ( (2*N-1) * X * Q(N-1) - (N-1) * Q(N-2) ) / N
c
c  Restrictions:
c
c    -1 .lt. X .lt. 1
c
c  Special values:
c
c    Note that the Legendre function Q(N,X) is equal to the
c    associated Legendre function of the second kind,
c    Q(N,M,X) with M = 0.
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
c    Output, integer N, the order of the function.
c
c    Output, double precision X, the point where the function is evaluated.
c
c    Output, double precision FX, the value of the function.
c
      implicit none

      integer n_max
      parameter ( n_max = 21 )

      double precision fx
      double precision fx_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)
      double precision x
      double precision x_vec(n_max)

      save fx_vec
      save n_vec
      save x_vec

      data fx_vec /
     &   0.2554128118829953D+00,
     &  -0.9361467970292512D+00,
     &  -0.4787614548274669D+00,
     &   0.4246139251747229D+00,
     &   0.5448396833845414D+00,
     &  -0.9451328261673470D-01,
     &  -0.4973516573531213D+00,
     &  -0.1499018843853194D+00,
     &   0.3649161918783626D+00,
     &   0.3055676545072885D+00,
     &  -0.1832799367995643D+00,
     &   0.6666666666666667D+00,
     &   0.6268672028763330D+00,
     &   0.5099015515315237D+00,
     &   0.3232754180589764D+00,
     &   0.8026113738148187D-01,
     &  -0.1986547714794823D+00,
     &  -0.4828663183349136D+00,
     &  -0.7252886849144386D+00,
     &  -0.8454443502398846D+00,
     &  -0.6627096245052618D+00 /
      data n_vec /
     &   0,  1,  2,
     &   3,  4,  5,
     &   6,  7,  8,
     &   9, 10,  3,
     &   3,  3,  3,
     &   3,  3,  3,
     &   3,  3,  3 /
      data x_vec /
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.25D+00,
     &  0.00D+00,
     &  0.10D+00,
     &  0.20D+00,
     &  0.30D+00,
     &  0.40D+00,
     &  0.50D+00,
     &  0.60D+00,
     &  0.70D+00,
     &  0.80D+00,
     &  0.90D+00 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        x = 0.0D+00
        fx = 0.0D+00
      else
        n = n_vec(n_data)
        x = x_vec(n_data)
        fx = fx_vec(n_data)
      end if

      return
      end
