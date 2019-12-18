#!/usr/bin/env perl

use strict;
use warnings;

BEGIN {
    require FindBin;
    chdir $FindBin::Bin;
}

use lib "./lib";

use DayTwo;
use FileLoader;

my $day_two     = DayTwo->new;
my $file_loader = FileLoader->new( "./src/puzzle.txt" );

my $input_1 = 0;
my $input_2 = 0;

my $goal   = 19690720;
my $actual = -1;



while ( $input_1 < 173 ) {

    $input_2 = 0;

    while ( $input_2 < 173 ) {

        print "noun: $input_1, verb: $input_2\n";
        $actual = $day_two->run( $input_1, $input_2, $file_loader );

        if ( $goal == $actual ) {
            last;
        }
        $input_2++;
    }
    if ( $goal == $actual ) {
        last;
    }

    $input_1++;
}

print "noun: $input_1, verb: $input_2\n\n 100*noun*verb = " . ( 100 * $input_1 + $input_2 ) . "\n\n";

print "Liste an Stelle 0: " . $day_two->run( 23, 47, $file_loader ) . "\n";
