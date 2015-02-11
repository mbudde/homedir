# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTSIZE=2000
export HISTCONTROL=ignoredups
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

source_if_exists /etc/bash_completion
source_if_exists ~/.bash_aliases

# make less more friendly for non-text input files, see lesspipe(1)
inpath lesspipe && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" -a "$TERM" != "cygwin" ]; then
    eval "`dircolors -b ~/.bash_colors`"
    alias ls='ls --color=auto --group-directories-first'
    source_if_exists ~/.bash_prompt
fi


export EDITOR="$(choose_first vim vi nano)"
export VISUAL="$(choose_first "gvim --remote-wait")"
export ALTERNATE_EDITOR=""

export GVIMSERVER=GVIM

export FULLNAME='Michael Budde'
export EMAIL='mbudde@gmail.com'

export DEBFULLNAME=$FULLNAME
export DEBEMAIL=$EMAIL

if [ -d "$HOME/Documents/AmazonEC2" ]; then
    export EC2_URL=https://ec2.eu-west-1.amazonaws.com
    export EC2_PRIVATE_KEY=$HOME/Documents/AmazonEC2/mb.pem 2>/dev/null
    export EC2_CERT=$HOME/Documents/AmazonEC2/mb_cert.pem
fi
