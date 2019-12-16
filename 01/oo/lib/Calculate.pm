package Calculate;

use strict;
use warnings;

use POSIX;


sub new {
	my ($class ) = @_;
	my $self = {};
	
	bless($self, $class);
}


sub fuel_for_module {
	my($self, $mass) = @_;
	
	
	my $fuel_for_module = POSIX::floor($mass / 3) -2;

	my $fuel_for_fuel = $self->fuel_for_fuel($fuel_for_module);

	return $fuel_for_module + $fuel_for_fuel;
}

#computes the fuel required for extra fuel
sub fuel_for_fuel {
	my ($self, $new) = @_;

	my $fuel_for_new = POSIX::floor($new / 3) -2;

	if($fuel_for_new <= 0) {
		return 0;
	}
	else {
		return $fuel_for_new + $self->fuel_for_fuel($fuel_for_new);
	}
}


1;
