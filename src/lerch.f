      function lerch ( z, s, a )

c*********************************************************************72
c
cc LERCH estimates the Lerch transcendent function.
c
c  Discussion:
c
c    The Lerch transcendent function is defined as:
c
c      LERCH ( Z, S, A ) = Sum ( 0 <= K < +oo ) Z**K / ( A + K )**S
c
c    excluding any term with ( A + K ) = 0.
c
c    In Mathematica, the function can be evaluated by:
c
c      LerchPhi[z,s,a]
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    11 July 2008
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
c  Thanks:
c
c    Oscar van Vlijmen
c
c  Parameters:
c
c    Input, double precision Z, integer S, double precision A, 
c    the parameters of the function.
c
c    Output, double precision LERCH, an approximation to the Lerch
c    transcendent function.
c
      implicit none

      double precision a
      double precision eps
      integer k
      double precision lerch
      integer s
      double precision term
      double precision total
      double precision z
      double precision z_k

      if ( z .le. 0.0D+00 ) then
        lerch = 0.0D+00
        return
      end if

      eps = 1.0D-10
      total = 0.0D+00
      k = 0
      z_k = 1.0D+00

10    continue

        if ( a + dble ( k ) .ne. 0.0D+00 ) then

          term = z_k / ( a + dble ( k ) )**s
          total = total + term

          if ( abs ( term ) <= eps * ( 1.0D+00 + abs ( total ) ) ) then
            go to 20
          end if

        end if

        k = k + 1
        z_k = z_k * z

        go to 10

20    continue

      lerch = total

      return
      end
