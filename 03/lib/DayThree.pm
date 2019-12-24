
package DayThree;

use strict;
use warnings;

use Wire;

sub new {
    my ( $class ) = @_;
    my $self = {};

    bless( $self, $class );
}

sub run {
    my ( $self, $file_loader ) = @_;

    my $puzzle = $file_loader->load_file;

    $self->{shortest_distance} = undef;

    my @path = split /\n/, $puzzle;

    $self->init_a( $path[0] );
    $self->find_shortest( $path[1] );

}

#creates two hashes. the first hash has the x-values as keys and holds all interverals one which the wire is, the second one holds the y-value with intervals on the x-axis
sub init_a {
    my ( $self, $path ) = @_;

    my $tmp_x = 0;
    my $tmp_y = 0;

    my %intervals_x;
    my %intervals_y;

    my @moves = split ", ", $path;

    for my $move ( @moves ) {

        #intervals for static x
        if ( substr( $move, 0, 1 ) eq "U" ) {
            print $move . "\n";
            my $start = $tmp_y;
            my $end = $tmp_y + int( substr( $move, 1, length( $move ) - 1 ) );
            $tmp_y = $end;

            if ( $intervals_x{$tmp_x} ) {
                push @{ $intervals_x{$tmp_x} }, "[$start, $end]";
            }
            else {
                $intervals_x{$tmp_x} = ["[$start, $end]"];
            }

        }

        elsif ( substr( $move, 0, 1 ) eq "D" ) {
            print $move . "\n";
            my $start = $tmp_y;
            my $end = $tmp_y - int( substr( $move, 1, length( $move ) - 1 ) );
            $tmp_y = $end;

            if ( $intervals_x{$tmp_x} ) {
                push @{ $intervals_x{$tmp_x} }, "[$start, $end]";
            }
            else {
                $intervals_x{$tmp_x} = ["[$start, $end]"];
            }

        }

        #intervals for static y
        elsif ( substr( $move, 0, 1 ) eq "L" ) {
            print $move . "\n";
            my $start = $tmp_x;
            my $end = $tmp_x - int( substr( $move, 1, length( $move ) - 1 ) );
            $tmp_x = $end;

            if ( $intervals_y{$tmp_y} ) {
                push @{ $intervals_y{$tmp_y} }, "[$start, $end]";
            }
            else {
                $intervals_y{$tmp_y} = ["[$start, $end]"];
            }

        }

        elsif ( substr( $move, 0, 1 ) eq "R" ) {
            print $move . "\n";
            my $start = $tmp_x;
            my $end = $tmp_x + int( substr( $move, 1, length( $move ) - 1 ) );
            $tmp_x = $end;

            if ( $intervals_y{$tmp_y} ) {
                push @{ $intervals_y{$tmp_y} }, "[$start, $end]";
            }
            else {
                $intervals_y{$tmp_y} = ["[$start, $end]"];
            }

        }

    }

    $self->{wire_a} = [ %intervals_x, %intervals_y ];

    use Data::Dumper;

    #print Dumper %intervals_x;
    print "\n---------------------\n";

    #print Dumper %intervals_y;
}

sub find_shortest {
    my ( $self, $path ) = @_;

    my $tmp_x = 0;
    my $tmp_y = 0;

    my @moves = split ", ", $path;

    for my $move ( @moves ) {

        if ( substr( $move, 0, 1 ) eq "U" ) {

            my $length = int( substr( $move, 1, length( $move ) - 1 ) );

            while ( $length > 0 ) {
                $tmp_y++;
                $self->is_intersection( $tmp_x, $tmp_y );
                $length--;
            }

        }
        elsif ( substr( $move, 0, 1 ) eq "D" ) {
            print "";
        }    #...
    }

}

#check if point is in an interval of wire a
sub is_intersection {
    my ( $self, $x, $y ) = @_;
}

1;
