if not command -qs man
    # see #5329 and discussion at https://github.com/fish-shell/fish-shell/commit/13e025bdb01cc4dd08463ec497a0a3495873702f
    exit
end

function man --description "Format and display the on-line manual pages"
    # Work around the "builtin" manpage that everything symlinks to,
    # by prepending our fish datadir to man. This also ensures that man gives fish's
    # man pages priority, without having to put fish's bin directories first in $PATH.

    # Preserve the existing MANPATH, and default to the system path (the empty string).
    set -l manpath
    if set -q MANPATH
        set manpath $MANPATH
    else if set -l p (command man -p 2>/dev/null)
        # NetBSD's man uses "-p" to print the path.
        # FreeBSD's man also has a "-p" option, but that requires an argument.
        # Other mans (men?) don't seem to have it.
        #
        # Unfortunately NetBSD prints things like "/usr/share/man/man1",
        # while not allowing them as $MANPATH components.
        # What it needs is just "/usr/share/man".
        #
        # So we strip the last component.
        # This leaves a few wrong directories, but that should be harmless.
        set manpath (string replace -r '[^/]+$' '' $p)
    else
        set manpath ''
    end
    # Notice the shadowing local exported copy of the variable.
    set -lx MANPATH $manpath

    # Prepend fish's man directory if available.
    set -l fish_manpath (dirname $__fish_data_dir)/fish/man
    if test -d $fish_manpath
        set MANPATH $fish_manpath $MANPATH
    end

    command man $argv
end
