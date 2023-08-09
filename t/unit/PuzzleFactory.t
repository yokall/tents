use Test2::V0;

use FindBin;

use Tents::PuzzleFactory;

my $filepath = $FindBin::Bin . '/../data/6x6.json';

my $puzzle = Tents::PuzzleFactory::puzzle_from_file($filepath);

is( $puzzle->rows,    [ 2, 0, 3, 0, 0, 2 ], 'rows are populated' );
is( $puzzle->columns, [ 1, 1, 2, 1, 1, 1 ], 'columns are populated' );

my $expected_grid = [
    [ " ", " ", " ", "T", "T", " " ],
    [ " ", " ", "T", " ", " ", " " ],
    [ " ", "T", " ", " ", " ", " " ],
    [ " ", " ", " ", " ", "T", " " ],
    [ " ", "T", " ", " ", " ", " " ],
    [ " ", " ", " ", " ", "T", " " ]
];
is( $puzzle->grid, $expected_grid, 'grid is populated' );

done_testing();
