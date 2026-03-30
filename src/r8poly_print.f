      subroutine r8poly_print ( n, a, title )

c*********************************************************************72
c
cc R8POLY_PRINT prints out a polynomial.
c
c  Discussion:
c
c    The power sum form is:
c
c      p(x) = a(0) + a(1) * x + ... + a(n-1) * x^(n-1) + a(n) * x^(n)
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    26 January 2007
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the dimension of A.
c
c    Input, double precision A(0:N), the polynomial coefficients.
c    A(0) is the constant term and
c    A(N) is the coefficient of X^N.
c
c    Input, character * ( * ) TITLE, an optional title.
c
      implicit none

      integer n

      double precision a(0:n)
      integer i
      double precision mag
      integer n2
      character plus_minus
      integer r8poly_degree
      character * ( * ) title
      integer title_length

      title_length = len_trim ( title )

      if ( 0 .lt. title_length ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) title(1:title_length)
      end if

      write ( *, '(a)' ) ' '

      n2 = r8poly_degree ( n, a )

      if ( a(n2) .lt. 0.0D+00 ) then
        plus_minus = '-'
      else
        plus_minus = ' '
      end if

      mag = abs ( a(n2) )

      if ( 2 .le. n2 ) then
        write ( *, '(a,a1,g14.6,a,i3)' ) 
     &    '  p(x) = ', plus_minus, mag, ' * x ^ ', n2
      else if ( n2 .eq. 1 ) then
        write ( *, '(a,a1,g14.6,a)' ) 
     &    '  p(x) = ', plus_minus, mag, ' * x'
      else if ( n2 .eq. 0 ) then
        write ( *, '(a,a1,g14.6)' ) '  p(x) = ', plus_minus, mag
      end if

      do i = n2-1, 0, -1

        if ( a(i) .lt. 0.0D+00 ) then
          plus_minus = '-'
        else
          plus_minus = '+'
        end if

        mag = abs ( a(i) )

        if ( mag .ne. 0.0D+00 ) then

          if ( 2 .le. i ) then
            write ( *, ' (9x,a1,g14.6,a,i3)' ) 
     &        plus_minus, mag, ' * x ^ ', i
          else if ( i .eq. 1 ) then
            write ( *, ' (9x,a1,g14.6,a)' ) plus_minus, mag, ' * x'
          else if ( i .eq. 0 ) then
            write ( *, ' (9x,a1,g14.6)' ) plus_minus, mag
          end if
        end if

      end do

      return
      end
