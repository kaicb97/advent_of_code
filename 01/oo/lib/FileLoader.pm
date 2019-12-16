package FileLoader;

use strict;
use warnings;

sub new {
    my ( $class, $path ) = @_;
    my $self = { path => $path };

    bless $self, $class;
}

sub load_file {
	my ($self) = @_;

	open(my $fh, "<", $self->path ) or die "Fehler";
	local $/=undef;
	my $input = <$fh>;
	return $input;
}



sub path {
	my ($self) = @_;
	return $self->{path};
}

1;
