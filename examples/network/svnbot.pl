use v6;
use Net::IRC <debug new_bot>;

# Parse @*ARGS
my $nick        = @*ARGS.shift // "blechbot";
my $server      = @*ARGS.shift // "localhost";
my $interval    = @*ARGS.shift // 300;
my $repository  = @*ARGS.shift // ".";
my $svndiffurl  = (@*ARGS[0] ~~ rx:P5/http/) ?? @*ARGS.shift !! 0;
my $show_branch = (@*ARGS[0] eq "true") ?? @*ARGS.shift !! 0;
my $sep_header  = (@*ARGS[0] eq "true") ?? @*ARGS.shift !! 0;
my ($host, $port) = split ":", $server;
$port //= 6667;

debug "svnbot started. Summary of configuration:";
debug "  Will connect as...                  $nick";
debug "  to...                               {$host}:$port";
debug "  checking for new revisions of...    $repository";
debug "  every...                            $interval seconds.";
debug "  Branch information will {$show_branch ?? "" !! "not "}be shown.";
debug "  There {$sep_header ?? "will" !! "won't"} be a separate header line.";
debug "To change any of these parameters, restart $*PROGRAM_NAME";
debug "and supply appropriate arguments:";
debug "  $*PROGRAM_NAME nick host[:port] interval repository [show_branch] [sep_header] [channel...]";
debug "  where repository...    is the path to the SVN repository (e.g. \".\"";
debug "                         or \"http://svn.perl.org/parrot/\"),";
debug "        show_branch...   specifies whether branch information should";
debug "                         be shown (true|false), and";
debug "        sep_header...    specifies whether a separate header line";
debug "                         should be outputted (true|false).";
debug "        svndiffurl...    specifies the base url for svn diff";
debug "                         requests.  revision# is appended.";

# Initialize $cur_svnrev. $cur_svnrev contains the last revision seen, and is
# set by svn_headrev() and svn_commits().
my $cur_entry;
my $cur_svnrev = 0;
svn_headrev();

sub on_invite($event) {...}
sub on_privmsg($event) {...}
sub svn_check($event) {...}

# Create new bot "object"
my $bot = new_bot(nick => $nick, host => $host, port => $port, debug_raw => 0);
$bot<add_handler>("INVITE",  &on_invite);  # We want to invite our bot
$bot<add_handler>("PRIVMSG", &on_privmsg); # Remote control
$bot<add_handler>("runloop", &svn_check);  # Check for new revisions
$bot<connect>();
$bot<login>();
$bot<join>($_) for @*ARGS;
$bot<run>();

# Join all channels we're invited to.
sub on_invite($event) {
    my ($from, $chan) = $event<from rest>;
    debug "Got an invitation from \"$from\" to join channel \"$chan\".";
    $bot<join>($chan);
}

# Remote control
sub on_privmsg($event) {
    given $event<rest> {
        debug "Received a ?-request from $event<from>: $event<rest>"
            if substr($event<rest>, 0, 1) eq "?";

        my $reply_to = substr($event<object>, 0, 1) eq "#" ?? $event<object> !! $event<from_nick>;
        my $reply    = { $bot<privmsg>(to => $reply_to, text => $^text) };

        when rx:P5/^\?help/ {
            $reply("svnbot6 -- ?help | ?quit [reason] | ?raw ... | ?join #chan | ?uptime | ?check");
        }

        when rx:P5/^\?quit\s*(.*)$/ {
            if substr($reply_to, 0, 1) eq "#" {
                $reply("?quit only available per private message so other bots don't quit as well.");
            } else {
                $bot<quit>($0);
            }
        }

        when rx:P5/^\?raw\s+(.+)$/ {
            $bot<raw>($0);
        }

        when rx:P5/^\?join\s+(.+)$/ {
            $bot<join>($0);
        }

        when rx:P5/^\?uptime$/ {
            my $start_time = INIT { time };
            $bot<privmsg>(
                to   => $reply_to,
                text => "Running for {int(time() - $start_time)} seconds."
            );
        }

        when rx:P5/^\?check$/ {
            svn_check "now";
        }
    }
}

# This sub checks for new commits.
sub svn_check($event) {
    state $last_check = time;

    $last_check = 0 if $event eq "now";

    # We don't want to flood our poor svn repository.
    if time() - $last_check >= $interval {
        $last_check = time;
        debug "Checking for new commits (ignore error messages)... ";
        # svn_commits() sets $cur_svnrev, if needed.
        my $commits = svn_commits();
        if $commits {
          debug "done, new commits (current HEAD revision: $cur_svnrev)";
        } else {
          debug "done, no new commits (current HEAD revision: $cur_svnrev)";
          return;
        }

        my @lines   = split("\n", $commits).grep:{ $_ };

        # We inform all channels we've joined of new commits.
        my @chans = $bot<channels>();

        # Finally, send the announcement.
        for @lines -> $line {
            for @chans -> $chan { 
                $bot<privmsg>($chan, $line);
            }
        }
    }
}

