      subroutine legendre_symbol ( q, p, l )

c*********************************************************************72
c
cc LEGENDRE_SYMBOL evaluates the Legendre symbol (Q/P).
c
c  Discussion:
c
c    Let P be an odd prime.  Q is a QUADRATIC RESIDUE modulo P
c    if there is an integer R such that R*R = Q ( mod P ).
c    The Legendre symbol ( Q / P ) is defined to be:
c
c      + 1 if Q ( mod P ) /= 0 and Q is a quadratic residue modulo P,
c      - 1 if Q ( mod P ) /= 0 and Q is not a quadratic residue modulo P,
c        0 if Q ( mod P ) .eq. 0.
c
c    We can also define ( Q / P ) for P = 2 by:
c
c      + 1 if Q ( mod P ) /= 0
c        0 if Q ( mod P ) .eq. 0
c
c  Example:
c
c    (0/7) =   0
c    (1/7) = + 1  ( 1*1 = 1 mod 7 )
c    (2/7) = + 1  ( 3*3 = 2 mod 7 )
c    (3/7) = - 1
c    (4/7) = + 1  ( 2*2 = 4 mod 7 )
c    (5/7) = - 1
c    (6/7) = - 1
c
c    Note that for any prime P, exactly half of the integers from 1 to P-1
c    are quadratic residues.
c
c    ( 0 / P ) = 0.
c
c    ( Q / P ) = ( mod ( Q, P ) / P ).
c
c    ( Q / P ) = ( Q1 / P ) * ( Q2 / P ) if Q = Q1 * Q2.
c
c    If Q is prime, and P is prime and greater than 2, then:
c
c      if ( Q .eq. 1 ) then
c
c        ( Q / P ) = 1
c
c      else if ( Q .eq. 2 ) then
c
c        ( Q / P ) = + 1 if mod ( P, 8 ) = 1 or mod ( P, 8 ) = 7,
c        ( Q / P ) = - 1 if mod ( P, 8 ) = 3 or mod ( P, 8 ) = 5.
c
c      else
c
c        ( Q / P ) = - ( P / Q ) if Q = 3 ( mod 4 ) and P = 3 ( mod 4 ),
c                  =   ( P / Q ) otherwise.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    18 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Charles Pinter,
c    A Book of Abstract Algebra,
c    McGraw Hill, 1982, pages 236-237.
c
c    Daniel Zwillinger,
c    CRC Standard Mathematical Tables and Formulae,
c    30th Edition,
c    CRC Press, 1996, pages 86-87.
c
c  Parameters:
c
c    Input, integer Q, an integer whose Legendre symbol with
c    respect to P is desired.
c
c    Input, integer P, a prime number, greater than 1, with respect
c    to which the Legendre symbol of Q is desired.
c
c    Output, integer L, the Legendre symbol (Q/P).
c    Ordinarily, L will be -1, 0 or 1.
c    L = -2, P is less than or equal to 1.
c    L = -3, P is not prime.
c    L = -4, the internal stack of factors overflowed.
c    L = -5, not enough factorization space.
c
      implicit none

      integer maxfactor
      parameter ( maxfactor = 20 )
      integer maxstack
      parameter ( maxstack = 50 )

      integer factor(maxfactor)
      integer i
      logical i4_is_prime
      integer l
      integer nfactor
      integer nleft
      integer nmore
      integer nstack
      integer p
      integer power(maxfactor)
      integer pp
      integer pstack(maxstack)
      integer q
      integer qq
      integer qstack(maxstack)
      integer t
c
c  P must be greater than 1.
c
      if ( p .le. 1 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'LEGENDRE_SYMBOL - Fatal error!'
        write ( *, '(a)' ) '  P must be greater than 1.'
        l = -2
        return
      end if
c
c  P must be prime.
c
      if ( .not. i4_is_prime ( p ) ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'LEGENDRE_SYMBOL - Fatal error!'
        write ( *, '(a)' ) '  P is not prime.'
        l = -3
        return
      end if
c
c  ( k*P / P ) = 0.
c
      if ( mod ( q, p ) .eq. 0 ) then
        l = 0
        return
      end if
c
c  For the special case P = 2, (Q/P) = 1 for all odd numbers.
c
      if ( p .eq. 2 ) then
        l = 1
        return
      end if
c
c  Make a copy of Q, and force it to be nonnegative.
c
      qq = q

10    continue

      if ( qq .lt. 0 ) then
        qq = qq + p
        go to 10
      end if

      nstack = 0
      pp = p
      l = 1

20    continue

        qq = mod ( qq, pp )
c
c  Decompose QQ into factors of prime powers.
c
        call i4_factor ( qq, maxfactor, nfactor, factor, power, nleft )

        if ( nleft .ne. 1 ) then
          write ( *, '(a)' ) ' '
          write ( *, '(a)' ) 'LEGENDRE_SYMBOL - Fatal error!'
          write ( *, '(a)' ) '  Not enough factorization space.'
          l = - 5
          return
        end if
c
c  Each factor which is an odd power is added to the stack.
c
        nmore = 0

        do i = 1, nfactor

          if ( mod ( power(i), 2 ) .eq. 1 ) then

            nmore = nmore + 1
            nstack = nstack + 1

            if ( maxstack .lt. nstack ) then
              write ( *, '(a)' ) ' '
              write ( *, '(a)' ) 'LEGENDRE_SYMBOL - Fatal error!'
              write ( *, '(a)' ) '  Stack overflowc'
              l = - 4
              return
            end if

            pstack(nstack) = pp
            qstack(nstack) = factor(i)

          end if

        end do

        if ( nmore .ne. 0 ) then

          qq = qstack(nstack)
          nstack = nstack - 1
c
c  Check for a QQ of 1 or 2.
c
          if ( qq .eq. 1 ) then

            l = + 1 * l

          else if ( qq .eq. 2 .and. 
     &            ( mod ( pp, 8 ) .eq. 1 .or. 
     &              mod ( pp, 8 ) .eq. 7 ) ) then

            l = + 1 * l

          else if ( qq .eq. 2 .and. 
     &            ( mod ( pp, 8 ) .eq. 3 .or. 
     &              mod ( pp, 8 ) .eq. 5 ) ) then

            l = - 1 * l

          else

            if ( mod ( pp, 4 ) .eq. 3 .and. 
     &           mod ( qq, 4 ) .eq. 3 ) then
              l = - 1 * l
            end if

            t  = pp
            pp = qq
            qq = t

            go to 20

          end if

        end if
c
c  If the stack is empty, we're done.
c
        if ( nstack .eq. 0 ) then
          go to 30
        end if
c
c  Otherwise, get the last P and Q from the stack, and process them.
c
        pp = pstack(nstack)
        qq = qstack(nstack)
        nstack = nstack - 1

      go to 20

30    continue

      return
      end
