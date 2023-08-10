package Tents::Rules::Adjacent;

use Moose;
extends 'Tents::Rules::Rule';

sub apply {
    my $self = shift;

ROW:
    for ( my $y = 0; $y < scalar( @{ $self->grid } ); $y++ ) {
    COLUMN:
        for ( my $x = 0; $x < scalar( @{ $self->grid->[0] } ); $x++ ) {
            next if $self->grid->[$y]->[$x] ne '.';

            my $adjacent_tiles = $self->get_adjacent_tiles( $x, $y );

            foreach my $tile ( @{$adjacent_tiles} ) {
                if ( defined($tile) && $tile eq 'T' ) {
                    next COLUMN;
                }
            }

            $self->grid->[$y]->[$x] = "G";
        }
    }
}

1;
