package DayThree;

use strict;
use warnings;

sub new {
    my ( $class ) = @_;
    my $self = {};

    bless( $self, $class );
}

sub run {
    my ( $self, $file_loader, $offset ) = @_;

    my $puzzle = $file_loader->load_file;

    $self->{shortest_distance} = 0;
$self->{offset} = $offset;

    #print $puzzle . "\n";

    #split puzzle at linebreak

    my @path = split /\n/, $puzzle;

    $self->{wire_a} = $self->write_array( $path[0] );
    $self->{wire_b} = $self->write_array( $path[1] );
}

sub write_array {
    my ( $self, $path ) = @_;

    print $path . "\n\n";

    my $pos_x = 25;
    my $pos_y = 25;

    my @matrix;
    $self->{matrix} = \@matrix;

    my @steps = split ", ", $path;

    for my $step ( @steps ) {

        my $direction = substr $step, 0, 1;
        my $length = int( substr $step, 1, length( $step ) - 1 );

        if ( $direction eq "R" ) {
            $self->move_right( $pos_x, $pos_y, $length );
            $pos_x += $length;
            print "Rechts mit $step, neue Position: ($pos_x, $pos_y) \n";
        }
        elsif ( $direction eq "L" ) {
            $self->move_left( $pos_x, $pos_y, $length );
            $pos_x -= $length;
            print "Links mit $step, neue Position: ($pos_x, $pos_y) \n";
        }
        elsif ( $direction eq "U" ) {
            $self->move_up( $pos_x, $pos_y, $length );
            $pos_y += $length;
            print "Hoch mit $step, neue Position: ($pos_x, $pos_y) \n";
        }
        elsif ( $direction eq "D" ) {
            $self->move_down( $pos_x, $pos_y, $length );
            $pos_y -= $length;
            print "Runter mit $step, neue Position: ($pos_x, $pos_y) \n";
        }

    }
	
    use Data::Dumper;
    print Dumper $self->{matrix};
    $self->print_wire;
}

#position - point before instruction, instruction number of steps to go
sub move_up {
    my ( $self, $pos_x, $pos_y, $steps ) = @_;

    while ( $steps > 0 ) {

        my $tmp_y = int( $pos_y + $steps );

	$self->{matrix}[$pos_x][$tmp_y] = 1;
        $steps--;
    }
}

sub move_down {
    my ( $self, $pos_x, $pos_y, $steps ) = @_;

    while ( $steps > 0 ) {

        my $tmp_y = int( $pos_y - $steps );

	$self->{matrix}[$pos_x][$tmp_y] = 1;
        $steps--;
    }
}


sub move_left {
    my ( $self, $pos_x, $pos_y, $steps ) = @_;

    while ( $steps > 0 ) {

        my $tmp_x = int( $pos_x - $steps );

	$self->{matrix}[$tmp_x][$pos_y] = 1;
        $steps--;
    }
}


sub move_right {
    my ( $self, $pos_x, $pos_y, $steps ) = @_;

    while ( $steps > 0 ) {

        my $tmp_x = int( $pos_x + $steps );

	$self->{matrix}[$tmp_x][$pos_y] = 1;
        $steps--;
    }
}



sub print_wire {
	print "\n print wire: \n\n";
	my ($self) = @_;

	my $offset = $self->{offset};

	my $pos_x = 0;
	my $pos_y = 0;

	for my $val_x ($self->{matrix}) {
		my @x = @{$val_x};
		use Data::Dumper @{$val_x};
			for my $val_y (@x) {
				print "(" . $pos_x . ", " . $pos_y . ")\n";
				$pos_y++;
			}
			print "\n";

		$pos_x++;
	}
	
}

#sub compute_distance {
#	my ($self, $position) = @_;
#
#	my $distance = $pos_x-$pos_y;
#
#	if($distance < $self->{shortest_distance}) {
#		$self->shortest_distance = $distance;
#	}
#}

1;
