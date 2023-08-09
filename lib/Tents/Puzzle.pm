package Tents::Puzzle;

use Moose;

has 'rows'    => ( is => 'ro', isa => 'ArrayRef[Str]' );
has 'columns' => ( is => 'ro', isa => 'ArrayRef[Str]' );
has 'grid'    => ( is => 'rw', isa => 'ArrayRef[ArrayRef[Str]]' );

sub draw {
    my $self = shift;

    my @lines = ( '  ' . join( ' ', @{ $self->columns } ) . ' ' );
    for ( my $y = 0; $y < scalar( @{ $self->rows } ); $y++ ) {
        my $line = $self->rows->[$y] . ' ';
        for ( my $x = 0; $x < scalar( @{ $self->columns } ); $x++ ) {
            $line .= $self->grid->[$y]->[$x] . ' ';
        }

        push( @lines, $line );
    }

    my $output = join( "\n", @lines ) . "\n";

    return $output;
}

1;
