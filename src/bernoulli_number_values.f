      subroutine bernoulli_number_values ( n_data, n, c )

c*********************************************************************72
c
cc BERNOULLI_NUMBER_VALUES returns some values of the Bernoulli numbers.
c
c  Discussion:
c
c    The Bernoulli numbers are rational.
c
c    If we define the sum of the M-th powers of the first N integers as:
c
c      SIGMA(M,N) = sum ( 0 <= I <= N ) I**M
c
c    and let C(I,J) be the combinatorial coefficient:
c
c      C(I,J) = Ic / ( ( I - J )c * Jc )
c
c    then the Bernoulli numbers B(J) satisfy:
c
c      SIGMA(M,N) = 1/(M+1) * sum ( 0 <= J <= M ) C(M+1,J) B(J) * (N+1)**(M+1-J)
c
c    In Mathematica, the function can be evaluated by:
c
c      BernoulliB[n]
c
c    With C(N+1,K) denoting the standard binomial coefficient,
c
c      B(0) = 1.0
c      B(N) = - ( sum ( 0 <= K .lt. N ) C(N+1,K) * B(K) ) / C(N+1,N)
c
c    Except for B(1), all Bernoulli numbers of odd index are 0.
c
c  First values:
c
c   B0  1                   =         1.00000000000
c   B1 -1/2                 =        -0.50000000000
c   B2  1/6                 =         1.66666666666
c   B3  0                   =         0
c   B4 -1/30                =        -0.03333333333
c   B5  0                   =         0
c   B6  1/42                =         0.02380952380
c   B7  0                   =         0
c   B8 -1/30                =        -0.03333333333
c   B9  0                   =         0
c  B10  5/66                =         0.07575757575
c  B11  0                   =         0
c  B12 -691/2730            =        -0.25311355311
c  B13  0                   =         0
c  B14  7/6                 =         1.16666666666
c  B15  0                   =         0
c  B16 -3617/510            =        -7.09215686274
c  B17  0                   =         0
c  B18  43867/798           =        54.97117794486
c  B19  0                   =         0
c  B20 -174611/330          =      -529.12424242424
c  B21  0                   =         0
c  B22  854,513/138         =      6192.123
c  B23  0                   =         0
c  B24 -236364091/2730      =    -86580.257
c  B25  0                   =         0
c  B26  8553103/6           =   1425517.16666
c  B27  0                   =         0
c  B28 -23749461029/870     = -27298231.0678
c  B29  0                   =         0
c  B30  8615841276005/14322 = 601580873.901
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    19 March 2007
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
c    Output, integer N, the order of the Bernoulli number.
c
c    Output, double precision C, the value of the Bernoulli number.
c
      implicit none

      integer n_max
      parameter ( n_max = 10 )

      double precision c
      double precision c_vec(n_max)
      integer n
      integer n_data
      integer n_vec(n_max)

      save c_vec
      save n_vec

      data c_vec /
     &   0.1000000000000000D+01,
     &  -0.5000000000000000D+00,
     &   0.1666666666666667D+00,
     &   0.0000000000000000D+00,
     &  -0.3333333333333333D-01,
     &  -0.2380952380952380D-01,
     &  -0.3333333333333333D-01,
     &   0.7575757575757575D-01,
     &  -0.5291242424242424D+03,
     &   0.6015808739006424D+09 /
      data n_vec /
     &   0,  1,  2,  3,  4, 6,  8, 10, 20, 30 /

      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( n_max .lt. n_data ) then
        n_data = 0
        n = 0
        c = 0.0D+00
      else
        n = n_vec(n_data)
        c = c_vec(n_data)
      end if

      return
      end
