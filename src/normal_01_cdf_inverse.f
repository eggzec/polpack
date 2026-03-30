      function normal_01_cdf_inverse ( p )

c*********************************************************************72
c
cc NORMAL_01_CDF_INVERSE inverts the standard normal CDF.
c
c  Discussion:
c
c    The result is accurate to about 1 part in 10^16.
c
c  Modified:
c
c    13 January 2008
c
c  Author:
c
c    Michael Wichura
c
c  Reference:
c
c    Michael Wichura,
c    Algorithm AS 241:
c    The Percentage Points of the Normal Distribution,
c    Applied Statistics,
c    Volume 37, Number 3, 1988, pages 477-484.
c
c  Parameters:
c
c    Input, double precision P, the value of the cumulative probability 
c    densitity function.  0 < P < 1.
c
c    Output, integer IFAULT, error flag.
c    0, no error.
c    1, P <= 0 or P >= 1.
c
c    Output, double precision NORMAL_01_CDF_INVERSE, the normal deviate value 
c    with the property that the probability of a standard normal deviate being 
c    less than or equal to this value is P.
c
      implicit none

      double precision a0
      double precision a1
      double precision a2
      double precision a3
      double precision a4
      double precision a5
      double precision a6
      double precision a7
      double precision b1
      double precision b2
      double precision b3
      double precision b4
      double precision b5
      double precision b6
      double precision b7
      double precision c0
      double precision c1
      double precision c2
      double precision c3
      double precision c4
      double precision c5
      double precision c6
      double precision c7
      double precision const1
      double precision const2
      double precision d1
      double precision d2
      double precision d3
      double precision d4
      double precision d5
      double precision d6
      double precision d7
      double precision e0
      double precision e1
      double precision e2
      double precision e3
      double precision e4
      double precision e5
      double precision e6
      double precision e7
      double precision f1
      double precision f2
      double precision f3
      double precision f4
      double precision f5
      double precision f6
      double precision f7
      double precision normal_01_cdf_inverse
      double precision p
      double precision q
      double precision r
      double precision split1
      double precision split2

      parameter ( a0 = 3.3871328727963666080D+00 )
      parameter ( a1 = 1.3314166789178437745D+02 )
      parameter ( a2 = 1.9715909503065514427D+03 )
      parameter ( a3 = 1.3731693765509461125D+04 )
      parameter ( a4 = 4.5921953931549871457D+04 )
      parameter ( a5 = 6.7265770927008700853D+04 )
      parameter ( a6 = 3.3430575583588128105D+04 )
      parameter ( a7 = 2.5090809287301226727D+03 )
      parameter ( b1 = 4.2313330701600911252D+01 )
      parameter ( b2 = 6.8718700749205790830D+02 )
      parameter ( b3 = 5.3941960214247511077D+03 )
      parameter ( b4 = 2.1213794301586595867D+04 )
      parameter ( b5 = 3.9307895800092710610D+04 )
      parameter ( b6 = 2.8729085735721942674D+04 )
      parameter ( b7 = 5.2264952788528545610D+03 )
      parameter ( c0 = 1.42343711074968357734D+00 )
      parameter ( c1 = 4.63033784615654529590D+00 )
      parameter ( c2 = 5.76949722146069140550D+00 )
      parameter ( c3 = 3.64784832476320460504D+00 )
      parameter ( c4 = 1.27045825245236838258D+00 )
      parameter ( c5 = 2.41780725177450611770D-01 )
      parameter ( c6 = 2.27238449892691845833D-02 )
      parameter ( c7 = 7.74545014278341407640D-04 )
      parameter ( const1 = 0.180625D+00 )
      parameter ( const2 = 1.6D+00 )
      parameter ( d1 = 2.05319162663775882187D+00 )
      parameter ( d2 = 1.67638483018380384940D+00 )
      parameter ( d3 = 6.89767334985100004550D-01 )
      parameter ( d4 = 1.48103976427480074590D-01 )
      parameter ( d5 = 1.51986665636164571966D-02 )
      parameter ( d6 = 5.47593808499534494600D-04 )
      parameter ( d7 = 1.05075007164441684324D-09 )
      parameter ( e0 = 6.65790464350110377720D+00 )
      parameter ( e1 = 5.46378491116411436990D+00 )
      parameter ( e2 = 1.78482653991729133580D+00 )
      parameter ( e3 = 2.96560571828504891230D-01 )
      parameter ( e4 = 2.65321895265761230930D-02 )
      parameter ( e5 = 1.24266094738807843860D-03 )
      parameter ( e6 = 2.71155556874348757815D-05 )
      parameter ( e7 = 2.01033439929228813265D-07 )
      parameter ( f1 = 5.99832206555887937690D-01 )
      parameter ( f2 = 1.36929880922735805310D-01 )
      parameter ( f3 = 1.48753612908506148525D-02 )
      parameter ( f4 = 7.86869131145613259100D-04 )
      parameter ( f5 = 1.84631831751005468180D-05 )
      parameter ( f6 = 1.42151175831644588870D-07 )
      parameter ( f7 = 2.04426310338993978564D-15 )
      parameter ( split1 = 0.425D+00 )
      parameter ( split2 = 5.D+00 )

      q = p - 0.5D+00

      if ( dabs ( q ) .le. split1 ) then

        r = const1 - q * q

        normal_01_cdf_inverse = q * (((((((
     &      a7   * r 
     &    + a6 ) * r 
     &    + a5 ) * r 
     &    + a4 ) * r 
     &    + a3 ) * r 
     &    + a2 ) * r 
     &    + a1 ) * r 
     &    + a0 ) / (((((((
     &      b7   * r 
     &    + b6 ) * r 
     &    + b5 ) * r 
     &    + b4 ) * r 
     &    + b3 ) * r 
     &    + b2 ) * r 
     &    + b1 ) * r 
     &    + 1.0D+00 )

      else

        if ( q .lt. 0.0D+00 ) then
          r = p
        else
          r = 1.0D+00 - p
        end if

        if ( r .le. 0.0D+00 ) then
          normal_01_cdf_inverse = 0.0D+00
          return
        end if

        r = dsqrt ( - dlog ( r ) )

        if ( r .le. split2 ) then

          r = r - const2

          normal_01_cdf_inverse = (((((((
     &        c7   * r 
     &      + c6 ) * r 
     &      + c5 ) * r 
     &      + c4 ) * r 
     &      + c3 ) * r 
     &      + c2 ) * r 
     &      + c1 ) * r 
     &      + c0 ) / (((((((
     &        d7   * r 
     &      + d6 ) * r 
     &      + d5 ) * r 
     &      + d4 ) * r 
     &      + d3 ) * r 
     &      + d2 ) * r 
     &      + d1 ) * r 
     &      + 1.0D+00 )

        else

          r = r - split2

          normal_01_cdf_inverse = (((((((
     &        e7   * r 
     &      + e6 ) * r 
     &      + e5 ) * r 
     &      + e4 ) * r 
     &      + e3 ) * r 
     &      + e2 ) * r 
     &      + e1 ) * r 
     &      + e0 ) / (((((((
     &        f7   * r 
     &      + f6 ) * r 
     &      + f5 ) * r 
     &      + f4 ) * r 
     &      + f3 ) * r 
     &      + f2 ) * r 
     &      + f1 ) * r 
     &      + 1.0D+00 )

        end if

        if ( q .lt. 0.0D+00 ) then
          normal_01_cdf_inverse = - normal_01_cdf_inverse
        end if

      end if

      return
      end
