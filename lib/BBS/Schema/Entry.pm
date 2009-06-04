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

sub date_slash {
    my $self = shift;
    sprintf "%s %s", $self->created_at->date('/'), $self->created_at->hms;
}

package BBS::ResultSet::Entry;
use base 'DBIx::Class::ResultSet';
use BBS::Utils;

1;
