use v6;

use Test;

plan 19;

# L<S04/Phasers/ENTER "at every block entry time">
# L<S04/Phasers/LEAVE "at every block exit time">

{
    my $str;
    my sub foo ($x, $y) {
        ENTER { $str ~= "(" }
        LEAVE { $str ~= ")" }
        $str ~= "$x,$y";
    }
    foo(3,4);
    is $str, '(3,4)';
    foo(-1,2);
    is $str, '(3,4)(-1,2)';
}

# reversed order
{
    my $str;
    my sub foo ($x, $y) {
        $str ~= "$x,$y";
        LEAVE { $str ~= ")" }
        ENTER { $str ~= "(" }
    }
    foo(7,-8);
    is $str, '(7,-8)';
    foo(5,0);
    is $str, '(7,-8)(5,0)';
}

# multiple ENTER and LEAVE blocks
{
    my $str;
    {
        ENTER { $str ~= '[' }
        LEAVE { $str ~= ']' }

        $str ~= 21;

        ENTER { $str ~= '(' }
        LEAVE { $str ~= ')' }

        ENTER { $str ~= '{' }
        LEAVE { $str ~= '}' }
    }
    is $str, '[({21})]', 'multiple ENTER/LEAVE worked';
}

# L<S04/Phasers/ENTER "repeats on loop blocks">
{
    my $str;
    for 1..2 {
        $str ~= ',';
        ENTER { $str ~= "E$_" }
        LEAVE { $str ~= "L$_ " }
    }
    is $str, 'E1,L1 E2,L2 ', 'ENTER/LEAVE repeats on loop blocks';
}

# L<S04/Phasers/LEAVE "at every block exit time">

# named sub:
{
    my $str;
    my sub is_even ($x) {
        return 1 if $x % 2 == 0;
        return 0;
        LEAVE { $str ~= $x }
    }
    is is_even(3), 0, 'basic sanity check (1)';
    is $str, '3', 'LEAVE executed at the 1st explicit return';
    is is_even(2), 1, 'basic sanity check (2)';
    is $str, '32', 'LEAVE executed at the 2nd explicit return';
}

# normal closure:
{
    is eval(q{
        my $a;
        {
            leave;
            $a = 100;
            LEAVE { $a++ }
        }
        $a;
    }), 1, 'leave triggers LEAVE {}';
}

{
    my $str;
    try {
        ENTER { $str ~= '(' }
        LEAVE { $str ~= ')' }
        $str ~= 'x';
        die 'foo';
    }
    is $str, '(x)', 'die calls LEAVE blocks';
}

{
    my $str;
    try {
        LEAVE { $str ~= $! // '<undef>' }
        die 'foo';
    }
    is $str, 'foo', '$! set in LEAVE if exception thrown';
}

{
    my $str;
    {
        LEAVE { $str ~= (defined $! ?? 'yes' !! 'no') }
        try { die 'foo' }
        $str ~= (defined $! ?? 'aye' !! 'nay');
    }
    is $str, 'ayeno', '$! not set in LEAVE if exception not thrown';
}

{
    my $str;
    try {
        $str ~= '(';
        try {
            ENTER { die 'foo' }
            $str ~= 'x';
        }
        $str ~= ')';
    }
    is $str, '()', 'die in ENTER caught by try';
}

{
    my $str;
    try {
        $str ~= '(';
        try {
            LEAVE { die 'foo' }
            $str ~= 'x';
        }
        $str ~= ')';
    }
    is $str, '(x)', 'die in LEAVE caught by try';
}

{
    my $str;
    try {
        $str ~= '(';
        try {
            ENTER { $str ~= '['; die 'foo' }
            LEAVE { $str ~= ']' }
            $str ~= 'x';
        }
        $str ~= ')';
    }
    is $str, '([])', 'die in ENTER calls LEAVE';
}

{
    my $str;
    try {
        ENTER { $str ~= '1'; die 'foo' }
        ENTER { $str ~= '2' }
    }
    is $str, '1', 'die aborts ENTER queue';
}

{
    my $str;
    try {
        LEAVE { $str ~= '1' }
        LEAVE { $str ~= '2'; die 'foo' }
    }
    is $str, '21', 'die doesn\'t abort LEAVE queue';
}

# vim: ft=perl6