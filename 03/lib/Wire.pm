package Wire;

use strict;
use warnings;

use Point;

sub new {
    my ( $class ) = @_;
    my $self = {};

    bless( $self, $class );
}

sub init {
    my ( $self, $path ) = @_;

    my $tmp_x = 0;
    my $tmp_y = 0;

    my @wire;

    my @steps = split ",", $path;

    for my $step ( @steps ) {


	    #print("\nStart: (" . $tmp_x . ", " . $tmp_y . ") \nAnweisung: " . $step . "\n");

        my $direction = substr $step, 0, 1;
        my $length = int( substr $step, 1, length( $step ) - 1 );

        #move up
        if ( $direction eq "U" ) {

            while ( $length > 0 ) {

                my $p = Point->new;
                $p->set_point( $tmp_x, $tmp_y );
                push @wire, $p;

                $tmp_y++;
                $length--;
            }

        }
        elsif ( $direction eq "D" ) {
            while ( $length > 0 ) {

                my $p = Point->new;
                $p->set_point( $tmp_x, $tmp_y );
                push @wire, $p;

                $tmp_y--;
                $length--;
            }

        }
	elsif($direction eq "R") {
            while ( $length > 0 ) {

                my $p = Point->new;
                $p->set_point( $tmp_x, $tmp_y );
                push @wire, $p;

                $tmp_x++;
                $length--;
            }
	
	}
	elsif($direction eq "L") {
            while ( $length > 0 ) {

                my $p = Point->new;
                $p->set_point( $tmp_x, $tmp_y );
                push @wire, $p;

                $tmp_x--;
                $length--;
            }
	
	}
    }

    $self->{wire} = \@wire;
}

sub print_wire {
    my ( $self ) = @_;

    for my $p ( @{ $self->{wire} } ) {
        $p->print_point;


    }
}

1;
