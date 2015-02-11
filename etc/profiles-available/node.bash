add_path ~/opt/node/bin


node_deactivate () {
    if [ -n "$_OLD_NODE_PATH" ]; then
        PATH="$_OLD_NODE_PATH"
        export PATH
        unset _OLD_NODE_PATH
    fi

    # This should detect bash and zsh, which have a hash command that must
    # be called to get it to forget past commands.  Without forgetting
    # past commands the $PATH changes we made may not be respected
    if [ -n "$BASH" -o -n "$ZSH_VERSION" ] ; then
        hash -r
    fi
}

node_activate () {
    if [ -n "$_OLD_NODE_PATH" ]; then
        deactivate
    fi

    _OLD_NODE_PATH="$PATH"
    PATH="$(npm bin):$PATH"
    export PATH

    # This should detect bash and zsh, which have a hash command that must
    # be called to get it to forget past commands.  Without forgetting
    # past commands the $PATH changes we made may not be respected
    if [ -n "$BASH" -o -n "$ZSH_VERSION" ] ; then
        hash -r
    fi

    echo "Entered node env \"$(npm prefix)\""
}
