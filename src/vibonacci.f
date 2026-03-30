      subroutine vibonacci ( n, seed, v )

c*********************************************************************72
c
cc VIBONACCI computes the first N Vibonacci numbers.
c
c  Discussion:
c
c    The "Vibonacci numbers" are a generalization of the Fibonacci numbers:
c      V(N+1) = +/- V(N) +/- V(N-1)
c    where the signs are chosen randomly.
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
c  Reference:
c
c    Brian Hayes,
c    The Vibonacci Numbers,
c    American Scientist,
c    July-August 1999, Volume 87, Number 4.
c
c    Divakar Viswanath,
c    Random Fibonacci sequences and the number 1.13198824,
c    Mathematics of Computation,
c    1998.
c
c  Parameters:
c
c    Input, integer N, the highest number to compute.
c
c    Input/output, integer SEED, a seed for the random number 
c    generator.
c
c    Output, integer V(N), the first N Vibonacci numbers.  By 
c    convention, V(1) and V(2) are taken to be 1.
c
      implicit none

      integer n

      integer i
      integer i4_uniform_ab
      integer j
      integer s1
      integer s2
      integer seed
      integer v(n)

      if ( n .le. 0 ) then
        return
      end if

      v(1) = 1

      if ( n .le. 1 ) then
        return
      end if

      v(2) = 1

      do i = 3, n
        
        j = i4_uniform_ab ( 0, 1, seed )

        if ( j .eq. 0 ) then
          s1 = -1
        else
          s1 = +1
        end if

        j = i4_uniform_ab ( 0, 1, seed )

        if ( j .eq. 0 ) then
          s2 = -1
        else
          s2 = +1
        end if

        v(i) = s1 * v(i-1) + s2 * v(i-2)

      end do
     
      return
      end
