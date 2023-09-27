package Tents::Rules::TentSurrounding;

use Moose;
use Readonly;

extends 'Tents::Rules::Rule';

Readonly my @x_modifiers => ( -1, 0,  1,  -1, 1, -1, 0, 1 );
Readonly my @y_modifiers => ( -1, -1, -1, 0,  0, 1,  1, 1 );

sub apply {
    my $self = shift;

    my $grid = $self->puzzle->grid;

    for ( my $y = 0; $y < scalar( @{$grid} ); $y++ ) {
        for ( my $x = 0; $x < scalar( @{ $grid->[0] } ); $x++ ) {
            next if $grid->[$y]->[$x] ne 't';

            for ( my $i = 0; $i < scalar(@x_modifiers); $i++ ) {
                my $check_x = $x + $x_modifiers[$i];
                my $check_y = $y + $y_modifiers[$i];

                next if $check_x < 0 || $check_x >= scalar( @{ $grid->[0] } );
                next if $check_y < 0 || $check_y >= scalar( @{$grid} );

                $grid->[$check_y]->[$check_x] = 'G' if $grid->[$check_y]->[$check_x] eq '.';
            }
        }
    }
}

1;
