
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Extract information from the C<$VERSION> and C<%IRSSI> headers of an Irssi script.',
  'AUTHOR' => 'Tom Feist <shabble+cpan@metavore.org>',
  'BUILD_REQUIRES' => {
    'Log::Any::Test' => '0',
    'Test::Differences' => '0',
    'Test::Exception' => '0',
    'Test::More' => '0',
    'YAML::Any' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Irssi-Script-InfoParser',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Irssi::Script::InfoParser',
  'PREREQ_PM' => {
    'ExtUtils::MakeMaker' => '0',
    'Log::Any' => '0',
    'Moose' => '0',
    'PPI' => '0',
    'PPI::Document' => '0',
    'PPI::Dumper' => '0',
    'namespace::autoclean' => '0'
  },
  'VERSION' => '0.002',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



