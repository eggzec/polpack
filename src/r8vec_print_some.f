      subroutine r8vec_print_some ( n, a, max_print, title )

c*********************************************************************72
c
cc R8VEC_PRINT_SOME prints "some" of an R8VEC.
c
c  Discussion:
c
c    The user specifies MAX_PRINT, the maximum number of lines to print.
c
c    If N, the size of the vector, is no more than MAX_PRINT, then
c    the entire vector is printed, one entry per line.
c
c    Otherwise, if possible, the first MAX_PRINT-2 entries are printed,
c    followed by a line of periods suggesting an omission,
c    and the last entry.
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license.
c
c  Modified:
c
c    16 September 2003
c
c  Author:
c
c    John Burkardt
c
c  Parameters:
c
c    Input, integer N, the number of entries of the vector.
c
c    Input, double precision A(N), the vector to be printed.
c
c    Input, integer MAX_PRINT, the maximum number of lines to print.
c
c    Input, character*(*) TITLE, an optional title.
c
      implicit none

      integer n

      double precision a(n)
      integer i
      integer max_print
      integer s_len_trim
      character*(*) title

      if ( max_print .le. 0 ) then
        return
      end if

      if ( n .le. 0 ) then
        return
      end if

      if ( 0 .lt. s_len_trim ( title ) ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) title
        write ( *, '(a)' ) ' '
      end if

      if ( n .le. max_print ) then

        do i = 1, n
          write ( *, '(i6,2x,g14.6)' ) i, a(i)
        end do

      else if ( 3 .le. max_print ) then

        do i = 1, max_print-2
          write ( *, '(i6,2x,g14.6)' ) i, a(i)
        end do

        write ( *, '(a)' ) '......  ..............'
        i = n

        write ( *, '(i6,2x,g14.6)' ) i, a(i)

      else

        do i = 1, max_print-1
          write ( *, '(i6,2x,g14.6)' ) i, a(i)
        end do

        i = max_print

        write ( *, '(i6,2x,g14.6,a)' ) i, a(i), '...more entries...'

      end if

      return
      end
