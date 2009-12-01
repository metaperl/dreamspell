package DateTime::Calendar::Dreamspell;

use warnings;
use strict;

our $VERSION = '0.01';

use Data::Dumper;
use DateTime;
use DateTime::Span;
use Moose;


has 'greg_year'  => ( is => 'rw', isa => 'Int', required => 1);
has 'greg_month' => ( is => 'rw', isa => 'Int', required => 1);
has 'greg_day'   => ( is => 'rw', isa => 'Int', required => 1);
has 'dt'    => ( is => 'rw', isa => 'DateTime');

sub BUILD {
  my($self)=@_;

  $self->dt
    (
     DateTime->new
     (
      year  => $self->greg_year,
      month => $self->greg_month,
      day   => $self->greg_day
     )
    );

  #warn 'SELF' . Dumper($self);

}


sub now {

  my $now = DateTime->now;

  __PACKAGE__->from_object($now);

}

sub from_object {
  my($pkg,$object)=@_;

  __PACKAGE__->new(greg_year => $object->year,
		   greg_month => $object->month,
		   greg_day => $object->day);
}

=for understanding year determination

Similar to how a school year spans calendar years, a Dreamspell year does the same thing.

We will define each Dreamspell year by the calendar year it begins with. 

Since "Yellow Self-Existing Seed Year" spans 2009-07-26 to 2010-07-25, a Gregorian date
with year 2009 would belong to that Dreamspell year if its month/day is 7/26 to 12/31.
Otherwise, it would belong to Dreamspell year 2008.

=cut

my %dreamspell_year =
  (

   2008 => 'blue electric storm',
   2009 => 'yellow self-existing seed'

  );


sub year {
  my($self)=@_;

  my $potential_start_date = DateTime->new(year => $self->greg_year,
					   month => 7,
					   day => 26);

  my $dreamspell_year_span = DateTime::Span->from_datetime_and_duration
    (
     start => $potential_start_date, days => 365
    );

  warn "End day  is " . $dreamspell_year_span->end->strftime('%F');
  #warn "self is " . $self;
  #warn "self is " . Dumper($self);
  warn "self->dt is " . $self->dt;

  if ($dreamspell_year_span->intersects($self->dt)) {
    $self->greg_year;
  } else {
    $self->greg_year - 1;
  }

}

sub moon {
  my($self)=@_;



}


1; # End of DateTime::Calendar::Dreamspell
