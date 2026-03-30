      subroutine mertens_values ( n_data, n, c )

c*********************************************************************72
c
cc MERTENS_VALUES returns some values of the Mertens function.
c
c  Discussion:
c
c    The Mertens function M(N) is the sum from 1 to N of the Moebius
c    function MU.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    01 Decemberr 2007
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Marc Deleglise, Joel Rivat,
c    Computing the Summation of the Moebius Function,
c    Experimental Mathematics,
c    Volume 5, 1996, pages 291-295.
c
c    Eric Weisstein,
c    CRC Concise Encyclopedia of Mathematics,
c    CRC Press, 2002,
c    Second edition,
c    ISBN: 1584883472,
c    LC: QA5.W45.
c
c  Parameters:
c
c    Input/output, integer N_DATA.
c    On input, if N_DATA is 0, the first test data is returned, and N_DATA
c    is set to 1.  On each subsequent call, the input value of N_DATA is
c    incremented and that test data item is returned, if available.  When
c    there is no more test data, N_DATA is set to 0.
c
c    Output, integer N, the argument of the Mertens function.
c
c    Output, integer C, the value of the Mertens function.
c
      implicit none

      integer nmax
      parameter ( nmax = 15 )

      integer c
      integer c_vec(nmax)
      integer n
      integer n_data
      integer n_vec(nmax)


      save c_vec
      save n_vec

      data c_vec /
     &    1,   0,  -1,   -1,  -2,  -1,  -2,  -2,   -2,  -1, 
     &   -2,  -2,   1,    2, -23 /
      data n_vec /
     &    1,   2,   3,   4,   5,   6,   7,   8,   9,  10, 
     &   11,  12,  100, 1000, 10000 /
      
      if ( n_data .lt. 0 ) then
        n_data = 0
      end if

      n_data = n_data + 1

      if ( nmax .lt. n_data ) then
        n_data = 0
        n = 0
        c = 0
      else
        n = n_vec(n_data)
        c = c_vec(n_data)
      end if

      return
      end
