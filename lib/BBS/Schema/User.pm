package BBS::Schema::User;
use BBS::Utils;

__PACKAGE__->resultset_class('BBS::ResultSet::User');
__PACKAGE__->resultset_attributes({
    alias => 'user',
    from  => [{user => 'users'}],
    cache => 1,
    prefetch => [qw/entry/],
    where => {'user.deleted' => 0},
    order_by => 'user.id DESC',
});
__PACKAGE__->has_many("entry", "BBS::Schema::Entry", { "foreign.user_id" => "self.id" });

package BBS::ResultSet::User;
use base 'DBIx::Class::ResultSet';
use BBS::Utils;

1;
