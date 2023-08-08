#!/usr/bin/env perl

use lib '../lib';

use Tents::PuzzleFactory;

my $tent = Tents::PuzzleFactory::tent_from_file('../tents/6x6.json');

use Data::Dumper;
warn Dumper($tent);
