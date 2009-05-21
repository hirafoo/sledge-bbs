package BBS::Schema::Entry;
use BBS::Utils;

__PACKAGE__->resultset_class('BBS::ResultSet::Entry');
__PACKAGE__->resultset_attributes({
    alias => 'entry',
    from  => [{entry => 'entries'}],
    cache => 1,
    prefetch => [qw/user/],
    where => {'entry.deleted' => 0},
    order_by => 'entry.id DESC',
});
__PACKAGE__->belongs_to("user", "BBS::Schema::User", { id => "user_id" });

package BBS::ResultSet::Entry;
use BBS::Utils;

use base 'DBIx::Class::ResultSet';

1;
