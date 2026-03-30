      function r8_agm ( a, b )

c*********************************************************************72
c
cc R8_AGM computes the arithmetic-geometric mean of A and B.
c
c  Discussion:
c
c    The AGM is defined for nonnegative A and B.
c
c    The AGM of numbers A and B is defined by setting
c
c      A(0) = A,
c      B(0) = B
c
c      A(N+1) = ( A(N) + B(N) ) / 2
c      B(N+1) = sqrt ( A(N) * B(N) )
c
c    The two sequences both converge to AGM(A,B).
c
c    In Mathematica, the AGM can be evaluated by
c
c      ArithmeticGeometricMean [ a, b ]
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    09 February 2008
c
c  Author:
c
c    John Burkardt
c
c  Reference:
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
c    Input, double precision A, B, the arguments whose AGM is to be computed.
c
c    Output, double precision R8_AGM, the arithmetic-geometric mean of A and B.
c
      implicit none

      double precision a
      double precision a2
      double precision b
      double precision b2
      double precision c
      double precision d
      integer it
      integer it_max
      parameter ( it_max = 1000 )
      double precision r8_agm
      double precision r8_epsilon
      double precision tol

      if ( a .lt. 0.0D+00 ) then
        write ( *, '(a)' ) ''
        write ( *, '(a)' ) 'R8_AGM - Fatal error!'
        write ( *, '(a)' ) '  A < 0.0.'
        stop 1
      end if

      if ( b .lt. 0.0D+00 ) then
        write ( *, '(a)' ) ''
        write ( *, '(a)' ) 'R8_AGM - Fatal error!'
        write ( *, '(a)' ) '  B < 0.0.'
        stop 1
      end if

      if ( a .eq. 0.0D+00 .or. b .eq. 0.0D+00 ) then
        r8_agm = 0.0D+00
        return
      end if

      it = 0
      tol = 100.0D+00 * r8_epsilon ( )

      a2 = a
      b2 = b

10    continue

        it = it + 1

        c = ( a2 + b2 ) / 2.0D+00
        d = sqrt ( a2 * b2 )

        if ( abs ( c - d ) .le. tol * ( c + d ) ) then
          go to 20
        end if

        if ( it_max .lt. it ) then
          go to 20
        end if

        a2 = c
        b2 = d

      go to 10

20    continue

      r8_agm = c

      return
      end
