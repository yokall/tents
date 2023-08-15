use Test2::V0;

use Tents::Puzzle;

my $row_clues    = [ 2, 0, 3, 0, 0, 2 ];
my $column_clues = [ 1, 1, 2, 1, 1, 1 ];
my $grid         = [
    [ ".", ".", ".", "T", "T", "." ],
    [ ".", ".", "T", ".", ".", "." ],
    [ ".", "T", ".", ".", ".", "." ],
    [ ".", ".", ".", ".", "T", "." ],
    [ ".", "T", ".", ".", ".", "." ],
    [ ".", ".", ".", ".", "T", "." ]
];

my $puzzle = Tents::Puzzle->new( row_clues => $row_clues, column_clues => $column_clues, grid => $grid );

subtest 'draw' => sub {
    my $expected = "  1 1 2 1 1 1 \n" . "2 . . . T T . \n" . "0 . . T . . . \n" . "3 . T . . . . \n" . "0 . . . . T . \n" . "0 . T . . . . \n" . "2 . . . . T . \n";

    is( $puzzle->draw(), $expected, 'should return a string representation of the puzzle' );
};

done_testing();
