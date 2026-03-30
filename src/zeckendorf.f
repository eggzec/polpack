      subroutine zeckendorf ( n, m_max, m, i_list, f_list )

c*********************************************************************72
c
cc ZECKENDORF produces the Zeckendorf decomposition of a positive integer.
c
c  Discussion:
c
c    Zeckendorf proved that every positive integer can be represented
c    uniquely as the sum of non-consecutive Fibonacci numbers.
c
c    N = sum ( 1 <= I <= M ) F_LIST(I)
c
c  Example:
c
c     N    Decomposition
c
c    50    34 + 13 + 3
c    51    34 + 13 + 3 + 1
c    52    34 + 13 + 5
c    53    34 + 13 + 5 + 1
c    54    34 + 13 + 5 + 2
c    55    55
c    56    55 + 1
c    57    55 + 2
c    58    55 + 3
c    59    55 + 3 + 1
c    60    55 + 5
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
c  Parameters:
c
c    Input, integer N, the positive integer to be decomposed.
c
c    Input, integer M_MAX, the maximum dimension of I_LIST 
c    and F_LIST.
c
c    Output, integer M, the number of parts in the decomposition.
c
c    Output, integer I_LIST(M_MAX), contains in entries 1 
c    through M the index of the Fibonacci numbers in the decomposition.
c
c    Output, integer F_LIST(M_MAX), contains in entries 1 
c    through M the value of the Fibonacci numbers in the decomposition.
c
      implicit none

      integer m_max

      integer f
      integer f_list(m_max)
      integer i
      integer i_list(m_max)
      integer j
      integer m
      integer n
      integer n_copy

      m = 0

      n_copy = n
c
c  Extract a sequence of Fibonacci numbers.
c
10    continue

      if ( 0 .lt. n_copy .and. m .lt. m_max ) then
        call fibonacci_floor ( n_copy, f, i )
        m = m + 1
        i_list(m) = i
        n_copy = n_copy - f
        go to 10
      end if
c
c  Replace any pair of consecutive indices ( I, I-1 ) by I+1.
c
      do i = m, 2, -1

        if ( i_list(i-1) .eq. i_list(i) + 1 ) then
          i_list(i-1) = i_list(i-1) + 1
          do j = i, m - 1
            i_list(j) = i_list(j+1)
          end do
          i_list(m) = 0
          m = m - 1
        end if

      end do
c
c  Fill in the actual values of the Fibonacci numbers.
c
      do i = 1, m
        call fibonacci_direct ( i_list(i), f_list(i) )
      end do

      return
      end
