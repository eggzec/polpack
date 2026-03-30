      subroutine collatz_count_max ( n, i_max, j_max )

c*********************************************************************72
c
cc COLLATZ_COUNT_MAX seeks the maximum Collatz count for 1 through N.
c
c  Discussion:
c
c    For each integer I, we compute a sequence of values that 
c    terminate when we reach 1.  The number of steps required to
c    reach 1 is the "rank" of I, and we are searching the numbers
c    from 1 to N for the number with maximum rank.
c
c    For a given I, the sequence is produced by:
c
c    1) J = 1, X(J) = I;
c    2) If X(J) = 1, stop.
c    3) J = J + 1; 
c       if X(J-1) was even, X(J) = X(J-1)/2;
c       else                X(J) = 3 * X(J-1) + 1;
c    4) Go to 3
c
c  Example:
c
c            N     I_MAX J_MAX
c
c           10         9    20
c          100        97   119
c        1,000       871   179
c       10,000     6,171   262
c      100,000    77,031   351
c    1,000,000   837,799   525
c   10,000,000 8,400,511   686
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    12 April 2009
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the maximum integer to check.
c
c    Output, integer I_MAX, J_MAX, an integer I with the maximum 
c    rank, and the value of the maximum rank.
c
      implicit none

      integer i
      integer i_max
      integer j
      integer j_max
      integer n
      integer x

      i_max = -1
      j_max = -1

      do i = 1, n

        j = 1
        x = i

10      continue

        if ( x .ne. 1 ) then

          j = j + 1

          if ( mod ( x, 2 ) .eq. 0 ) then
            x = x / 2
          else
            x = 3 * x + 1
          end if

          go to 10

        end if

        if ( j_max .lt. j ) then
          i_max = i
          j_max = j
        end if

      end do

      return
      end
