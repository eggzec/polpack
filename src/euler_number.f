      subroutine euler_number ( n, e )

c*********************************************************************72
c
cc EULER_NUMBER computes the Euler numbers.
c
c  Discussion:
c
c    The Euler numbers can be evaluated in Mathematica by:
c
c      EulerE[n]
c
c    These numbers rapidly get too big to store in an ordinary integer!
c
c    The terms of odd index are 0.
c
c    E(N) = -C(N,N-2) * E(N-2) - C(N,N-4) * E(N-4) - ... - C(N,0) * E(0).
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
c    05 July 2008
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
c    Input, integer N, the index of the last Euler number
c    to compute.
c
c    Output, integer E(0:N), the Euler numbers.
c
      implicit none

      integer n

      integer e(0:n)
      integer i
      integer i4_choose
      integer j

      if ( n .lt. 0 ) then
        return
      end if

      e(0) = 1

      if ( n .eq. 0 ) then
        return
      end if

      e(1) = 0
 
      if ( n .eq. 1 ) then
        return
      end if

      e(2) = -1
    
      do i = 3, n

        e(i) = 0

        if ( mod ( i, 2 ) .eq. 0 ) then

          do j = 2, i, 2
            e(i) = e(i) - i4_choose ( i, j ) * e(i-j)
          end do

        end if

      end do
 
      return
      end
