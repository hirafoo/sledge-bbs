package BBS::Pages::Entry::Index;
use base qw/BBS::Pages/;
use self;
use BBS::ActiveRecord;
use BBS::Authorizer;
use BBS::Utils;

__PACKAGE__->tmpl_dirname('entry');

sub create_authorizer {
    return BBS::Authorizer->new($self);
}

sub dispatch_index {
    my $entries = Entry->find_all_by(
        visible => 1,
    );

    my $result = Entry->list($self->r->params, $entries);
    $self->tmpl->param(
        entries => $result->{data},
        pager   => $result->{pager},
    );
}

sub dispatch_create {}

sub post_dispatch_create {
    my $params = $self->r->params;
    my $user = $self->session->param('user');

    if ($params->{content}) {
        Entry->create({
            user_id => $user->id,
            content => $params->{content},
        });
        $self->tmpl->param(success => 1);
    }
}

1;
