#!/bin/bash

XKB_DIR=/usr/share/X11/xkb

info() {
    echo -n "$1... "
}

ok() {
    echo -e "\033[0;32mdone\033[0m"
}

if [ -f $XKB_DIR/symbols/dk.orig ]; then
    info "Restoring original symbol map"
    sudo cp $XKB_DIR/symbols/dk.orig $XKB_DIR/symbols/dk
else
    info "Backing up original symbol map"
    sudo cp $XKB_DIR/symbols/dk $XKB_DIR/symbols/dk.orig
fi
ok

info "Updating symbol map"
cat symbols/mbudde | sudo tee -a $XKB_DIR/symbols/dk >/dev/null
ok

info "Updating evdev.xml rule file"
sudo patch --forward --backup --reject-file=- $XKB_DIR/rules/evdev.xml rules/evdev.xml.patch
ok

info "Clearing cached keymaps"
sudo rm /var/lib/xkb/*.xkm
ok

info "Loading new keymap"
setxkbmap -layout dk -variant mbudde
ok
