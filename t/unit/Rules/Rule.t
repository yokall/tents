use Test2::V0;

use Tents::Puzzle;
use Tents::Rules::Rule;

my $grid = [
    [ ".", ".", ".", "T", "T", "." ],
    [ ".", ".", "T", ".", ".", "." ],
    [ ".", "T", ".", ".", ".", "." ],
    [ ".", ".", ".", ".", "T", "." ],
    [ ".", "T", ".", ".", ".", "." ],
    [ ".", ".", ".", ".", "T", "." ]
];

my $rule = Tents::Rules::Rule->new( puzzle => Tents::Puzzle->new( grid => $grid ) );

subtest 'get_adjacent_tiles' => sub {

    is( $rule->get_adjacent_tiles( 1, 1 ), [ ".", "T", "T", "." ], 'should return the value of the 4 adjacent tiles, starting directly above and going clockwise' );

    is( $rule->get_adjacent_tiles( 1, 0 )->[0], undef, 'should return undef for the first element if there is no row above the current tile' );

    is( $rule->get_adjacent_tiles( 5, 1 )->[1], undef, 'should return undef for the second element if there is no column to the right of the current tile' );

    is( $rule->get_adjacent_tiles( 1, 5 )->[2], undef, 'should return undef for the third element if there is no row below the current tile' );

    is( $rule->get_adjacent_tiles( 0, 1 )->[3], undef, 'should return undef for the fourth element if there is no column to the left of the current tile' );

};

done_testing();
