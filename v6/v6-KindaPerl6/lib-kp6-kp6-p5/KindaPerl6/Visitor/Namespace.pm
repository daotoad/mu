{

    package KindaPerl6::Visitor::Namespace;

    # Do not edit this file - Perl 5 generated by KindaPerl6
    use v5;
    use strict;
    no strict 'vars';
    use constant KP6_DISABLE_INSECURE_CODE => 0;
    use KindaPerl6::Runtime::Perl5::KP6Runtime;
    my $_MODIFIED;
    BEGIN { $_MODIFIED = {} }
    BEGIN { $_ = ::DISPATCH( $::Scalar, "new", { modified => $_MODIFIED, name => "$_" } ); }
    {
        my $table;
        $table = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$table' } ) unless defined $table;
        BEGIN { $table = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$table' } ) }
        do {
            if ( ::DISPATCH( ::DISPATCH( ::DISPATCH( $GLOBAL::Code_VAR_defined, 'APPLY', $::KindaPerl6::Visitor::Namespace ), "true" ), "p5landish" ) ) { }
            else {
                {
                    my $table;
                    $table = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$table' } ) unless defined $table;
                    BEGIN { $table = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$table' } ) }
                    do {
                        ::MODIFIED($::KindaPerl6::Visitor::Namespace);
                        $::KindaPerl6::Visitor::Namespace = ::DISPATCH( ::DISPATCH( $::Class, 'new', ::DISPATCH( $::Str, 'new', 'KindaPerl6::Visitor::Namespace' ) ), 'PROTOTYPE', );
                        }
                }
            }
        };
        ::DISPATCH(
            ::DISPATCH( $::KindaPerl6::Visitor::Namespace, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'visit' ),
            ::DISPATCH(
                $::Code, 'new',
                {   code => sub {
                        my $List__ = ::DISPATCH( $::Array, 'new', { modified => $_MODIFIED, name => '$List__' } );
                        my $node;
                        $node = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$node' } ) unless defined $node;
                        BEGIN { $node = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$node' } ) }
                        my $node_name;
                        $node_name = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$node_name' } ) unless defined $node_name;
                        BEGIN { $node_name = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$node_name' } ) }
                        $self = shift;
                        my $CAPTURE;
                        $CAPTURE = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$CAPTURE' } ) unless defined $CAPTURE;
                        BEGIN { $CAPTURE = ::DISPATCH( $::Scalar, 'new', { modified => $_MODIFIED, name => '$CAPTURE' } ) }
                        ::DISPATCH_VAR( $CAPTURE, "STORE", ::CAPTURIZE( \@_ ) );
                        do {
                            ::MODIFIED($List__);
                            $List__ = ::DISPATCH( $CAPTURE, 'array', );
                        };
                        do {
                            ::MODIFIED($Hash__);
                            $Hash__ = ::DISPATCH( $CAPTURE, 'hash', );
                        };
                        do {
                            ::MODIFIED($node);
                            $node = ::DISPATCH( $List__, 'INDEX', ::DISPATCH( $::Int, 'new', 0 ) );
                        };
                        do {
                            ::MODIFIED($node_name);
                            $node_name = ::DISPATCH( $List__, 'INDEX', ::DISPATCH( $::Int, 'new', 1 ) );
                        };
                        do {
                            if ( ::DISPATCH( ::DISPATCH( ::DISPATCH( $GLOBAL::Code_infix_58__60_eq_62_, 'APPLY', $node_name, ::DISPATCH( $::Str, 'new', 'Var' ) ), "true" ), "p5landish" ) ) {
                                {
                                    do {
                                        if ( ::DISPATCH( ::DISPATCH( ::DISPATCH( $GLOBAL::Code_prefix_58__60__64__62_, 'APPLY', ::DISPATCH( $node, 'namespace', ) ), "true" ), "p5landish" ) ) {
                                            {
                                                ::DISPATCH( $GLOBAL::Code_say, 'APPLY', ::DISPATCH( $::Str, 'new', 'global ' ), ::DISPATCH( $node, 'name', ) );
                                                return (
                                                    ::DISPATCH(
                                                        $::Lookup,
                                                        'new',
                                                        ::DISPATCH( $::Str, 'new', 'obj' ) => ::DISPATCH(
                                                            $::Lookup,
                                                            'new',
                                                            ::DISPATCH( $::Str, 'new', 'obj' ) => ::DISPATCH(
                                                                $::Var, 'new', ::DISPATCH( $::Str, 'new', 'namespace' ) => ::DISPATCH( $::Array, "new", { _array => [] } ),
                                                                ::DISPATCH( $::Str, 'new', 'name' )   => ::DISPATCH( $::Str, 'new', 'KP6' ),
                                                                ::DISPATCH( $::Str, 'new', 'twigil' ) => ::DISPATCH( $::Str, 'new', '' ),
                                                                ::DISPATCH( $::Str, 'new', 'sigil' )  => ::DISPATCH( $::Str, 'new', '%' ),
                                                            ),
                                                            ::DISPATCH( $::Str, 'new', 'index' ) => ::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::Str, 'new', 'buf' ) => ::DISPATCH( $::Str, 'new', 'a' ), ),
                                                        ),
                                                        ::DISPATCH( $::Str, 'new', 'index' ) => ::DISPATCH( $::Val::Buf, 'new', ::DISPATCH( $::Str, 'new', 'buf' ) => ::DISPATCH( $::Str, 'new', 'b' ), ),
                                                    )
                                                    )
                                            }
                                        }
                                        }
                                }
                            }
                        };
                        return ($::Undef);
                    },
                    signature => ::DISPATCH(
                        $::Signature,
                        "new",
                        {   invocant => $::Undef,
                            array    => ::DISPATCH(
                                $::Array, "new",
                                {   _array => [
                                        ::DISPATCH( $::Signature::Item, "new", { sigil => '$', twigil => '', name => 'node',      namespace => [], } ),
                                        ::DISPATCH( $::Signature::Item, "new", { sigil => '$', twigil => '', name => 'node_name', namespace => [], } ),
                                    ]
                                }
                            ),
                            hash   => ::DISPATCH( $::Hash, "new", { _hash => {} } ),
                            return => $::Undef,
                        }
                    ),
                }
            )
        );
        do {
            ::MODIFIED($table);
            $table = ::DISPATCH(
                $::Hash, "new",
                {   _hash => {
                        ::DISPATCH( $::Str, 'new', '$' )->{_value} => ::DISPATCH( $::Str, 'new', 'Scalar_' ),
                        ::DISPATCH( $::Str, 'new', '@' )->{_value} => ::DISPATCH( $::Str, 'new', 'List_' ),
                        ::DISPATCH( $::Str, 'new', '%' )->{_value} => ::DISPATCH( $::Str, 'new', 'Hash_' ),
                        ::DISPATCH( $::Str, 'new', '&' )->{_value} => ::DISPATCH( $::Str, 'new', 'Code_' ),
                    }
                }
            );
            }
    };
    1
}
