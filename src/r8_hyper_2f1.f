      subroutine r8_hyper_2f1 ( a_input, b_input, c_input, x_input, hf )

c*********************************************************************72
c
cc R8_HYPER_2F1 evaluates the hypergeometric function F(A,B,C,X).
c
c  Discussion:
c
c    A minor bug was corrected.  The HW variable, used in several places as
c    the "old" value of a quantity being iteratively improved, was not
c    being initialized.  JVB, 11 February 2008.
c
c    The original version of this program allowed the input arguments to
c    be modified, although they were restored to their input values before exit.
c    This is unacceptable if the input arguments are allowed to be constants.
c    The code has been modified so that the input arguments are never modified.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    21 March 2009
c
c  Author:
c
c    Original FORTRAN77 version by Shanjie Zhang, Jianming Jin.
c    This FORTRAN77 version by John Burkardt.
c
c    The original FORTRAN77 version of this routine is copyrighted by
c    Shanjie Zhang and Jianming Jin.  However, they give permission to
c    incorporate this routine into a user program provided that the copyright
c    is acknowledged.
c
c  Reference:
c
c    Shanjie Zhang, Jianming Jin,
c    Computation of Special Functions,
c    Wiley, 1996,
c    ISBN: 0-471-11963-6,
c    LC: QA351.C45
c
c  Parameters:
c
c    Input, double precision A_INPUT, B_INPUT, C_INPUT, X_INPUT, 
c    the arguments of the function.  The user is allowed to pass these
c    values as constants or variables.
c    C_INPUT must not be equal to a nonpositive integer.
c    X_INPUT .lt. 1.
c
c    Output, double precision HF, the value of the function.
c
      implicit none

      double precision a
      double precision a_input
      double precision a0
      double precision aa
      double precision b
      double precision b_input
      double precision bb
      double precision c
      double precision c_input
      double precision c0
      double precision c1
      double precision el
      parameter ( el = 0.5772156649015329D+00 )
      double precision eps
      double precision f0
      double precision f1
      double precision g0
      double precision g1
      double precision g2
      double precision g3
      double precision ga
      double precision gabc
      double precision gam
      double precision gb
      double precision gbm
      double precision gc
      double precision gca
      double precision gcab
      double precision gcb
      double precision gm
      double precision hf
      double precision hw
      integer j
      integer k
      logical l0
      logical l1
      logical l2
      logical l3
      logical l4
      logical l5
      integer m
      integer nm
      double precision pa
      double precision pb
      double precision pi
      parameter ( pi = 3.141592653589793D+00 )
      double precision r
      double precision r0
      double precision r1
      double precision r8_psi
      double precision rm
      double precision rp
      double precision sm
      double precision sp
      double precision sp0
      double precision x
      double precision x_input
      double precision x1
