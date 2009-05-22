package BBS::Authorizer;

use strict;
use base qw(Sledge::Authorizer);

sub authorize {
    my($self, $page) = @_;
    unless ($page->session->param('user')) {
        return $page->redirect('/login.cgi');
    }
}

1;
