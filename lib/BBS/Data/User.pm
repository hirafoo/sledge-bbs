package BBS::Data::User;

use strict;
use base qw/BBS::Data::Base/;

sub search {shift->resultset('User')->search_rs}

sub hoge {
    my($class, $num) = @_;
    return $class->resultset("User")->search->count;
}

1;
