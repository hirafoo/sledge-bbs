package BBS::Pages::Index;
use BBS::ActiveRecord;
use BBS::Utils;
use base qw(BBS::Pages);

use BBS::Authorizer;

__PACKAGE__->tmpl_dirname('.');

sub dispatch_index {
    my $self = shift;

    my $users = User->find_all_by( visible => 1 );
    my $user;

    $self->tmpl->param(
        cur_date => scalar localtime,
        users => $users,
        ($user = $self->session->param('user')) ? (user => $user) : (),
    );
}

sub dispatch_auth {
    my $self = shift;
    $self->tmpl->param(hoge => 'huga');
}

sub post_dispatch_index {
    my $self = shift;
 
    my @p = $self->r->param;
    my %params = map { $_ => $self->r->param($_) } @p;

    my $result;
    if (!$params{name} or !$params{password}) { # oh fxxk'n poor validate
        $result = 'can not blank';
    }
    elsif (User->find_by( name => $params{name} )) {
        $result = 'the name is already used';
    }
    else {
        User->create( \%params );
        $result = 'create your data';
    }

    $self->tmpl->param(result => $result);
}


sub dispatch_login {}

sub post_dispatch_login {
    my $self = shift;
p "post login";
    my @p = $self->r->param;
    my %params = map { $_ => $self->r->param($_) } @p;

    if (my $user = $self->check_user(\%params)) {
        p 'login ok';
        $self->session->param(user => $user);
#        return $self->redirect('/entry/index.cgi');
    }
    else {
        p 'login ng';
        $self->tmpl->param(error => 'login failed');
    }
}
       
sub check_user {
    my($self, $params) = @_;

    User->find_by(
        name => $params->{name},
        password => $params->{password},
    );
}

sub dispatch_logout {
    my $self = shift;
    p 1;
    $self->session->remove('user');
    my $sid = $self->session->session_id;
    Session->find_by(id => $sid)->delete;
    $self->redirect('/index.cgi');
    $self->load_template('index.html');
    $self->output_content;
}

sub dispatch_entry {
    my $self = shift;
}

1;
