package Tents::Puzzle;

use Moose;

has 'row_clues'    => ( is => 'ro', isa => 'ArrayRef[Str]' );
has 'column_clues' => ( is => 'ro', isa => 'ArrayRef[Str]' );
has 'grid'         => ( is => 'rw', isa => 'ArrayRef[ArrayRef[Str]]' );

sub draw {
    my $self = shift;

    my @lines = ( '  ' . join( ' ', @{ $self->column_clues } ) . ' ' );
    for ( my $y = 0; $y < scalar( @{ $self->row_clues } ); $y++ ) {
        my $line = $self->row_clues->[$y] . ' ';
        for ( my $x = 0; $x < scalar( @{ $self->column_clues } ); $x++ ) {
            $line .= $self->grid->[$y]->[$x] . ' ';
        }

        push( @lines, $line );
    }

    my $output = join( "\n", @lines ) . "\n";

    return $output;
}

1;
