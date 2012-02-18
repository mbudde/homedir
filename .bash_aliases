# -*- sh -*-
# ls aliases
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'

alias saved='pwd > ~/.savedir'
alias showd='cat ~/.savedir'
alias god='cd "`cat ~/.savedir`"'

alias :q=exit
alias :e="$EDITOR"

alias e='emacsclient'
alias ec='emacsclient -n'
alias et='emacsclient -t'
alias emacscompile='emacs -Q --batch -f batch-byte-compile'

alias lfnid='fnid --separator=newline'
alias llid='lid --separator=newline'

alias gpgsig='gpg --armor --sign --detach-sig'

alias pwgen='apg -a 0 -n 20 -m 8 -x 12 -M sNcl -t -s'
alias screengrab='ffmpeg -f x11grab -s 1280x1024 -r 25 -i :0 -sameq "$HOME/Videos/Recording `date +%F\ %T`.mpg"'

tree_pager () { tree -C "$@" | less ${LESS:--FRSX} ; }
alias tree="tree_pager"

# aptitude aliases
alias apu='sudo aptitude update'
alias apug='sudo aptitude safe-upgrade'
alias apdg='sudo aptitude dist-upgrade'
alias api='sudo aptitude install'
alias apr='sudo aptitude remove'
alias app='sudo aptitude purge'
alias apbd='sudo aptitude build-dep'
alias aps='aptitude search'
alias apd='aptitude download'
alias apsh='aptitude show'

# apt-get aliases
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agp='sudo apt-get remove --purge'
