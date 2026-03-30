      subroutine lock ( n, a )

c*********************************************************************72
c
cc LOCK returns the number of codes for a lock with N buttons.
c
c  Discussion:
c
c    A button lock has N numbered buttons.  To open the lock, groups
c    of buttons must be pressed in the correct order.  Each button
c    may be pushed no more than once.  Thus, a code for the lock is 
c    an ordered list of the groups of buttons to be pushed.
c
c    For this discussion, we will assume that EVERY button is pushed
c    at some time, as part of the code.  To count the total number
c    of codes, including those which don't use all the buttons, then
c    the number is 2 * A(N), or 2 * A(N) - 1 if we don't consider the
c    empty code to be valid.
c
c  Examples:
c
c    If there are 3 buttons, then there are 13 possible "full button" codes:
c
c      (123)
c      (12) (3)
c      (13) (2)
c      (23) (1)
c      (1) (23)
c      (2) (13)
c      (3) (12)
c      (1) (2) (3)
c      (1) (3) (2)
c      (2) (1) (3)
c      (2) (3) (1)
c      (3) (1) (2)
c      (3) (2) (1)
c
c    and, if we don't need to push all the buttons, every "full button" code above
c    yields a distinct "partial button" code by dropping the last set of buttons:
c
c      ()
c      (12)
c      (13)
c      (23)
c      (1)
c      (2)
c      (3)
c      (1) (2)
c      (1) (3)
c      (2) (1)
c      (2) (3)
c      (3) (1)
c      (3) (2)
c
c  First values:
c
c     N         A(N)
c     0           1
c     1           1
c     2           3
c     3          13
c     4          75
c     5         541
c     6        4683
c     7       47293
c     8      545835
c     9     7087261
c    10   102247563
c
c  Recursion:
c
c    A(I) = sum ( 0 <= J < I ) Binomial ( I, N-J ) * A(J)
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
c    Daniel Velleman, Gregory Call,
c    Permutations and Combination Locks,
c    Mathematics Magazine,
c    Volume 68, Number 4, October 1995, pages 243-253.
c
c  Parameters:
c
c    Input, integer N, the maximum number of lock buttons.
c
c    Output, integer A(0:N), the number of lock codes.
c
      implicit none

      integer n

      integer a(0:n)
      integer i
      integer i4_choose
      integer j

      if ( n .lt. 0 ) then
        return
      end if

      a(0) = 1

      do i = 1, n
        a(i) = 0
        do j = 0, i - 1
          a(i) = a(i) + i4_choose ( i, i - j ) * a(j)
        end do
      end do

      return
      end
