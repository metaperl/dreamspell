#!perl -T

use Test::More qw(no_plan);

BEGIN {
	use_ok( 'DateTime::Calendar::Dreamspell' );
}

my $dcd = DateTime::Calendar::Dreamspell->new(year => 2009, month => 12, day => 4);

isa_ok($dcd, 'DateTime::Calendar::Dreamspell');

is(  $dcd->dt->strftime('%F'), '2009-12-04', 'internal datetime object');

my $dcd_now = DateTime::Calendar::Dreamspell->now;

diag("Now is"  . $dcd_now->dt->strftime('%F') );

$dt = DateTime->new( year   => 1964,
		     month  => 10,
		     day    => 16,
		     );


my $dcd_fo = DateTime::Calendar::Dreamspell->from_object($dt);

is(  $dcd_fo->dt->strftime('%F'), '1964-10-16', 'internal datetime object');
