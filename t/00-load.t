#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Date::Dreamspell' );
}

diag( "Testing Date::Dreamspell $Date::Dreamspell::VERSION, Perl $], $^X" );
