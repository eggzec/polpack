      function benford ( ival )

c*********************************************************************72
c
cc BENFORD returns the Benford probability of one or more significant digits.
c
c  Discussion:
c
c    Benford's law is an empirical formula explaining the observed
c    distribution of initial digits in lists culled from newspapers,
c    tax forms, stock market prices, and so on.  It predicts the observed
c    high frequency of the initial digit 1, for instance.
c
c    Note that the probabilities of digits 1 through 9 are guaranteed
c    to add up to 1, since
c      LOG10 ( 2/1 ) + LOG10 ( 3/2) + LOG10 ( 4/3 ) + ... + LOG10 ( 10/9 )
c      = LOG10 ( 2/1 * 3/2 * 4/3 * ... * 10/9 ) = LOG10 ( 10 ) = 1.
c
c    The formula is:
c
c      Prob ( First significant digits are IVAL ) =
c        LOG10 ( ( IVAL + 1 ) / IVAL ).
c
c  Licensing:
c
c    This code is distributed under the GNU LGPL license. 
c
c  Modified:
c
c    02 December 2007
c
c  Author:
c
c    John Burkardt
c
c  Reference:
c
c    Frank Benford,
c    The Law of Anomalous Numbers,
c    Proceedings of the American Philosophical Society,
c    Volume 78, pages 551-572, 1938.
c
c    Ted Hill,
c    The First Digit Phenomenon,
c    American Scientist,
c    Volume 86, July/August 1998, pages 358 - 363.
c
c    Ralph Raimi,
c    The Peculiar Distribution of First Digits,
c    Scientific American,
c    December 1969, pages 109-119.
c
c  Parameters:
c
c    Input, integer IVAL, the string of significant digits to
c    be checked.  If IVAL is 1, then we are asking for the Benford probability
c    that a value will have first digit 1.  If IVAL is 123, we are asking for
c    the probability that the first three digits will be 123, and so on.
c    Note that IVAL must not be 0 or negative.
c
c    Output, double precision BENFORD, the Benford probability that an
c    item taken from a real world distribution will have the initial
c    digits IVAL.
c
      implicit none

      double precision benford
      integer ival

      if ( ival <= 0 ) then
        write ( *, '(a)' ) ' '
        write ( *, '(a)' ) 'BENFORD - Fatal errorc'
        write ( *, '(a)' ) '  The input argument must be positive.'
        write ( *, '(a,i8)' ) '  Your value was ', ival
        stop 1
      end if

      benford = log10 ( dble ( ival + 1 ) / dble ( ival ) )

      return
      end
