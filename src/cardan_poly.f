      subroutine cardan_poly ( n, x, s, cx )

c*********************************************************************72
c
cc CARDAN_POLY evaluates the Cardan polynomials.
c
c  Discussion:
c
c    Writing the N-th polynomial in terms of its coefficients:
c
c      C(N,S,X) = sum ( 0 <= I <= N ) D(N,I) * S**(N-I)/2 * X^I
c
c    then
c
c    D(0,0) = 1
c
c    D(1,1) = 1
c    D(1,0) = 0
c
c    D(N,N) = 1
c    D(N,K) = D(N-1,K-1) - D(N-2,K)
c
c  First terms:
c
c     N  C(N,S,X)
c
c     0  2
c     1  X
c     2  X^2  -  2 S
c     3  X^3  -  3 S X
c     4  X^4  -  4 S X^2 +  2 S^2
c     5  X^5  -  5 S X^3 +  5 S^2 X
c     6  X^6  -  6 S X^4 +  9 S^2 X^2 -  2 S^3
c     7  X^7  -  7 S X^5 + 14 S^2 X^3 -  7 S^3 X
c     8  X^8  -  8 S X^6 + 20 S^2 X^4 - 16 S^3 X^2 +  2 S^4
c     9  X^9  -  9 S X^7 + 27 S^2 X^5 - 30 S^3 X^3 +  9 S^4 X
c    10  X^10 - 10 S X^8 + 35 S^2 X^6 - 50 S^3 X^4 + 25 S^4 X^2 -  2 S^5
c    11  X^11 - 11 S X^9 + 44 S^2 X^7 - 77 S^3 X^5 + 55 S^4 X^3 - 11 S^5 X
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    03 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Thomas Osler,
c    Cardan Polynomials and the Reduction of Radicals,
c    Mathematics Magazine, 
c    Volume 74, Number 1, February 2001, pages 26-32.
c
c  Parameters:
c
c    Input, integer N, the highest polynomial to compute.
c
c    Input, double precision X, the point at which the polynomials 
c    are to be computed.
c
c    Input, double precision S, the value of the parameter, which 
c    must be positive.
c
c    Output, double precision CX(0:N), the values of the Cardan 
c    polynomials at X.
c
      implicit none

      integer n

      double precision cx(0:n)
      double precision fact
      integer i
      double precision s
      double precision s2
      double precision x
      double precision x2(1)

      s2 = sqrt ( s )
      x2(1) = 0.5D+00 * x / s2

      call cheby_t_poly ( 1, n, x2, cx )

      fact = 1.0D+00

      do i = 0, n
        cx(i) = 2.0D+00 * fact * cx(i)
        fact = fact * s2
      end do
     
      return
      end
