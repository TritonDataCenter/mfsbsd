# $FreeBSD$
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
# more examples available at /usr/share/examples/csh/
#

alias h         history 25
alias j         jobs -l
alias la        ls -aF
alias lf        ls -FA
alias ll        ls -lAF

# A righteous umask
umask 22


setenv  EDITOR  vi
setenv  PAGER   more
setenv  BLOCKSIZE       K
setenv  GOPATH /opt/go

set path = (/sbin /bin /usr/sbin /usr/bin /usr/local/sbin /usr/local/bin $HOME/bin $GOPATH/bin)

if ($?prompt) then
        # An interactive shell -- set some stuff up
        set prompt = "%N@%m:%~ %# "
        set promptchars = "%#"

        set filec
        set history = 1000
        set savehist = (1000 merge)
        set autolist = ambiguous
        # Use history to aid expansion
        set autoexpand
        set autorehash
        set mail = (/var/mail/$USER)
        if ( $?tcsh ) then
                bindkey "^W" backward-delete-word
                bindkey -k up history-search-backward
                bindkey -k down history-search-forward
        endif

endif
