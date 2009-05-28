package BBS::Pages::Entry::Index;
use BBS::ActiveRecord;
use BBS::Authorizer;
use BBS::Utils;
use self;
use base qw(BBS::Pages);

__PACKAGE__->tmpl_dirname('entry');

sub create_authorizer {
    return BBS::Authorizer->new($self);
}

sub dispatch_index {
    my $entries = Entry->find_all_by(
        visible => 1,
    );

    $self->tmpl->param(
        entries => $entries,
        msgs => 'hoge',
    );
}

sub post_dispatch_index {
    $self->tmpl->param(msgs => 'hoge');
}

sub dispatch_create {
}

sub post_dispatch_create {
    my @p = $self->r->param;
    my %params = map { $_ => $self->r->param($_) } @p;
    my $user = $self->session->param('user');

    Entry->create({
        user_id => $user->id,
        content => $params{content},
    }) if $params{content};
}

1;
