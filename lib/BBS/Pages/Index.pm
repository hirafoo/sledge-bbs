package BBS::Pages::Index;
use BBS::Utils;

use BBS::Data::User;
use base qw(BBS::Pages);

sub dispatch_index {
    my $self = shift;

    my $p = BBS::Data::User->search->next;

    $self->tmpl->param(
        cur_date => scalar localtime,
        co => BBS::Data::User->hoge,
    );
}

sub dispatch_auth {
    my $self = shift;
    $self->tmpl->param(hoge => 'huga');
}

1;
