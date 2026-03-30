      function r8poly_degree ( na, a )

c*********************************************************************72
c
cc R8POLY_DEGREE returns the degree of a polynomial.
c
c  Discussion:
c
c    The degree of a polynomial is the index of the highest power
c    of X with a nonzero coefficient.
c
c    The degree of a constant polynomial is 0.  The degree of the
c    zero polynomial is debatable, but this routine returns the
c    degree as 0.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    05 January 2015
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer NA, the dimension of A.
c
c    Input, double precision A(0:NA), the coefficients of the polynomials.
c
c    Output, integer R8POLY_DEGREE, the degree of A.
c
      implicit none

      integer na

      double precision a(0:na)
      integer r8poly_degree
      integer value

      value = na

10    continue

      if ( 0 .lt. value ) then

        if ( a(value) .ne. 0.0D+00 ) then
          go to 20
        end if

        value = value - 1

        go to 10

      end if

20    continue

      r8poly_degree = value

      return
      end
