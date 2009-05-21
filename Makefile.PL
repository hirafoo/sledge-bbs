use strict;
use inc::Module::Install;

name 'BBS';
all_from 'lib/BBS.pm';

use_test_base;
auto_include_deps;

requires $_ 
    for qw/
        Template::Plugin::LinkTo
    /;

test_requires $_
    for qw/
    /;

auto_install;
WriteAll;
