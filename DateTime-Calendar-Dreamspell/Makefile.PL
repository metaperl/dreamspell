use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'DateTime::Calendar::Dreamspell',
    AUTHOR              => 'Terrence Brannon <metaperl@gmail.com>',
    VERSION_FROM        => 'lib/DateTime/Calendar/Dreamspell.pm',
    ABSTRACT_FROM       => 'lib/DateTime/Calendar/Dreamspell.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
		  'Moose' => 0,
		  DateTime => 0,
		  'DateTime::Span' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'DateTime-Calendar-Dreamspell-*' },
);
