package FileLoader;

use strict;
use warnings;


sub new {
	my ($class, $path) = @_;
	my $self = {};

	bless($self, $class);

	$self->_setup_path($path);

	return $self;
}



sub _setup_path {
	my ($self, $path) = @_;
	$self->{path} = $path;
}





sub load_file {
	my ($self) = @_;

	open(my $fh, "<", $self->{path});
	local $/ = undef;
	return <$fh>;
}

1;
