#!/bin/bash

function up {
    P=""
    for i in $(seq 1 1 ${1:-1}); do
        P="$P../"
    done
    cd $P
}

function add_path {
    local varname=${2:-PATH}
    local varcontent=$(eval echo \$$varname)
    [ -d "$1" ] && eval export $varname=\"$1:$varcontent\"
}

function source_if_exists {
    [ -f "$1" ] && source $1
}

function inpath {
    which "$1" >/dev/null
}

function choose_first {
    for cmd in "$@"; do
        inpath "$cmd" && printf "$cmd" && break
    done
}