# This queries "svn".
sub svn_commits() {
    # Pipes not yet supported in Pugs.
    my $tempfile = INIT { "temp-svnbot-$*PID-{(^1000).pick}" };
    END { unlink $tempfile }
    # We don't want localized svn messages (like "Geänderte Pfade" instead of
    # "Changed paths"), so we can reliably grep for them and process them.
    INIT { %*ENV<LC_ALL> = %*ENV<LANG> = "C" }

    # If this is an incremental update...
    if $cur_svnrev {
        if '.svn' ~~ :d {
            # must be in repo 
            run "svn st -N -q -u . > $tempfile";
        }
        else {
	        run "svn info $repository -r HEAD > $tempfile";
        }
        my $latest = 0;
        for $tempfile.lines {
            when rx:P5/evision:\s+(\d+)/ {
                $latest = $0;
                last;
            }
        }
        if ($latest == $cur_svnrev) {
            return undef;
        }
        # ...only query for new commits since we last checked.
        my $from = $cur_svnrev + 1;
        # Hack to prevent "-3:HEAD", resulting in a syntax error, resulting in
        # svn not outputting the log, resulting in svnbot not saying anything.
        $from    = "HEAD" if $from <= 0;
        run "svn log -vr {$from}:HEAD $repository > $tempfile";
    } else {
        # Else query only for the newest commit.
        run "svn log -vr HEAD $repository > $tempfile";
    }

    my $commits;
    my $fh = open $tempfile;
    my $branch;
    my $subst = "XXX-HACK-SVNBOT-SUBST-{rand}"; # XXX!

    for $fh.lines -> $_ {
        state $cur_entry;

        when rx:P5/^-----+/ {
            # ignore
        }

        when rx:P5/^   [MAUDCGR] / {
            $branch = $_ ~~ rx:P5:i"branches/([^/]+)"
                ?? $0
                !! "trunk";
            $commits ~~ s:P5:g/$subst/$branch/;
        }

        when rx:P5/^r(\d+) \| (\w+)/ {
            $cur_entry = "r$0 | $1++";
            # Break the loop if we see $cur_svnrev -- that means, there're no new
            # commits.
            next if $0 == $cur_svnrev;
            $cur_svnrev = +$0 if $0 > $cur_svnrev;
            $commits ~= "{$cur_entry}{$show_branch ?? " | $subst" !! ""}:\n"
                if $sep_header;
        }

        when rx:P5/\S/ {
           if $cur_entry and $_ !~~ rx:P5/^Changed paths\:/ {
              $_ ~~ rx:P5/^(.*)$/;
              $commits ~= $sep_header
                  ?? ": "
                  !! "$cur_entry | {$show_branch ?? "$branch | " !! ""}";
              $commits ~= "$0\n";
           }
       }
    }
    if $svndiffurl && $commits {
        $commits ~= "diff: $svndiffurl$cur_svnrev\n";
        run "wget $svndiffurl$cur_svnrev -O -";
    }

    return $commits;
}

# Just a thin wrapper around svn_commits().
sub svn_headrev() {
    debug "Retrieving current HEAD revision... ";
    svn_commits();
    debug "done, current HEAD revision: $cur_svnrev";
}


=begin END
=head1 NAME

svnbot

=head1 DESCRIPTION

This is a small IRC bot using C<Net::IRC> capable of relaying new commits to a
Subversion repository to IRC.

=head1 SYNOPSIS

  $ ./svnbot.pl nick host[:port] interval repository show_branch sep_header

where

=over

=item C<repository>

is the path to the SVN repository (e.g. F<.> or L<http://svn.perl.org/parrot/>,

=item C<show_branch>

specifies whether branch information should be shown (C<true>|C<false>), and

=item C<sep_header>

specifies whether a separate header line should be outputted (C<true>|C<false>).

=back

=head1 INSTALLATION

There's no separate installation step needed, simply run C<svnbot.pl> and
supply appropriate options.

=head1 FAQ

"I configured svnbot to check for new commits every I<n> seconds, but the
commits usually take much more time to show up. Why is this so?"

If you look at svnbot's source, you'll see that it really I<tries> to check the
SVN repository after I<n> seconds elapsed. The problem is, that svnbot doesn't
have a chance to check, because C<Net::IRC> is busy reading from the socket to
the IRC server. Unfortunately, the call to C<.get> C<Net::IRC> issues is
I<blocking>, meaning that the operating system will suspend C<svnbot.pl> until
it receives some data from the IRC server.

In Perl 5, the problem would be easy to remedy, as perl5 allows you to set
timeouts. But, as Pugs doesn't have a mechanism to set timeouts yet, there's
nothing C<Net::IRC> can do about it.
