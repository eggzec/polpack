      subroutine cheby_t_poly ( m, n, x, cx )

c*********************************************************************72
c
cc CHEBY_T_POLY evaluates Chebyshev polynomials T(n,x).
c
c  Discussion:
c
c    Chebyshev polynomials are useful as a basis for representing the
c    approximation of functions since they are well conditioned, in the sense
c    that in the interval [-1,1] they each have maximum absolute value 1.
c    Hence an error in the value of a coefficient of the approximation, of
c    size epsilon, is exactly reflected in an error of size epsilon between
c    the computed approximation and the theoretical approximation.
c
c    Typical usage is as follows, where we assume for the moment
c    that the interval of approximation is [-1,1].  The value
c    of N is chosen, the highest polynomial to be used in the
c    approximation.  Then the function to be approximated is
c    evaluated at the N+1 points XJ which are the zeroes of the N+1-th
c    Chebyshev polynomial.  Let these values be denoted by F(XJ).
c
c    The coefficients of the approximation are now defined by
c
c      C(I) = 2/(N+1) * sum ( 1 <= J <= N+1 ) F(XJ) T(I),XJ)
c
c    except that C(0) is given a value which is half that assigned
c    to it by the above formula,
c
c    and the representation is
c
c    F(X) approximated by sum ( 0 <= J <= N ) C(J) T(J,X)
c
c    Now note that, again because of the fact that the Chebyshev polynomials
c    have maximum absolute value 1, if the higher order terms of the
c    coefficients C are small, then we have the option of truncating
c    the approximation by dropping these terms, and we will have an
c    exact value for maximum perturbation to the approximation that
c    this will cause.
c
c    It should be noted that typically the error in approximation
c    is dominated by the first neglected basis function (some multiple of
c    T(N+1,X) in the example above).  If this term were the exact error,
c    then we would have found the minimax polynomial, the approximating
c    polynomial of smallest maximum deviation from the original function.
c    The minimax polynomial is hard to compute, and another important
c    feature of the Chebyshev approximation is that it tends to behave
c    like the minimax polynomial while being easy to compute.
c
c    To evaluate a sum like 
c
c      sum ( 0 <= J <= N ) C(J) T(J,X), 
c
c    Clenshaw's recurrence formula is recommended instead of computing the
c    polynomial values, forming the products and summing.
c
c    Assuming that the coefficients C(J) have been computed
c    for J = 0 to N, then the coefficients of the representation of the
c    indefinite integral of the function may be computed by
c
c      B(I) = ( C(I-1) - C(I+1))/2*(I-1) for I=1 to N+1, 
c
c    with
c 
c      C(N+1)=0
c      B(0) arbitrary.  
c
c    Also, the coefficients of the representation of the derivative of the 
c    function may be computed by:
c
c      D(I) = D(I+2)+2*I*C(I) for I=N-1, N-2, ..., 0, 
c
c    with
c
c      D(N+1) = D(N)=0.
c
c    Some of the above may have to adjusted because of the irregularity of C(0).
c
c    The formula is:
c
c      T(N,X) = COS(N*ARCCOS(X))
c
c  Differential equation:
c
c    (1-X*X) Y'' - X Y' + N N Y = 0
c
c  First terms:
c
c    T(0,X) =  1
c    T(1,X) =  1 X
c    T(2,X) =  2 X^2 -   1
c    T(3,X) =  4 X^3 -   3 X
c    T(4,X) =  8 X^4 -   8 X^2 +  1
c    T(5,X) = 16 X^5 -  20 X^3 +  5 X
c    T(6,X) = 32 X^6 -  48 X^4 + 18 X^2 - 1
c    T(7,X) = 64 X^7 - 112 X^5 + 56 X^3 - 7 X
c
c  Inequality:
c
c    abs ( T(N,X) ) <= 1 for -1 <= X <= 1
c
c  Orthogonality:
c
c    For integration over [-1,1] with weight
c
c      W(X) = 1 / sqrt(1-X*X), 
c
c    if we write the inner product of T(I,X) and T(J,X) as
c
c      < T(I,X), T(J,X) > = integral ( -1 <= X <= 1 ) W(X) T(I,X) T(J,X) dX
c
c    then the result is:
c
c      < T(I,X), T(J,X) > = 0    if I /= J
c      < T(I,X), T(J,X) > = PI/2 if I == J /= 0
c      < T(I,X), T(J,X) > = PI   if I == J == 0
c
c    A discrete orthogonality relation is also satisfied at each of
c    the N zeroes of T(N,X):  sum ( 1 <= K <= N ) T(I,X) * T(J,X)
c                              = 0 if I /= J
c                              = N/2 if I == J /= 0
c                              = N if I == J == 0
c
c  Recursion:
c
c    T(0,X) = 1,
c    T(1,X) = X,
c    T(N,X) = 2 * X * T(N-1,X) - T(N-2,X)
c
c    T'(N,X) = N * ( -X * T(N,X) + T(N-1,X) ) / ( 1 - X^2 )
c
c  Special values:
c
c    T(N,1) = 1
c    T(N,-1) = (-1)^N
c    T(2N,0) = (-1)^N
c    T(2N+1,0) = 0
c    T(N,X) = (-1)^N * T(N,-X)
c
c  Zeroes:
c
c    M-th zero of T(N,X) is X = cos((2*M-1)*PI/(2*N)), M = 1 to N.
c
c  Extrema:
c
c    M-th extremum of T(N,X) is X = cos(PI*M/N), M = 0 to N.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    28 March 2012
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
        cx(i,1) = x(i)
      end do

      do j = 2, n
        do i = 1, m
          cx(i,j) = 2.0D+00 * x(i) * cx(i,j-1) - cx(i,j-2)
        end do
      end do
     
      return
      end
