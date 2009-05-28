package BBS::Config::_common;
use BBS;
use BBS::Schema;
use BBS::Utils;
use File::Spec;
use vars qw(%C);
*Config = \%C;

$C{TMPL_PATH}     = File::Spec->rel2abs(($ENV{MOD_PERL} ? '../' : '') . 'template');
$C{DATASOURCE}    = [ 'dbi:mysql:bbs','root', '' ];
$C{COOKIE_NAME}   = 'sledge_sid';
$C{COOKIE_PATH}   = '/';
$C{COOKIE_DOMAIN} = undef;

$BBS::SCHEMA = BBS::Schema->connection( @{$C{DATASOURCE}} );

1;
