package BBS::Pages::Entry;
use BBS::ActiveRecord;
use BBS::Utils;
use base qw(BBS::Pages);

use BBS::Authorizer;

__PACKAGE__->tmpl_dirname('entry');

sub create_authorizer {
    my $self = shift;
    return BBS::Authorizer->new($self);
}

sub dispatch_index {
    my $self = shift;
    $self->tmpl->param(msgs => 'hoge');
}

sub post_dispatch_index {
    my $self = shift;
    $self->tmpl->param(msgs => 'hoge');
}

1;
