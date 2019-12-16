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

	
	my $fuel_for_module = formula($row);
	my $fuel_for_fuel = fuel_for_fuel($fuel_for_module);

	$fuel += $fuel_for_module + $fuel_for_fuel;

}

print ("Fuel required: " . $fuel . "\n");





#computes the fuel required for extra fuel
sub fuel_for_fuel {
	my ($new) = @_;

	my $fuel_for_new = formula($new);

	if($fuel_for_new <= 0) {
		return 0;
	}
	else {
		return $fuel_for_new + fuel_for_fuel($fuel_for_new);
	}
}



#computes the fuel required for a given mass excluding the fuel for extra fuel-mass
sub formula {
	my ($mass) = @_;

	return POSIX::floor($mass / 3) -2;
}
