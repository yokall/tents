package Tents::Rules::OnlyOneFreeTile;

use Moose;
extends 'Tents::Rules::Rule';

sub apply {
    my $self = shift;

    my $grid = $self->puzzle->grid;

ROW:
    for ( my $y = 0; $y < scalar( @{$grid} ); $y++ ) {
    COLUMN:
        for ( my $x = 0; $x < scalar( @{ $grid->[0] } ); $x++ ) {
            next if $grid->[$y]->[$x] ne 'T';

            my $adjacent_tiles = $self->get_adjacent_tiles( $x, $y );

            my @free_tiles;
            for ( my $i = 0; $i < 4; $i++ ) {
                my $tile = $adjacent_tiles->[$i];
                if ( defined($tile) && $tile eq '.' ) {
                    if ( $i == 0 ) {
                        push( @free_tiles, [ $y - 1, $x ] );
                    }
                    elsif ( $i == 1 ) {
                        push( @free_tiles, [ $y, $x + 1 ] );
                    }
                    elsif ( $i == 2 ) {
                        push( @free_tiles, [ $y + 1, $x ] );
                    }
                    else {
                        push( @free_tiles, [ $y, $x - 1 ] );
                    }
                }
            }

            if ( scalar(@free_tiles) == 1 ) {
                my ( $y, $x ) = @{ $free_tiles[0] };
                $grid->[$y]->[$x] = "t";
            }

        }
    }
}

1;
