module: ansi
synopsis: Ansi codes for a terminal stream
author: Gafrewig
copyright: (c) 2012 Dylan Hackers

define constant $esc = as( <character>, 27 );

define constant *reset-attr* = format-to-string( "%S[0m", $esc );

define constant *bold-on* = format-to-string( "%S[1m", $esc );
define constant *bold-off* = format-to-string( "%S[22m", $esc );

define constant *blink-on* = format-to-string( "%S[5m", $esc );
define constant *blink-off* = format-to-string( "%S[25m", $esc );

define constant *underline-on* = format-to-string( "%S[4m", $esc );
define constant *underline-off* = format-to-string( "%S[24m", $esc );

define constant *inverse-on* = format-to-string( "%S[7m", $esc );
define constant *inverse-off* = format-to-string( "%S[27m", $esc );

define constant *fg-black* = format-to-string( "%S[0;30m", $esc );
define constant *fg-red* = format-to-string( "%S[0;31m", $esc );
define constant *fg-green* = format-to-string( "%S[0;32m", $esc );
define constant *fg-yellow* = format-to-string( "%S[0;33m", $esc );
define constant *fg-blue* = format-to-string( "%S[0;34m", $esc );
define constant *fg-magenta* = format-to-string( "%S[0;35m", $esc );
define constant *fg-cyan* = format-to-string( "%S[0;36m", $esc );
define constant *fg-white* = format-to-string( "%S[0;37m", $esc );

define constant *bg-black* = format-to-string( "%S[0;40m", $esc );
define constant *bg-red* = format-to-string( "%S[0;41m", $esc );
define constant *bg-green* = format-to-string( "%S[0;42m", $esc );
define constant *bg-yellow* = format-to-string( "%S[0;43m", $esc );
define constant *bg-blue* = format-to-string( "%S[0;44m", $esc );
define constant *bg-magenta* = format-to-string( "%S[0;45m", $esc );
define constant *bg-cyan* = format-to-string( "%S[0;46m", $esc );
define constant *bg-white* = format-to-string( "%S[0;47m", $esc );

define constant *save-position* = format-to-string( "%S[s", $esc );
define constant *restore-position* = format-to-string( "%S[u", $esc );

define constant *show-cursor* = format-to-string( "%S[?25h", $esc );
define constant *hide-cursor* = format-to-string( "%S[?25l", $esc );

define function set-cursor-pos( x :: <integer>, y :: <integer> ) => ( seq :: <string> )
    format-to-string( "%S[%d;%dH", $esc, y, x );
end;

define function set-cursor-col( x :: <integer> ) => ( seq :: <string> )
    format-to-string( "%S[%dG", $esc, x );
end;

define function move-cursor( #key dx :: <integer> = 0, dy :: <integer> = 0 ) => ( seq :: <string> )
    let sx = "";
    if ( dx > 0 )
        sx := format-to-string( "%S[%dC", $esc, dx );
    elseif ( dx < 0 )
        sx := format-to-string( "%S[%dD", $esc, -dx );
    end if;
    let sy = "";
    if ( dy > 0 )
        sy := format-to-string( "%S[%dB", $esc, dy );
    elseif ( dy < 0 )
        sy := format-to-string( "%S[%dA", $esc, -dy );
    end if;
    format-to-string( "%S%S", sx, sy );
end;

define constant $clear-to-end = 0;
define constant $clear-to-beginning = 1;
define constant $clear-all = 2;

define constant <clear-cmd> = one-of( $clear-to-end, $clear-to-beginning, $clear-all );

define function clear-screen( #key cmd :: <clear-cmd> = $clear-all )
    format-to-string( "%S[%dJ", $esc, cmd );
end;

define function clear-line( #key cmd :: <clear-cmd> = $clear-all )
    format-to-string( "%S[%dK", $esc, cmd );
end;

define function scroll( dy :: <integer> ) => ( seq :: <string> )
    if ( dy >= 0 )
        format-to-string( "%S[%dT", $esc, dy );
    else
        format-to-string( "%S[%dS", $esc, -dy );
    end if;
end;

define function main(name, arguments)
    format-out( *fg-cyan* );
    format-out( set-cursor-pos( 5, 10 ) );
    format-out( "%S[?25h", $esc );
    format-out( "Hello, world!" );
    
    format-out( "\n" );
    format-out( *reset-attr* );
    exit-application(0);
end function main;


// Invoke our main() function.
main(application-name(), application-arguments());
