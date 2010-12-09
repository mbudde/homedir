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

[ -f ~/.bash_functions ] && . ~/.bash_functions
source_if_exists /etc/bash_completion
source_if_exists ~/.bash_aliases

# make less more friendly for non-text input files, see lesspipe(1)
inpath lesspipe && eval "$(lesspipe)"
inpath lessfile && eval "$(lessfile)"

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

add_path ~/usr/bin
add_path ~/.gem/ruby/1.8/bin
add_path ~/usr/lib/python2.6/site-package PYTHONPATH

export EDITOR="$(choose_first emacsclient vim vi nano)"
#export VISUAL="gvim -f"
export ALTERNATE_EDITOR=""

export FULLNAME='Michael Budde'
export EMAIL='mbudde@gmail.com'

export DEBFULLNAME=$FULLNAME
export DEBEMAIL=$EMAIL

# Google Go compilation env variables
export GOROOT=/home/devel/forked/go
export GOOS=linux
export GOARCH=amd64
export GOBIN=$HOME/usr/bin/go
add_path ~/usr/bin/go

if [ -f "$HOME/Documents/Regnskab/ledger.dat" ]; then
    export LEDGER="$HOME/Documents/Regnskab/ledger.dat"
fi

if [ -d "$HOME/Documents/AmazonEC2" ]; then
    export EC2_PRIVATE_KEY=$(ls -1 $HOME/Documents/AmazonEC2/pk-HDK*.pem | head -1)
    export EC2_CERT=$(ls -1 $HOME/Documents/AmazonEC2/cert-HDK*.pem | head -1)
fi

add_path ~/Code/android/android-sdk-linux_x86/tools
export JAVA_HOME=/usr/lib/jvm/java-6-sun
