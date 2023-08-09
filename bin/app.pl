#!/usr/bin/env perl

use strict;
use warnings;

use FindBin;

use lib '../lib';

use Tents::PuzzleFactory;
use Tents::Rules::Adjacent;

my $puzzle = Tents::PuzzleFactory::puzzle_from_file( $FindBin::Bin . '/../tents/6x6.json' );

print $puzzle->draw();

print "\nApply adjacent rule\n";

my $adjacent_rule = Tents::Rules::Adjacent->new( grid => $puzzle->grid );

for ( my $y = 0; $y < scalar( @{ $puzzle->rows } ); $y++ ) {
    for ( my $x = 0; $x < scalar( @{ $puzzle->columns } ); $x++ ) {
        $adjacent_rule->apply( $x, $y );
    }
}

print $puzzle->draw();
