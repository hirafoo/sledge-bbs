package BBS::Data::Entry;
use base qw/BBS::Data::Base::DBIC/;
use self;
use BBS::ActiveRecord;
use BBS::Utils;

sub list {
    my ($params, $data) = @args;

    my $page = delete $params->{page} || 1;
    $data = $data->page($page);

    return {
        data  => $data,
        pager => $data->pager,
    };
}

1;
