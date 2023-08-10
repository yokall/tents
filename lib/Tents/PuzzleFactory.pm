package Tents::PuzzleFactory;

use JSON;

use Tents::Puzzle;

sub puzzle_from_file {
    my $filepath = shift;

    my $data;
    {
        local $/;    # Slurp mode to read entire file
        open my $fh, '<', $filepath;
        $data = decode_json(<$fh>);
        close $fh;
    }

    return Tents::Puzzle->new( row_clues => $data->{row_clues}, column_clues => $data->{column_clues}, grid => $data->{grid} );
}

1;
