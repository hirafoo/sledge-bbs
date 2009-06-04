package BBS::Pages::Index;
use base qw/BBS::Pages/;
use self;
use BBS::ActiveRecord;
use BBS::Utils;

use BBS::Authorizer;
use Sledge::Plugin::Email::Japanese;

__PACKAGE__->tmpl_dirname('.');

sub dispatch_index {}

sub post_dispatch_index {
    my $params = $self->r->params;

    # 本当はモデルに実装すべきだけど手抜き
    my $result;
    if (!$params->{name} or !$params->{password}) { # oh fxxk'n poor validate
        $result = 'can not blank';
    }
    elsif (User->find_by( name => $params->{name} )) {
        $result = 'the name is already used';
    }
    else {
        User->create( $params );
        $result = 'create your data';
    }

    $self->tmpl->param(result => $result);
}

sub dispatch_login {}

sub post_dispatch_login {
    my $params = $self->r->params;

    if (my $user = $self->check_user($params)) {
        $self->tmpl->param(user => $user);
        $self->session->param(user => $user);
    }
    else {
        $self->tmpl->param(error => 'login failed');
    }
}
       
sub check_user {
    my ($params) = @args;

    User->find_by(
        name     => $params->{name},
        password => $params->{password},
    );
}

sub dispatch_logout {
    $self->session->remove('user');
    my $sid = $self->session->session_id;
    Session->find_by(id => $sid)->delete;
    $self->redirect('/index.cgi');
}

sub dispatch_sendmail {}

sub post_dispatch_sendmail {
    my $params = $self->r->params;

    if(!$params->{to} or !$params->{msg}) {
        return $self->tmpl->param(error => 'not blank');
    }

    $self->send_mail(
        'mail.txt' => {
            Subject => 'Hi!',
            To      => $params->{to},
            TmplParams => {
                msg => $params->{msg},
            },
        },
    );
}

1;
