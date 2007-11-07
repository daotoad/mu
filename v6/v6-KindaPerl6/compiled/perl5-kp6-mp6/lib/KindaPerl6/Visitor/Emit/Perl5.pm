# Do not edit this file - Generated by MiniPerl6
use v5;
use strict;
use MiniPerl6::Perl5::Runtime;
use MiniPerl6::Perl5::Match;

package KindaPerl6::Visitor::Emit::Perl5;
sub new { shift; bless {@_}, "KindaPerl6::Visitor::Emit::Perl5" }
sub visitor_args { @_ == 1 ? ( $_[0]->{visitor_args} ) : ( $_[0]->{visitor_args} = $_[1] ) }

sub visit {
    my $self   = shift;
    my $List__ = \@_;
    my $node;
    do { $node = $List__->[0]; [$node] };
    $node->emit_perl5( $self->{visitor_args}->{'secure'} );
}

package CompUnit;
sub new { shift; bless {@_}, "CompUnit" }

sub set_secure_mode {
    my $List__ = \@_;
    my $args_secure;
    do { $args_secure = $List__->[0]; [$args_secure] };
    my $value = '0';
    do {
        if ($args_secure) { $value = '1' }
        else { }
    };
    return ( ( 'use constant KP6_DISABLE_INSECURE_CODE => ' . ( $value . ( ';' . Main::newline() ) ) ) );
}

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    my $args_secure;
    do { $args_secure = $List__->[0]; [$args_secure] };
    $KindaPerl6::Visitor::Emit::Perl5::current_compunit = $self->{name};
    my $source = '';
    do {
        if ( $self->{body} ) { $source = $self->{body}->emit_perl5() }
        else { }
    };
    (   '{ package '
            . (
            $self->{name}
                . (
                '; '
                    . (
                    Main::newline()
                        . (
                        '# Do not edit this file - Perl 5 generated by '
                            . (
                            $Main::_V6_COMPILER_NAME
                                . (
                                Main::newline()
                                    . (
                                    'use v5;'
                                        . (
                                        Main::newline()
                                            . (
                                            'use strict;'
                                                . (
                                                Main::newline()
                                                    . (
                                                    'no strict "vars";'
                                                        . (
                                                        Main::newline()
                                                            . (
                                                            set_secure_mode($args_secure)
                                                                . (
                                                                'use '
                                                                    . (
                                                                    Main::get_compiler_target_runtime()
                                                                        . (
                                                                        ';'
                                                                            . (
                                                                            Main::newline()
                                                                                . (
                                                                                'my $_MODIFIED; INIT { $_MODIFIED = {} }'
                                                                                    . (
                                                                                    Main::newline()
                                                                                        . (
                                                                                        'INIT { '
                                                                                            . (
                                                                                            '$_ = ::DISPATCH($::Scalar, "new", { modified => $_MODIFIED, name => "$_" } ); '
                                                                                                . ( '}' . ( Main::newline() . ( $source . ( Main::newline() . ( '; 1 }' . Main::newline() ) ) ) ) )
                                                                                            )
                                                                                        )
                                                                                    )
                                                                                )
                                                                            )
                                                                        )
                                                                    )
                                                                )
                                                            )
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
    );
}

package Val::Int;
sub new { shift; bless {@_}, "Val::Int" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    ( '::DISPATCH( $::Int, \'new\', ' . ( $self->{int} . ( ' )' . Main::newline() ) ) );
}

package Val::Bit;
sub new { shift; bless {@_}, "Val::Bit" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    ( '::DISPATCH( $::Bit, \'new\', ' . ( $self->{bit} . ( ' )' . Main::newline() ) ) );
}

package Val::Num;
sub new { shift; bless {@_}, "Val::Num" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    ( '::DISPATCH( $::Num, \'new\', ' . ( $self->{num} . ( ' )' . Main::newline() ) ) );
}

package Val::Buf;
sub new { shift; bless {@_}, "Val::Buf" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    ( '::DISPATCH( $::Str, \'new\', ' . ( Main::singlequote() . ( Main::mangle_string( $self->{buf} ) . ( Main::singlequote() . ( ' )' . Main::newline() ) ) ) ) );
}

package Val::Char;
sub new { shift; bless {@_}, "Val::Char" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    ( '::DISPATCH( $::Str, \'new\', chr( ' . ( $self->{char} . ( ' ) )' . Main::newline() ) ) );
}

package Val::Undef;
sub new { shift; bless {@_}, "Val::Undef" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    '$::Undef';
}

package Val::Object;
sub new { shift; bless {@_}, "Val::Object" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    die('Emitting of Val::Object not implemented');
}

package Native::Buf;
sub new { shift; bless {@_}, "Native::Buf" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    die('Emitting of Native::Buf not implemented');
}

package Lit::Seq;
sub new { shift; bless {@_}, "Lit::Seq" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    ( '(' . ( Main::join( [ map { $_->emit_perl5() } @{ $self->{seq} } ], ', ' ) . ')' ) );
}

package Lit::Array;
sub new { shift; bless {@_}, "Lit::Array" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    ( '{ _array => [' . ( Main::join( [ map { $_->emit_perl5() } @{ $self->{array} } ], ', ' ) . ( '] }' . Main::newline() ) ) );
}

package Lit::Hash;
sub new { shift; bless {@_}, "Lit::Hash" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    my $fields = $self->{hash};
    my $str    = '';
    my $field;
    do {
        for my $field ( @{$fields} ) { $str = ( $str . ( $field->[0]->emit_perl5() . ( '->{_value} => ' . ( $field->[1]->emit_perl5() . ',' ) ) ) ) }
    };
    ( '{ _hash => { ' . ( $str . ( ' } }' . Main::newline() ) ) );
}

package Lit::Pair;
sub new { shift; bless {@_}, "Lit::Pair" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    ( '::DISPATCH( $::Pair, \'new\', ' . ( '{ key => ' . ( $self->{key}->emit_perl5() . ( ', value => ' . ( $self->{value}->emit_perl5() . ( ' } )' . Main::newline() ) ) ) ) ) );
}

package Lit::NamedArgument;
sub new { shift; bless {@_}, "Lit::NamedArgument" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    ( '::DISPATCH( $::NamedArgument, \'new\', ' . ( '{ _argument_name_ => ' . ( $self->{key}->emit_perl5() . ( ', value => ' . ( ( defined( $self->{value} ) ? $self->{value}->emit_perl5() : 'undef' ) . ( ' } )' . Main::newline() ) ) ) ) ) );
}

package Lit::SigArgument;
sub new { shift; bless {@_}, "Lit::SigArgument" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    (   '::DISPATCH( $::Signature::Item, \'new\', '
            . (
            '{ '
                . (
                'sigil  => \''
                    . (
                    $self->{key}->sigil()
                        . (
                        '\', '
                            . (
                            'twigil => \''
                                . (
                                $self->{key}->twigil()
                                    . (
                                    '\', '
                                        . (
                                        'name   => \''
                                            . (
                                            $self->{key}->name()
                                                . (
                                                '\', '
                                                    . (
                                                    'value  => '
                                                        . (
                                                        ( defined( $self->{value} ) ? $self->{value}->emit_perl5() : 'undef' )
                                                        . ( ', '
                                                                . (
                                                                'has_default    => '
                                                                    . (
                                                                    $self->{has_default}->emit_perl5()
                                                                        . (
                                                                        ', '
                                                                            . (
                                                                            'is_named_only  => '
                                                                                . (
                                                                                $self->{is_named_only}->emit_perl5()
                                                                                    . (
                                                                                    ', '
                                                                                        . (
                                                                                        'is_optional    => '
                                                                                            . (
                                                                                            $self->{is_optional}->emit_perl5()
                                                                                                . (
                                                                                                ', '
                                                                                                    . (
                                                                                                    'is_slurpy      => '
                                                                                                        . (
                                                                                                        $self->{is_slurpy}->emit_perl5()
                                                                                                            . (
                                                                                                            ', '
                                                                                                                . (
                                                                                                                'is_multidimensional  => '
                                                                                                                    . (
                                                                                                                    $self->{is_multidimensional}->emit_perl5()
                                                                                                                        . (
                                                                                                                        ', '
                                                                                                                            . (
                                                                                                                            'is_rw          => '
                                                                                                                                . (
                                                                                                                                $self->{is_rw}->emit_perl5()
                                                                                                                                    . ( ', ' . ( 'is_copy        => ' . ( $self->{is_copy}->emit_perl5() . ( ', ' . ( ' } )' . Main::newline() ) ) ) ) )
                                                                                                                                )
                                                                                                                            )
                                                                                                                        )
                                                                                                                    )
                                                                                                                )
                                                                                                            )
                                                                                                        )
                                                                                                    )
                                                                                                )
                                                                                            )
                                                                                        )
                                                                                    )
                                                                                )
                                                                            )
                                                                        )
                                                                    )
                                                                )
                                                        )
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
    );
}

package Lit::Code;
sub new { shift; bless {@_}, "Lit::Code" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    ( 'do { ' . ( $self->emit_declarations() . ( $self->emit_body() . ' }' ) ) );
}

sub emit_body {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    Main::join( [ map { $_->emit_perl5() } @{ $self->{body} } ], '; ' );
}

sub emit_signature {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    $self->{sig}->emit_perl5();
}

sub emit_declarations {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    my $s;
    my $name;
    do {
        for my $name ( @{ $self->{pad}->variable_names() } ) {
            my $decl = Decl->new( 'decl' => 'my', 'type' => '', 'var' => Var->new( 'sigil' => '', 'twigil' => '', 'name' => $name, 'namespace' => [], ), );
            $s = ( $s . ( $name->emit_perl5() . ( ';' . Main::newline() ) ) );
        }
    };
    return ($s);
}

sub emit_arguments {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    my $array_  = Var->new( 'sigil' => '@', 'twigil' => '', 'name' => '_',       'namespace' => [], );
    my $hash_   = Var->new( 'sigil' => '%', 'twigil' => '', 'name' => '_',       'namespace' => [], );
    my $CAPTURE = Var->new( 'sigil' => '$', 'twigil' => '', 'name' => 'CAPTURE', 'namespace' => [], );
    my $CAPTURE_decl = Decl->new( 'decl' => 'my', 'type' => '', 'var' => $CAPTURE, );
    my $str = '';
    $str = ( $str . $CAPTURE_decl->emit_perl5() );
    $str = ( $str . '::DISPATCH_VAR($CAPTURE,"STORE",::CAPTURIZE(\@_));' );
    my $bind_ = Bind->new( 'parameters' => $array_, 'arguments' => Call->new( 'invocant' => $CAPTURE, 'method' => 'array', 'arguments' => [], ), );
    $str = ( $str . ( $bind_->emit_perl5() . ';' ) );
    my $bind_hash = Bind->new( 'parameters' => $hash_, 'arguments' => Call->new( 'invocant' => $CAPTURE, 'method' => 'hash', 'arguments' => [], ), );
    $str = ( $str . ( $bind_hash->emit_perl5() . ';' ) );
    my $i = 0;
    my $field;
    $str = ( $str . '{ my $_param_index = 0; ' );
    do {

        for my $field ( @{ $self->{sig}->positional() } ) {
            my $bind_named = Bind->new( 'parameters' => $field->key(), 'arguments' => Call->new( 'invocant' => $hash_, 'arguments' => [ Val::Buf->new( 'buf' => $field->key()->name(), ) ], 'method' => 'LOOKUP', ), );
            my $bind_default = Bind->new( 'parameters' => $field->key(), 'arguments' => $field->value(), );
            $str = (
                $str
                    . (
                    ' if ( exists $Hash__->{_value}{_hash}{\''
                        . (
                        $field->key()->name()
                            . (
                            '\'} ) '
                                . (
                                ' { '
                                    . (
                                    $bind_named->emit_perl5()
                                        . ( ' } ' . ( ' elsif ( exists $List__->{_value}{_array}[ $_param_index ] ) ' . ( ' { ' . ( $field->key()->emit_perl5() . ( ' = $List__->{_value}{_array}[ $_param_index++ ]; ' . ' } ' ) ) ) ) )
                                    )
                                )
                            )
                        )
                    )
            );
            do {
                if ( $field->has_default()->bit() ) { $str = ( $str . ( ' else { ' . ( $bind_default->emit_perl5() . ' } ' ) ) ) }
                else { }
            };
            $i = ( $i + 1 );
        }
    };
    $str = ( $str . '} ' );
    return ($str);
}

package Lit::Object;
sub new { shift; bless {@_}, "Lit::Object" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    my $fields = $self->{fields};
    my $str    = '';
    my $field;
    do {
        for my $field ( @{$fields} ) {
            $str = ( $str . ( '::DISPATCH( $::NamedArgument, "new", ' . ( '{ ' . ( '_argument_name_ => ' . ( $field->[0]->emit_perl5() . ( ', ' . ( 'value           => ' . ( $field->[1]->emit_perl5() . ( ', ' . ' } ), ' ) ) ) ) ) ) ) ) );
        }
    };
    ( '::DISPATCH( $::' . ( $self->{class} . ( ', \'new\', ' . ( $str . ( ' )' . Main::newline() ) ) ) ) );
}

package Assign;
sub new { shift; bless {@_}, "Assign" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    my $node = $self->{parameters};
    do {
        if ( ( Main::isa( $node, 'Var' ) && @{ $node->namespace() } ) ) {
            $node = Apply->new(
                'code'      => Var->new( 'name' => 'ternary:<?? !!>', 'twigil' => '', 'sigil' => '&', 'namespace' => ['GLOBAL'], ),
                'arguments' => [
                    Apply->new( 'arguments' => [$node], 'code' => Var->new( 'name' => 'VAR_defined', 'twigil' => '', 'sigil' => '&', 'namespace' => ['GLOBAL'], ), ),
                    $node, Bind->new( 'parameters' => $node, 'arguments' => Call->new( 'invocant' => Var->new( 'name' => '::Scalar', 'twigil' => '', 'sigil' => '$', 'namespace' => [], ), 'method' => 'new', 'hyper' => '', ), )
                ],
            );
        }
        else { }
    };
    ( '::DISPATCH_VAR( ' . ( $node->emit_perl5() . ( ', \'STORE\', ' . ( $self->{arguments}->emit_perl5() . ( ' )' . Main::newline() ) ) ) ) );
}

package Var;
sub new { shift; bless {@_}, "Var" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    my $table = { '$' => '$', '@' => '$List_', '%' => '$Hash_', '&' => '$Code_', };
    do {
        if ( ( $self->{twigil} eq '.' ) ) { return ( ( '::DISPATCH( $self, "' . ( $self->{name} . ( '" )' . Main::newline() ) ) ) ) }
        else { }
    };
    do {
        if ( ( $self->{twigil} eq '!' ) ) { return ( ( '$self->{_value}{"' . ( $self->{name} . ( '"}' . Main::newline() ) ) ) ) }
        else { }
    };
    do {
        if ( ( $self->{name} eq '/' ) ) { return ( ( $table->{ $self->{sigil} } . 'MATCH' ) ) }
        else { }
    };
    return ( Main::mangle_name( $self->{sigil}, $self->{twigil}, $self->{name}, $self->{namespace} ) );
}

package Bind;
sub new { shift; bless {@_}, "Bind" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    do {
        if ( Main::isa( $self->{parameters}, 'Call' ) ) { return ( Assign->new( 'parameters' => $self->{parameters}, 'arguments' => $self->{arguments}, )->emit_perl5() ) }
        else { }
    };
    my $str = ( '::MODIFIED(' . ( $self->{parameters}->emit_perl5() . ( ');' . Main::newline() ) ) );
    $str = ( $str . ( $self->{parameters}->emit_perl5() . ( ' = ' . $self->{arguments}->emit_perl5() ) ) );
    return ( ( 'do {' . ( $str . '}' ) ) );
}

package Proto;
sub new { shift; bless {@_}, "Proto" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    return ( ( '$::' . $self->{name} ) );
}

package Call;
sub new { shift; bless {@_}, "Call" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    my $invocant;
    do {
        if ( Main::isa( $self->{invocant}, 'Proto' ) ) {
            do {
                if   ( ( $self->{invocant}->name() eq 'self' ) ) { $invocant = '$self' }
                else                                             { $invocant = $self->{invocant}->emit_perl5() }
                }
        }
        else { $invocant = $self->{invocant}->emit_perl5() }
    };
    do {
        if ( ( $invocant eq 'self' ) ) { $invocant = '$self' }
        else { }
    };
    my $meth = $self->{method};
    do {
        if ( ( $meth eq 'postcircumfix:<( )>' ) ) { $meth = '' }
        else { }
    };
    my $call = Main::join( [ map { $_->emit_perl5() } @{ $self->{arguments} } ], ', ' );
    do {
        if ( $self->{hyper} ) {
            ( '::DISPATCH( $::Array, "new", { _array => [ '
                    . ( 'map { ::DISPATCH( $_, "' . ( $meth . ( '", ' . ( $call . ( ') } ' . ( '@{ ::DISPATCH( ' . ( $invocant . ( ', "array" )->{_value}{_array} } ' . ( '] } )' . Main::newline() ) ) ) ) ) ) ) ) ) );
        }
        else {
            do {
                if ( ( $meth eq '' ) ) { ( '::DISPATCH( ' . ( $invocant . ( ', \'APPLY\', ' . ( $call . ( ' )' . Main::newline() ) ) ) ) ) }
                else { ( '::DISPATCH( ' . ( $invocant . ( ', ' . ( '\'' . ( $meth . ( '\', ' . ( $call . ( ' )' . Main::newline() ) ) ) ) ) ) ) ) }
                }
        }
        }
}

package Apply;
sub new { shift; bless {@_}, "Apply" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    do {
        if   ( ( $self->{code}->name() eq 'self' ) ) { return ('$self') }
        else                                         { }
    };
    return ( ( '::DISPATCH( ' . ( $self->{code}->emit_perl5() . ( ', \'APPLY\', ' . ( Main::join( [ map { $_->emit_perl5() } @{ $self->{arguments} } ], ', ' ) . ( ' )' . Main::newline() ) ) ) ) ) );
}

package Return;
sub new { shift; bless {@_}, "Return" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    return ( ( 'return(' . ( $self->{result}->emit_perl5() . ( ')' . Main::newline() ) ) ) );
}

package If;
sub new { shift; bless {@_}, "If" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    (   'do { if (::DISPATCH(::DISPATCH('
            . (
            $self->{cond}->emit_perl5()
                . (
                ',"true"),"p5landish") ) '
                    . (
                      ( $self->{body} ? ( '{ ' . ( $self->{body}->emit_perl5() . ' } ' ) ) : '{ } ' )
                    . ( ( $self->{otherwise} ? ( ' else { ' . ( $self->{otherwise}->emit_perl5() . ' }' ) ) : ' else { ::DISPATCH($::Bit, "new", 0) }' ) . ( ' }' . Main::newline() ) )
                    )
                )
            )
    );
}

package While;
sub new { shift; bless {@_}, "While" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    my $cond = $self->{cond};
    do {
        if   ( ( Main::isa( $cond, 'Var' ) && ( $cond->sigil() eq '@' ) ) ) { }
        else                                                                { $cond = Apply->new( 'code' => Var->new( 'sigil' => '&', 'twigil' => '', 'name' => 'prefix:<@>', 'namespace' => ['GLOBAL'], ), 'arguments' => [$cond], ) }
    };
    ( 'do { while (::DISPATCH(::DISPATCH(' . ( $self->{cond}->emit_perl5() . ( ',"true"),"p5landish") ) ' . ( ' { ' . ( $self->{body}->emit_perl5() . ( ' } }' . Main::newline() ) ) ) ) ) );
}

package Decl;
sub new { shift; bless {@_}, "Decl" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    my $decl = $self->{decl};
    my $name = $self->{var}->name();
    do {
        if ( ( $decl eq 'has' ) ) { return ( ( 'sub ' . ( $name . ( ' { ' . ( '@_ == 1 ' . ( '? ( $_[0]->{' . ( $name . ( '} ) ' . ( ': ( $_[0]->{' . ( $name . ( '} = $_[1] ) ' . '}' ) ) ) ) ) ) ) ) ) ) ) }
        else { }
    };
    my $create = ( ', \'new\', { modified => $_MODIFIED, name => \'' . ( $self->{var}->emit_perl5() . '\' } ) ' ) );
    do {
        if ( ( $decl eq 'our' ) ) {
            my $s;
            $s = 'our ';
            do {
                if ( ( $self->{var}->sigil() eq '$' ) ) {
                    return (
                        (   $s
                                . (
                                $self->{var}->emit_perl5()
                                    . (
                                    ' = ::DISPATCH( $::Scalar'
                                        . (
                                        $create
                                            . (
                                            ' unless defined '
                                                . (
                                                $self->{var}->emit_perl5()
                                                    . (
                                                    '; ' . ( 'INIT { ' . ( $self->{var}->emit_perl5() . ( ' = ::DISPATCH( $::Scalar' . ( $create . ( ' unless defined ' . ( $self->{var}->emit_perl5() . ( '; ' . ( '}' . Main::newline() ) ) ) ) ) ) ) )
                                                    )
                                                )
                                            )
                                        )
                                    )
                                )
                        )
                    );
                }
                else { }
            };
            do {
                if ( ( $self->{var}->sigil() eq '&' ) ) { return ( ( $s . ( $self->{var}->emit_perl5() . ( ' = ::DISPATCH( $::Routine' . ( $create . ( ';' . Main::newline() ) ) ) ) ) ) }
                else { }
            };
            do {
                if ( ( $self->{var}->sigil() eq '%' ) ) { return ( ( $s . ( $self->{var}->emit_perl5() . ( ' = ::DISPATCH( $::HashContainer' . ( $create . ( ';' . Main::newline() ) ) ) ) ) ) }
                else { }
            };
            do {
                if ( ( $self->{var}->sigil() eq '@' ) ) { return ( ( $s . ( $self->{var}->emit_perl5() . ( ' = ::DISPATCH( $::ArrayContainer' . ( $create . ( ';' . Main::newline() ) ) ) ) ) ) }
                else { }
            };
            return ( ( $s . ( $self->{var}->emit_perl5() . Main::newline() ) ) );
        }
        else { }
    };
    do {
        if ( ( $self->{var}->sigil() eq '$' ) ) {
            return (
                (   $self->{decl}
                        . (
                        ' '
                            . (
                            $self->{var}->emit_perl5()
                                . (
                                '; '
                                    . (
                                    $self->{var}->emit_perl5()
                                        . (
                                        ' = ::DISPATCH( $::Scalar'
                                            . ( $create . ( ' unless defined ' . ( $self->{var}->emit_perl5() . ( '; ' . ( 'INIT { ' . ( $self->{var}->emit_perl5() . ( ' = ::DISPATCH( $::Scalar' . ( $create . ( '}' . Main::newline() ) ) ) ) ) ) ) ) )
                                        )
                                    )
                                )
                            )
                        )
                )
            );
        }
        else { }
    };
    do {
        if ( ( $self->{var}->sigil() eq '&' ) ) {
            return (
                (   $self->{decl}
                        . (
                        ' '
                            . (
                            $self->{var}->emit_perl5()
                                . (
                                '; '
                                    . (
                                    $self->{var}->emit_perl5()
                                        . (
                                        ' = ::DISPATCH( $::Routine'
                                            . (
                                            $create . ( ' unless defined ' . ( $self->{var}->emit_perl5() . ( '; ' . ( 'INIT { ' . ( $self->{var}->emit_perl5() . ( ' = ::DISPATCH( $::Routine' . ( $create . ( '}' . Main::newline() ) ) ) ) ) ) ) ) )
                                        )
                                    )
                                )
                            )
                        )
                )
            );
        }
        else { }
    };
    do {
        if ( ( $self->{var}->sigil() eq '%' ) ) { return ( ( $self->{decl} . ( ' ' . ( ' ' . ( $self->{var}->emit_perl5() . ( ' = ::DISPATCH( $::HashContainer' . ( $create . ( '; ' . Main::newline() ) ) ) ) ) ) ) ) }
        else { }
    };
    do {
        if ( ( $self->{var}->sigil() eq '@' ) ) { return ( ( $self->{decl} . ( ' ' . ( ' ' . ( $self->{var}->emit_perl5() . ( ' = ::DISPATCH( $::ArrayContainer' . ( $create . ( '; ' . Main::newline() ) ) ) ) ) ) ) ) }
        else { }
    };
    return ( ( $self->{decl} . ( ' ' . $self->{var}->emit_perl5() ) ) );
}

package Sig;
sub new { shift; bless {@_}, "Sig" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    my $inv = '$::Undef';
    do {
        if ( Main::isa( $self->{invocant}, 'Var' ) ) { $inv = Main::perl( $self->{invocant}, ) }
        else { }
    };
    my $pos;
    my $decl;
    do {
        for my $decl ( @{ $self->{positional} } ) { $pos = ( $pos . ( $decl->emit_perl5() . ', ' ) ) }
    };
    my $named = '';
    ( '::DISPATCH( $::Signature, "new", { ' . ( 'invocant => ' . ( $inv . ( ', ' . ( 'array    => ::DISPATCH( $::Array, "new", { _array => [ ' . ( $pos . ( ' ] } ), ' . ( 'return   => $::Undef, ' . ( '} )' . Main::newline() ) ) ) ) ) ) ) ) );
}

package Capture;
sub new { shift; bless {@_}, "Capture" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    my $s = '::DISPATCH( $::Capture, "new", { ';
    do {
        if ( defined( $self->{invocant} ) ) { $s = ( $s . ( 'invocant => ' . ( $self->{invocant}->emit_perl5() . ', ' ) ) ) }
        else { $s = ( $s . 'invocant => $::Undef, ' ) }
    };
    do {
        if ( defined( $self->{array} ) ) {
            $s = ( $s . 'array => ::DISPATCH( $::Array, "new", { _array => [ ' );
            my $item;
            do {
                for my $item ( @{ $self->{array} } ) { $s = ( $s . ( $item->emit_perl5() . ', ' ) ) }
            };
            $s = ( $s . ' ] } ),' );
        }
        else { }
    };
    do {
        if ( defined( $self->{hash} ) ) {
            $s = ( $s . 'hash => ::DISPATCH( $::Hash, "new", { _hash => { ' );
            my $item;
            do {
                for my $item ( @{ $self->{hash} } ) { $s = ( $s . ( $item->[0]->emit_perl5() . ( '->{_value} => ' . ( $item->[1]->emit_perl5() . ', ' ) ) ) ) }
            };
            $s = ( $s . ' } } ),' );
        }
        else { }
    };
    return ( ( $s . ( ' } )' . Main::newline() ) ) );
}

package Subset;
sub new { shift; bless {@_}, "Subset" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    ( '::DISPATCH( $::Subset, "new", { '
            . ( 'base_class => ' . ( $self->{base_class}->emit_perl5() . ( ', ' . ( 'block => ' . ( 'sub { local $_ = shift; ' . ( $self->{block}->block()->emit_perl5() . ( ' } ' . ( ' } )' . Main::newline() ) ) ) ) ) ) ) ) );
}

package Method;
sub new { shift; bless {@_}, "Method" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    (   '::DISPATCH( $::Code, \'new\', { '
            . (
            'code => sub { '
                . (
                Main::newline()
                    . (
                    '# emit_declarations'
                        . (
                        Main::newline()
                            . (
                            $self->{block}->emit_declarations()
                                . (
                                Main::newline()
                                    . (
                                    '# get $self'
                                        . (
                                        Main::newline()
                                            . (
                                            '$self = shift; '
                                                . (
                                                Main::newline()
                                                    . (
                                                    '# emit_arguments'
                                                        . (
                                                        Main::newline()
                                                            . (
                                                            $self->{block}->emit_arguments()
                                                                . (
                                                                Main::newline()
                                                                    . (
                                                                    '# emit_body'
                                                                        . ( Main::newline() . ( $self->{block}->emit_body() . ( ' }, ' . ( 'signature => ' . ( $self->{block}->emit_signature() . ( ', ' . ( ' } )' . Main::newline() ) ) ) ) ) ) )
                                                                    )
                                                                )
                                                            )
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
    );
}

package Sub;
sub new { shift; bless {@_}, "Sub" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    (   '::DISPATCH( $::Code, \'new\', { '
            . (
            'code => sub { '
                . ( $self->{block}->emit_declarations() . ( $self->{block}->emit_arguments() . ( $self->{block}->emit_body() . ( ' }, ' . ( 'signature => ' . ( $self->{block}->emit_signature() . ( ', ' . ( ' } )' . Main::newline() ) ) ) ) ) ) ) )
            )
    );
}

package Macro;
sub new { shift; bless {@_}, "Macro" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    (   '::DISPATCH( $::Macro, \'new\', { '
            . (
            'code => sub { '
                . ( $self->{block}->emit_declarations() . ( $self->{block}->emit_arguments() . ( $self->{block}->emit_body() . ( ' }, ' . ( 'signature => ' . ( $self->{block}->emit_signature() . ( ', ' . ( ' } )' . Main::newline() ) ) ) ) ) ) ) )
            )
    );
}

package Do;
sub new { shift; bless {@_}, "Do" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    ( 'do { ' . ( $self->{block}->emit_perl5() . ( ' }' . Main::newline() ) ) );
}

package BEGIN;
sub new { shift; bless {@_}, "BEGIN" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    ( 'INIT { ' . ( $self->{block}->emit_perl5() . ' }' ) );
}

package Use;
sub new { shift; bless {@_}, "Use" }

sub emit_perl5 {
    my $self   = shift;
    my $List__ = \@_;
    do { [] };
    do {
        if ( ( $self->{mod} eq 'v6' ) ) { return ( ( Main::newline() . ( '#use v6' . Main::newline() ) ) ) }
        else { }
    };
    do {
        if ( $self->{perl5} ) { return ( ( 'use ' . ( $self->{mod} . ( ';$::' . ( $self->{mod} . ( '= KindaPerl6::Runtime::Perl5::Wrap::use5(\'' . ( $self->{mod} . '\')' ) ) ) ) ) ) ) }
        else { return ( ( 'use ' . $self->{mod} ) ) }
        }
}

1;
