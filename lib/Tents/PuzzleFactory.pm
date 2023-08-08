package Tents::PuzzleFactory;

use JSON;

use Tents::Puzzle;

sub tent_from_file {
    my $filepath = shift;

    my $data;
    {
        local $/;    # Slurp mode to read entire file
        open my $fh, '<', $filepath;
        $data = decode_json(<$fh>);
        close $fh;
    }

    return Tents::Puzzle->new( rows => $data->{rows}, columns => $data->{columns}, grid => $data->{grid} );
}

1;
