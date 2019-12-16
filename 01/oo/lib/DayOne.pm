package DayOne;

use strict;
use warnings;

use Calculate;

sub new {
    my ( $class, $file_loader ) = @_;

    my $self = {};
    bless( $self, $class );

    $self->_setup_file_loader( $file_loader );

    return $self;
}

sub _setup_file_loader {
    my ( $self, $file_loader ) = @_;
    die "FileLoader required" unless $file_loader;

    $self->{file_loader} = $file_loader;
}

sub calc_fuel {

    my ( $self ) = @_;

    my $puzzle_data = $self->{file_loader}->load_file;

    my $calculate = Calculate->new;
    my $fuel      = 0;

    my @puzzle_data = split /\n/, $puzzle_data;

    for my $row ( @puzzle_data ) {
        $fuel += $calculate->fuel_for_module( $row );
    }

    print "Fuel required: " . $fuel . "\n";
}

1;
