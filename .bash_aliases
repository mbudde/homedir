alias up='cd ..'

# ls aliases
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'

alias hgit='git --git-dir=$HOME/.homegit --work-tree=$HOME'

# aptitude aliases
alias apu='sudo aptitude update'
alias apug='sudo aptitude safe-upgrade'
alias apdg='sudo aptitude dist-upgrade'
alias api='sudo aptitude install'
alias apr='sudo aptitude remove'
alias app='sudo aptitude purge'
alias aps='aptitude search'
alias apd='aptitude download'
alias apsh='aptitude show'

# apt-get aliases
alias agi='sudo apt-get install'
alias agr='sudo apt-get remove'
alias agp='sudo apt-get remove --purge'