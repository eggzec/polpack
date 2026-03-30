      subroutine cheby_u_poly ( m, n, x, cx )

c*********************************************************************72
c
cc CHEBY_U_POLY evaluates Chebyshev polynomials U(n,x).
c
c  Differential equation:
c
c    (1-X*X) Y'' - 3 X Y' + N (N+2) Y = 0
c
c    The formula is:
c
c      If |X| <= 1, then
c
c        U(N,X) = sin ( (N+1) * arccos(X) ) / sqrt ( 1 - X^2 )
c                = sin ( (N+1) * arccos(X) ) / sin ( arccos(X) )
c
c      else
c
c        U(N,X) = sinh ( (N+1) * arccosh(X) ) / sinh ( arccosh(X) )
c
c  First terms:
c
c    U(0,X) =   1
c    U(1,X) =   2 X
c    U(2,X) =   4 X^2 -   1
c    U(3,X) =   8 X^3 -   4 X
c    U(4,X) =  16 X^4 -  12 X^2 +  1
c    U(5,X) =  32 X^5 -  32 X^3 +  6 X
c    U(6,X) =  64 X^6 -  80 X^4 + 24 X^2 - 1
c    U(7,X) = 128 X^7 - 192 X^5 + 80 X^3 - 8X
c
c  Orthogonality:
c
c    For integration over [-1,1] with weight
c
c      W(X) = sqrt(1-X*X), 
c
c    we have
c
c      < U(I,X), U(J,X) > = integral ( -1 <= X <= 1 ) W(X) U(I,X) U(J,X) dX 
c
c    then the result is:
c
c      < U(I,X), U(J,X) >  =  0    if I /= J
c      < U(I,X), U(J,X) >  =  PI/2 if I == J
c
c  Recursion:
c
c    U(0,X) = 1,
c    U(1,X) = 2 * X,
c    U(N,X) = 2 * X * U(N-1,X) - U(N-2,X)
c
c  Special values:
c
c    U(N,1) = N + 1
c    U(2N,0) = (-1)^N
c    U(2N+1,0) = 0
c    U(N,X) = (-1)^N * U(N,-X)
c
c  Zeroes:
c
c    M-th zero of U(N,X) is X = cos( M*PI/(N+1)), M = 1 to N
c
c  Extrema:
c
c    M-th extremum of U(N,X) is X = cos( M*PI/N), M = 0 to N
c
c  Norm:
c
c    Integral ( -1 <= X <= 1 ) ( 1 - X^2 ) * U(N,X)^2 dX = PI/2
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    01 October 2002
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
c  Parameters:
c
c    Input, integer M, the number of evaluation points.
c
c    Input, integer N, the highest polynomial to compute.
c
c    Input, double precision X(M), the evaluation points.
c
c    Output, double precision CX(M,0:N), the values of the N+1 
c    Chebyshev polynomials.
c
      implicit none

      integer m
      integer n

      double precision cx(m,0:n)
      integer i
      integer j
      double precision x(m)

      if ( n .lt. 0 ) then
        return
      end if

      do i = 1, m
        cx(i,0) = 1.0D+00
      end do

      if ( n .lt. 1 ) then
        return
      end if

      do i = 1, m
        cx(i,1) = 2.0D+00 * x(i)
      end do

      do j = 2, n
        do i = 1, m
          cx(i,j) = 2.0D+00 * x(i) * cx(i,j-1) - cx(i,j-2)
        end do
      end do
 
      return
      end
