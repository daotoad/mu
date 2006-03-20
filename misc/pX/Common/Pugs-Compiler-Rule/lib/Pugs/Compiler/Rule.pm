package Pugs::Compiler::Rule;
$Pugs::Compiler::Rule::VERSION = '0.01';

# Documentation in the __END__
use 5.006;
use strict;
use warnings;

use Pugs::Grammar::Base;
use Pugs::Grammar::Rule;
use Pugs::Runtime::Rule;
use Pugs::Runtime::Match;
use Pugs::Emitter::Rule::Perl5;

sub new { $_[0] }

sub compile {
    my ( $class, $rule_source, %param ) = @_;

    my $self = { source => $rule_source };

    # XXX - should use user's lexical pad instead?
    $self->{grammar} = delete $param{grammar} || 'Pugs::Grammar::Base';

    $self->{ast} = Pugs::Grammar::Rule->rule( 
        $self->{source} );
    die "Error in rule: '$rule_source' at: '$self->{ast}{tail}'\n" if $self->{ast}{tail};
    #print 'rule ast: ', do{use Data::Dumper; Dumper($self->{ast}{capture})};
    $self->{perl5} = Pugs::Emitter::Rule::Perl5::emit( 
        $self->{grammar}, $self->{ast}{capture} );
    print 'rule perl5: ', do{use Data::Dumper; Dumper($self->{perl5})};

    local $@;
    $self->{code} = eval 
        $self->{perl5};
    die "Error in evaluation: $@\nSource:\n$self->{perl5}\n" if $@;

    bless $self, $class;
}

sub code { 
    my $rule = shift; 
    sub { 
        my $grammar = shift;
        $rule->match( $_[0], $grammar ); 
    } 
}

sub match {
    my ( $rule, $str, $grammar ) = @_; 
    $grammar ||= $rule->{grammar};
    #warn "match: grammar $rule->{grammar}, $_[0]";
    foreach my $i (0..length($str)) {
        my $match = $rule->{code}( 
            $grammar,
            substr($str, $i) 
        );
        defined $match or next;
        $match->{from} = $i;
        return Pugs::Runtime::Match->new( $match ) 
    }
    return Pugs::Runtime::Match->new( { bool => 0 } );   # XXX - fix?
}

1;

__END__

=head1 NAME 

Pugs::Compiler::Rule - Compiler for Perl 6 Rules

=head1 SYNOPSIS

Un-named rules are objects:

    use Pugs::Compiler::Rule;

    my $rule = Pugs::Compiler::Rule->compile( '((.).).' );
    my $match = $rule->match( 'abc' );

    if ($match) {               # true
        print $match;           # "abc"
        print $match->from;     # 0
        print $match->to;       # 3
        print $match->[0];      # "ab"
        print $match->[0][0];   # "a"
    }

Named rules are methods in a Grammar:

    package MyGrammar;
    use Pugs::Compiler::Rule;
    use Pugs::Grammar::Base;

    *rule = Pugs::Compiler::Rule->compile( '((.).).' )->code;
    my $match = MyGrammar->rule( 'abc' );

=head1 DESCRIPTION

This module provides an implementation for Perl 6 Rules.  It is a front-end
to several other modules:

=over 4

* Runtime Classes

=item * L<Pugs::Runtime::Rule> provides the runtime engine for Rules.

=item * L<Pugs::Runtime::Match> represents a B<Match> object.

=item * L<Pugs::Runtime::Grammar> represents a B<Grammar> class / object.

* Grammars

=item * L<Pugs::Grammar::Rule> parses the Rules syntax.

=item * L<Pugs::Grammar::Rule::Rule> specifies the Rules syntax with Rules.

=item * L<Pugs::Grammar::Base> is the base Grammar: <ws>, <space>.

* Code Emitters

=item * L<Pugs::Emitter::Rule::Perl5> converts parsed Rules to Perl 5 code.

=back

=head2 Implemented Features

 . ? * + *? +? ??
 \char <ws> <word> literal
 $variable @variable
 <'literal'>
 [] 
 ()     
 <subrule>
 <namespace::subrule>
 <?subrule>
 <!subrule>
 |
 <@var>             -- special-cased for array-of-rule (but not Rule|Str)
 {code}             -- non-capturing closure
                    -- perl5 syntax inside closure
                    -- $/ doesn't work yet
 { return code }    -- capturing closure
                    -- perl5 syntax inside closure
                    -- $/ works
 $var := (capture)  -- capture aliasing
 $<> $/<>           -- special variables can't be used inside a match yet
 $/ 
 $<0> $<1>
 <$var>             -- untested

=head2 Unimplemented Features

 $/<0> $/<1>
 $/0 $/1
 $0 $1
 <"literal">
 ^ ^^ $ $$
 <unicode-class> <+unicode-class> <+unicode-class+unicode-class>
 <&var> 
 <%var>
 **{n..m}
 : :: :::   (commit)
 $var := [non-capture]
 $var := <rule>
 <(closure-assertion)> <{code-returns-rule}>
 <<character-class>> <[character-class]>
 :flag :flag() :flag[]
 lookahead lookbehind
 #comment\n
 \x0a \0123 ...
 <?ws>                      -- optional whitespace ???
 &    
 <!abc>                     -- is this !<abc> or !abc ?
 \n \N

=head1 METHODS

=head2 compile (Str $rule_source)

Class method.  Returns a compiled rule object, or throws an exception on
invalid rule syntax.

options:

=item * grammar => $class - Specify which namespace (Grammar) the rule 
belongs to.

=head2 match (Str $match_against)

Instance method.  Returns a L<Pugs::Runtime::Match> object.

=head1 CAVEATS

This is an experimental development version.  There are currently no support
for match flags, and the API is still in flux.

It is currently unsuitable for just about any use other than Pugs development.
Please join us on irc.freenode.net #perl6 if you'd like to participate. :-)

=head1 AUTHORS

The Pugs Team E<lt>perl6-compiler@perl.orgE<gt>.

=head1 SEE ALSO

The Perl 6 Rules Spec: L<http://dev.perl.org/perl6/doc/design/syn/S05.html>

=head1 COPYRIGHT

Copyright 2006 by Flavio Soibelmann Glock and others.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
