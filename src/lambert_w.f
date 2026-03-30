      function lambert_w ( x )

c*********************************************************************72
c
cc LAMBERT_W estimates the Lambert W function.
c
c  Discussion:
c
c    The function W(X) is defined implicitly by:
c
c      W(X) * e^W(X) = X
c
c    The function is also known as the "Omega" function.
c
c    In Mathematica, the function can be evaluated by:
c
c      W = ProductLog [ X ]
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
c    Robert Corless, Gaston Gonnet, David Hare, David Jeffrey, Donald Knuth,
c    On the Lambert W Function,
c    Advances in Computational Mathematics,
c    Volume 5, 1996, pages 329-359.
c
c    Brian Hayes,
c    "Why W?",
c    The American Scientist,
c    Volume 93, March-April 2005, pages 104-108.
c
c    Eric Weisstein,
c    CRC Concise Encyclopedia of Mathematics,
c    CRC Press, 2002,
c    Second edition,
c    ISBN: 1584883472,
c    LC: QA5.W45
c
c    Stephen Wolfram,
c    The Mathematica Book,
c    Fourth Edition,
c    Cambridge University Press, 1999,
c    ISBN: 0-521-64314-7,
c    LC: QA76.95.W65.
c
c  Parameters:
c
c    Input, double precision X, the argument of the function.
c
c    Output, double precision LAMBERT_W, an approximation to the 
c    Lambert W function.
c
      implicit none

      double precision lambert_w
      double precision lambert_w_crude
      integer it
      integer it_max 
      parameter ( it_max = 100 )
      double precision tol
      parameter ( tol = 1.0D-10 )
      double precision w
      double precision x

      w = lambert_w_crude ( x )
      it = 0

10    continue

        if ( it_max .lt. it ) then
          go to 20
        end if

        if ( abs ( ( x - w * exp ( w ) ) ) .lt.
     &    tol * abs ( ( w + 1.0D+00 ) * exp ( w ) ) ) then
          go to 20
        end if

        w = w - ( w * exp ( w ) - x ) 
     &    / ( ( w + 1.0D+00 ) * exp ( w ) 
     &    - ( w + 2.0D+00 ) * ( w * exp ( w ) - x ) 
     &    / ( 2.0D+00 * w + 2.0D+00 ) )

        it = it + 1

      go to 10

20    continue

      lambert_w = w

      return
      end
