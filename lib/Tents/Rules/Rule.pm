package Tents::Rules::Rule;

use Moose;

use Tents::Puzzle;

has 'puzzle' => ( is => 'ro', isa => 'Tents::Puzzle' );

sub get_adjacent_tiles {
    my ( $self, $x, $y ) = @_;

    my $grid = $self->puzzle->grid;

    my @tiles;

    if ( $y - 1 >= 0 ) {
        push( @tiles, $grid->[ $y - 1 ]->[$x] );
    }
    else {
        push( @tiles, undef );
    }

    if ( $x + 1 < scalar( @{ $grid->[0] } ) ) {
        push( @tiles, $grid->[$y]->[ $x + 1 ] );
    }
    else {
        push( @tiles, undef );
    }

    if ( $y + 1 < scalar( @{$grid} ) ) {
        push( @tiles, $grid->[ $y + 1 ]->[$x] );
    }
    else {
        push( @tiles, undef );
    }

    if ( $x - 1 >= 0 ) {
        push( @tiles, $grid->[$y]->[ $x - 1 ] );
    }
    else {
        push( @tiles, undef );
    }

    return \@tiles;
}

1;
