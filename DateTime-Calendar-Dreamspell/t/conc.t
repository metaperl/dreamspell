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





