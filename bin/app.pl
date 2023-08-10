#!/usr/bin/env perl

use strict;
use warnings;

use FindBin;
use FindBin::libs;

use Tents::PuzzleFactory;
use Tents::Rules::Adjacent;

my $puzzle = Tents::PuzzleFactory::puzzle_from_file( $FindBin::Bin . '/../tents/6x6.json' );

print "Starting puzzle\n\n";

print $puzzle->draw();

print "\nApply adjacent rule\n\n";

my $adjacent_rule = Tents::Rules::Adjacent->new( grid => $puzzle->grid );
$adjacent_rule->apply();

print $puzzle->draw();
