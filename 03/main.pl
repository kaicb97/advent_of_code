#!/usr/bin/env perl

use strict;
use warnings;


BEGIN {
    require FindBin;
    chdir $FindBin::Bin;
}

use lib "./lib";

use FileLoader;
use DayThree;

my $file_loader = FileLoader->new("./src/puzzle.txt");
my $day_three = DayThree->new;

$day_three->run($file_loader);

