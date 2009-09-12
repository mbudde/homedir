# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"
[ -x /usr/bin/lessfile ] && eval "$(lessfile)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b ~/.bash_colors`"
    alias ls='ls --color=auto --group-directories-first'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'

    if [ -f ~/.bash_prompt ]; then
        . ~/.bash_prompt
    fi
fi

if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi

export EDITOR=vim
#export VISUAL="gvim -f"

export FULLNAME='Michael Budde'
export EMAIL='mbudde@gmail.com'

export DEBFULLNAME=$FULLNAME
export DEBEMAIL=$EMAIL

