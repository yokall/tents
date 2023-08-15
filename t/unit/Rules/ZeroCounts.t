use FindBin;
use FindBin::libs;
use Test2::V0;

use Tents::Rules::ZeroCounts;

use Test::PuzzleFactory;

my $puzzle = Test::PuzzleFactory::puzzle_from_file( $FindBin::Bin . '/../../data/6x6.json' );

my $rule = Tents::Rules::ZeroCounts->new( puzzle => $puzzle );

subtest 'apply' => sub {
    $rule->apply();

    my $grid = $puzzle->grid;

    subtest 'for a row clue of 0 each' => sub {
        foreach my $tile ( @{ $grid->[3] } ) {
            ok( $tile eq 'T' || $tile eq 'G', 'tile is a tent or grass' );
        }
    };

    subtest 'for a column clue of 0 each' => sub {
        for ( my $y = 0; $y < scalar( @{$grid} ); $y++ ) {
            my $tile = $grid->[$y]->[2];

            ok( $tile eq 'T' || $tile eq 'G', 'tile is a tent or grass' );
        }
    };
};

done_testing();
