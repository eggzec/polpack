      subroutine bernoulli_poly ( n, x, bx )

c*********************************************************************72
c
cc BERNOULLI_POLY evaluates the Bernoulli polynomial of order N at X.
c
c  Discussion:
c
c    B(N,0) = B(N,1) = B(N), the N-th Bernoulli number.
c
c    B'(N,X) = N * B(N-1,X)
c
c    B(N,X+1) - B(N,X) = N * X^(N-1)
c    B(N,X) = (-1)^N * B(N,1-X)
c
c    The formula is:
c
c      B(N,X) = sum ( 1 <= K <= N ) B(K) * C(N,K) * X^(N-K)
c
c  First values:
c
c    B(0,X)  1
c    B(1,X)  X    - 1/2
c    B(2,X)  X^2 -   X      +  1/6
c    B(3,X)  X^3 - 3/2*X^2 +  1/2*X
c    B(4,X)  X^4 - 2*X^3   +      X^2 - 1/30
c    B(5,X)  X^5 - 5/2*X^4 +  5/3*X^3 - 1/6*X
c    B(6,X)  X^6 - 3*X^5   +  5/2*X^4 - 1/2*X^2 + 1/42
c    B(7,X)  X^7 - 7/2*X^6 +  7/2*X^5 - 7/6*X^3 + 1/6*X
c    B(8,X)  X^8 - 4*X^7   + 14/3*X^6 - 7/3*X^4 + 2/3*X^2 - 1/30
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    05 December 2007
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
c    Input, double precision X, the value of X at which the polynomial is to
c    be evaluated.
c
c    Output, double precision BX, the value of B(N,X).
c
      implicit none

      integer n

      double precision bx
      integer c(0:n)
      integer i
      double precision work(0:n)
      double precision x

      call bernoulli_number ( n, work )
c
c  Get row N of Pascal's triangle.
c
      do i = 0, n
        call comb_row_next ( i, c )
      end do

      bx = 1.0D+00
      do i = 1, n
        bx = bx * x + work(i) * dble ( c(i) )
      end do

      return
      end
