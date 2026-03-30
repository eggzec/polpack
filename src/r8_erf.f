      function r8_erf ( x )

c*********************************************************************72
c
cc R8_ERF evaluates the error function.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    04 July 2008
c
c  Author:
c
c    Original FORTRAN77 version by William Cody.
c    Modifications by John Burkardt.
c
c  Reference:
c
c    William Cody,
c    Rational Chebyshev approximations for the error function,
c    Mathematics of Computation, 
c    1969, pages 631-638.
c
c  Parameters:
c
c    Input, double precision X, the argument of the error function.
c
c    Output, double precision R8_ERF, the value of the error function.
c
      implicit none

      double precision a(5)
      double precision b(4)
      double precision c(9)
      double precision d(8)
      double precision del
      double precision r8_erf
      integer i
      double precision p(6)
      double precision q(5)
      double precision r8_epsilon
      double precision sqrpi
      parameter ( sqrpi = 0.56418958354775628695D+00 )
      double precision thresh
      parameter ( thresh = 0.46875D+00 )
      double precision x
      double precision xabs
      double precision xbig
      parameter ( xbig = 26.543D+00 )
      double precision xden
      double precision xnum
      double precision xsq

      save a
      save b
      save c
      save d
      save p
      save q

      data a /
     &  3.16112374387056560D+00, 
     &  1.13864154151050156D+02, 
     &  3.77485237685302021D+02, 
     &  3.20937758913846947D+03, 
     &  1.85777706184603153D-01 /
      data b /
     &  2.36012909523441209D+01, 
     &  2.44024637934444173D+02, 
     &  1.28261652607737228D+03, 
     &  2.84423683343917062D+03 /
      data c /
     &  5.64188496988670089D-01, 
     &  8.88314979438837594D+00, 
     &  6.61191906371416295D+01, 
     &  2.98635138197400131D+02, 
     &  8.81952221241769090D+02, 
     &  1.71204761263407058D+03, 
     &  2.05107837782607147D+03, 
     &  1.23033935479799725D+03, 
     &  2.15311535474403846D-08 /
      data d /
     &  1.57449261107098347D+01, 
     &  1.17693950891312499D+02, 
     &  5.37181101862009858D+02, 
     &  1.62138957456669019D+03, 
     &  3.29079923573345963D+03, 
     &  4.36261909014324716D+03, 
     &  3.43936767414372164D+03, 
     &  1.23033935480374942D+03 /
      data p /
     &  3.05326634961232344D-01, 
     &  3.60344899949804439D-01, 
     &  1.25781726111229246D-01, 
     &  1.60837851487422766D-02, 
     &  6.58749161529837803D-04, 
     &  1.63153871373020978D-02 /
      data q /
     &  2.56852019228982242D+00, 
     &  1.87295284992346047D+00, 
     &  5.27905102951428412D-01, 
     &  6.05183413124413191D-02, 
     &  2.33520497626869185D-03 /

      xabs = abs ( x )
c
c  Evaluate ERF(X) for |X| <= 0.46875.
c
      if ( xabs .le. thresh ) then

        if ( r8_epsilon ( ) .lt. xabs ) then
          xsq = xabs * xabs
        else
          xsq = 0.0D+00
        end if

        xnum = a(5) * xsq
        xden = xsq
        do i = 1, 3
          xnum = ( xnum + a(i) ) * xsq
          xden = ( xden + b(i) ) * xsq
        end do

        r8_erf = x * ( xnum + a(4) ) / ( xden + b(4) )
c
c  Evaluate ERFC(X) for 0.46875 <= |X| <= 4.0.
c
      else if ( xabs .le. 4.0D+00 ) then

        xnum = c(9) * xabs
        xden = xabs
        do i = 1, 7
          xnum = ( xnum + c(i) ) * xabs
          xden = ( xden + d(i) ) * xabs
        end do

        r8_erf = ( xnum + c(8) ) / ( xden + d(8) )
        xsq = aint ( xabs * 16.0D+00 ) / 16.0D+00
        del = ( xabs - xsq ) * ( xabs + xsq )
        r8_erf = exp ( - xsq * xsq ) * exp ( - del ) * r8_erf

        r8_erf = ( 0.5D+00 - r8_erf ) + 0.5D+00

        if ( x .lt. 0.0D+00 ) then
          r8_erf = - r8_erf
        end if
c
c  Evaluate ERFC(X) for 4.0 < |X|.
c
      else

        if ( xbig .le. xabs ) then

          if ( 0.0D+00 .lt. x ) then
            r8_erf = 1.0D+00
          else
            r8_erf = -1.0D+00
          end if

        else

          xsq = 1.0D+00 / ( xabs * xabs )

          xnum = p(6) * xsq
          xden = xsq
          do i = 1, 4
            xnum = ( xnum + p(i) ) * xsq
            xden = ( xden + q(i) ) * xsq
          end do

          r8_erf = xsq * ( xnum + p(5) ) / ( xden + q(5) )
          r8_erf = ( sqrpi - r8_erf ) / xabs
          xsq = aint ( xabs * 16.0D+00 ) / 16.0D+00
          del = ( xabs - xsq ) * ( xabs + xsq )
          r8_erf = exp ( - xsq * xsq ) * exp ( - del ) * r8_erf

          r8_erf = ( 0.5D+00 - r8_erf ) + 0.5D+00
          if ( x .lt. 0.0D+00 ) then
            r8_erf = - r8_erf
          end if

        end if

      end if

      return
      end
