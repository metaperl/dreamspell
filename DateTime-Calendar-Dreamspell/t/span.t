#!perl -T


use Test::More qw(no_plan);

BEGIN {
	use_ok( 'DateTime::Span' );
}

my %date_conc_arg = (year => 2009,
		     month => 7,
		     day => 26);

my $start_date = DateTime->new(%date_conc_arg);

my $dreamspell_year_span = DateTime::Span->from_datetime_and_duration
  (
   start => $start_date, days => 365
  );

for my $boundary qw(start end) {

  diag "$boundary day  is " . $dreamspell_year_span->$boundary->strftime('%F');

}


for my $delta qw(-1 0 1) {
  my %arg = %date_conc_arg;
  $arg{day} += $delta;
  my $date = DateTime->new(%arg);
  diag "test day  is " . $date->strftime('%F');

  if ($dreamspell_year_span->intersects($date,$date)) {
    warn 'intersects';
  }

  if ($dreamspell_year_span->contains($date,$date)) {
    warn 'contains';
  }

}
  
