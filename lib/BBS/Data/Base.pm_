package BBS::Data::Base;

use strict;
use base 'DBIx::Class::Schema::Loader';
use BBS::Config;

use autobox::String::Inflector;
use DateTime;

__PACKAGE__->loader_options(
#    components => [qw/TimeStamp::Auto Relationship::Sugar/],
#    additional_base_classes => [qw/DBIx::Class::WebForm/],
    exclude => qr/^(?:schema_migrations)$/,
    moniker_map => sub { shift->singularize->camelize },
#    skip_relationships => 1,
);

__PACKAGE__->connection(BBS::Config->instance->DATASOURCE);

1;
