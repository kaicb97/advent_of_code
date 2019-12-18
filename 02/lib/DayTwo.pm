package DayTwo;

use strict;
use warnings;

sub new {
    my ( $class ) = @_;
    my $self = {};

    bless( $self, $class );
}

sub run {
    my ( $self, $file_loader ) = @_;

    my $puzzle = $file_loader->load_file;

    my @intlist = split /,/, $puzzle;

    $self->{intlist} = \@intlist;

${$self->{intlist}}[1] = 12;
${$self->{intlist}}[2] = 2;

    my $index = 0;
    while ( scalar( @intlist ) > $index ) {

        my $operation = $self->opcode( $intlist[$index] );

        if ( $operation ) {
            my $value_1 = $intlist[ $index + 1 ];
            my $value_2 = $intlist[ $index + 2 ];
            my $result  = $intlist[ $index + 3 ];

            $self->$operation( $value_1, $value_2, $result );
        }
        else {
            die "Unbekannter opcode!";
        }

        $index += 4;
    }

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
    my ( $self, $value_1, $value_2, $result ) = @_;

    my $sum_1 = ${ $self->{intlist} }[$value_1];
    print "erster summand: " . $sum_1 . "\n";
    my $sum_2 = ${ $self->{intlist} }[$value_2];
    print "zweiter summand: " . $sum_2 . "\n";

    ${ $self->{intlist} }[$result] = $sum_1 + $sum_2;
    print "$value_1($sum_1) + $value_2($sum_2) => ($result)${$self->{intlist}}[$result]\n";
}

sub mult {
    my ( $self, $value_1, $value_2, $result ) = @_;

    my $sum_1 = ${ $self->{intlist} }[$value_1];
    print "erster summand: " . $sum_1 . "\n";
    my $sum_2 = ${ $self->{intlist} }[$value_2];
    print "zweiter summand: " . $sum_2 . "\n";

    my $sum = ${ $self->{intlist} }[$result] = $sum_1 * $sum_2;
    print "$value_1($sum_1) * $value_2($sum_2) => ($result)${$self->{intlist}}[$result]\n";
}

sub halt {
    my ( $self ) = @_;
    print "\n\nintlist an Stelle 0: " . ${ $self->{intlist} }[0] . "\n\n";
    exit;
}
1;
