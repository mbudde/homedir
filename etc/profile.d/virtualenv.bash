if inpath virtualenvwrapper.sh ; then
    export WORKON_HOME=~/Code/envs
    # export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
    export VIRTUALENV_USE_DISTRIBUTE=1
    source $(which virtualenvwrapper.sh)
fi
