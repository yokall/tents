#!/usr/bin/env perl

use strict;
use warnings;

use FindBin;
use FindBin::libs;

use Tents::PuzzleFactory;
use Tents::Rules::Adjacent;
use Tents::Rules::OnlyOneFreeTile;
use Tents::Rules::ZeroCounts;

my $puzzle = Tents::PuzzleFactory::puzzle_from_file( $FindBin::Bin . '/../tents/6x6.json' );

print "Starting puzzle\n\n";

print $puzzle->draw();

print "\nApply zero counts rule\n\n";

my $zero_counts_rule = Tents::Rules::ZeroCounts->new( puzzle => $puzzle );
$zero_counts_rule->apply();

print $puzzle->draw();

print "\nApply adjacent rule\n\n";

my $adjacent_rule = Tents::Rules::Adjacent->new( puzzle => $puzzle );
$adjacent_rule->apply();

print $puzzle->draw();

print "\nApply only 1 free tile rule\n\n";

my $only_one_free_tile_rule = Tents::Rules::OnlyOneFreeTile->new( puzzle => $puzzle );
$only_one_free_tile_rule->apply();

print $puzzle->draw();
