      subroutine bernoulli_number2 ( n, b )

c*********************************************************************72
c
cc BERNOULLI_NUMBER2 evaluates the Bernoulli numbers.
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
c    Note that the Bernoulli numbers grow rapidly.  Bernoulli number
c    62 is probably the last that can be computed on the VAX without
c    overflow.
c
c    A different method than that used in BERN is employed.
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
c  Recursion:
c
c    With C(N+1,K) denoting the standard binomial coefficient,
c
c    B(0) = 1.0
c    B(N) = - ( sum ( 0 <= K < N ) C(N+1,K) * B(K) ) / C(N+1,N)
c
c  Special Values:
c
c    Except for B(1), all Bernoulli numbers of odd index are 0.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    04 December 2007
c
c  Parameters:
c
c    Input, integer N, the highest order Bernoulli number
c    to compute.
c
c    Output, double precision B(0:N), the requested Bernoulli numbers.
c
      implicit none

      integer n

      double precision altpi
      double precision b(0:n)
      integer i
      integer k
      integer kmax
      parameter ( kmax = 400 )
      double precision pi
      parameter ( pi = 3.141592653589793D+00 )
      double precision sgn
      double precision sum2
      double precision t
      double precision term
      double precision tol
      parameter ( tol = 1.0D-06 )

      if ( n .lt. 0 ) then
        return
      end if

      b(0) = 1.0D+00

      if ( n .lt. 1 ) then
        return
      end if

      b(1) = -0.5D+00

      if ( n .lt. 2 ) then
        return
      end if

      altpi = log ( 2.0D+00 * pi )
c
c  Initial estimates for B(I), I = 2 to N
c
      b(2) = log ( 2.0D+00 )
      do i = 3, n
        if ( mod ( i, 2 ) .eq. 1 ) then
          b(i) = 0.0D+00
        else
          b(i) = log ( dble ( i * ( i - 1 ) ) ) + b(i-2)
        end if
      end do

      b(2) = 1.0D+00 / 6.0D+00

      if ( n .le. 3 ) then
        return
      end if

      b(4) = -1.0D+00 / 30.0D+00

      sgn = -1.0D+00

      do i = 6, n, 2

        sgn = -sgn
        t = 2.0D+00 * sgn * exp ( b(i) - dble ( i ) * altpi )

        sum2 = 1.0D+00

        do k = 2, kmax

          term = dble ( k )**(-i)
          sum2 = sum2 + term

          if ( term .le. tol * sum2 ) then
            exit
          end if

        end do

        b(i) = t * sum2

      end do

      return
      end
