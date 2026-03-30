      function r8_psi ( xx )

c*********************************************************************72
c
cc R8_PSI evaluates the function Psi(X).
c
c  Discussion:
c
c    This routine evaluates the logarithmic derivative of the
c    GAMMA function,
c
c      PSI(X) = d/dX (GAMMA(X)) / GAMMA(X) 
c             = d/dX LN ( GAMMA(X) )
c
c    for real X, where either
c
c      -XMAX1 < X < -XMIN  and X is not a negative integer), 
c
c    or
c
c      XMIN < X.
c
c  Modified:
c
c    23 January 2008
c
c  Author:
c
c    William Cody
c
c  Reference:
c
c    William Cody, Anthony Strecok, Henry Thacher,
c    Chebyshev Approximations for the Psi Function,
c    Mathematics of Computation,
c    Volume 27, Number 121, January 1973, pages 123-127.
c
c  Parameters:
c
c    Input, double precision XX, the argument of the function.
c
c    Output, double precision R8_PSI, the value of the function.
c
      implicit none

      double precision aug
      double precision den
      integer i
      integer n
      integer nq
      double precision p1(9)
      double precision p2(7)
      double precision piov4
      double precision q1(8)
      double precision q2(6)
      double precision r8_psi
      double precision sgn
      double precision xlarge
      double precision upper
      double precision w
      double precision x
      double precision xinf
      double precision xmax1
      double precision xmin1
      double precision xsmall
      double precision x01
      double precision x01d
      double precision x02
      double precision xx
      double precision z
c
c  Mathematical constants.  PIOV4 = pi / 4
c
      data piov4 /7.8539816339744830962D-01/
c
c  Machine-dependent constants
c
      data xinf /1.70D+38/
      data xmin1 /5.89D-39/
      data xmax1 /3.60D+16/
      data xsmall /2.05D-09/
      data xlarge /2.04D+15/
c
c  Zero of psi(x)
c
      data x01 /187.0D+00/
      data x01d /128.0D+00/
      data x02 /6.9464496836234126266D-04/
c
c  Coefficients for approximation to  psi(x)/(x-x0)  over [0.5, 3.0]
c
      data p1/4.5104681245762934160d-03,5.4932855833000385356d+00,
     &        3.7646693175929276856d+02,7.9525490849151998065d+03,
     &        7.1451595818951933210d+04,3.0655976301987365674d+05,
     &        6.3606997788964458797d+05,5.8041312783537569993d+05,
     &        1.6585695029761022321d+05/
      data q1/9.6141654774222358525d+01,2.6287715790581193330d+03,
     &        2.9862497022250277920d+04,1.6206566091533671639d+05,
     &        4.3487880712768329037d+05,5.4256384537269993733d+05,
     &        2.4242185002017985252d+05,6.4155223783576225996d-08/
c
c  Coefficients for approximation to  psi(x) - ln(x) + 1/(2x)
c  for 3.0 < x.
c
      data p2/-2.7103228277757834192d+00,-1.5166271776896121383d+01,
     &        -1.9784554148719218667d+01,-8.8100958828312219821d+00,
     &        -1.4479614616899842986d+00,-7.3689600332394549911d-02,
     &        -6.5135387732718171306d-21/
      data q2/ 4.4992760373789365846d+01, 2.0240955312679931159d+02,
     &         2.4736979003315290057d+02, 1.0742543875702278326d+02,
     &         1.7463965060678569906d+01, 8.8427520398873480342d-01/

      x = xx
      w = abs ( x )
      aug = 0.0D+00
c
c  Check for valid arguments, then branch to appropriate algorithm.
c
      if ( - x .ge. xmax1 .or. w .lt. xmin1 ) then
        r8_psi = xinf
        if ( 0.0D+00 .lt. x ) then
          r8_psi = -xinf
        end if
        return
      end if

      if ( x .ge. 0.5D+00 ) then
        go to 200
c
c  X < 0.5, use reflection formula: psi(1-x) = psi(x) + pi * cot(pi*x)
c  Use 1/X for PI*COTAN(PI*X)  when  XMIN1 < |X| <= XSMALL.
c
      else if ( w .le. xsmall ) then
        aug = - 1.0D+00 / x
        go to 150
      end if
c
c  Argument reduction for cotangent.
c
  100 continue

      if ( x .lt. 0.0D+00 ) then
        sgn = piov4
      else
        sgn = - piov4
      end if

      w = w - aint ( w )
      nq = int ( w * 4.0D+00 )
      w = 4.0D+00 * ( w - dble ( nq ) * 0.25D+00 )
c
c  W is now related to the fractional part of 4.0 * X.
c  Adjust argument to correspond to values in the first
c  quadrant and determine the sign.
c
      n = nq / 2

      if ( n + n .ne. nq ) then
        w = 1.0D+00 - w
      end if

      z = piov4 * w

      if ( mod ( n, 2 ) .ne. 0 ) then
        sgn = - sgn
      end if
c
c  Determine the final value for  -pi * cotan(pi*x).
c
      n = ( nq + 1 ) / 2
      if ( mod ( n, 2 ) .eq. 0 ) then
c
c  Check for singularity.
c
        if ( z .eq. 0.0D+00 ) then
          r8_psi = xinf
          if ( 0.0D+00 .lt. x ) then
            r8_psi = -xinf
          end if
          return
        end if

        aug = sgn * ( 4.0D+00 / tan ( z ) )

      else
        aug = sgn * ( 4.0D+00 * tan ( z ) )
      end if

  150 continue

      x = 1.0D+00 - x

  200 continue
c
c  0.5 <= X <= 3.0.
c
      if ( x .le. 3.0D+00 ) then

        den = x
        upper = p1(1) * x
        do i = 1, 7
          den = ( den + q1(i) ) * x
          upper = ( upper + p1(i+1) ) * x
        end do
        den = ( upper + p1(9) ) / ( den + q1(8) )
        x = ( x - x01 / x01d ) - x02
        r8_psi = den * x + aug
        return

      end if
c
c  3.0 < X.
c
      if ( x .lt. xlarge ) then
        w = 1.0D+00 / ( x * x )
        den = w
        upper = p2(1) * w
        do i = 1, 5
          den = ( den + q2(i) ) * w
          upper = ( upper + p2(i+1) ) * w
        end do
        aug = ( upper + p2(7) ) / ( den + q2(6) ) - 0.5D+00 / x + aug
      end if

      r8_psi = aug + log ( x )

      return
      end
