#!/usr/bin/env perl

use strict;
use warnings;

BEGIN {
    require FindBin;
    chdir $FindBin::Bin;
}

use lib "./lib";

use DayTwo;
use FileLoader;

my $day_two     = DayTwo->new;
my $file_loader = FileLoader->new( "./src/puzzle.txt" );

$day_two->run($file_loader)














#use Data::Dumper;
#
#
#my @intlist = (1, 12, 2, 0);
#
#
#compute(0);
#
#
#
#sub compute {
#	my ($index) = @_;
#
#	my $opcode = $intlist[$index];
#	my $value_1 = $intlist[$index+1];
#	my $value_2 = $intlist[$index+2];
#	my $result = $intlist[$index+3];
#
#
#	if ($opcode == 1) {
#		add($value_1, $value_2, $result);
#	}
#	elsif ($opcode == 2) {
#		mult($value_1, $value_2, $result);
#	}
#	elsif ($opcode == 99) {
#		#program is finished and should immediately halt
#	}
#	else {
#		die("unbekannter opcode \n");
#	}
#
#}
#
#
#
#
#
#sub add {
#	my ($sum_1, $sum_2, $result) = @_;
#
#	$intlist[$result] = $intlist[$sum_1] + $intlist[$sum_2];
#}
#
#
#
#sub mult {
#	my ($sum_1, $sum_2, $result) = @_;
#
#	$intlist[$result] = $intlist[$sum_1] * $intlist[$sum_2];
#}
#
#
#
#print Dumper @intlist;
