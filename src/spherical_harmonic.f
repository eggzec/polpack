      subroutine spherical_harmonic ( l, m, theta, phi, c, s )

c*********************************************************************72
c
cc SPHERICAL_HARMONIC evaluates spherical harmonic functions.
c
c  Discussion:
c
c    The spherical harmonic function Y(L,M,THETA,PHI,X) is the
c    angular part of the solution to Laplace's equation in spherical
c    coordinates.
c
c    Y(L,M,THETA,PHI,X) is related to the associated Legendre
c    function as follows:
c
c      Y(L,M,THETA,PHI,X) = FACTOR * P(L,M,cos(THETA)) * exp ( i * M * PHI )
c
c    Here, FACTOR is a normalization factor:
c
c      FACTOR = sqrt ( ( 2 * L + 1 ) * ( L - M )! / ( 4 * PI * ( L + M )! ) )
c
c    In Mathematica, a spherical harmonic function can be evaluated by
c
c      SphericalHarmonicY [ l, m, theta, phi ]
c
c    Note that notational tradition in physics requires that THETA
c    and PHI represent the reverse of what they would normally mean
c    in mathematical notation; that is, THETA goes up and down, and
c    PHI goes around.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    15 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Milton Abramowitz, Irene Stegun,
c    Handbook of Mathematical Functions,
c    National Bureau of Standards, 1964,
c    ISBN: 0-486-61272-4,
c    LC: QA47.A34.
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
c    Input, integer L, the first index of the spherical harmonic
c    function.  Normally, 0 <= L.
c
c    Input, integer M, the second index of the spherical harmonic 
c    function.  Normally, -L <= M <= L.
c
c    Input, double precision THETA, the polar angle, for which
c    0 <= THETA <= PI.
c
c    Input, double precision PHI, the longitudinal angle, for which
c    0 <= PHI <= 2*PI.
c
c    Output, double precision C(0:L), S(0:L), the real and imaginary
c    parts of the functions Y(L,0:L,THETA,PHI).
c
      implicit none

      integer l

      double precision c(0:l)
      integer i
      integer m
      integer m_abs
      double precision phi
      double precision plm(0:l)
      double precision s(0:l)
      double precision theta

      m_abs = abs ( m )

      call legendre_associated_normalized ( l, m_abs, cos ( theta ), 
     &  plm )

      do i = 0, l
        c(i) = plm(i) * cos ( dble ( m ) * phi )
        s(i) = plm(i) * sin ( dble ( m ) * phi )
      end do

      if ( m .lt. 0 ) then
        do i = 0, l
          c(i) = - c(i)
          s(i) = - s(i)
        end do
      end if

      return
      end
