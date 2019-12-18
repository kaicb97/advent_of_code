package DayTwo;

use strict;
use warnings;

sub new {
    my ( $class ) = @_;
    my $self = {};

    bless( $self, $class );
}

sub run {
    my ( $self, $input_noun, $input_verb, $file_loader ) = @_;

    my $puzzle = $file_loader->load_file;

    my @intlist = split /,/, $puzzle;

    $self->{intlist} = \@intlist;

    ${ $self->{intlist} }[1] = $input_noun;
    ${ $self->{intlist} }[2] = $input_verb;

    my $index = 0;
    while ( scalar( @intlist ) > $index ) {

        my $operation = $self->opcode( $intlist[$index] );

        if ( $operation ) {
            my $value_1 = $intlist[ $index + 1 ];
            my $value_2 = $intlist[ $index + 2 ];
            my $result  = $intlist[ $index + 3 ];

            $intlist[$result] = $self->$operation( $intlist[$value_1], $intlist[$value_2] );
        }
        else {
            die "Unbekannter opcode!";
        }

	last if($operation eq "halt");

        $index += 4;
    }

	return $intlist[0];
}

sub opcode {
    my ( $self, $code ) = @_;

    if ( $code == 1 ) {
        return "add";
    }
    elsif ( $code == 2 ) {
        return "mult";
    }
    elsif ( $code == 99 ) {
        return "halt";
    }
    return undef;

}

sub add {
    my ( $self, $sum_1, $sum_2 ) = @_;
    return $sum_1 + $sum_2;
}

sub mult {
    my ( $self, $sum_1, $sum_2 ) = @_;
    return $sum_1 * $sum_2;
}

sub halt {
    my ( $self ) = @_;
    #print "\n\nintlist an Stelle 0: " . ${ $self->{intlist} }[0] . "\n\n";
    #exit;
}
1;
