#!/bin/bash

up () {
    P=""
    for ((i=${1:-1}; i > 0; i--)); do
        P="$P../"
    done
    cd $P
}

add_path () {
    local varname=${2:-PATH}
    local varcontent=$(eval echo \$$varname)
    [ -d "$1" ] && [[ $varcontent != *$1* ]] && eval export $varname=\"$varcontent:$1\"
}

prepend_path () {
    local varname=${2:-PATH}
    local varcontent=$(eval echo \$$varname)
    [ -d "$1" ] && [[ $varcontent != *$1* ]] && eval export $varname=\"$1:$varcontent\"
}

source_if_exists () {
    [ -f "$1" ] && source $1
}

inpath () {
    which "$1" &>/dev/null
}

choose_first () {
    for cmd in "$@"; do
        inpath $cmd && printf "%s" "$cmd" && break
    done
}
