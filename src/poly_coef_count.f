      function poly_coef_count ( dim, degree )

c*********************************************************************72
c
cc POLY_COEF_COUNT: polynomial coefficient count given dimension and degree.
c
c  Discussion:
c
c    To count all monomials of degree 5 or less in dimension 3,
c    we can count all monomials of degree 5 in dimension 4.
c
c    To count all monomials of degree 5 in dimension 4, we imagine
c    that each of the variables X, Y, Z and W is a "box" and that
c    we need to drop 5 pebbles into these boxes.  Every distinct
c    way of doing this represents a degree 5 monomial in dimension 4.
c    Ignoring W gives us monomials up to degree five in dimension 3.
c
c    To count them, we draw 3 lines as separators to indicate the
c    4 boxes, and then imagine all distinct sequences involving
c    the three lines and the 5 pebbles.  Indicate the lines by 1's
c    and the pebbles by 0's and we're asking for the number of
c    permutations of 3 1's and 5 0's, which is 8! / (3! 5!)
c
c    In other words, 56 = 8! / (3! 5!) is:
c    * the number of monomials of degree exactly 5 in dimension 4, 
c    * the number of monomials of degree 5 or less in dimension 3, 
c    * the number of polynomial coefficients of a polynomial of 
c      degree 5 in (X,Y,Z).
c
c    In general, the formula for the number of monomials of degree DEG
c    or less in dimension DIM is
c
c      (DEG+DIM)! / (DEG! * DIM!)
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    12 July 2008
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer DIM, the dimension of the polynomial.
c    0 <= DIM.
c
c    Input, integer DEGREE, the degree of the polynomnial
c    0 <= DEGREE
c
c    Output, integer POLY_COEF_COUNT, the number of coefficients 
c    in the general polynomial of dimension DIM and degree DEGREE.
c
      implicit none

      integer degree
      integer dim
      integer i4_choose
      integer poly_coef_count

      if ( dim .lt. 0 ) then
        poly_coef_count = -1
      else if ( degree .lt. 0 ) then
        poly_coef_count = -1
      else
        poly_coef_count = i4_choose ( degree + dim, degree )
      end if

      return
      end 
