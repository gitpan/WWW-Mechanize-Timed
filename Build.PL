use strict;
use Module::Build;

my $build = Module::Build->new(
  create_makefile_pl => 'traditional',
  license     => 'perl',
  module_name => 'WWW::Mechanize::Timed',
  requires    => {
    'WWW::Mechanize'  => '0.72',
    'LWPx::TimedHTTP' => '1.2',
    'Test::More'      => '0.01',
  },
);

$build->create_build_script;
