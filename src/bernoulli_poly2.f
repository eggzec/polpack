      subroutine bernoulli_poly2 ( n, x, bx )

c*********************************************************************72
c
cc BERNOULLI_POLY2 evaluates the N-th Bernoulli polynomial at X.
c
c  Discussion:
c
c    BERN(N,0) = BERN(N,1) = B(N), the N-th Bernoulli number.
c
c    B'(N,X) = N*B(N-1,X).
c
c    B(N,X+1) - B(N,X) = N*X^(N-1)
c    B(N,X) = (-1)^N * B(N,1-X)
c
c    The formula is:
c
c      B(N,X) = sum ( 1 <= K <= N ) B(K)*C(N,K)*X^(N-K)
c
c  First values:
c
c    B(0,X)  1
c    B(1,X)  X    - 1/2
c    B(2,X)  X^2 -   X      +  1/6
c    B(3,X)  X^3 - 3*X^2/2 +    X/2
c    B(4,X)  X^4 - 2*X^3   +    X^2   - 1/30
c    B(5,X)  X^5 - 5*X^4/2 +  5*X^3/3 -   X/6
c    B(6,X)  X^6 - 3*X^5   +  5*X^4/2 -   X^2/2 + 1/42
c    B(7,X)  X^7 - 7*X^6/2 +  7*X^5/2 - 7*X^3/6 +   X/6
c    B(8,X)  X^8 - 4*X^7   + 14*X^6/3 - 7*X^4/3 + 2*X^2/3 - 1/30
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    06 December 2007
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the order of the Bernoulli polynomial to
c    be evaluated.  N must be 0 or greater.
c
c    Input, double precision X, the value at which the polynomial is to
c    be evaluated.
c
c    Output, double precision BX, the value of B(N,X).
c
      implicit none

      double precision b
      double precision bx
      double precision fact
      integer i
      integer n
      double precision x

      fact = 1.0D+00

      call bernoulli_number3 ( 0, b )

      bx = b

      do i = 1, n
        fact = fact * dble ( n + 1 - i ) / dble ( i )
        call bernoulli_number3 ( i, b )
        bx = bx * x + fact * b
      end do

      return
      end
