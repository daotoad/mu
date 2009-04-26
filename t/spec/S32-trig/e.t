use v6;
use Test;
plan 5;

# L<S32::Numeric/"The :Trig tag">

=begin description

Basic tests for trigonometric functions.

=end description

# See also: L<"http://en.wikipedia.org/wiki/E_%28mathematical_constant%29"> :)
my $e = e;

is(e      , $e,    "e, as a value");
#?rakudo todo 'e() still parses as sub'
eval_dies_ok('e()', "e(), dies as a sub");
is(1 + e,   $e+1, "1+e, as a value");
#?rakudo skip 'parse error, space after the e'
is(e + 1,   $e+1, "e+1, as a value");
#?rakudo skip 'parse error, space after the e'
is(1 + e +0, $e+1, "1 + e +0, as a value");
