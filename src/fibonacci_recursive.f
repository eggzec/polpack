      subroutine fibonacci_recursive ( n, f )

c*********************************************************************72
c
cc FIBONACCI_RECURSIVE computes the first N Fibonacci numbers.
c
c  Discussion:
c
c    The 'golden ratio' 
c
c      PHI = (1+sqrt(5))/2 
c
c    satisfies the algebraic equation:
c
c      X*X-X-1=0
c
c    which is often written as:
c
c       X        1
c      --- =  ------
c       1      X - 1
c
c    expressing the fact that a rectangle, whose sides are in proportion X:1,
c    is similar to the rotated rectangle after a square of side 1 is removed.
c
c      <----X---->
c 
c      +-----*---*
c      |     |   |  1
c      |     |   | 
c      +-----*---+
c      <--1-><X-1>
c
c    A direct formula for the N-th Fibonacci number can be found.
c
c    Let
c
c      PHIP = ( 1 + sqrt(5) ) / 2
c      PHIM = ( 1 - sqrt(5) ) / 2
c
c    Then
c
c      F(N) = ( PHIP^N + PHIM^N ) / sqrt(5)
c
c    Moreover, F(N) can be computed by computing PHIP**N / sqrt(5) and rounding
c    to the nearest whole number.
c
c    The function 
c
c      F(X) = X / ( 1 - X - X^2 )
c
c    has a power series whose coefficients are the Fibonacci numbers:
c
c      F(X) = 0 + 1*X + 1*X^2 + 2*X^3 + 3*X^4 + 5*X^5+...
c
c  First terms:
c
c      0
c      1
c      1
c      2
c      3
c      5
c      8
c     13
c     21
c     34
c     55
c     89
c    144
c
c    The 40th number is                  102,334,155.
c    The 50th number is               12,586,269,025.
c    The 100th number is 354,224,848,179,261,915,075.
c
c  Recursion:
c
c    F(0) = 0
c    F(1) = 1
c
c    F(N) = F(N-1) + F(N-2)
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    13 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the highest Fibonacci number to compute.
c
c    Output, integer F(N), the first N Fibonacci numbers.
c
      implicit none

      integer n

      integer f(n)
      integer i

      if ( n .le. 0 ) then
        return
      end if

      f(1) = 1

      if ( n .le. 1 ) then
        return
      end if

      f(2) = 1

      do i = 3, n
        f(i) = f(i-1) + f(i-2)
      end do
 
      return
      end
