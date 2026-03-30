      function euler_number2 ( n )

c*********************************************************************72
c
cc EULER_NUMBER2 computes the Euler numbers.
c
c  Discussion:
c
c    The Euler numbers can be evaluated in Mathematica by:
c
c      EulerE[n]
c
c  First terms:
c
c    E0  = 1
c    E1  = 0
c    E2  = -1
c    E3  = 0
c    E4  = 5
c    E5  = 0
c    E6  = -61
c    E7  = 0
c    E8  = 1385
c    E9  = 0
c    E10 = -50521
c    E11 = 0
c    E12 = 2702765
c    E13 = 0
c    E14 = -199360981
c    E15 = 0
c    E16 = 19391512145
c    E17 = 0
c    E18 = -2404879675441
c    E19 = 0
c    E20 = 370371188237525
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    08 July 2008
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
c    Input, integer N, the index of the Euler number to compute.
c
c    Output, double precision EULER_NUMBER2, the value of E(N).
c
      implicit none

      double precision euler_number2
      double precision e(0:6)
      integer i
      integer itmax
      parameter ( itmax = 1000 )
      integer n
      double precision pi
      parameter ( pi = 3.141592653589793D+00 )
      double precision r8_factorial
      double precision sum1
      double precision term

      save e

      data e /
     &  1.0D+00, -1.0D+00, 5.0D+00, -61.0D+00, 1385.0D+00, 
     &  -50521.0D+00, 2702765.0D+00 /

      if ( n .lt. 0 ) then
        euler_number2 = 0.0D+00
        return
      end if

      if ( n .eq. 0 ) then
        euler_number2 = e(0)
        return
      end if

      if ( mod ( n, 2 ) .eq. 1 ) then
        euler_number2 = 0.0D+00
        return
      end if

      if ( n .le. 12 ) then
        euler_number2 = e(n/2)
        return
      end if

      sum1 = 0.0D+00
      do i = 1, itmax

        term = 1.0D+00 / dble ( ( 2 * i - 1 )**( n + 1 ) )

        if ( mod ( i, 2 ) .eq. 1 ) then
          sum1 = sum1 + term
        else
          sum1 = sum1 - term
        end if

        if ( abs ( term ) .lt. 1.0D-10 ) then
          go to 10
        else if ( abs ( term ) .lt. 1.0D-08 * abs ( sum1 ) ) then
          go to 10
        end if

      end do

10    continue

      euler_number2 = 2.0D+00 ** ( n + 2 ) * sum1 * r8_factorial ( n ) 
     &  / pi ** ( n + 1 )

      if ( mod ( n, 4 ) .ne. 0 ) then
        euler_number2 = - euler_number2
      end if

      return
      end
