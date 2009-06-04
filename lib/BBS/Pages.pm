package BBS::Pages;
use BBS::ActiveRecord;
use BBS::Config;
use BBS::Utils;

use Sledge::Authorizer::Null;
use Sledge::Charset::Default;
use Sledge::Pages::Compat;
use Sledge::SessionManager::Cookie;
use Sledge::Session::MySQL;
use Sledge::Template::TT;

__PACKAGE__->register_hook(
    BEFORE_DISPATCH => sub {
        my $self = shift;

        my $users = User->find_all_by( visible => 1 );
        my $user;

        $self->tmpl->param(
            users => $users,
            ($user = $self->session->param('user')) ? (user => $user) : (),
        );

        $self->tmpl->set_option(
            INCLUDE_PATH => [
                $self->create_config->tmpl_path,
                $self->create_config->tmpl_path . '/default',
            ],
            PRE_PROCESS => 'macro.txt',
            TEMPLATE_EXTENSION => '.html',
            WRAPPER => $self->create_config->tmpl_path .'/default/wrapper.html',
        );
    },
);

sub create_authorizer {
    my $self = shift;
    return Sledge::Authorizer::Null->new($self);
}

sub create_charset {
    my $self = shift;
    return Sledge::Charset::Default->new($self);
}

sub create_config {
    my $self = shift;
    return BBS::Config->instance;
}

sub create_manager {
    my $self = shift;
    return Sledge::SessionManager::Cookie->new($self);
}

sub create_session {
    my($self, $sid) = @_;
    return Sledge::Session::MySQL->new($self, $sid);
}

1;
