# A ruby transliteration of src/perl6/STD.pm
# Sources to crib from:
#  v6/v6-KindaPerl6/compiled/ruby-kp6-mp6/kp6_runtime.rb
#  misc/pX/Common/redsix/redsix
#  misc/pX/Common/yet_another_regex_engine/Regexp_ModuleA.pm (perhaps)
# We'll pay the pain of sticking with ruby 1.8 for now, since folks
# seem to have trouble finding the real 1.9.0.
#
# Notes
# 
#
require 'prelude'

class Perl < Grammar
    LOOSESTH = {:prec=>"a=!"}
    LOOSESTS = "a=!"

    def dot_ws
        true
    end

    def expect_infix
        (infix && starTOK{infix_postfix_meta_operator}) ||
            infix_prefix_meta_operator || infix_circumfix_meta_operator
    end

    ## I'm unclear on what infix() is, and thus on how to get from expect_infix() to _EXPR().
    def prefix; false; end
    def prefix_circumfix_meta_operator; false; end
    def expect_postfix; false; end
    def adverbs; false; end


    ## regex - ##Q why is this a regex?
    def stdstopper
        (@scanner.eos? ||
##         terminator || statement_mod_cond || statement_mod_loop ||
##         cent.pos == env[:endstmt] ||
##         cent.pos == env[:endargs]
##         #    | <$+unitstopper> ##?
false ##
         )
    end

    def pop(a);a.pop;end
    def push(a,e);a.push(e);end
    def reverse(a);a.reverse;end
    def item(h);raise "what does item do?";end
    def _EXPR(seenS, preclimH=nil, stopS=nil, *fateA) ## Args reordered!!!!! ########
        preclimH ||= LOOSESTH
        stopS ||= method(:stdstopper)

        $env.scope_enter(:inquoteS,:prevopS,:thisopH);
        
        my preclimS = preclimH[:prec];
        $env[:inquoteS] = 0
        #    my terminatorA = before(lambda{|s| stop(s) } );
        #    return () if not terminatorA.empty? and terminatorA[0].bool;
        termstackA = []
        opstackA = []

        push opstackA, termH;         # (just a sentinel value)

        hereS = nil
        if seenS 
            hereS = seenS;
        else 
            my tA = expect_term();
            hereS = tA[0];
        end
        push termstackA, hereS;
        say "In EXPR, at ", hereS.pos;

        reduce = lambda {
            say "entering reduce, termstack == ", termstackA.length, " opstack == ", opstackA.length;
            my opS = pop(opstackA);
            case opS[:assoc] 
            when 'chain' 
                say "reducing chain";
                chainA = []
                push chainA, pop(termstackA);
                push chainA, opS;
                while not opstackA.empty? 
                    break if opS[:prec] != opstackA[-1][:prec];
                    push chainA, pop(termstackA);
                    push chainA, pop(opstackA)[:top];
                end
                push chainA, pop(termstackA);
                opS[:top][:chain] = reverse chainA;
                push termstackA, opS[:top];
            when 'list' 
                say "reducing list";
                listA = []
                push listA, pop(termstackA);
                while not opstackA.empty? 
                    break if opS[:top][:sym] != opstackA[-1][:top][:sym];
                    push listA, pop(termstackA);
                    pop(opstackA);
                end
                push listA, pop(termstackA);
                opS[:top][:list] = reverse listA;
                push termstackA, opS[:top];
            else
                say "reducing";
                listA = []
                say termstackA.length;

                #opS[:top][:right] = pop termstackA;
                #opS[:top][:left] = pop termstackA;

                my _opH = opS;   # XXX anti-pugs hack
                _opH[:top][:right] = pop termstackA;
                _opH[:top][:left] = pop termstackA;
                opS = _opH;

                push termstackA, opS[:top];
            end
        }

        while true 
            say "In while true, at ", hereS.pos;
            my terminatorA = hereS.before(lambda{|s| stop(s) } );
            my tS = terminatorA[0];
            break if tS and terminatorA[0].bool;
            thisopH = {}
            #        my infixA = hereS.expect_tight_infix(preclimS);
            my infixA = hereS.expect_infix();
            my infixS = infixA[0];
            hereS = infixS;
        
            # XXX might want to allow this in a declaration though
            if not infixS;  hereS.panic("Can't have two terms in a row"); end

            if not thisopH.key?(:prec) 
                say "No prec case in thisop!";
                thisopH = terminatorH;
            end
            thisprecS = thisopH[:prec];
            # substitute precedence for listops
            thisopH[:prec] = thisopH[:sub] if thisopH[:sub];
            
            # Does new infix (or terminator) force any reductions?
            while opstackA[-1][:prec] < thisprecS 
                reduce();
            end
            
            # Not much point in reducing the sentinels...
            break if thisprecS < LOOSESTS;
            
            # Equal precedence, so use associativity to decide.
            if opstackA[-1][:prec] == thisprecS 
                case thisopH[:assoc] 
                when 'non' ;   hereS.panic("\"#{infixS}\" is not associative")
                when 'left' ;  reduce()   # reduce immediately
                when 'right';  # just shift
                when 'chain';  # just shift
                when 'list'                # if op differs reduce else shift
                    reduce() if thisopH[:top][:sym] != opstackA[-1][:top][:sym];
                else
                    hereS.panic("Unknown associativity \"#{thisopH[:assoc]}\" for \"#{infixS}\"")
                end
            end
            push opstackA, item(thisopH);
            my terminatorA = hereS.before(lambda{|s| stop(s) } );
            if not terminatorA.empty? and terminatorA[0].bool 
                hereS.panic("#{infixS.perl()} is missing right term");
            end
            thisopH = {}
            my tA = hereS.expect_term();
            hereS = tA[0];
            push termstackA, hereS;
            say "after push: ", termstackA.length;
        end
        reduce() while termstackA.length > 1;
        termstackA == 1 or hereS.panic("Internal operator parser error, termstack == #{termstackA.length}");
        $env.scope_leave
        return termstackA[0];
    end

    def expect_term
        b = pos
        # queue up the prefixes to interleave with postfixes
        pre = starTOK lambda{
            m = _match_from(pos)
            if prefix_ = prefix
                m[:prec] = prefix_[:prec]
            elsif precircum = prefix_circumfix_meta_operator
                m[:prec] = precircum[:prec]
            else
                return false
            end
            # XXX assuming no precedence change
            starTOK{prefix_postfix_meta_operator}
            dot_ws
            m
        }

        _noun = noun or return fail_at(b)

        # also queue up any postfixes, since adverbs could change things
        postfix = starTOK{expect_postfix}
        dot_ws
        quesTOK{adverbs}

        # now push ops over the noun according to precedence.
        #    { make $¢.nounphrase(:noun($<noun>), :pre(@<pre>), :post(@<post>)) }
        _match_from(b,{:noun=>_noun,:postfix=>postfix})
    end
    
    def noun
        ##(pair || package_declarator || scope_declarator || plurality_declarator ||
        ## routine_declarator || regex_declarator || type_declarator || circumfix ||
        ( variable || value || subcall || capterm || sigterm || term || statement_prefix)
    end
    def variable; false; end
    def value; quote || number || version || fulltypename; end
    def quote; false; end
    def number; dec_number || integer || rad_number; end
    def integer
        _match_pat %r{
            0 ( b [01]+           ( _ [01]+ )*
              | o [0-7]+         ( _ [0-7]+ )*
              | x [0-9a-fA-F]+ ( _ [0-9a-fA-F]+ )*
              | d \d+               ( _ \d+)*
              | \d+(_\d+)*
              )
            | \d+(_\d+)*
        }x
    end
    def dec_number; false; end
end

p Perl.new(('42')).noun()
p Perl.new(('42')).expect_term()
p Perl.new(('42'))._EXPR(false)

say "Starting...";
my $r = Perl.new(('42')).expect_infix();
say $r;
exit;
say "WHAT\t", $r.WHAT;
say "BOOL\t", $r.bool;
say "FROM\t", $r.from;
say "TO\t", $r.to;

## vim: expandtab sw=4
## Local Variables:
## ruby-indent-level: 4
## End:
