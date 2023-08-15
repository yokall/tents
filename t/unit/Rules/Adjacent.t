use FindBin;
use FindBin::libs;
use Test2::V0;

use Tents::Rules::Adjacent;

use Test::PuzzleFactory;

my $puzzle = Test::PuzzleFactory::puzzle_from_file( $FindBin::Bin . '/../../data/6x6.json' );

my $rule = Tents::Rules::Adjacent->new( puzzle => $puzzle );

subtest 'apply' => sub {
    $rule->apply();

    my $grid = $puzzle->grid;

    is( $grid->[2]->[2], 'G', "should set the tile to 'G' if none of the adjacent tiles are trees" );
    is( $grid->[1]->[1], '.', "should not update the tile if any of the adjacent tiles are trees" );
    is( $grid->[5]->[0], 'G', "should treat undef tiles as not trees" );
    is( $grid->[1]->[0], 'T', "should not update the tile if it's a tree" );
};

done_testing();
