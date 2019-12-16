#!/usr/bin/env perl


use strict;
use warnings;

use POSIX;


my $path_puzzle = "./puzzle_input.txt";

open (my $fh, '<:encoding(UTF-8)', $path_puzzle)
	or die "Fehler beim öffnen von 'puzzle_input.txt'";


my $fuel = 0;

while (my $row = <$fh>) {
	chomp $row;

	

	$fuel += POSIX::floor($row / 3) -2;

}

print ("Fuel required: " . $fuel . "\n");
