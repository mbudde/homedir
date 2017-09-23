# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ ! -f ~/.bash_functions ]; then
    echo ".bash_functions not found - aborting!"
    return
fi
. ~/.bash_functions

add_path ~/usr/bin
add_path ~/.local/bin
source_if_exists ~/etc/profile

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
    [ -r ~/.bash_colors ] && eval "`dircolors -b ~/.bash_colors`"
    alias ls='ls --color=auto --group-directories-first'
    source_if_exists ~/.bash_prompt
fi

export COLORTERM=gnome-terminal

if [[ -n $NVIM_LISTEN_ADDRESS ]]; then
    export EDITOR=nve
else
    export EDITOR="$(choose_first nvim vim vi nano)"
fi
export VISUAL="$(choose_first "gvim --remote-wait")"
export ALTERNATE_EDITOR=""
export GIT_EDITOR=$EDITOR

export GVIMSERVER=GVIM

export FULLNAME='Michael Budde'
export EMAIL='mbudde@gmail.com'

export DEBFULLNAME=$FULLNAME
export DEBEMAIL=$EMAIL
