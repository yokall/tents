package Tents::Puzzle;

use Moose;

has 'rows'    => ( is => 'ro', isa => 'ArrayRef[Str]' );
has 'columns' => ( is => 'ro', isa => 'ArrayRef[Str]' );
has 'grid'    => ( is => 'rw', isa => 'ArrayRef[ArrayRef[Str]]' );

1;
