package WWW::Mechanize::Timed;

use strict;
use warnings FATAL => 'all';
our $VERSION = '0.42';

use base qw( WWW::Mechanize );
use LWPx::TimedHTTP qw(:autoinstall);

sub new {
    my $class = shift;
    my %args = @_;
    my $self = $class->SUPER::new( %args );
    return $self;
}

sub client_request_connect_time {
  my $self = shift;
  return $self->response->header('Client-Request-Connect-Time');
}

sub client_request_transmit_time {
  my $self = shift;
  return $self->response->header('Client-Request-Transmit-Time');
}

sub client_response_server_time {
  my $self = shift;
  return $self->response->header('Client-Response-Server-Time');
}

sub client_response_receive_time {
  my $self = shift;
  return $self->response->header('Client-Response-Receive-Time');
}

__END__

=head1 NAME

WWW::Mechanize::Timed - Time Mechanize requests

=head1 SYNOPSIS

  use WWW::Mechanize::Timed;
  my $ua = WWW::Mechanize::Timed->new();
  $ua->get($url);
  print "Total time: " . $ua->client_response_receive_time . "\n";

=head1 DESCRIPTION

This module is a subclass of L<WWW::Mechanize> that times each stage
of the HTTP request. These can then be used in monitoring systems.

=head1 CONSTRUCTOR

=head2 new

The constructor is provided by L<WWW::Mechnize>. See that module's
documentation for details.

=head1 METHODS

The vast majority of methods are provided by L<WWW::Mechanize>. See
that module's documentation for details. Additional methods provided
by this module follow. The most useful method is
client_response_receive_time, or how long it took to get the data from
the webserver once the response was made (and gives an idea of how
loaded the webserver was). All times are in seconds.

=head2 client_request_connect_time

The time it took to connect to the remote server.

=head2 client_request_transmit_time

The time it took to transmit the request.

=head2 client_response_server_time

Time it took to respond to the request.

=head2 client_response_receive_time

Time it took to get the data back.

=head1 THANKS

Andy Lester for L<WWW::Mechanize>. Simon Wistow for L<LWPx::TimedHTTP>.

=head1 LICENCE AND COPYRIGHT

This module is copyright Fotango Ltd 2004. All rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.000 or,
at your option, any later version of Perl 5 you may have available.

The full text of the licences can be found in the F<Artistic> and
F<COPYING> files included with this module, or in L<perlartistic> and
L<perlgpl> as supplied with Perl 5.8.1 and later.

=head1 AUTHOR

Leon Brocard <acme@astray.com>.

=head1 SEE ALSO

L<WWW::Mechanize>.


