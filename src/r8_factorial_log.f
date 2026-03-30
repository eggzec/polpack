      function r8_factorial_log ( n )

c*********************************************************************72
c
cc R8_FACTORIAL_LOG computes log(factorial(N)).
c
c  Discussion:
c
c    The formula is:
c
c      LOG ( FACTORIAL ( N ) ) 
c        = LOG ( product ( 1 <= I <= N ) I )
c        = sum ( ( 1 <= I <= N ) LOG ( I ) )
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
c  Parameters:
c
c    Input, integer N, the argument of the factorial function.
c    If N is less than 1, the value is returned as 0.
c
c    Output, double precision R8_FACTORIAL_LOG, the logarithm of
c    the factorial of N.
c
      implicit none

      integer i
      integer n
      double precision r8_factorial_log

      r8_factorial_log = 0.0D+00

      do i = 1, n
        r8_factorial_log = r8_factorial_log + log ( dble ( i ) )
      end do

      return
      end
