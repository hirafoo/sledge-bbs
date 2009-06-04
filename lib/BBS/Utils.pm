package BBS::Utils;
use strict;
use warnings;

use Data::Dumper;
use DateTime;

sub import {
    my $class = shift;
    my $pkg   = caller;

    strict->import;
    warnings->import;

    no strict 'refs';
    *{"$pkg\::p"} = \&p;
    *{"$pkg\::now"} = \&now;
}

sub p { 
    warn Dumper shift;# if $ENV{CATALYST_DEBUG} or $ENV{P_DEBUG};
}

my $tz = DateTime::TimeZone->new( name => 'local' );
sub now { DateTime->now(time_zone => $tz) }
    

# add method to $self->r

*Apache::Request::params = sub {
    my $self = shift;
    my @p = $self->param;
    my %params = map { $_ => $self->param($_) } @p;
    \%params;
};

1;
