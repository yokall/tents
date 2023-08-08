use Test2::V0;

use FindBin;

use Tents::PuzzleFactory;

my $filepath = $FindBin::Bin . '/../data/6x6.json';

my $tent = Tents::PuzzleFactory::tent_from_file($filepath);

is( $tent->rows,    [ 2, 0, 3, 0, 0, 2 ], 'rows are populated' );
is( $tent->columns, [ 1, 1, 2, 1, 1, 1 ], 'columns are populated' );

my $expected_grid = [
    [ "", "",  "",  "T", "T", "" ],
    [ "", "",  "T", "",  "",  "" ],
    [ "", "T", "",  "",  "",  "" ],
    [ "", "",  "",  "",  "T", "" ],
    [ "", "T", "",  "",  "",  "" ],
    [ "", "",  "",  "",  "T", "" ]
];
is( $tent->grid, $expected_grid, 'grid is populated' );

done_testing();
