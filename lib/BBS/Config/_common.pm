package BBS::Config::_common;
use strict;
use File::Spec;
use vars qw(%C);
*Config = \%C;

$C{TMPL_PATH}     = File::Spec->rel2abs('template');
$C{DATASOURCE}    = [ 'dbi:mysql:bbs','root', '' ];
$C{COOKIE_NAME}   = 'sledge_sid';
$C{COOKIE_PATH}   = '/';
$C{COOKIE_DOMAIN} = undef;

1;
