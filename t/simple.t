use strict;
use Test::More tests => 6;
use_ok('WWW::Mechanize::Timed');

my $ua = WWW::Mechanize::Timed->new();
isa_ok($ua, 'WWW::Mechanize::Timed');

$ua->get("http://www.astray.com/");

ok($ua->client_request_connect_time);
ok($ua->client_request_transmit_time);
ok($ua->client_response_server_time);
ok($ua->client_response_receive_time);



