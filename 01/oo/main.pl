
#!/usr/bin/env perl

use strict;
use warnings;

BEGIN {
    require FindBin;
    chdir $FindBin::Bin;
}

use lib "./lib";

use FileLoader;
use DayOne;
use Calculate;


my $puzzle_fl = FileLoader->new( "./src/puzzle.txt" );
my $day_one   = DayOne->new( $puzzle_fl );


$day_one->calc_fuel;



