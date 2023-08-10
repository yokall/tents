use Test2::V0;

use FindBin;

use Tents::PuzzleFactory;

my $filepath = $FindBin::Bin . '/../data/6x6.json';

my $puzzle = Tents::PuzzleFactory::puzzle_from_file($filepath);

is( $puzzle->row_clues,    [ 2, 0, 3, 0, 0, 2 ], 'row_clues are populated' );
is( $puzzle->column_clues, [ 1, 1, 2, 1, 1, 1 ], 'column_clues are populated' );

my $expected_grid = [
    [ ".", ".", ".", "T", "T", "." ],
    [ ".", ".", "T", ".", ".", "." ],
    [ ".", "T", ".", ".", ".", "." ],
    [ ".", ".", ".", ".", "T", "." ],
    [ ".", "T", ".", ".", ".", "." ],
    [ ".", ".", ".", ".", "T", "." ]
];
is( $puzzle->grid, $expected_grid, 'grid is populated' );

done_testing();
