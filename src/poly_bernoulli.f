      subroutine poly_bernoulli ( n, k, b )

c*********************************************************************72
c
cc POLY_BERNOULLI evaluates the poly-Bernolli numbers with negative index.
c
c  Discussion:
c
c    The poly-Bernoulli numbers B_n^k were defined by M Kaneko
c    formally as the coefficients of X^n/nc in a particular power 
c    series.  He also showed that, when the super-index is negative,
c    we have
c
c      B_n^(-k) = Sum ( 0 <= j <= min ( n, k ) ) 
c        (jc)^2 * S(n+1,j+1) * S(k+1,j+1)
c
c    where S(n,k) is the Stirling number of the second kind, the number of
c    ways to partition a set of size n into k nonempty subset.
c
c    B_n^(-k) is also the number of "lonesum matrices", that is, 0-1
c    matrices of n rows and k columns which are uniquely reconstructable
c    from their row and column sums.
c
c    The poly-Bernoulli numbers get large very quickly.
c
c  Table:
c
c    \ K 0  1    2     3      4       5        6
c    N
c    0   1  1    1     1      1       1        1
c    1   1  2    4     8     16      32       64
c    2   1  4   14    46    146     454     1394
c    3   1  8   46   230   1066    4718    20266
c    4   1 16  146  1066   6902   41506   237686
c    5   1 32  454  4718  41506  329462  2441314
c    6   1 64 1394 20266 237686 2441314 22934774
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
c    Chad Brewbaker,
c    Lonesum (0,1) Matrices and Poly-Bernoulli Numbers of Negative Index,
c    MS Thesis,
c    Iowa State University, 2005.
c
c    M Kaneko,
c    Poly-Bernoulli Numbers,
c    Journal Theorie des Nombres Bordeaux,
c    Volume 9, 1997, pages 221-228.
c
c  Parameters:
c
c    Input, integer N, K, the indices.  N and K should be 
c    nonnegative.
c
c    Output, integer B, the value of B_N^(-K).
c
      implicit none

      integer m_max
      parameter ( m_max = 20 )

      integer b
      integer j
      integer jfact
      integer jhi
      integer k
      integer m
      integer n
      integer s(m_max*m_max)

      if ( n .lt. 0 ) then
        b = 0
        return
      else if ( n .eq. 0 ) then
        b = 1
        return
      end if

      if ( k .lt. 0 ) then
        b = 0
        return
      else if ( k .eq. 0 ) then
        b = 1
        return
      end if

      jhi = min ( n, k )
      m = max ( n, k ) + 1

      if ( m_max < m ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'POLY_BERNOULLI - Fatal error!'
        write ( *, '(a)' ) '  Internal storage M_MAX = ', m_max
        write ( *, '(a)' ) '  exceeded by value M = ', m
        stop 1
      end if

      call stirling2 ( m, m, s )

      jfact = 1
      b = 0

      do j = 0, jhi

        b = b + jfact * jfact * s(n+1+j*m_max) * s(k+1+j*m_max)

        jfact = jfact * ( j + 1 )

      end do

      return
      end
