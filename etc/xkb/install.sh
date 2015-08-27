#!/bin/bash

XKB_DIR=/usr/share/X11/xkb

info() {
    echo -n "$1... "
}

ok() {
    echo -e "\033[0;32mdone\033[0m"
}

if [ ! -e $XKB_DIR/symbols/mbudde ]; then
    info "Symlinking mbudde symbol map"
    sudo ln -s "$HOME/etc/xkb/symbols/mbudde" "$XKB_DIR/symbols/mbudde"
    ok
fi

info "Updating evdev.xml rule file"
sudo patch --forward --backup --reject-file=- $XKB_DIR/rules/evdev.xml rules/evdev.xml.patch
ok

info "Clearing cached keymaps"
sudo dpkg-reconfigure xkb-data
ok

# info "Loading new keymap"
# setxkbmap -layout mbudde -variant default
# ok
