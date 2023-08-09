#!/usr/bin/env perl

use lib '../lib';

use Tents::PuzzleFactory;

my $puzzle = Tents::PuzzleFactory::puzzle_from_file('../tents/6x6.json');

print $puzzle->draw();
