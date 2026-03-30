      function r8_euler_constant ( )

c*********************************************************************72
c
cc R8_EULER_CONSTANT returns the value of the Euler-Mascheroni constant.
c
c  Discussion:
c
c    The Euler-Mascheroni constant is often denoted by a lower-case gamma.
c
c      gamma = limit ( N -> +oo )
c        ( sum ( 1 <= I <= N ) 1 / I ) - log ( N )
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
c    Output, double precision R8_EULER_CONSTANT, the value of the 
c    Euler-Mascheroni constant.
c
      implicit none

      double precision r8_euler_constant

      r8_euler_constant = 0.577215664901532860606512090082402431042D+00

      return
      end
