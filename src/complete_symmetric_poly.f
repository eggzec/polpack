      subroutine complete_symmetric_poly ( n, r, x, value )

c*********************************************************************72
c
cc COMPLETE_SYMMETRIC_POLY evaluates a complete symmetric polynomial.
c
c  Discussion:
c
c    N\R  0   1         2               3
c      +--------------------------------------------------------
c    0 |  1   0         0               0
c    1 |  1   X1        X1^2            X1^3
c    2 |  1   X1+X2     X1^2+X1X2+X2^2  X1^3+X1^2X2+X1X2^2+X2^3
c    3 |  1   X1+X2+X3  ...
c
c    If X = ( 1, 2, 3, 4, 5, ... ) then
c
c    N\R  0     1     2     3     4 ...
c      +--------------------------------------------------------
c    0 |  1     0     0     0     0
c    1 |  1     1     1     1     1
c    2 |  1     3     7    15    31
c    3 |  1     6    25    90   301
c    4 |  1    10    65   350  1701
c    5 |  1    15   140  1050  6951
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    04 November 2013
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the number of variables.
c    0 <= N.
c
c    Input, integer R, the degree of the polynomial.
c    0 <= R.
c
c    Input, double precision X(N), the value of the variables.
c
c    Output, double precision VALUE, the value of TAU(N,R)(X).
c
      implicit none

      integer n
      integer r

      integer i
      integer nn
      integer rr
      double precision tau(0:max(n,r))
      double precision value
      double precision x(n)

      if ( n .lt. 0 ) then
        write ( *, '(a)' ) ''
        write ( *, '(a)' ) 'COMPLETE_SYMMETRIC_POLY - Fatal error!'
        write ( *, '(a)' ) '  N < 0.'
        stop 1
      end if

      if ( r .lt. 0 ) then
        write ( *, '(a)' ) ''
        write ( *, '(a)' ) 'COMPLETE_SYMMETRIC_POLY - Fatal error!'
        write ( *, '(a)' ) '  R < 0.'
        stop 1
      end if

      do i = 0, max ( n, r )
        tau(i) = 0.0D+00
      end do

      tau(0) = 1.0D+00
      do nn = 1, n
        do rr = 1, r
          tau(rr) = tau(rr) + x(nn) * tau(rr-1)
        end do
      end do

      value = tau(r)

      return
      end
