package Tents::Rules::Adjacent;

use Moose;
extends 'Tents::Rules::Rule';

sub apply {
    my ( $self, $x, $y ) = @_;

    return if $self->grid->[$y]->[$x] ne '.';

    my $adjacent_tiles = $self->get_adjacent_tiles( $x, $y );

    foreach my $tile ( @{$adjacent_tiles} ) {
        if ( defined($tile) && $tile eq 'T' ) {
            return;
        }
    }

    $self->grid->[$y]->[$x] = "G";
}

1;
