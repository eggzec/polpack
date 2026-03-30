      subroutine bernoulli_number ( n, b )

c*********************************************************************72
c
cc BERNOULLI_NUMBER computes the value of the Bernoulli numbers B(0) through B(N).
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
c      C(I,J) = I! / ( ( I - J )! * J! )
c
c    then the Bernoulli numbers B(J) satisfy:
c
c      SIGMA(M,N) = 1/(M+1) * sum ( 0 <= J <= M ) C(M+1,J) B(J) * (N+1)**(M+1-J)
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
c  Warning:
c
c    This recursion, which is used in this routine, rapidly results
c    in significant errors.
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
c    03 December 2007
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the order of the highest Bernoulli
c    number to compute.
c
c    Output, double precision B(0:N), B(I) contains the I-th Bernoulli number.
c
      implicit none

      integer n

      double precision b(0:n)
      double precision b_sum
      integer c(0:n+1)
      integer i
      integer j

      if ( n .lt. 0 ) then
        return
      end if

      b(0) = 1.0D+00

      if ( n .lt. 1 ) then
        return
      end if

      b(1) = -0.5D+00

      c(0) = 1
      c(1) = 2
      c(2) = 1

      do i = 2, n

        call comb_row_next ( i + 1, c )

        if ( mod ( i, 2 ) .eq. 1 ) then

          b(i) = 0.0D+00

        else

          b_sum = 0.0D+00
          do j = 0, i - 1
            b_sum = b_sum + b(j) * dble ( c(j) )
          end do

          b(i) = -b_sum / dble ( c(i) )

        end if

      end do

      return
      end
