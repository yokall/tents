package Tents::Rules::ZeroCounts;

use Moose;
extends 'Tents::Rules::Rule';

sub apply {
    my ($self) = @_;

    my $puzzle = $self->puzzle;

    for ( my $x = 0; $x < scalar( @{ $puzzle->column_clues } ); $x++ ) {
        if ( $puzzle->column_clues->[$x] eq '0' ) {
            for ( my $y = 0; $y < scalar( @{ $puzzle->row_clues } ); $y++ ) {
                $self->puzzle->grid->[$y]->[$x] = 'G' if $self->puzzle->grid->[$y]->[$x] eq '.';
            }
        }
    }

    for ( my $y = 0; $y < scalar( @{ $puzzle->row_clues } ); $y++ ) {
        if ( $puzzle->row_clues->[$y] eq '0' ) {
            for ( my $x = 0; $x < scalar( @{ $puzzle->column_clues } ); $x++ ) {
                $self->puzzle->grid->[$y]->[$x] = 'G' if $self->puzzle->grid->[$y]->[$x] eq '.';
            }
        }
    }
}

1;
