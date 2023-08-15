package Tents::Rules::Adjacent;

use Moose;
extends 'Tents::Rules::Rule';

sub apply {
    my $self = shift;

    my $grid = $self->puzzle->grid;

ROW:
    for ( my $y = 0; $y < scalar( @{$grid} ); $y++ ) {
    COLUMN:
        for ( my $x = 0; $x < scalar( @{ $grid->[0] } ); $x++ ) {
            next if $grid->[$y]->[$x] ne '.';

            my $adjacent_tiles = $self->get_adjacent_tiles( $x, $y );

            foreach my $tile ( @{$adjacent_tiles} ) {
                if ( defined($tile) && $tile eq 'T' ) {
                    next COLUMN;
                }
            }

            $grid->[$y]->[$x] = "G";
        }
    }
}

1;
