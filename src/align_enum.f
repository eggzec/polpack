      function align_enum ( m, n )

c*********************************************************************72
c
cc ALIGN_ENUM counts the alignments of two sequences of M and N elements.
c
c  Discussion:
c
c    We assume that we have sequences A and B of M and N characters each.
c    An alignment of the two sequences is a rule matching corresponding
c    elements of one sequence to another.  Some elements of either sequence
c    can be matched to a null element.  If A(I1) and A(I2) are matched
c    to B(J1) and B(J2), and I1 < I2, then it must be the case that J1 < J2.
c
c    The 5 alignments of a sequence of 1 to a sequence of 2 are:
c
c          _1_   _2_   __3__   __4__   __5__
c
c      A:  1 -   - 1   - 1 -   - - 1   1 - -
c      B:  1 2   1 2   1 - 2   1 2 -   - 1 2
c
c    The formula is:
c
c      F(0,0) = 1
c      F(1,0) = 1
c      F(0,1) = 1
c      F(M,N) = F(M-1,N) + F(M-1,N-1) + F(M,N-1)
c
c    To compute F(M,N), it is not necessary to keep an M+1 by N+1
c    array in memory.  A vector of length N will do.
c
c    F(N,N) is approximately ( 1 + sqrt(2) )^(2*N+1) / sqrt ( N )
c
c  Example:
c
c    The initial portion of the table is:
c
c
c  M/N   0    1    2    3    4       5       6       7       8       9      10
c
c   0    1    1    1    1    1       1       1       1       1       1       1
c   1    1    3    5    7    9      11      13      15      17      19      21
c   2    1    5   13   25   41      61      85     113     145     181     221
c   3    1    7   25   63  129     231     377     575     833    1159    1561
c   4    1    9   41  129  321     681    1289    2241    3649    5641    8361
c   5    1   11   61  231  681    1683    3653    7183   13073   22363   36365
c   6    1   13   85  377 1289    3653    8989   19825   40081   75517  134245
c   7    1   15  113  575 2241    7183   19825   48639  108545  224143  433905
c   8    1   17  145  833 3649   13073   40081  108545  265729  598417 1256465
c   9    1   19  181 1159 5641   22363   75517  224143  598417 1462563 3317445
c  10    1   21  221 1561 8361   36365  134245  433905 1256465 3317445 8097453
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    01 December 2007
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Michael Waterman,
c    Introduction to Computational Biology,
c    Chapman and Hall, 1995, pages 186-190.
c
c  Parameters:
c
c    Input, integer M, N, the number of elements of the
c    two sequences.
c
c    Output, integer ALIGN_ENUM, the number of possible
c    alignments of the sequences.
c
      implicit none

      integer n

      integer align_enum
      integer fi(0:n)
      integer fim1j
      integer fim1jm1
      integer i
      integer j
      integer m

      if ( m .lt. 0 ) then
        align_enum = 0
        return
      else if ( n .lt. 0 ) then
        align_enum = 0
        return
      else if ( m .eq. 0 ) then
        align_enum = 1
        return
      else if ( n .eq. 0 ) then
        align_enum = 1
        return
      end if

      fi(0:n) = 1

      do i = 1, m

        fim1jm1 = 1

        do j = 1, n

          fim1j = fi(j)

          fi(j) = fi(j) + fi(j-1) + fim1jm1

          fim1jm1 = fim1j

        end do
      end do

      align_enum = fi(n)

      return
      end
