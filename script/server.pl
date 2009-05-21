#!/usr/bin/perl -w

use strict;
use warnings;
use Getopt::Long;
use UNIVERSAL::require;
use Sledge::Helper::Server;
use lib './lib';

my $port = 3000;
my $page = shift || 'Index';

GetOptions( 
  'port=s' => \$port, 
  'page=s' => \$page, 
);

my $server = Sledge::Helper::Server->new("BBS::Pages::".$page, $port);
$server->run();

1;
