{

    package Match;

    # Do not edit this file - Perl 5 generated by KindaPerl6
    use v5;
    use strict;
    no strict "vars";
    use constant KP6_DISABLE_INSECURE_CODE => 0;
    use KindaPerl6::Runtime::Perl5::Runtime;
    my $_MODIFIED;
    INIT { $_MODIFIED = {} }
    INIT {
        $_ =
          ::DISPATCH( $::Scalar, "new",
            { modified => $_MODIFIED, name => "$_" } );
    }
    do {
        do {
            if (
                ::DISPATCH(
                    ::DISPATCH(
                        ::DISPATCH(
                            $GLOBAL::Code_VAR_defined, 'APPLY', $::Match
                        ),
                        "true"
                    ),
                    "p5landish"
                )
              )
            {
            }
            else {
                do {
                    do {
                        ::MODIFIED($::Match);
                        $::Match = ::DISPATCH(
                            ::DISPATCH(
                                $::Class, 'new',
                                ::DISPATCH( $::Str, 'new', 'Match' )
                            ),
                            'PROTOTYPE',
                        );
                      }
                  }
            }
        };
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_parent',
            ::DISPATCH( $::Capture, 'HOW', )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_attribute',
            ::DISPATCH( $::Str, 'new', 'from' )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_attribute',
            ::DISPATCH( $::Str, 'new', 'to' )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_attribute',
            ::DISPATCH( $::Str, 'new', 'result' )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_attribute',
            ::DISPATCH( $::Str, 'new', 'bool' )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_attribute',
            ::DISPATCH( $::Str, 'new', 'match_str' )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'Str' ),
            ::DISPATCH(
                $::Code, 'new',
                {
                    code => sub {

                        # emit_declarations
                        my $List__ =
                          ::DISPATCH( $::ArrayContainer, 'new',
                            { modified => $_MODIFIED, name => '$List__' } );
                        my $self;
                        $self =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$self' } )
                          unless defined $self;
                        INIT {
                            $self =
                              ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$self' } );
                        }

                        # get $self
                        $self = shift;

                        # emit_arguments
                        my $CAPTURE;
                        $CAPTURE =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$CAPTURE' } )
                          unless defined $CAPTURE;
                        INIT {
                            $CAPTURE = ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$CAPTURE' }
                            );
                        }
                        ::DISPATCH_VAR( $CAPTURE, "STORE", ::CAPTURIZE( \@_ ) );
                        do {
                            ::MODIFIED($List__);
                            $List__ = ::DISPATCH( $CAPTURE, 'array', );
                        };
                        do {
                            ::MODIFIED($Hash__);
                            $Hash__ = ::DISPATCH( $CAPTURE, 'hash', );
                        };
                        { my $_param_index = 0; }

                        # emit_body
                        do {
                            if (
                                ::DISPATCH(
                                    ::DISPATCH(
                                        ::DISPATCH( $self, "result" ), "true"
                                    ),
                                    "p5landish"
                                )
                              )
                            {
                                do {
                                    return (
                                        ::DISPATCH(
                                            ::DISPATCH( $self, "result" ),
                                            'Str',
                                        )
                                    );
                                  }
                            }
                            else { ::DISPATCH( $::Bit, "new", 0 ) }
                        };
                        ::DISPATCH(
                            $GLOBAL::Code_ternary_58__60__63__63__32__33__33__62_,
                            'APPLY',
                            ::DISPATCH( $self, "bool" ),
                            ::DISPATCH(
                                $GLOBAL::Code_substr,
                                'APPLY',
                                ::DISPATCH( $self, "match_str" ),
                                ::DISPATCH( $self, "from" ),
                                ::DISPATCH(
                                    $GLOBAL::Code_infix_58__60__45__62_,
                                    'APPLY',
                                    ::DISPATCH( $self, "to" ),
                                    ::DISPATCH( $self, "from" )
                                )
                            ),
                            $::Undef
                        );
                    },
                    signature => ::DISPATCH(
                        $::Signature,
                        "new",
                        {
                            invocant => bless(
                                {
                                    'namespace' => [],
                                    'name'      => 'self',
                                    'twigil'    => '',
                                    'sigil'     => '$'
                                },
                                'Var'
                            ),
                            array =>
                              ::DISPATCH( $::Array, "new", { _array => [] } ),
                            return => $::Undef,
                        }
                    ),
                }
            )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'scalar' ),
            ::DISPATCH(
                $::Code, 'new',
                {
                    code => sub {

                        # emit_declarations
                        my $List__ =
                          ::DISPATCH( $::ArrayContainer, 'new',
                            { modified => $_MODIFIED, name => '$List__' } );
                        my $self;
                        $self =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$self' } )
                          unless defined $self;
                        INIT {
                            $self =
                              ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$self' } );
                        }

                        # get $self
                        $self = shift;

                        # emit_arguments
                        my $CAPTURE;
                        $CAPTURE =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$CAPTURE' } )
                          unless defined $CAPTURE;
                        INIT {
                            $CAPTURE = ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$CAPTURE' }
                            );
                        }
                        ::DISPATCH_VAR( $CAPTURE, "STORE", ::CAPTURIZE( \@_ ) );
                        do {
                            ::MODIFIED($List__);
                            $List__ = ::DISPATCH( $CAPTURE, 'array', );
                        };
                        do {
                            ::MODIFIED($Hash__);
                            $Hash__ = ::DISPATCH( $CAPTURE, 'hash', );
                        };
                        { my $_param_index = 0; }

                        # emit_body
                        do {
                            if (
                                ::DISPATCH(
                                    ::DISPATCH(
                                        ::DISPATCH( $self, "result" ), "true"
                                    ),
                                    "p5landish"
                                )
                              )
                            {
                                do {
                                    return ( ::DISPATCH( $self, "result" ) );
                                  }
                            }
                            else {
                                do {
                                    return ( ::DISPATCH( $self, 'Str', ) );
                                  }
                            }
                          }
                    },
                    signature => ::DISPATCH(
                        $::Signature,
                        "new",
                        {
                            invocant => bless(
                                {
                                    'namespace' => [],
                                    'name'      => 'self',
                                    'twigil'    => '',
                                    'sigil'     => '$'
                                },
                                'Var'
                            ),
                            array =>
                              ::DISPATCH( $::Array, "new", { _array => [] } ),
                            return => $::Undef,
                        }
                    ),
                }
            )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'true' ),
            ::DISPATCH(
                $::Code, 'new',
                {
                    code => sub {

                        # emit_declarations
                        my $List__ =
                          ::DISPATCH( $::ArrayContainer, 'new',
                            { modified => $_MODIFIED, name => '$List__' } );
                        my $self;
                        $self =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$self' } )
                          unless defined $self;
                        INIT {
                            $self =
                              ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$self' } );
                        }

                        # get $self
                        $self = shift;

                        # emit_arguments
                        my $CAPTURE;
                        $CAPTURE =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$CAPTURE' } )
                          unless defined $CAPTURE;
                        INIT {
                            $CAPTURE = ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$CAPTURE' }
                            );
                        }
                        ::DISPATCH_VAR( $CAPTURE, "STORE", ::CAPTURIZE( \@_ ) );
                        do {
                            ::MODIFIED($List__);
                            $List__ = ::DISPATCH( $CAPTURE, 'array', );
                        };
                        do {
                            ::MODIFIED($Hash__);
                            $Hash__ = ::DISPATCH( $CAPTURE, 'hash', );
                        };
                        { my $_param_index = 0; }

                        # emit_body
                        return (
                            ::DISPATCH( ::DISPATCH( $self, "bool" ), 'true', )
                        );
                    },
                    signature => ::DISPATCH(
                        $::Signature,
                        "new",
                        {
                            invocant => bless(
                                {
                                    'namespace' => [],
                                    'name'      => 'self',
                                    'twigil'    => '',
                                    'sigil'     => '$'
                                },
                                'Var'
                            ),
                            array =>
                              ::DISPATCH( $::Array, "new", { _array => [] } ),
                            return => $::Undef,
                        }
                    ),
                }
            )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'set_from' ),
            ::DISPATCH(
                $::Code, 'new',
                {
                    code => sub {

                        # emit_declarations
                        my $List__ =
                          ::DISPATCH( $::ArrayContainer, 'new',
                            { modified => $_MODIFIED, name => '$List__' } );
                        my $self;
                        $self =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$self' } )
                          unless defined $self;
                        INIT {
                            $self =
                              ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$self' } );
                        }

                        # get $self
                        $self = shift;

                        # emit_arguments
                        my $CAPTURE;
                        $CAPTURE =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$CAPTURE' } )
                          unless defined $CAPTURE;
                        INIT {
                            $CAPTURE = ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$CAPTURE' }
                            );
                        }
                        ::DISPATCH_VAR( $CAPTURE, "STORE", ::CAPTURIZE( \@_ ) );
                        do {
                            ::MODIFIED($List__);
                            $List__ = ::DISPATCH( $CAPTURE, 'array', );
                        };
                        do {
                            ::MODIFIED($Hash__);
                            $Hash__ = ::DISPATCH( $CAPTURE, 'hash', );
                        };
                        { my $_param_index = 0; }

                        # emit_body
                        ::DISPATCH_VAR(
                            ::DISPATCH( $self, "from" ),
                            'STORE',
                            ::DISPATCH(
                                $_, 'INDEX', ::DISPATCH( $::Int, 'new', 0 )
                            )
                        );
                    },
                    signature => ::DISPATCH(
                        $::Signature,
                        "new",
                        {
                            invocant => bless(
                                {
                                    'namespace' => [],
                                    'name'      => 'self',
                                    'twigil'    => '',
                                    'sigil'     => '$'
                                },
                                'Var'
                            ),
                            array =>
                              ::DISPATCH( $::Array, "new", { _array => [] } ),
                            return => $::Undef,
                        }
                    ),
                }
            )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'set_to' ),
            ::DISPATCH(
                $::Code, 'new',
                {
                    code => sub {

                        # emit_declarations
                        my $List__ =
                          ::DISPATCH( $::ArrayContainer, 'new',
                            { modified => $_MODIFIED, name => '$List__' } );
                        my $self;
                        $self =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$self' } )
                          unless defined $self;
                        INIT {
                            $self =
                              ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$self' } );
                        }

                        # get $self
                        $self = shift;

                        # emit_arguments
                        my $CAPTURE;
                        $CAPTURE =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$CAPTURE' } )
                          unless defined $CAPTURE;
                        INIT {
                            $CAPTURE = ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$CAPTURE' }
                            );
                        }
                        ::DISPATCH_VAR( $CAPTURE, "STORE", ::CAPTURIZE( \@_ ) );
                        do {
                            ::MODIFIED($List__);
                            $List__ = ::DISPATCH( $CAPTURE, 'array', );
                        };
                        do {
                            ::MODIFIED($Hash__);
                            $Hash__ = ::DISPATCH( $CAPTURE, 'hash', );
                        };
                        { my $_param_index = 0; }

                        # emit_body
                        ::DISPATCH_VAR(
                            ::DISPATCH( $self, "to" ),
                            'STORE',
                            ::DISPATCH(
                                $_, 'INDEX', ::DISPATCH( $::Int, 'new', 0 )
                            )
                        );
                    },
                    signature => ::DISPATCH(
                        $::Signature,
                        "new",
                        {
                            invocant => bless(
                                {
                                    'namespace' => [],
                                    'name'      => 'self',
                                    'twigil'    => '',
                                    'sigil'     => '$'
                                },
                                'Var'
                            ),
                            array =>
                              ::DISPATCH( $::Array, "new", { _array => [] } ),
                            return => $::Undef,
                        }
                    ),
                }
            )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'set_bool' ),
            ::DISPATCH(
                $::Code, 'new',
                {
                    code => sub {

                        # emit_declarations
                        my $List__ =
                          ::DISPATCH( $::ArrayContainer, 'new',
                            { modified => $_MODIFIED, name => '$List__' } );
                        my $self;
                        $self =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$self' } )
                          unless defined $self;
                        INIT {
                            $self =
                              ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$self' } );
                        }

                        # get $self
                        $self = shift;

                        # emit_arguments
                        my $CAPTURE;
                        $CAPTURE =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$CAPTURE' } )
                          unless defined $CAPTURE;
                        INIT {
                            $CAPTURE = ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$CAPTURE' }
                            );
                        }
                        ::DISPATCH_VAR( $CAPTURE, "STORE", ::CAPTURIZE( \@_ ) );
                        do {
                            ::MODIFIED($List__);
                            $List__ = ::DISPATCH( $CAPTURE, 'array', );
                        };
                        do {
                            ::MODIFIED($Hash__);
                            $Hash__ = ::DISPATCH( $CAPTURE, 'hash', );
                        };
                        { my $_param_index = 0; }

                        # emit_body
                        ::DISPATCH_VAR(
                            ::DISPATCH( $self, "bool" ),
                            'STORE',
                            ::DISPATCH(
                                $_, 'INDEX', ::DISPATCH( $::Int, 'new', 0 )
                            )
                        );
                    },
                    signature => ::DISPATCH(
                        $::Signature,
                        "new",
                        {
                            invocant => bless(
                                {
                                    'namespace' => [],
                                    'name'      => 'self',
                                    'twigil'    => '',
                                    'sigil'     => '$'
                                },
                                'Var'
                            ),
                            array =>
                              ::DISPATCH( $::Array, "new", { _array => [] } ),
                            return => $::Undef,
                        }
                    ),
                }
            )
        );
        ::DISPATCH(
            ::DISPATCH( $::Match, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'set_match_str' ),
            ::DISPATCH(
                $::Code, 'new',
                {
                    code => sub {

                        # emit_declarations
                        my $List__ =
                          ::DISPATCH( $::ArrayContainer, 'new',
                            { modified => $_MODIFIED, name => '$List__' } );
                        my $self;
                        $self =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$self' } )
                          unless defined $self;
                        INIT {
                            $self =
                              ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$self' } );
                        }

                        # get $self
                        $self = shift;

                        # emit_arguments
                        my $CAPTURE;
                        $CAPTURE =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$CAPTURE' } )
                          unless defined $CAPTURE;
                        INIT {
                            $CAPTURE = ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$CAPTURE' }
                            );
                        }
                        ::DISPATCH_VAR( $CAPTURE, "STORE", ::CAPTURIZE( \@_ ) );
                        do {
                            ::MODIFIED($List__);
                            $List__ = ::DISPATCH( $CAPTURE, 'array', );
                        };
                        do {
                            ::MODIFIED($Hash__);
                            $Hash__ = ::DISPATCH( $CAPTURE, 'hash', );
                        };
                        { my $_param_index = 0; }

                        # emit_body
                        ::DISPATCH_VAR(
                            ::DISPATCH( $self, "match_str" ),
                            'STORE',
                            ::DISPATCH(
                                $_, 'INDEX', ::DISPATCH( $::Int, 'new', 0 )
                            )
                        );
                    },
                    signature => ::DISPATCH(
                        $::Signature,
                        "new",
                        {
                            invocant => bless(
                                {
                                    'namespace' => [],
                                    'name'      => 'self',
                                    'twigil'    => '',
                                    'sigil'     => '$'
                                },
                                'Var'
                            ),
                            array =>
                              ::DISPATCH( $::Array, "new", { _array => [] } ),
                            return => $::Undef,
                        }
                    ),
                }
            )
        );
    };
    1
}
