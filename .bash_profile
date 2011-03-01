# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if inpath virtualenvwrapper.sh ; then
    export WORKON_HOME=~/Code/envs
    source $(which virtualenvwrapper.sh)
fi
