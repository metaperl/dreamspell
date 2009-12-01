#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'DateTime::Dreamspell' );
}

diag( "Testing DateTime::Dreamspell $DateTime::Dreamspell::VERSION, Perl $], $^X" );
