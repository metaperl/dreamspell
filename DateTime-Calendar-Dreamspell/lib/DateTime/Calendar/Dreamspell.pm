package DateTime::Calendar::Dreamspell;

use warnings;
use strict;

our $VERSION = '0.01';

use DateTime;
use Moose;


has 'year'  => ( is => 'rw', isa => 'Int', required => 1);
has 'month' => ( is => 'rw', isa => 'Int', required => 1);
has 'day'   => ( is => 'rw', isa => 'Int', required => 1);
has 'dt'    => ( is => 'rw', isa => 'DateTime');

sub BUILD {
  my($self)=@_;

  $self->dt
    (
     DateTime->new
     (
      year  => $self->year,
      month => $self->month,
      day   => $self->day
     )
    );
}


sub now {

  my $now = DateTime->now;

  __PACKAGE__->from_object($now);

}

sub from_object {
  my($pkg,$object)=@_;

  __PACKAGE__->new(year => $object->year,
		   month => $object->month,
		   day => $object->day);
}


sub determine_moon {
  my($self)=@_;



}


1; # End of DateTime::Calendar::Dreamspell
