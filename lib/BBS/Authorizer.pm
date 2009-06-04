package BBS::Authorizer;
use base qw/Sledge::Authorizer/;
use BBS::Utils;

sub authorize {
    my($self, $page) = @_;
    unless ($page->session->param('user')) {
        return $page->redirect('/login.cgi');
    }
}

1;
