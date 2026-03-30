      function catalan_constant ( )

c*********************************************************************72
c
cc CATALAN_CONSTANT returns the value of Catalan's constant.
c
c  Discussion:
c
c    Catalan's constant, which may be denoted by G, is defined as
c
c      G = sum ( 0 <= K ) ( -1 )**K / ( 2 * K + 1 )^2
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
c    Eric Weisstein,
c    CRC Concise Encyclopedia of Mathematics,
c    CRC Press, 2002,
c    Second edition,
c    ISBN: 1584883472,
c    LC: QA5.W45
c
c  Parameters:
c
c    Output, double precision CATALAN_CONSTANT, the value of Catalan's
c    constant.
c
      implicit none

      double precision catalan_constant

      catalan_constant = 0.915965594177D+00

      return
      end
