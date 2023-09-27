use FindBin;
use FindBin::libs;
use Test2::V0;

use Tents::Rules::TentSurrounding;

use Test::PuzzleFactory;

my $puzzle = Test::PuzzleFactory::puzzle_from_file( $FindBin::Bin . '/../../data/BlankTentSurroundingTiles.json' );

my $rule = Tents::Rules::TentSurrounding->new( puzzle => $puzzle );

subtest 'apply' => sub {
    $rule->apply();

    my $grid = $puzzle->grid;

    is( $grid->[4]->[0], 'G', "should set blank tiles surrounding tents to 'G' for grass" );
};

done_testing();
