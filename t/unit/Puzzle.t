use Test2::V0;

use Tents::Puzzle;

my $rows    = [ 2, 0, 3, 0, 0, 2 ];
my $columns = [ 1, 1, 2, 1, 1, 1 ];
my $grid    = [
    [ " ", " ", " ", "T", "T", " " ],
    [ " ", " ", "T", " ", " ", " " ],
    [ " ", "T", " ", " ", " ", " " ],
    [ " ", " ", " ", " ", "T", " " ],
    [ " ", "T", " ", " ", " ", " " ],
    [ " ", " ", " ", " ", "T", " " ]
];

my $puzzle = Tents::Puzzle->new( rows => $rows, columns => $columns, grid => $grid );

subtest 'draw' => sub {
    my $expected = "  1 1 2 1 1 1 \n" . "2       T T   \n" . "0     T       \n" . "3   T         \n" . "0         T   \n" . "0   T         \n" . "2         T   \n";

    is( $puzzle->draw(), $expected, 'should return a string representation of the puzzle' );
};

done_testing();
