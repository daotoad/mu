{

    package Int;

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
                            $GLOBAL::Code_VAR_defined, 'APPLY', $::Int
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
                        ::MODIFIED($::Int);
                        $::Int = ::DISPATCH(
                            ::DISPATCH(
                                $::Class, 'new',
                                ::DISPATCH( $::Str, 'new', 'Int' )
                            ),
                            'PROTOTYPE',
                        );
                      }
                  }
            }
        };
        ::DISPATCH(
            ::DISPATCH( $::Int, 'HOW', ),
            'add_parent',
            ::DISPATCH( $::Value, 'HOW', )
        );
        ::DISPATCH(
            ::DISPATCH( $::Int, 'HOW', ),
            'add_method',
            ::DISPATCH( $::Str, 'new', 'smartmatch' ),
            ::DISPATCH(
                $::Code, 'new',
                {
                    code => sub {

                        # emit_declarations
                        my $List__ =
                          ::DISPATCH( $::ArrayContainer, 'new',
                            { modified => $_MODIFIED, name => '$List__' } );
                        my $v;
                        $v =
                          ::DISPATCH( $::Scalar, 'new',
                            { modified => $_MODIFIED, name => '$v' } )
                          unless defined $v;
                        INIT {
                            $v =
                              ::DISPATCH( $::Scalar, 'new',
                                { modified => $_MODIFIED, name => '$v' } );
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
                        {
                            my $_param_index = 0;
                            if ( exists $Hash__->{_value}{_hash}{'v'} ) {
                                do {
                                    ::MODIFIED($v);
                                    $v =
                                      ::DISPATCH( $Hash__, 'LOOKUP',
                                        ::DISPATCH( $::Str, 'new', 'v' ) );
                                  }
                            }
                            elsif (
                                exists $List__->{_value}{_array}[$_param_index]
                              )
                            {
                                $v =
                                  $List__->{_value}{_array}[ $_param_index++ ];
                            }
                        }

                        # emit_body
                        ::DISPATCH( $GLOBAL::Code_infix_58__60__61__61__62_,
                            'APPLY', $self, $v );
                    },
                    signature => ::DISPATCH(
                        $::Signature,
                        "new",
                        {
                            invocant => $::Undef,
                            array    => ::DISPATCH(
                                $::Array, "new",
                                {
                                    _array => [
                                        ::DISPATCH(
                                            $::Signature::Item,
                                            'new',
                                            {
                                                sigil       => '$',
                                                twigil      => '',
                                                name        => 'v',
                                                value       => $::Undef,
                                                has_default => ::DISPATCH(
                                                    $::Bit, 'new', 0
                                                ),
                                                is_named_only => ::DISPATCH(
                                                    $::Bit, 'new', 0
                                                ),
                                                is_optional => ::DISPATCH(
                                                    $::Bit, 'new', 0
                                                ),
                                                is_slurpy => ::DISPATCH(
                                                    $::Bit, 'new', 0
                                                ),
                                                is_multidimensional =>
                                                  ::DISPATCH(
                                                    $::Bit, 'new', 0
                                                  ),
                                                is_rw => ::DISPATCH(
                                                    $::Bit, 'new', 0
                                                ),
                                                is_copy => ::DISPATCH(
                                                    $::Bit, 'new', 0
                                                ),
                                            }
                                        ),
                                    ]
                                }
                            ),
                            return => $::Undef,
                        }
                    ),
                }
            )
        );
    };
    1
}
