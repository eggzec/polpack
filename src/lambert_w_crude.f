      function lambert_w_crude ( x )

c*********************************************************************72
c
cc LAMBERT_W_CRUDE is a crude estimate of the Lambert W function.
c
c  Discussion:
c
c    This crude approximation can be used as a good starting point
c    for an iterative process.
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
c    13 July 2008
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
c    Output, double precision LAMBERT_W_CRUDE, a crude approximation 
c    to the Lambert W function.
c
      implicit none

      double precision lambert_w_crude
      double precision value
      double precision x

      if ( x .le. 500.0D+00 ) then

        value = 0.04D+00 + 0.665D+00 
     &    * ( 1.0D+00 + 0.0195D+00 * log ( x + 1.0D+00 ) ) 
     &    * log ( x + 1.0D+00 )

      else

        value = log ( x - 4.0D+00 ) 
     &    - ( 1.0D+00 - 1.0D+00 / log ( x ) ) * log ( log ( x ) )

      end if

      lambert_w_crude = value

      return
      end
