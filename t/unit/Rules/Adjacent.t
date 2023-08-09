use Test2::V0;

use Tents::Rules::Adjacent;

my $grid = [
    [ ".", ".", ".", "T", "T", "." ],
    [ ".", ".", "T", ".", ".", "." ],
    [ ".", "T", ".", ".", ".", "." ],
    [ ".", ".", ".", ".", "T", "." ],
    [ ".", "T", ".", ".", ".", "." ],
    [ ".", ".", ".", ".", "T", "." ]
];

my $rule = Tents::Rules::Adjacent->new( grid => $grid );

subtest 'apply' => sub {
    $rule->apply( 2, 3 );
    $rule->apply( 3, 3 );
    $rule->apply( 0, 0 );

    is( $grid->[3]->[2], 'G', "should set the tile to 'G' if none of the adjacent tiles are trees" );
    is( $grid->[3]->[3], '.', "should not update the tile if any of the adjacent tiles are trees" );
    is( $grid->[0]->[0], 'G', "should treat undef tiles as not trees" );
};

done_testing();
