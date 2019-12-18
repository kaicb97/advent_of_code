package DayThree;

use strict;
use warnings;



sub new {
	my ($class) = @_;
	my $self = {};

	bless($self, $class);
}



sub run {
	my ($self, $file_loader) = @_;

	my $puzzle = $file_loader->load_file;

	$self->{shortest_distance} = 0;

	print $puzzle . "\n";
}







#position - point before instruction, instruction number of steps to go
sub move_up {
	my ($self, $position, $instruction) = @_;

	my $pos_x = 0;
	my $pos_y = 0;
	my $steps = 7;

	for($steps; $steps > 0; $steps--) {
		
		@array[$pos_x][($pos_y+$steps)] = 1;

		if($arrayA[$pos_x][($pos_y+$steps)] == $arrayB... == 1) {
			compute_distance(positonObject);
		}
	}
}


sub compute_distance {
	my ($self, $position) = @_;

	my $distance = $pos_x-$pos_y;

	if($distance < $self->{shortest_distance}) {
		$self->shortest_distance = $distance;
	}
}






1;
