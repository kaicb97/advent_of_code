package DayTwo;

use strict;
use warnings;

sub new {
    my ( $class ) = @_;
    my $self = {};

    bless( $self, $class );
}

sub run {
	my ($self, $file_loader) = @_;

	my $raw_data = $file_loader->load_file;

	my @intlist = split /,/, $raw_data;

	$self->{intlist} = @intlist;	
	$self->opcode(2);
}


sub opcode {
	my ($self, $index)

	print $self->{intlist};
}

1;
