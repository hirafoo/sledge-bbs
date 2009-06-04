package BBS::Config::_common;
use BBS;
use BBS::Schema;
use BBS::Utils;

our %C;
*Config = \%C;

$C{COOKIE_NAME}   = 'sledge_sid';
$C{COOKIE_PATH}   = '/';
$C{COOKIE_DOMAIN} = undef;
$C{DATASOURCE}    = [ 'dbi:mysql:bbs','root', '' ];
$C{EMAIL} = {
    From => 'info@example.com',
    send => ['sendmail', 'FromSender' => 'foo@example.com']
};
$C{TMPL_PATH}     = $ENV{APP_PATH} . 'template';

$BBS::SCHEMA = BBS::Schema->connection( @{$C{DATASOURCE}} );

1;
