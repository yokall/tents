use FindBin;
use FindBin::libs;
use Test2::V0;

use Tents::Rules::OnlyOneFreeTile;

use Test::PuzzleFactory;

my $puzzle = Test::PuzzleFactory::puzzle_from_file( $FindBin::Bin . '/../../data/OnlyOneFree.json' );

my $rule = Tents::Rules::OnlyOneFreeTile->new( puzzle => $puzzle );

subtest 'apply' => sub {

    $rule->apply();

    my $grid = $puzzle->grid;

    is( $grid->[1]->[3], 't', "should set the only free tile around a tree to 't' for tent" );
};

done_testing();
