package BBS::Schema::Session;
use BBS::Utils;

__PACKAGE__->resultset_class('BBS::ResultSet::Session');
__PACKAGE__->resultset_attributes({
    alias => 'session',
    from  => [{session => 'sessions'}],
    cache => 1,
});

package BBS::ResultSet::Session;
use base 'DBIx::Class::ResultSet';
use BBS::Utils;

1;
