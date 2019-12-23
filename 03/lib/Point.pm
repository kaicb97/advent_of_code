package Point;

use strict;
use warnings;


sub new {
	my ($class) = @_;
	my $self = {};

	bless($self, $class);
	return $self;
}


sub set_point {
	my ($self, $x, $y) = @_;

	$self->{x} = $x;
	$self->{y} = $y;
}



sub print_point {
	my ($self) = @_;

	print "(" . $self->{x} . ", " . $self->{y} . ")\n";
}



1;