c
c  Immediately copy the input argumentsc
c
      a = a_input
      b = b_input
      c = c_input
      x = x_input

      l0 = ( c .eq. aint ( c ) ) .and. ( c .lt. 0.0D+00 )
      l1 = ( 1.0D+00 - x .lt. 1.0D-15 ) .and. ( c - a - b .le. 0.0D+00 )
      l2 = ( a .eq. aint ( a ) ) .and. ( a .lt. 0.0D+00 )
      l3 = ( b .eq. aint ( b ) ) .and. ( b .lt. 0.0D+00 )
      l4 = ( c - a .eq. aint ( c - a ) ) .and. ( c - a .le. 0.0D+00 )
      l5 = ( c - b .eq. aint ( c - b ) ) .and. ( c - b .le. 0.0D+00 )

      if ( l0 .or. l1 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'R8_HYPER_2F1 - Fatal error!'
        write ( *, '(a)' ) '  The hypergeometric series is divergent.'
        return
      end if

      if ( 0.95D+00 .lt. x ) then
        eps = 1.0D-08
      else
        eps = 1.0D-15
      end if

      if ( x .eq. 0.0D+00 .or. a .eq. 0.0D+00 .or. b .eq. 0.0D+00 ) then

        hf = 1.0D+00
        return

      else if ( 1.0D+00 - x .eq. eps .and. 0.0D+00 .lt. c - a - b ) then

        gc = gamma ( c )
        gcab = gamma ( c - a - b )
        gca = gamma ( c - a )
        gcb = gamma ( c - b )
        hf = gc * gcab / ( gca * gcb )
        return

      else if ( 1.0D+00 + x .le. eps .and. 
     &  abs ( c - a + b - 1.0D+00 ) .le. eps ) then

        g0 = sqrt ( pi ) * 2.0D+00**( - a )
        g1 = gamma ( c )
        g2 = gamma ( 1.0D+00 + a / 2.0D+00 - b )
        g3 = gamma ( 0.5D+00 + 0.5D+00 * a )
        hf = g0 * g1 / ( g2 * g3 )
        return

      else if ( l2 .or. l3 ) then

        if ( l2 ) then
          nm = int ( abs ( a ) )
        end if

        if ( l3 ) then
          nm = int ( abs ( b ) )
        end if

        hf = 1.0D+00
        r = 1.0D+00

        do k = 1, nm
          r = r * ( a + k - 1.0D+00 ) * ( b + k - 1.0D+00 ) 
     &      / ( k * ( c + k - 1.0D+00 ) ) * x
          hf = hf + r
        end do

        return

      else if ( l4 .or. l5 ) then

        if ( l4 ) then
          nm = int ( abs ( c - a ) )
        end if

        if ( l5 ) then
          nm = int ( abs ( c - b ) )
        end if

        hf = 1.0D+00
        r  = 1.0D+00
        do k = 1, nm
          r = r * ( c - a + k - 1.0D+00 ) * ( c - b + k - 1.0D+00 ) 
     &      / ( k * ( c + k - 1.0D+00 ) ) * x
          hf = hf + r
        end do
        hf = ( 1.0D+00 - x )**( c - a - b ) * hf
        return

      end if

      aa = a
      bb = b
      x1 = x

      if ( x .lt. 0.0D+00 ) then
        x = x / ( x - 1.0D+00 )
        if ( a .lt. c .and. b .lt. a .and. 0.0D+00 .lt. b ) then
          a = bb
          b = aa
        end if
        b = c - b
      end if

      if ( 0.75D+00 .le. x ) then

        gm = 0.0D+00

        if ( abs ( c - a - b - aint ( c - a - b ) ) .lt. 1.0D-15 ) then

          m = int ( c - a - b )
          ga = gamma ( a )
          gb = gamma ( b )
          gc = gamma ( c )
          gam = gamma ( a + m )
          gbm = gamma ( b + m )

          pa = r8_psi ( a )
          pb = r8_psi ( b )

          if ( m /= 0 ) then
            gm = 1.0D+00
          end if

          do j = 1, abs ( m ) - 1
            gm = gm * j
          end do

          rm = 1.0D+00
          do j = 1, abs ( m )
            rm = rm * j
          end do

          f0 = 1.0D+00
          r0 = 1.0D+00
          r1 = 1.0D+00
          sp0 = 0.0D+00
          sp = 0.0D+00

          if ( 0 .le. m ) then

            c0 = gm * gc / ( gam * gbm )
            c1 = - gc * ( x - 1.0D+00 )**m / ( ga * gb * rm )

            do k = 1, m - 1
              r0 = r0 * ( a + k - 1.0D+00 ) * ( b + k - 1.0D+00 ) 
     &          / ( k * ( k - m ) ) * ( 1.0D+00 - x )
              f0 = f0 + r0
            end do

            do k = 1, m
              sp0 = sp0 + 1.0D+00 / ( a + k - 1.0D+00 ) 
     &          + 1.0D+00 / ( b + k - 1.0D+00 ) - 1.0D+00 / dble ( k )
            end do

            f1 = pa + pb + sp0 + 2.0D+00 * el + log ( 1.0D+00 - x )
            hw = f1

            do k = 1, 250

              sp = sp + ( 1.0D+00 - a ) / ( k * ( a + k - 1.0D+00 ) ) 
     &          + ( 1.0D+00 - b ) / ( k * ( b + k - 1.0D+00 ) )

              sm = 0.0D+00
              do j = 1, m
                sm = sm + ( 1.0D+00 - a ) 
     &            / ( ( j + k ) * ( a + j + k - 1.0D+00 ) ) 
     &            + 1.0D+00 / ( b + j + k - 1.0D+00 )
              end do

              rp = pa + pb + 2.0D+00 * el + sp + sm 
     &          + log ( 1.0D+00 - x )

              r1 = r1 * ( a + m + k - 1.0D+00 ) 
     &          * ( b + m + k - 1.0D+00 ) 
     &          / ( k * ( m + k ) ) * ( 1.0D+00 - x )

              f1 = f1 + r1 * rp

              if ( abs ( f1 - hw ) .lt. abs ( f1 ) * eps ) then
                exit
              end if

              hw = f1

            end do

            hf = f0 * c0 + f1 * c1

          else if ( m .lt. 0 ) then

            m = - m
            c0 = gm * gc / ( ga * gb * ( 1.0D+00 - x )**m )
            c1 = - ( - 1 )**m * gc / ( gam * gbm * rm )

            do k = 1, m - 1
              r0 = r0 * ( a - m + k - 1.0D+00 ) 
     &          * ( b - m + k - 1.0D+00 ) 
     &          / ( k * ( k - m ) ) * ( 1.0D+00 - x )
              f0 = f0 + r0
            end do

            do k = 1, m
              sp0 = sp0 + 1.0D+00 / dble ( k )
            end do

            f1 = pa + pb - sp0 + 2.0D+00 * el + log ( 1.0D+00 - x )
            hw = f1

            do k = 1, 250

              sp = sp + ( 1.0D+00 - a ) 
     &          / ( k * ( a + k - 1.0D+00 ) ) 
     &          + ( 1.0D+00 - b ) / ( k * ( b + k - 1.0D+00 ) )

              sm = 0.0D+00
              do j = 1, m
                sm = sm + 1.0D+00 / dble ( j + k )
              end do

              rp = pa + pb + 2.0D+00 * el + sp - sm 
     &          + log ( 1.0D+00 - x )

              r1 = r1 * ( a + k - 1.0D+00 ) * ( b + k - 1.0D+00 ) 
     &          / ( k * ( m + k ) ) * ( 1.0D+00 - x )

              f1 = f1 + r1 * rp

              if ( abs ( f1 - hw ) .lt. abs ( f1 ) * eps ) then
                exit
              end if

              hw = f1

            end do

            hf = f0 * c0 + f1 * c1

          end if

        else

          ga = gamma ( a )
          gb = gamma ( b )
          gc = gamma ( c )
          gca = gamma ( c - a )
          gcb = gamma ( c - b )
          gcab = gamma ( c - a - b )
          gabc = gamma ( a + b - c )
          c0 = gc * gcab / ( gca * gcb )
          c1 = gc * gabc / ( ga * gb ) * ( 1.0D+00 - x )**( c - a - b )
          hf = 0.0D+00
          hw = hf
          r0 = c0
          r1 = c1

          do k = 1, 250

            r0 = r0 * ( a + k - 1.0D+00 ) * ( b + k - 1.0D+00 ) 
     &        / ( k * ( a + b - c + k ) ) * ( 1.0D+00 - x )

            r1 = r1 * ( c - a + k - 1.0D+00 ) * ( c - b + k - 1.0D+00 )
     &        / ( k * ( c - a - b + k ) ) * ( 1.0D+00 - x )

            hf = hf + r0 + r1

            if ( abs ( hf - hw ) .lt. abs ( hf ) * eps ) then
              exit
            end if

            hw = hf

          end do

          hf = hf + c0 + c1

        end if

      else

        a0 = 1.0D+00

        if ( a .lt. c .and. c .lt. 2.0D+00 * a .and. 
     &       b .lt. c .and. c .lt. 2.0D+00 * b ) then

          a0 = ( 1.0D+00 - x )**( c - a - b )
          a = c - a
          b = c - b

        end if

        hf = 1.0D+00
        hw = hf
        r = 1.0D+00

        do k = 1, 250

          r = r * ( a + k - 1.0D+00 ) * ( b + k - 1.0D+00 ) 
     &      / ( k * ( c + k - 1.0D+00 ) ) * x

          hf = hf + r

          if ( abs ( hf - hw ) .le. abs ( hf ) * eps ) then
            exit
          end if

          hw = hf

        end do

        hf = a0 * hf

      end if

      if ( x1 .lt. 0.0D+00 ) then
        x = x1
        c0 = 1.0D+00 / ( 1.0D+00 - x )**aa
        hf = c0 * hf
      end if

      a = aa
      b = bb

      if ( 120 .lt. k ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'R8_HYPER_2F1 - Warning!'
        write ( *, '(a)' ) '  A large number of iterations were needed.'
        write ( *, '(a)' ) 
     &    '  The accuracy of the results should be checked.'
      end if

      return
      end
