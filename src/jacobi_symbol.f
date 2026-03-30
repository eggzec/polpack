      subroutine jacobi_symbol ( q, p, j )

c*********************************************************************72
c
cc JACOBI_SYMBOL evaluates the Jacobi symbol (Q/P).
c
c  Discussion:
c
c    If P is prime, then
c
c      Jacobi Symbol (Q/P) = Legendre Symbol (Q/P)
c
c    Else 
c
c      let P have the prime factorization
c
c        P = Product ( 1 <= I <= N ) P(I)^E(I)
c
c      Jacobi Symbol (Q/P) =
c
c        Product ( 1 <= I <= N ) Legendre Symbol (Q/P(I))^E(I)
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
c    Daniel Zwillinger,
c    CRC Standard Mathematical Tables and Formulae,
c    30th Edition,
c    CRC Press, 1996, pages 86-87.
c
c  Parameters:
c
c    Input, integer Q, an integer whose Jacobi symbol with
c    respect to P is desired.
c
c    Input, integer P, the number with respect to which the Jacobi
c    symbol of Q is desired.  P should be 2 or greater.
c
c    Output, integer J, the Jacobi symbol (Q/P).
c    Ordinarily, J will be -1, 0 or 1.
c    -2, not enough factorization space.
c    -3, an error during Legendre symbol calculation.
c    
      implicit none

      integer maxfactor
      parameter ( maxfactor = 20 )

      integer factor(maxfactor)
      integer i
      integer j
      integer l
      integer nfactor
      integer nleft
      integer p
      integer power(maxfactor)
      integer pp
      integer q
      integer qq
c
c  P must be greater than 1.
c
      if ( p .le. 1 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'JACOBI_SYMBOL - Fatal error!'
        write ( *, '(a)' ) '  P must be greater than 1.'
        l = -2
        return
      end if
c
c  Decompose P into factors of prime powers.
c
      call i4_factor ( p, maxfactor, nfactor, factor, power, nleft )

      if ( nleft .ne. 1 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'JACOBI_SYMBOL - Fatal error!'
        write ( *, '(a)' ) '  Not enough factorization space.'
        j = -2
        return
      end if
c
c  Force Q to be nonnegative.
c
      qq = q

10    continue

      if ( qq .lt. 0 ) then
        qq = qq + p
        go to 10
      end if
c
c  For each prime factor, compute the Legendre symbol, and
c  multiply the Jacobi symbol by the appropriate factor.
c
      j = 1
      do i = 1, nfactor
        pp = factor(i)
        call legendre_symbol ( qq, pp, l )
        if ( l .lt. -1 ) then
          write ( *, '(a)' ) ' '
          write ( *, '(a)' ) 'JACOBI_SYMBOL - Fatal error!'
          write ( *, '(a)' ) 
     &      '  Error during Legendre symbol calculation.'
          j = -3
          return
        end if
        j = j * l ** power(i)
      end do

      return
      end
